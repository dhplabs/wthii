

/*	This code seeks to implement in HFNY the algorithm developed by Austin Privett in the file simple-rules.txt	*/

/********************************/
/*								*/
/*	implements lines 25 -- 46	*/
/*								*/
/********************************/
/*
FIND claims
WHERE -- have at least 1 EM level paid for
    cpt_hcpcs_code IN ('99281','99282','99283','99284','99285',
                           -- multiple 99292's potentially ok
                           '99291',
                           'G0380','G0381','G0382','G0383','G0384')
    AND claim_payment_status_code='P'
    AND number_of_units > 0
GROUP BY
    member_id,
    day,
    specialty_of_rendering_doctor,
    whether_or_not_facility_claim

THEN for each facility claim:
    IF more than 2 units
    PULL

THEN for each professional claim by specialty:
    -- can increase to 2 to decrease false positives
    IF more than 1 units
    PULL
*/
/*	QUESTION:  it says FIND CLAIMS, but failure to include claim_ID
	in the GROUP BY clause means we're pulling what's left in the
	SELECT clause, i.e. members by days by primary specialty of physician
	by whether it's a professional claim or facility.  Is this what we want?
*/
SELECT	--		crmc.ClaimNumber					::	VARCHAR( 13 )	AS	claim_ID
				crmc.MemberID						::	VARCHAR( 13 )	AS	member_ID
			,	crmc.FirstDOS						::	DATE			AS	first_DOS
		--	,	crmc.LastDOS						::	DATE			AS	last_DOS
		--	,	prov.ProviderNPI					::	VARCHAR( 30 )	AS	provider_NPI
			,	prov.PrimarySpecialty				::	VARCHAR( 10 )	AS	prov_primary_specialty
		--	,	prov.SecondarySpecialty				::	VARCHAR( 10 )	AS	prov_secondary_specialty
		--	,	crmc.PlaceofService					::	VARCHAR(  2 )	AS	place_Of_Service
		--	,	crmc.DischargeStatus				::	VARCHAR( 10 )	AS	discharge_Status
		--	,	crmc.ProcedureCode					::	VARCHAR( 10 )	AS	proc_Code
		--	,	crmc.ProcedureCodeModifier1			::	VARCHAR(  2 )	AS	proc_Code_Mod_1	/*	2,024,606 NOT NULL	*/
		--	,	crmc.ProcedureCodeModifier2			::	VARCHAR(  2 )	AS	proc_Code_Mod_2	/*	    7,562 NOT NULL	*/
		--	,	crmc.RevenueCode					::	VARCHAR( 10 )	AS	revenue_Code
		--	,	crmc.TypeofService					::	VARCHAR(  3 )	AS	type_Of_Service
		--	,	crmc.Units							::	VARCHAR(  9 )	AS	units
		--	,	crmc.ClaimType						::	VARCHAR(  1 )	AS	claim_Type		--	'I' facility;  'P' professional
		--	,	crmc.ClaimStatus					::	VARCHAR(  1 )	AS	claim_Status	--	'D' denied;  'F' full (as in "paid in ")
		--	,	crmc.ProcedureCode					::	VARCHAR(  6 )	AS	procedure_Code
		--	,	crmc.TypeofService					::	VARCHAR(  2 )	AS	type_Of_Service
		--	,	crmc.LineNumber						::	VARCHAR(  3 )	AS	claim_Line_Num
		--	,	crmc.PerformingProviderIdentifier	::	VARCHAR( 15 )	AS	perf_Provider_ID
			,	( crmc.ClaimType = 'P' )			::	BOOLEAN			AS	prof_indicator
		--	,	CASE	(		NOT prof_indicator
		--					AND	crmc.Units	>	2		)
		--			WHEN	TRUE	THEN	'1'
		--			ELSE					'0'
		--		END									::	VARCHAR(  1 )	AS	flag_A
		--	,	CASE	(		prof_indicator
		--					AND	crmc.Units	>	2		)
		--			WHEN	TRUE	THEN	'1'
		--			ELSE					'0'
		--		END									::	VARCHAR(  1 )	AS	flag_B
FROM				ESRD_clean_raw.medical_claims	crmc
			JOIN	ESRD_clean_raw.provider_info	prov
			ON		crmc.PerformingProviderIdentifier	=	prov.ProviderID
WHERE			(	crmc.ProcedureCode	IN	( '99281', '99282', '99283', '99284', '99285', '99291', 'G0380','G0381','G0382','G0383','G0384' )	)
			AND	(	crmc.Units			>	0																										)
			AND	(	crmc.ClaimStatus	=	'F'																										)
GROUP BY		member_ID
			,	first_DOS
			,	prov_primary_specialty
			,	prof_indicator
LIMIT		1000
;



/********************************/
/*								*/
/*	implements lines 51 -- 62	*/
/*								*/
/********************************/
/*
FIND claims
WHERE -- have at least 1 EM level paid for
    cpt_hcpcs_code IN ('99281','99282','99283','99284','99285',
                           -- multiple 99292's potentially ok
                           '99291',
                           'G0380','G0381','G0382','G0383','G0384')
    AND claim_payment_status_code='P'
    AND number_of_units > 0

IF facility claim has > 2 units
OR
IF professional claim has > 1 unit
*/
/*	QUESTION:	this seems very similar to what's in 1-make-table.sql.
	Is it supposed to be the same thing?
*/
SELECT	*
FROM
	(	SELECT
				crmc.ClaimNumber					::	VARCHAR( 13 )	AS	claim_ID
			,	crmc.MemberID						::	VARCHAR( 13 )	AS	member_ID
				,	crmc.FirstDOS						::	DATE			AS	first_DOS
			,	crmc.LastDOS						::	DATE			AS	last_DOS
			,	prov.ProviderNPI					::	VARCHAR( 30 )	AS	provider_NPI
			,	prov.PrimarySpecialty				::	VARCHAR( 10 )	AS	prov_primary_specialty
			,	prov.SecondarySpecialty				::	VARCHAR( 10 )	AS	prov_secondary_specialty
			,	crmc.PlaceofService					::	VARCHAR(  2 )	AS	place_Of_Service
			,	crmc.DischargeStatus				::	VARCHAR( 10 )	AS	discharge_Status
			,	crmc.ProcedureCode					::	VARCHAR( 10 )	AS	proc_Code
			,	crmc.ProcedureCodeModifier1			::	VARCHAR(  2 )	AS	proc_Code_Mod_1	/*	2,024,606 NOT NULL	*/
			,	crmc.ProcedureCodeModifier2			::	VARCHAR(  2 )	AS	proc_Code_Mod_2	/*	    7,562 NOT NULL	*/
			,	crmc.RevenueCode					::	VARCHAR( 10 )	AS	revenue_Code
			,	crmc.TypeofService					::	VARCHAR(  3 )	AS	type_Of_Service
			,	crmc.Units							::	VARCHAR(  9 )	AS	units
			,	crmc.ClaimType						::	VARCHAR(  1 )	AS	claim_Type		--	'I' facility;  'P' professional
			,	crmc.ClaimStatus					::	VARCHAR(  1 )	AS	claim_Status	--	'D' denied;  'F' full (as in "paid in ")
			,	crmc.ProcedureCode					::	VARCHAR(  6 )	AS	procedure_Code
			,	crmc.TypeofService					::	VARCHAR(  2 )	AS	type_Of_Service
			,	crmc.LineNumber						::	VARCHAR(  3 )	AS	claim_Line_Num
			,	crmc.PerformingProviderIdentifier	::	VARCHAR( 15 )	AS	perf_Provider_ID
			,	( crmc.ClaimType = 'P' )			::	BOOLEAN			AS	prof_indicator
			,	CASE	(		NOT prof_indicator
							AND	crmc.Units	>	2		)
					WHEN	TRUE	THEN	'1'
					ELSE					'0'
				END									::	VARCHAR(  1 )	AS	flag_A
			,	CASE	(		prof_indicator
							AND	crmc.Units	>	2		)
					WHEN	TRUE	THEN	'1'
					ELSE					'0'
				END									::	VARCHAR(  1 )	AS	flag_B
		FROM
					ESRD_clean_raw.medical_claims	crmc
			JOIN	ESRD_clean_raw.provider_info	prov
			ON		crmc.PerformingProviderIdentifier	=	prov.ProviderID
		WHERE
				(	procedure_Code	IN	( '99281', '99282', '99283', '99284', '99285', '99291', 'G0380','G0381','G0382','G0383','G0384' )	)
			AND	(	units			>	0																									)
			AND	(	claim_Status	=	'F'																									)
	)
WHERE
		flag_A	=	'1'
	OR	flag_B	=	'1'
;



/****************************************/
/*										*/
/*	implements lines 51 -- 58, 64 -- 66	*/
/*										*/
/****************************************/
/*
FIND claims
WHERE -- have at least 1 EM level paid for
    cpt_hcpcs_code IN ('99281','99282','99283','99284','99285',
                           -- multiple 99292's potentially ok
                           '99291',
                           'G0380','G0381','G0382','G0383','G0384')
    AND claim_payment_status_code='P'
    AND number_of_units > 0
	
IF the same professional NPI is on both the facility claim 
AND a professional claim
ON THE SAME DAY
PULL
OR if the same professional NPI is on two different claims (this catches instances where specialty changes)
*/
/*	QUESTION:	Is this what you're looking for?
	It is not flagging claims, per se, but member days by npi.
	It pays NO ATTENTION to doctor specialty
*/
SELECT
	--	claim_ID
		member_ID
	,	first_DOS
	,	provider_NPI
	,	MIN( prof_indicator::INTEGER )	AS	min_pi
	,	MAX( prof_indicator::INTEGER )	AS	max_pi
	,	( min_pi != max_pi )::BOOLEAN	AS	flag_C
FROM
	(	SELECT
				crmc.ClaimNumber					::	VARCHAR( 13 )	AS	claim_ID
			,	crmc.MemberID						::	VARCHAR( 13 )	AS	member_ID
			,	crmc.FirstDOS						::	DATE			AS	first_DOS
			,	crmc.LastDOS						::	DATE			AS	last_DOS
			,	prov.ProviderNPI					::	VARCHAR( 30 )	AS	provider_NPI
			,	prov.PrimarySpecialty				::	VARCHAR( 10 )	AS	prov_primary_specialty
			,	prov.SecondarySpecialty				::	VARCHAR( 10 )	AS	prov_secondary_specialty
			,	crmc.PlaceofService					::	VARCHAR(  2 )	AS	place_Of_Service
			,	crmc.DischargeStatus				::	VARCHAR( 10 )	AS	discharge_Status
			,	crmc.ProcedureCode					::	VARCHAR( 10 )	AS	proc_Code
			,	crmc.ProcedureCodeModifier1			::	VARCHAR(  2 )	AS	proc_Code_Mod_1	/*	2,024,606 NOT NULL	*/
			,	crmc.ProcedureCodeModifier2			::	VARCHAR(  2 )	AS	proc_Code_Mod_2	/*	    7,562 NOT NULL	*/
			,	crmc.RevenueCode					::	VARCHAR( 10 )	AS	revenue_Code
			,	crmc.TypeofService					::	VARCHAR(  3 )	AS	type_Of_Service
			,	crmc.Units							::	VARCHAR(  9 )	AS	units
			,	crmc.ClaimType						::	VARCHAR(  1 )	AS	claim_Type		--	'I' facility;  'P' professional
			,	crmc.ClaimStatus					::	VARCHAR(  1 )	AS	claim_Status	--	'D' denied;  'F' full (as in "paid in ")
			,	crmc.ProcedureCode					::	VARCHAR(  6 )	AS	procedure_Code
			,	crmc.TypeofService					::	VARCHAR(  2 )	AS	type_Of_Service
			,	crmc.LineNumber						::	VARCHAR(  3 )	AS	claim_Line_Num
			,	crmc.PerformingProviderIdentifier	::	VARCHAR( 15 )	AS	perf_Provider_ID
			,	( crmc.ClaimType = 'P' )			::	BOOLEAN			AS	prof_indicator
		FROM	
					ESRD_clean_raw.medical_claims	crmc
			JOIN	ESRD_clean_raw.provider_info	prov
			ON		crmc.PerformingProviderIdentifier	=	prov.ProviderID
		WHERE
				(	procedure_Code	IN	( '99281', '99282', '99283', '99284', '99285', '99291', 'G0380','G0381','G0382','G0383','G0384' )	)
			AND	(	units			>	0																									)
			AND	(	claim_Status	=	'F'																									)
	)
WHERE
	provider_NPI	IS NOT	NULL
GROUP BY
		member_ID
	,	first_DOS
	,	provider_NPI
HAVING
	flag_C
ORDER BY
		first_DOS
	,	provider_NPI
;
















--			,	MIN( crmc.ClaimType ) OVER PARTITION BY ( claim_ID )
--													::	VARCHAR(  1 )	AS	min_ct
--			,	MAX( crmc.ClaimType ) OVER PARTITION BY ( claim_ID )
--													::	VARCHAR(  1 )	AS	max_ct
--			,	MIN( prov.ProviderNPI ) OVER PARTITION BY ( claim_ID )
--													::	VARCHAR(  1 )	AS	min_npi
--			,	MAX( prov.ProviderNPI ) OVER PARTITION BY ( claim_ID )
--													::	VARCHAR(  1 )	AS	max_npi 







/*	THIS IS IT!  Table HFNY_All_EM_Lines	*/
/*	3,251,303 rows in table	*/
DROP TABLE IF EXISTS	whaight.HFNY_All_EM_Lines;
CREATE TABLE			whaight.HFNY_All_EM_Lines
(		member_ID					VARCHAR( 13 )	ENCODE	ZSTD
    ,	first_DOS					DATE			ENCODE	ZSTD
	,	prov_primary_specialty		VARCHAR( 10 )	ENCODE	BYTEDICT
	,	max_proc_code				VARCHAR(  6 )	ENCODE	ZSTD
	,	min_proc_code				VARCHAR(  6 )	ENCODE	ZSTD
	,	total_units					FLOAT			ENCODE	ZSTD
	,	prof_indicator				BOOLEAN			ENCODE	ZSTD
)
COMPOUND SORTKEY(
		member_ID
	,	first_DOS
);


INSERT INTO	whaight.HFNY_All_EM_Lines
(	SELECT
	        member_ID					::	VARCHAR( 13 )	AS	member_ID
		,	first_DOS					::	DATE			AS	first_DOS
		,	prov_primary_specialty		::	VARCHAR( 10 )	AS	prov_primary_specialty
		,	MAX( proc_Code )			::	VARCHAR(  6 )	AS  max_proc_code
		,	MIN( proc_Code )			::	VARCHAR(  6 )	AS  min_proc_code
		,	SUM( units::FLOAT )			::	FLOAT			AS  total_units
		,	( claim_Type	=	'P'	)	::	BOOLEAN			AS	prof_indicator
	FROM
		(	SELECT
					crmc.ClaimNumber					::	VARCHAR( 13 )	AS	claim_ID
				,	crmc.MemberID						::	VARCHAR( 13 )	AS	member_ID
				,	crmc.FirstDOS						::	DATE			AS	first_DOS
				,	crmc.LastDOS						::	DATE			AS	last_DOS
				,	prov.ProviderNPI					::	VARCHAR( 30 )	AS	provider_NPI
				,	prov.PrimarySpecialty				::	VARCHAR( 10 )	AS	prov_primary_specialty
				,	prov.SecondarySpecialty				::	VARCHAR( 10 )	AS	prov_secondary_specialty
				,	crmc.PlaceofService					::	VARCHAR(  2 )	AS	place_Of_Service
				,	crmc.DischargeStatus				::	VARCHAR( 10 )	AS	discharge_Status
				,	crmc.ProcedureCode					::	VARCHAR( 10 )	AS	proc_Code
				,	crmc.ProcedureCodeModifier1			::	VARCHAR(  2 )	AS	proc_Code_Mod_1	/*	2,024,606 NOT NULL	*/
				,	crmc.ProcedureCodeModifier2			::	VARCHAR(  2 )	AS	proc_Code_Mod_2	/*	    7,562 NOT NULL	*/
--				,	crmc.ProcedureCodeModifier3			::	VARCHAR(  2 )	AS	proc_Code_Mod_3	/*	        0 NOT NULL	*/
--				,	crmc.ProcedureCodeModifier4			::	VARCHAR(  2 )	AS	proc_Code_Mod_4	/*	        0 NOT NULL	*/
				,	crmc.RevenueCode					::	VARCHAR( 10 )	AS	revenue_Code
				,	crmc.TypeofService					::	VARCHAR(  3 )	AS	type_Of_Service
				,	crmc.Units							::	VARCHAR(  9 )	AS	units
				,	crmc.ClaimType						::	VARCHAR(  1 )	AS	claim_Type		--	'I' facility;  'P' professional
				,	crmc.ClaimStatus					::	VARCHAR(  1 )	AS	claim_Status	--	'D' denied;  'F' full (as in "paid in ")
				,	crmc.ProcedureCode					::	VARCHAR(  6 )	AS	procedure_Code
				,	crmc.TypeofService					::	VARCHAR(  2 )	AS	type_Of_Service
				,	crmc.LineNumber						::	VARCHAR(  3 )	AS	claim_Line_Num
				,	crmc.PerformingProviderIdentifier	::	VARCHAR( 15 )	AS	perf_Provider_ID
			FROM
						ESRD_clean_raw.medical_claims	crmc
				JOIN	ESRD_clean_raw.provider_info	prov
				ON		crmc.PerformingProviderIdentifier	=	prov.ProviderID
			WHERE
					(	procedure_Code	IN	( '99281', '99282', '99283', '99284', '99285', '99291', 'G0380','G0381','G0382','G0383','G0384' )	)
				AND	(	units			>	0																									)
				AND	(	ClaimStatus		=	'F'																									)
		)
	GROUP BY
			member_id
		,	first_DOS
		,	prov_primary_specialty
		,	prof_indicator
		-- cpt_hcpcs_code really want any instance of multiple
		-- Filter this below
		-- HAVING
		--     units > 1
	ORDER BY
			member_id
		,	first_DOS
		,	prov_primary_specialty
		,	prof_indicator
		--cpt_hcpcs_code really want any instance of multiple
);
--ANALYZE COMPRESSION	whaight.HFNY_All_EM_Lines;
ANALYZE				whaight.HFNY_All_EM_Lines;
VACUUM SORT ONLY	whaight.HFNY_All_EM_Lines;
ANALYZE				whaight.HFNY_All_EM_Lines;

