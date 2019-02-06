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
ORDER BY		member_ID	ASC
			,	first_DOS	ASC
			,	claim_ID	ASC
			,	LineNumber	ASC
;
