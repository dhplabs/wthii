


/*	Here is an implementation of the code in file 1-make-table.sql	*/


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

