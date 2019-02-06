SELECT	COUNT( ClaimNumber )
FROM
	(	SELECT DISTINCT		ClaimNumber
						,	MemberID
						,	CoveredIndividualID
						,	FirstDOS
		FROM			ESRD_clean_raw.medical_claims
		WHERE				DATEDIFF( DAY, '2017-05-01', FirstDOS )	>=	0
						AND	(		CPTCode1		IN	( 'J9355' )
								OR	CPTCode2		IN	( 'J9355' )
								OR	CPTCode3		IN	( 'J9355' )
								OR	CPTCode4		IN	( 'J9355' )
								OR	CPTCode5		IN	( 'J9355' )
								OR	ProcedureCode	IN	( 'J9355' )
							)
	)
;
/*	2504	*/
		



/*	WITH CPT FILTERS ONLY	*/
SELECT	COUNT( claim_ID )
FROM	(	SELECT DISTINCT	claim_ID
			FROM			whaight.HFNY_herc_claims_clean	)
;
/*	2429	*/



SELECT	COUNT( * )
FROM
	(
			(	SELECT	claim_ID	AS	claim_ID
				FROM	(	SELECT DISTINCT	claim_ID
							FROM			whaight.HFNY_herc_claims_clean	)
			)
		INTERSECT
			(	SELECT ClaimNumber	AS	claim_ID
				FROM
					(	SELECT DISTINCT		ClaimNumber
										,	MemberID
										,	CoveredIndividualID
										,	FirstDOS
						FROM			ESRD_clean_raw.medical_claims
						WHERE				DATEDIFF( DAY, '2017-05-01', FirstDOS )	>=	0
										AND	(		CPTCode1		IN	( 'J9355' )
												OR	CPTCode2		IN	( 'J9355' )
												OR	CPTCode3		IN	( 'J9355' )
												OR	CPTCode4		IN	( 'J9355' )
												OR	CPTCode5		IN	( 'J9355' )
												OR	ProcedureCode	IN	( 'J9355' )
											)
					)
			)
	)
;
/*	2429	*/



SELECT	COUNT( * )
FROM
	(
			(	SELECT ClaimNumber	AS	claim_ID
				FROM
					(	SELECT DISTINCT		ClaimNumber
						--				,	MemberID
						--				,	CoveredIndividualID
						--				,	FirstDOS
						FROM			ESRD_clean_raw.medical_claims
						WHERE				DATEDIFF( DAY, '2017-05-01', FirstDOS )	>=	0
										AND	(		CPTCode1		IN	( 'J9355' )
												OR	CPTCode2		IN	( 'J9355' )
												OR	CPTCode3		IN	( 'J9355' )
												OR	CPTCode4		IN	( 'J9355' )
												OR	CPTCode5		IN	( 'J9355' )
												OR	ProcedureCode	IN	( 'J9355' )
											)
					)
				ORDER BY	claim_ID
			)
		MINUS
			(	SELECT	claim_ID	AS	claim_ID
				FROM	(	SELECT DISTINCT	claim_ID
							FROM			whaight.HFNY_herc_claims_clean	)
			)
	)
;



/*	The basic info query	*/
SELECT
				ClaimNumber			AS	claim_ID
			,	MemberID			AS	member_ID
			,	LineNumber
			,	CASE	ClaimStatus
					WHEN	'D'	THEN	'unpaid'
					WHEN	'F'	THEN	'paid'
				END					AS	claim_payment_status
			,	CASE	CPTCode1
					WHEN	'J9355'	THEN	'herceptin'
					ELSE					NULL
				END					AS	administered
			,	ProcedureCodeModifier1
			,	Units
			,	CASE		(		Units::float			<	5.0		)
						AND	(		ProcedureCodeModifier1	!=	'JW'
								OR	ProcedureCodeModifier1	IS	NULL	)
					WHEN	TRUE	THEN	'1'
					WHEN	FALSE	THEN	'0'
				END					AS		abnormality_pre_flag_D
			,	ClaimPaidAmount
			,	ClaimAllowedAmount
			,	FirstDOS			AS	first_DOS
FROM				ESRD_clean_raw.medical_claims							claims
			JOIN	(	SELECT DISTINCT	claim_ID
						FROM			whaight.HFNY_herc_claims_clean	)	herc
			ON		claims.ClaimNumber	=	herc.claim_ID
			WHERE		claim_payment_status	=	'paid'
					AND	administered			=	'herceptin'
--GROUP BY		member_ID
--			,	claims.CPTCode1
--			,	claims.ClaimNumber
--			,	claims.linenumber
--			,	claims.ClaimStatus
ORDER BY		member_ID	ASC
			,	first_DOS	ASC
			,	claim_ID	ASC
			,	LineNumber	ASC
;



/*	Variant on the above, but we aggreagate dollar amounts by date for each member claim	*/
SELECT
				MemberID			AS	member_ID
			,	ClaimNumber			AS	claim_ID
			,	CASE	ClaimStatus
					WHEN	'D'	THEN	'unpaid'
					WHEN	'F'	THEN	'paid'
				END					AS	claim_payment_status
			,	CASE	CPTCode1
					WHEN	'J9355'	THEN	'herceptin'
					ELSE					NULL
				END					AS	administered
			,	SUM( Units )
			,	SUM( ClaimPaidAmount )
			,	SUM( ClaimAllowedAmount )
			,	FirstDOS			AS	first_DOS
FROM				ESRD_clean_raw.medical_claims							claims
			JOIN	(	SELECT DISTINCT	claim_ID
						FROM			whaight.HFNY_herc_claims_clean	)	herc
			ON		claims.ClaimNumber	=	herc.claim_ID
			WHERE		claim_payment_status	=	'paid'
					AND	administered			=	'herceptin'
GROUP BY		claims.ClaimNumber
			,	claims.MemberID
			,	claims.CPTCode1
			,	claims.ClaimStatus
			,	claims.FirstDOS
ORDER BY		member_ID	ASC
			,	first_DOS	ASC
;



/*	Check into the flagged claims under A, B, C and D	*/
SELECT		baseTable.member_ID
		,	baseTable.claim_ID
		,	baseTable.TOTAL_UNITS
		,	baseTable.TOTAL_PAID
		,	baseTable.TOTAL_ALLOWED
		,	baseTable.first_DOS
		,	baseTable.abnormality_flag_A
		,	baseTable.abnormality_flag_B
		,	baseTable.abnormality_flag_C
		,	crmc.CPTCode1
		,	crmc.ClaimSubmittedChargeAmount
		,	crmc.LineNumber
		,	crmc.ProcedureCode
		,	crmc.ProcedureCodeModifier1
		,	crmc.ProcedureCodeModifier2
		,	crmc.Units
		,	crmc.dhp_proc_code
FROM
	(	SELECT		member_ID
				,	claim_ID
				,	claim_payment_status
				,	administered
				,	TOTAL_UNITS
				,	TOTAL_PAID
				,	TOTAL_ALLOWED
				,	first_DOS
				,	CASE	TOTAL_UNITS > 95
						WHEN	TRUE	THEN	'1'
						ELSE					'0'
					END				AS	abnormality_flag_A
				,	CASE	TOTAL_UNITS IN ( 44, 88 )
						WHEN	TRUE	THEN	'1'
						ELSE					'0'
					END				AS	abnormality_flag_B
				,	CASE	TOTAL_UNITS = 0
						WHEN	TRUE	THEN	'1'
						ELSE					'0'
					END				AS	abnormality_flag_C
		FROM
			(	SELECT			MemberID					AS	member_ID
							,	ClaimNumber					AS	claim_ID
							,	CASE	ClaimStatus
									WHEN	'D'	THEN	'unpaid'
									WHEN	'F'	THEN	'paid'
								END							AS	claim_payment_status
							,	CASE	CPTCode1
									WHEN	'J9355'	THEN	'herceptin'
									ELSE					NULL
								END							AS	administered
							,	SUM( Units )				AS	TOTAL_UNITS
							,	SUM( ClaimPaidAmount )		AS	TOTAL_PAID
							,	SUM( ClaimAllowedAmount )	AS	TOTAL_ALLOWED
							,	FirstDOS					AS	first_DOS
				FROM				ESRD_clean_raw.medical_claims							claims
							JOIN	(	SELECT DISTINCT	claim_ID
										FROM			whaight.HFNY_herc_claims_clean	)	herc
							ON		claims.ClaimNumber	=	herc.claim_ID
							WHERE		claim_payment_status	=	'paid'
									AND	administered			=	'herceptin'
				GROUP BY		claims.ClaimNumber
							,	claims.MemberID
							,	claims.CPTCode1
							,	claims.ClaimStatus
							,	claims.FirstDOS
			)
	)								baseTable
LEFT JOIN
	ESRD_clean_raw.medical_claims	crmc
ON		crmc.MemberID		=	baseTable.member_ID
	AND	crmc.claimnumber	=	baseTable.claim_ID
WHERE
		abnormality_flag_A	=	'1'
	OR	abnormality_flag_B	=	'1'
	OR	abnormality_flag_C	=	'1'
ORDER BY
		baseTable.member_ID	ASC
	,	baseTable.first_DOS	ASC
;





SELECT		sum(abnormality_flag_A)
		,	sum(abnormality_flag_B)
		,	sum(abnormality_flag_C)
FROM
(SELECT		member_ID
		,	claim_ID
		,	claim_payment_status
		,	administered
		,	TOTAL_UNITS
		,	TOTAL_PAID
		,	TOTAL_ALLOWED
		,	first_DOS
		,	CASE	TOTAL_UNITS > 95
				WHEN	TRUE	THEN	'1'
				ELSE					'0'
			END				AS	abnormality_flag_A
		,	CASE	TOTAL_UNITS IN ( 44, 88 )
				WHEN	TRUE	THEN	'1'
				ELSE					'0'
			END				AS	abnormality_flag_B
		,	CASE	TOTAL_UNITS = 0
				WHEN	TRUE	THEN	'1'
				ELSE					'0'
			END				AS	abnormality_flag_C
FROM
	(	SELECT			MemberID					AS	member_ID
					,	ClaimNumber					AS	claim_ID
					,	CASE	ClaimStatus
							WHEN	'D'	THEN	'unpaid'
							WHEN	'F'	THEN	'paid'
						END							AS	claim_payment_status
					,	CASE	CPTCode1
							WHEN	'J9355'	THEN	'herceptin'
							ELSE					NULL
						END							AS	administered
					,	SUM( Units )				AS	TOTAL_UNITS
					,	SUM( ClaimPaidAmount )		AS	TOTAL_PAID
					,	SUM( ClaimAllowedAmount )	AS	TOTAL_ALLOWED
					,	FirstDOS					AS	first_DOS
		FROM				ESRD_clean_raw.medical_claims							claims
					JOIN	(	SELECT DISTINCT	claim_ID
								FROM			whaight.HFNY_herc_claims_clean	)	herc
					ON		claims.ClaimNumber	=	herc.claim_ID
					WHERE		claim_payment_status	=	'paid'
							AND	administered			=	'herceptin'
		GROUP BY		claims.ClaimNumber
					,	claims.MemberID
					,	claims.CPTCode1
					,	claims.ClaimStatus
					,	claims.FirstDOS
	)
ORDER BY		member_ID	ASC
			,	first_DOS	ASC)
;





/*	In this query, amount paid and total amount allowed are summed	*/
/*	over herceptin claims and line numbers for each member_ID		*/
SELECT
--				ClaimNumber			AS	claim_ID
				MemberID			AS	member_ID
--			,	LineNumber
			,	CASE	ClaimStatus
					WHEN	'D'	THEN	'unpaid'
					WHEN	'F'	THEN	'paid'
				END					AS	claim_payment_status
			,	CASE	CPTCode1
					WHEN	'J9355'	THEN	'herceptin'
					ELSE					NULL
				END					AS	administered
--			,	ProcedureCodeModifier1
--			,	Units
			,	SUM( ClaimPaidAmount )		TOTAL_PAID
			,	SUM( ClaimAllowedAmount )	TOTAL_ALLOWED
--			,	FirstDOS			AS	first_DOS
FROM				ESRD_clean_raw.medical_claims							claims
			JOIN	(	SELECT DISTINCT	claim_ID
						FROM			whaight.HFNY_herc_claims_clean	)	herc
			ON		claims.ClaimNumber	=	herc.claim_ID
			WHERE		claim_payment_status	=	'paid'
					AND	administered			=	'herceptin'
GROUP BY		member_ID
			,	claims.CPTCode1
--			,	claims.ClaimNumber
--			,	claims.linenumber
			,	claims.ClaimStatus
ORDER BY		member_ID	ASC
--			,	first_DOS	ASC
--			,	claim_ID	ASC
--			,	LineNumber	ASC
;



/*	This query is to check which CPT codes indicate herceptin.	*/
SELECT	*
FROM
	(	SELECT 			ClaimNumber			AS	claim_ID
					,	MemberID			AS	member_ID
					,	LineNumber
					,	CASE	ClaimStatus
							WHEN	'D'	THEN	'unpaid'
							WHEN	'F'	THEN	'paid'
						END					AS	claim_payment_status
					,	CASE	CPTCode1
							WHEN	'J9355'	THEN	'herceptin'
							ELSE					NULL
						END					AS	administered1
					,	CASE	CPTCode2
							WHEN	'J9355'	THEN	'herceptin'
							ELSE					NULL
						END					AS	administered2
					,	CASE	CPTCode3
							WHEN	'J9355'	THEN	'herceptin'
							ELSE					NULL
						END					AS	administered3
					,	CASE	CPTCode4
							WHEN	'J9355'	THEN	'herceptin'
							ELSE					NULL
						END					AS	administered4
					,	CASE	CPTCode5
							WHEN	'J9355'	THEN	'herceptin'
							ELSE					NULL
						END					AS	administered5
					,	ProcedureCodeModifier1
					,	Units
					,	ClaimPaidAmount
					,	ClaimAllowedAmount
					,	FirstDOS			AS	first_DOS
		FROM				ESRD_clean_raw.medical_claims							claims
					JOIN	(	SELECT DISTINCT	claim_ID
								FROM			whaight.HFNY_herc_claims_clean	)	herc
					ON		claims.ClaimNumber	=	herc.claim_ID
					WHERE		claim_payment_status	=	'paid'
							AND	(		administered1	=	'herceptin'
									OR	administered2	=	'herceptin'
									OR	administered3	=	'herceptin'
									OR	administered4	=	'herceptin'
									OR	administered5	=	'herceptin'	)
		ORDER BY		member_ID	ASC
					,	first_DOS	ASC
					,	claim_ID	ASC
					,	LineNumber	ASC
	)
WHERE
		administered2	IS NOT	NULL
	OR	administered3	IS NOT	NULL
	OR	administered4	IS NOT	NULL
	OR	administered5	IS NOT	NULL
;
/*	For HFNY, the CPT code indication of herceptin ONLY comes in CPTCode1	*/



/*	This query checks to bold claim above directly against the HFNY raw medical claims.	*/
SELECT	COUNT( * )
FROM	ESRD_clean_raw.medical_claims
WHERE		CPTCode1		LIKE	'J9355'
		OR	CPTCode2		LIKE	'J9355'
		OR	CPTCode3		LIKE	'J9355'
		OR	CPTCode4		LIKE	'J9355'
		OR	CPTCode5		LIKE	'J9355'
		OR	ProcedureCode	LIKE	'J9355'
;
/*	0	*/



SELECT	COUNT( * )
FROM	ESRD_clean_raw.medical_claims
WHERE	CPTCode1	LIKE	'J9355'
;




SELECT DISTINCT	ProcedureCodeModifier1
FROM	ESRD_clean_raw.medical_claims
WHERE	CPTCode1	LIKE	'J9355'
;
/*	procedurecodemodifier1

JG	--	effective 1/1/18 for outpatient Medicare FFS (fee-for-service) claims when any status
indicator K drugs (Non pass-through drugs and biologicals, and blood and blood products) are
involved. It will be required for any 340B hospitals (The 340B Drug Discount Program is a US
federal government program created in 1992 that requires drug manufacturers to provide outpatient
drugs to eligible health care organizations and covered entities at significantly reduced prices).

JW	--	The JW modifier is a Healthcare Common Procedure Coding System (HCPCS) Level II modifier
used on a Medicare Part B drug claim to report the amount of drug or biological (hereafter referred
to as drug) that is discarded and eligible for payment under the discarded drug policy.

KO	--	SINGLE DRUG UNIT DOSE FORMULATION

KP -- Append to appropriate code (one of unit dose form codes) when two or more drugs are combined
and dispensed to beneficiary in same unit dose container, each drug is billed using its unit dose
form code. Append KQ modifier to other unit dose code(s)

PO	--	Services, procedures and/or surgeries performed at off-campus provider-based outpatient
departments

SL	--	state supplied vaccine at no cost to provider

UD	--	The UD modifier is defined as “Medicaid level of care 13, as defined by each state.”
Some states require that, when billing Medicaid for 340B drugs on a fee‐for‐service basis,
covered entities use UD modifiers as a way to identify that the claim submitted relates to
a 340B drug

NULL
*/

select count(*)
from(
select distinct memberID
from	ESRD_clean_raw.medical_claims
where	DATEDIFF( DAY, '2017-05-01', firstdos )	>=	0
);
/*	1,426,608	*/











/*	Variant on the above, but we aggreagate dollar amounts by date for each member claim	*/
SELECT
				MemberID						AS	member_ID
			,	ClaimNumber						AS	claim_ID
			,	CASE	ClaimStatus
					WHEN	'D'	THEN	'unpaid'
					WHEN	'F'	THEN	'paid'
				END								AS	claim_payment_status
			,	CASE	CPTCode1
					WHEN	'J9355'	THEN	'herceptin'
					ELSE					NULL
				END								AS	administered
			,	SUM( Units )
			,	SUM( abnormality_pre_flag_D )	AS	abnormality_sub_flag_D
			,	SUM( ClaimPaidAmount )
			,	SUM( ClaimAllowedAmount )
			,	FirstDOS						AS	first_DOS
FROM
	(	SELECT
				MemberID
			,	ClaimNumber
			,	ClaimStatus
			,	CPTCode1
			,	Units
			,	CASE		(		Units::float			<	5.0		)
						AND	(		ProcedureCodeModifier1	!=	'JW'
								OR	ProcedureCodeModifier1	IS	NULL	)
					WHEN	TRUE	THEN	'1'
					WHEN	FALSE	THEN	'0'
				END					AS		abnormality_pre_flag_D
			,	ClaimPaidAmount
			,	ClaimAllowedAmount
			,	FirstDOS
		FROM
					ESRD_clean_raw.medical_claims							claims
			JOIN	(	SELECT DISTINCT	claim_ID
						FROM			whaight.HFNY_herc_claims_clean	)	herc
			ON		claims.ClaimNumber	=	herc.claim_ID
			WHERE		ClaimStatus	=	'F'
					AND	CPTCode1	=	'J9355'
	)
GROUP BY		ClaimNumber
			,	MemberID
			,	CPTCode1
			,	ClaimStatus
			,	FirstDOS
ORDER BY		MemberID	ASC
			,	FirstDOS	ASC
;




/*	Check into the flagged claims under A, B, C and D	*/
SELECT		baseTable.member_ID
		,	baseTable.claim_ID
		,	baseTable.TOTAL_UNITS
		,	baseTable.TOTAL_PAID
		,	baseTable.TOTAL_ALLOWED
		,	baseTable.first_DOS
		,	baseTable.abnormality_flag_A
		,	baseTable.abnormality_flag_B
		,	baseTable.abnormality_flag_C
		,	baseTable.abnormality_flag_D
		,	crmc.CPTCode1
		,	crmc.ClaimSubmittedChargeAmount
		,	crmc.LineNumber
		,	crmc.ProcedureCode
		,	crmc.ProcedureCodeModifier1
		,	crmc.ProcedureCodeModifier2
		,	crmc.Units
		,	crmc.dhp_proc_code
FROM
	(	SELECT		member_ID
				,	claim_ID
				,	claim_payment_status
				,	administered
				,	TOTAL_UNITS
				,	TOTAL_PAID
				,	TOTAL_ALLOWED
				,	first_DOS
				,	CASE	TOTAL_UNITS > 95
						WHEN	TRUE	THEN	'1'
						ELSE					'0'
					END				AS	abnormality_flag_A
				,	CASE	TOTAL_UNITS IN ( 44, 88 )
						WHEN	TRUE	THEN	'1'
						ELSE					'0'
					END				AS	abnormality_flag_B
				,	CASE	TOTAL_UNITS = 0
						WHEN	TRUE	THEN	'1'
						ELSE					'0'
					END				AS	abnormality_flag_C
				,	abnormality_flag_D
		FROM
			(	SELECT
								MemberID						AS	member_ID
							,	ClaimNumber						AS	claim_ID
							,	CASE	ClaimStatus
									WHEN	'D'	THEN	'unpaid'
									WHEN	'F'	THEN	'paid'
								END								AS	claim_payment_status
							,	CASE	CPTCode1
									WHEN	'J9355'	THEN	'herceptin'
									ELSE					NULL
								END								AS	administered
							,	SUM( Units )					AS	TOTAL_UNITS
							,	MAX( abnormality_pre_flag_D )	AS	abnormality_flag_D
							,	SUM( ClaimPaidAmount )			AS	TOTAL_PAID
							,	SUM( ClaimAllowedAmount )		AS	TOTAL_ALLOWED
							,	FirstDOS						AS	first_DOS
				FROM
					(	SELECT
								MemberID
							,	ClaimNumber
							,	ClaimStatus
							,	CPTCode1
							,	Units
							,	CASE		(		Units::float			<	5.0		)
										AND	(		ProcedureCodeModifier1	!=	'JW'
												OR	ProcedureCodeModifier1	IS	NULL	)
									WHEN	TRUE	THEN	'1'
									WHEN	FALSE	THEN	'0'
								END					AS		abnormality_pre_flag_D
							,	ClaimPaidAmount
							,	ClaimAllowedAmount
							,	FirstDOS
						FROM
									ESRD_clean_raw.medical_claims							claims
							JOIN	(	SELECT DISTINCT	claim_ID
										FROM			whaight.HFNY_herc_claims_clean	)	herc
							ON		claims.ClaimNumber	=	herc.claim_ID
							WHERE		ClaimStatus	=	'F'
									AND	CPTCode1	=	'J9355'
					)
				GROUP BY		ClaimNumber
							,	MemberID
							,	CPTCode1
							,	ClaimStatus
							,	FirstDOS
			)
	)								baseTable
LEFT JOIN
	ESRD_clean_raw.medical_claims	crmc
ON		crmc.MemberID		=	baseTable.member_ID
	AND	crmc.claimnumber	=	baseTable.claim_ID
WHERE
		abnormality_flag_A	=	'1'
	OR	abnormality_flag_B	=	'1'
	OR	abnormality_flag_C	=	'1'
ORDER BY
		baseTable.member_ID	ASC
	,	baseTable.first_DOS	ASC
;
