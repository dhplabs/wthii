/********************************************************************************/
/*																				*/
/*	FILE:			BHI_Adv_Norm_2												*/
/*	PROGRAMMED BY:	Will Haight (wthii)											*/
/*	DATE:			December 19, 2018											*/
/*	NOTES:			The following tables are established in this file:			*/
/*					whaight.BHI_Pro_clm_hdr_clean								*/
/*					whaight.BHI_Pro_clm_dtl_reduced								*/
/*					whaight.BHI_Pro_clm_hdr_clean_icd10							*/
/*					whaight.BHI_Pro_clm_hdr_reduced								*/
/*					whaight.BHI_Pharm_clm_hdr									*/
/*					whaight.BHI_Pharm_clm_dtl									*/
/*					whaight.BHI_all_claims_1NF									*/
/*																				*/
/*	MODIFICATIONS																*/
/*																				*/
/*		1.	BY:																	*/
/*			DATE:																*/
/*			NOTES:																*/
/*																				*/
/********************************************************************************/



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims.  These 	*/
/*	data were received in the table clean_raw.BHI_Professional_Claims.			*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Pro_clm_hdr_clean;
CREATE TABLE			whaight.BHI_Pro_clm_hdr_clean							--	H	D
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD	--	*	*
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD	--	*	*
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD	--	*
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD	--	*
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD	--	*
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD	--	*
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD	--	*
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD	--	*
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD	--	*
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD	--	*
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD	--	*
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD	--	*
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD	--	*
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD	--	*
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD	--	*
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD	--	*
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD	--	*
	,	rendering_Provider_Type_Code		VARCHAR(  2 )		ENCODE	ZSTD	--	*
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD	--	*
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD	--	*
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD	--	*
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD	--	*
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD	--	*
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD	--	*
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD	--	*
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD	--	*
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	primary_ICD9_DX_Code
	,	first_Date_Of_Service
	,	last_Date_Of_Service
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It reads the table	*/
/*	clean_raw.BHI_Professional_Claims and removes from the ICD DX and procedure	*/
/*	all non-alphanumeric characters.											*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Pro_clm_hdr_clean
(	SELECT
			pro.claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	pro.member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	pro.category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	pro.place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	pro.claim_Type_Code						::	VARCHAR(  2 )		AS	claim_Type_Code
		,	pro.first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	pro.last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
		,	REGEXP_REPLACE( pro.primary_ICD9_DX_Code, '[^a-zA-Z0-9]+', '' )
													::	VARCHAR(  7 )		AS	primary_ICD9_DX_Code
		,	REGEXP_REPLACE( pro.secondary_ICD9_DX_Code1, '[^a-zA-Z0-9]+', '' )
													::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code1
		,	REGEXP_REPLACE( pro.secondary_ICD9_DX_Code2, '[^a-zA-Z0-9]+', '' )
													::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code2
		,	REGEXP_REPLACE( pro.secondary_ICD9_DX_Code3, '[^a-zA-Z0-9]+', '' )
													::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code3
		,	pro.billing_Provider_NPI				::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	pro.billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	pro.billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	pro.billing_Provider_Medicare_ID		::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	pro.rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	pro.rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
		,	pro.rendering_Provider_Type_Code		::	VARCHAR(  2 )		AS	rendering_Provider_Type_Code
		,	pro.rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
		,	pro.ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	REGEXP_REPLACE( pro.primary_ICD10_DX_Code, '[^a-zA-Z0-9]+', '' )
													::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	REGEXP_REPLACE( pro.secondary_ICD10_DX_Code1, '[^a-zA-Z0-9]+', '' )
													::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	REGEXP_REPLACE( pro.secondary_ICD10_DX_Code2, '[^a-zA-Z0-9]+', '' )
													::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	REGEXP_REPLACE( pro.secondary_ICD10_DX_Code3, '[^a-zA-Z0-9]+', '' )
													::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	pro.claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	pro.non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
	FROM
		clean_raw.BHI_Professional_Claims		pro
);
ANALYZE COMPRESSION	whaight.BHI_Pro_clm_hdr_clean;
ANALYZE				whaight.BHI_Pro_clm_hdr_clean;
VACUUM SORT ONLY	whaight.BHI_Pro_clm_hdr_clean;
ANALYZE				whaight.BHI_Pro_clm_hdr_clean;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims.  These 	*/
/*	data were received in the table clean_raw.BHI_Professional_Claims.			*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Pro_clm_dtl_reduced;
CREATE TABLE			whaight.BHI_Pro_clm_dtl_reduced
(		claim_ID				VARCHAR( 12 )		ENCODE	ZSTD	--	*	*
	,	claim_Line_Num			INTEGER				ENCODE	ZSTD	--		*
	,	member_ID				VARCHAR( 12 )		ENCODE	ZSTD	--	*	*
	,	CPT_HCPCS_Code			VARCHAR(  6 )		ENCODE	ZSTD	--		*
	,	CPT_Modifier_Code		VARCHAR(  2 )		ENCODE	ZSTD	--		*
	,	number_Of_Units			NUMERIC( 10, 3 )	ENCODE	ZSTD	--		*
	,	type_Of_Service_Code	VARCHAR(  5 )		ENCODE	ZSTD	--		*
	,	TCRRV_Amount			NUMERIC( 10, 2 )	ENCODE	ZSTD	--		*
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_Line_Num
	,	CPT_HCPCS_Code
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It reads the table	*/
/*	clean_raw.BHI_Professional_Claims and removes from the ICD DX and procedure	*/
/*	all non-alphanumeric characters.											*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Pro_clm_dtl_reduced
(	SELECT
			pro.claim_ID				::	VARCHAR( 12 )		AS	claim_ID
		,	pro.claim_Line_Num			::	INTEGER				AS	claim_Line_Num
		,	pro.member_ID				::	VARCHAR( 12 )		AS	member_ID
		,	pro.CPT_HCPCS_Code			::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	pro.CPT_Modifier_Code		::	VARCHAR(  2 )		AS	CPT_Modifier_Code
		,	pro.number_Of_Units			::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	pro.type_Of_Service_Code	::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	pro.TCRRV_Amount			::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
	FROM
		clean_raw.BHI_Professional_Claims		pro
);
--ANALYZE COMPRESSION	whaight.BHI_Pro_clm_dtl_reduced;
ANALYZE				whaight.BHI_Pro_clm_dtl_reduced;
VACUUM SORT ONLY	whaight.BHI_Pro_clm_dtl_reduced;
ANALYZE				whaight.BHI_Pro_clm_dtl_reduced;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims with		*/
/*	all ICD DX and procedure codes included in the ICD 10 code set.				*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Pro_clm_hdr_clean_icd10;
CREATE TABLE			whaight.BHI_Pro_clm_hdr_clean_icd10
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD
	,	rendering_Provider_Type_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	GEM_Flags_primary					VARCHAR(  5 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	GEM_Flags_1							VARCHAR(  5 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	GEM_Flags_2							VARCHAR(  5 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	GEM_Flags_3							VARCHAR(  5 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	primary_ICD9_DX_Code
	,	first_Date_Of_Service
	,	last_Date_Of_Service
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_Professional_claims_clean, and accomplishes its	*/
/*	essential function:   it populates the new columns with ICD 10 translations	*/
/*	of ICD 9 DX and procedure codes when the claims were not submitted with		*/
/*	ICD 10 codes.  Translation is accomplished via the GEM xwalk tables from 	*/
/*	CMS, whaight.BHI_ICD9_to_ICD10_xwalk.										*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Pro_clm_hdr_clean_icd10
(	SELECT
			claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	claim_Type_Code						::	VARCHAR(  2 )		AS	claim_Type_Code
		,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
		,	primary_ICD9_DX_Code				::	VARCHAR(  7 )		AS	primary_ICD9_DX_Code
		,	secondary_ICD9_DX_Code1				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code1
		,	secondary_ICD9_DX_Code2				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code2
		,	secondary_ICD9_DX_Code3				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code3
		,	billing_Provider_NPI				::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
		,	rendering_Provider_Type_Code		::	VARCHAR(  2 )		AS	rendering_Provider_Type_Code
		,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
		,	ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	CASE	ICD_Code_Type
				WHEN	'2'	THEN	primary_ICD10_DX_Code
				WHEN	'1'	THEN	
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
						WHERE	icd9cm	=	primary_ICD9_DX_Code	)
				END								::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	CASE		ICD_Code_Type
				WHEN	'2'	THEN	NULL
				WHEN	'1'	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
						WHERE	icd9cm	=	primary_ICD9_DX_Code	)
				END								::	VARCHAR(  8 )		AS	GEM_Flags_Primary
		,	CASE	ICD_Code_Type
				WHEN	'2'	THEN	secondary_ICD10_DX_Code1
				WHEN	'1'	THEN	
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
						WHERE	icd9cm	=	secondary_ICD9_DX_Code1	)
				END								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	CASE		ICD_Code_Type
				WHEN	'2'	THEN	NULL
				WHEN	'1'	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
						WHERE	icd9cm	=	secondary_ICD9_DX_Code1	)
				END								::	VARCHAR(  8 )		AS	GEM_Flags_1
		,	CASE	ICD_Code_Type
				WHEN	'2'	THEN	secondary_ICD10_DX_Code2
				WHEN	'1'	THEN	
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
						WHERE	icd9cm	=	secondary_ICD9_DX_Code2	)
				END								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	CASE		ICD_Code_Type
				WHEN	'2'	THEN	NULL
				WHEN	'1'	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
						WHERE	icd9cm	=	secondary_ICD9_DX_Code2	)
				END								::	VARCHAR(  8 )		AS	GEM_Flags_2
		,	CASE	ICD_Code_Type
				WHEN	'2'	THEN	secondary_ICD10_DX_Code3
				WHEN	'1'	THEN	
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
						WHERE	icd9cm	=	secondary_ICD9_DX_Code3	)
				END								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	CASE		ICD_Code_Type
				WHEN	'2'	THEN	NULL
				WHEN	'1'	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
						WHERE	icd9cm	=	secondary_ICD9_DX_Code3	)
				END								::	VARCHAR(  8 )		AS	GEM_Flags_3
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
	FROM
		whaight.BHI_Pro_clm_hdr_clean
);
--ANALYZE COMPRESSION	whaight.BHI_Pro_clm_hdr_clean_icd10;
ANALYZE				whaight.BHI_Pro_clm_hdr_clean_icd10;
VACUUM SORT ONLY	whaight.BHI_Pro_clm_hdr_clean_icd10;
ANALYZE				whaight.BHI_Pro_clm_hdr_clean_icd10;



/********************************************************************************/
/*																				*/
/*	The INSERT below simply adds to the table whaight.BHI_claims_ICD10_DX_Codes	*/
/*	the ICD 10 diagnosis codes listed with the BHI professional claims.			*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_claims_ICD10_DX_Codes
(			SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	primary_ICD10_DX_Code		::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'P'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_Primary			::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Fac_Claim_Hdr_clean_icd10
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code1	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_1					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Fac_Claim_Hdr_clean_icd10
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code2	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_2					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Fac_Claim_Hdr_clean_icd10
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code3	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_3					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Fac_Claim_Hdr_clean_icd10
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
);
ANALYZE				whaight.BHI_claims_ICD10_DX_Codes;
VACUUM SORT ONLY	whaight.BHI_claims_ICD10_DX_Codes;
ANALYZE				whaight.BHI_claims_ICD10_DX_Codes;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims.  These 	*/
/*	data were received in the table clean_raw.BHI_Professional_Claims.			*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Pro_clm_hdr_reduced;
CREATE TABLE			whaight.BHI_Pro_clm_hdr_reduced
(		claim_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )	ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	claim_Type_Code						VARCHAR(  2 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE			ENCODE	ZSTD
	,	last_Date_Of_Service				DATE			ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )	ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )	ENCODE	ZSTD
	,	rendering_Provider_Type_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )	ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )	ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	first_Date_Of_Service
	,	last_Date_Of_Service
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_Professional_claims_clean, and accomplishes its	*/
/*	essential function:   it populates the new columns with ICD 10 translations	*/
/*	of ICD 9 DX and procedure codes when the claims were not submitted with		*/
/*	ICD 10 codes.  Translation is accomplished via the GEM xwalk tables from 	*/
/*	CMS, whaight.BHI_ICD9_to_ICD10_xwalk.										*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Pro_clm_hdr_reduced
(	SELECT
			claim_ID							::	VARCHAR( 12 )	AS	claim_ID
		,	member_ID							::	VARCHAR( 12 )	AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )	AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )	AS	place_Of_Service_Code
		,	claim_Type_Code						::	VARCHAR(  2 )	AS	claim_Type_Code
		,	first_Date_Of_Service				::	DATE			AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE			AS	last_Date_Of_Service
		,	billing_Provider_NPI				::	VARCHAR( 10 )	AS	billing_Provider_NPI
		,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )	AS	billing_Provider_Specialty_Code
		,	billing_Provider_Zip_Code			::	VARCHAR(  5 )	AS	billing_Provider_Zip_Code
		,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )	AS	billing_Provider_Medicare_ID
		,	rendering_Provider_NPI				::	VARCHAR( 10 )	AS	rendering_Provider_NPI
		,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )	AS	rendering_Provider_Specialty_Code
		,	rendering_Provider_Type_Code		::	VARCHAR(  2 )	AS	rendering_Provider_Type_Code
		,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )	AS	rendering_Provider_Zip_Code
		,	ICD_Code_Type						::	VARCHAR(  1 )	AS	ICD_Code_Type
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )	AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )	AS	non_Covered_Reason_Code
	FROM
		whaight.BHI_Pro_clm_hdr_clean_icd10
);
--ANALYZE COMPRESSION	whaight.BHI_Pro_clm_hdr_reduced;
ANALYZE				whaight.BHI_Pro_clm_hdr_reduced;
VACUUM SORT ONLY	whaight.BHI_Pro_clm_hdr_reduced;
ANALYZE				whaight.BHI_Pro_clm_hdr_reduced;



DROP TABLE IF EXISTS	whaight.BHI_Pharm_clm_hdr;
CREATE TABLE			whaight.BHI_Pharm_clm_hdr							--	H	D
(		claim_ID							VARCHAR( 12 )	ENCODE	ZSTD	--	*	*
	,	member_ID							VARCHAR( 12 )	ENCODE	ZSTD	--	*	*
	,	place_Of_Service_Code				VARCHAR(  2 )	ENCODE	ZSTD	--	*
	,	billing_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD	--	*
	,	rendering_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD	--	*
	,	prescribing_Provider_NPI			VARCHAR( 10 )	ENCODE	ZSTD	--	*
	,	prescribing_Provider_DEA_NCPDP_ID	VARCHAR( 27 )	ENCODE	ZSTD	--	*
	,	compound_Indicator					VARCHAR(  1 )	ENCODE	ZSTD	--	*
	,	DAW_Code							VARCHAR(  2 )	ENCODE	ZSTD	--	*
	,	dispensing_Status_Code				VARCHAR(  1 )	ENCODE	ZSTD	--	*
	,	plan_Specialty_Drug_Indicator		VARCHAR(  1 )	ENCODE	ZSTD	--	*
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	prescribing_Provider_NPI
);



INSERT INTO	whaight.BHI_Pharm_clm_hdr
(	SELECT
			claim_ID							::	VARCHAR( 12 )	AS	claim_ID
		,	member_ID							::	VARCHAR( 12 )	AS	member_ID
		,	place_Of_Service_Code				::	VARCHAR(  2 )	AS	place_Of_Service_Code
		,	billing_Provider_NPI				::	VARCHAR( 10 )	AS	billing_Provider_NPI
		,	rendering_Provider_NPI				::	VARCHAR( 10 )	AS	rendering_Provider_NPI
		,	prescribing_Provider_NPI			::	VARCHAR( 10 )	AS	prescribing_Provider_NPI
		,	prescribing_Provider_DEA_NCPDP_ID	::	VARCHAR( 27 )	AS	prescribing_Provider_DEA_NCPDP_ID
		,	compound_Indicator					::	VARCHAR(  1 )	AS	compound_Indicator
		,	DAW_Code							::	VARCHAR(  2 )	AS	DAW_Code
		,	dispensing_Status_Code				::	VARCHAR(  1 )	AS	dispensing_Status_Code
		,	plan_Specialty_Drug_Indicator		::	VARCHAR(  1 )	AS	plan_Specialty_Drug_Indicator
	FROM
		clean_raw.BHI_Pharmacy_Claims
);
ANALYZE COMPRESSION	whaight.BHI_Pharm_clm_hdr;
ANALYZE				whaight.BHI_Pharm_clm_hdr;
VACUUM SORT ONLY	whaight.BHI_Pharm_clm_hdr;
ANALYZE				whaight.BHI_Pharm_clm_hdr;



DROP TABLE IF EXISTS	whaight.BHI_Pharm_clm_dtl;
CREATE TABLE			whaight.BHI_Pharm_clm_dtl					--	H	D
(		claim_ID				VARCHAR( 12 )		ENCODE	ZSTD	--	*	*
	,	claim_Line_Num			INTEGER				ENCODE	ZSTD	--		*
	,	member_ID				VARCHAR( 12 )		ENCODE	ZSTD	--	*	*
	,	NDC_Code				VARCHAR( 11 )		ENCODE	ZSTD	--		*
	,	count_Of_Days_Supply	INTEGER				ENCODE	ZSTD	--		*
	,	dispensed_Quantity		NUMERIC( 10, 3 )	ENCODE	ZSTD	--		*
	,	prescription_Fill_Date	DATE				ENCODE	ZSTD	--		*
	,	TCRRV_Amount			NUMERIC( 10, 2 )	ENCODE	ZSTD	--		*
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_Line_Num
	,	NDC_Code
	,	prescription_Fill_Date
);



INSERT INTO	whaight.BHI_Pharm_clm_dtl
(	SELECT
			claim_ID				::	VARCHAR( 12 )		AS	claim_ID
		,	claim_Line_Num			::	INTEGER				AS	claim_Line_Num
		,	member_ID				::	VARCHAR( 12 )		AS	member_ID
		,	NDC_Code				::	VARCHAR( 11 )		AS	NDC_Code
		,	count_Of_Days_Supply	::	INTEGER				AS	count_Of_Days_Supply
		,	dispensed_Quantity		::	NUMERIC( 10, 3 )	AS	dispensed_Quantity
		,	prescription_Fill_Date	::	DATE				AS	prescription_Fill_Date
		,	TCRRV_Amount			::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
	FROM
		clean_raw.BHI_Pharmacy_Claims
);
--ANALYZE COMPRESSION	whaight.BHI_Pharm_clm_dtl;
ANALYZE				whaight.BHI_Pharm_clm_dtl;
VACUUM SORT ONLY	whaight.BHI_Pharm_clm_dtl;
ANALYZE				whaight.BHI_Pharm_clm_dtl;



DROP TABLE IF EXISTS	whaight.BHI_all_claims_1NF;
CREATE TABLE			whaight.BHI_all_claims_1NF
(		claim_ID				VARCHAR( 12 )	ENCODE	ZSTD
	,	member_ID				VARCHAR( 12 )	ENCODE	ZSTD
	,	claim_source_indicator	VARCHAR(  1 )	ENCODE	ZSTD	/*	'F'acility, 'P'rofessional, 'D'rugs for Pharmacy claims	*/
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_source_indicator
);



INSERT INTO	whaight.BHI_all_claims_1NF
(		SELECT DISTINCT
				claim_ID	::	VARCHAR( 12 )	AS	claim_ID
			,	member_ID	::	VARCHAR( 12 )	AS	member_ID
			,	'F'			::	VARCHAR(  1 )	AS	claim_source_indicator
		FROM
			whaight.BHI_Fac_clm_hdr_reduced
	UNION
		SELECT DISTINCT
				claim_ID	::	VARCHAR( 12 )	AS	claim_ID
			,	member_ID	::	VARCHAR( 12 )	AS	member_ID
			,	'P'			::	VARCHAR(  1 )	AS	claim_source_indicator
		FROM
			whaight.BHI_Pro_clm_hdr_reduced
	UNION
		SELECT DISTINCT
				claim_ID	::	VARCHAR( 12 )	AS	claim_ID
			,	member_ID	::	VARCHAR( 12 )	AS	member_ID
			,	'D'			::	VARCHAR(  1 )	AS	claim_source_indicator
		FROM
			whaight.BHI_Pharm_clm_hdr
);
--ANALYZE COMPRESSION	whaight.BHI_all_claims_1NF;
ANALYZE				whaight.BHI_all_claims_1NF;
VACUUM SORT ONLY	whaight.BHI_all_claims_1NF;
ANALYZE				whaight.BHI_all_claims_1NF;



/********************************************************************************/
/*																				*/
/*	Make sure the right people can get at these tables.							*/
/*																				*/
/********************************************************************************/
GRANT USAGE		ON SCHEMA	whaight								TO	aprivett;
GRANT SELECT	ON TABLE	whaight.BHI_Pro_clm_hdr_clean		TO	aprivett;
GRANT SELECT	ON TABLE	whaight.BHI_Pro_clm_dtl_reduced		TO	aprivett;
GRANT SELECT	ON TABLE	whaight.BHI_Pro_clm_hdr_clean_icd10	TO	aprivett;
GRANT SELECT	ON TABLE	whaight.BHI_Pro_clm_hdr_reduced		TO	aprivett;
GRANT SELECT	ON TABLE	whaight.BHI_Pharm_clm_hdr			TO	aprivett;
GRANT SELECT	ON TABLE	whaight.BHI_Pharm_clm_dtl			TO	aprivett;
GRANT SELECT	ON TABLE	whaight.BHI_all_claims_1NF			TO	aprivett;


GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_all_claims_1NF
TO				aprivett;



DROP TABLE IF EXISTS	whaight.BHI_ED_claims_master;
CREATE TABLE			whaight.BHI_ED_claims_master
(		claim_ID				VARCHAR( 12 )	ENCODE	ZSTD
	,	member_ID				VARCHAR( 12 )	ENCODE	ZSTD
	,	claim_source_indicator	VARCHAR(  1 )	ENCODE	ZSTD	/*	'F'acility, 'P'rofessional, 'D'rugs for Pharmacy claims	*/
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_source_indicator
);



INSERT INTO	whaight.BHI_ED_claims_master
(		SELECT DISTINCT
				claims.claim_ID					::	VARCHAR( 12 )	AS	claim_ID
			,	claims.member_ID				::	VARCHAR( 12 )	AS	member_ID
			,	claims.claim_source_indicator	::	VARCHAR(  1 )	AS	claim_source_indicator
		FROM
					whaight.BHI_all_claims_1NF	claims
			JOIN	(		SELECT DISTINCT		pro.claim_ID	AS	claim_ID
											,	pro.member_ID	AS	member_ID
							FROM			whaight.BHI_Professional_claims_clean_icd10	pro
							WHERE				pro.CPT_HCPCS_Code	IN	(	'99281',	'99282',	'99283',	'99284',	'99285',
																			'G0380',	'G0381',	'G0382',	'G0383',	'G0384',
																			'99220',	'99217',	'99236',	'99291',	'99292'		)
											OR	BTRIM( pro.place_Of_Service_Code )	=	'23'
						UNION
							SELECT DISTINCT		fac.claim_ID	AS	claim_ID
											,	fac.member_ID	AS	member_ID
							FROM			whaight.BHI_Facility_claims_clean_icd10		fac
							WHERE				fac.CPT_HCPCS_Code	IN	(	'99281',	'99282',	'99283',	'99284',	'99285',
																			'G0380',	'G0381',	'G0382',	'G0383',	'G0384',
																			'99220',	'99217',	'99236',	'99291',	'99292'		)
											OR	BTRIM( fac.place_Of_Service_Code )				=	'23'
											OR	SUBSTRING( BTRIM( fac.revenue_Code ), 1, 3 )	=	'045'
											OR	BTRIM( fac.revenue_Code )						=	'0981'
					)							pairs
		ON		claims.claim_ID		=	pairs.claim_ID
			AND	claims.member_ID	=	pairs.member_ID
);
--ANALYZE COMPRESSION	whaight.BHI_ED_claims_master;
ANALYZE				whaight.BHI_ED_claims_master;
VACUUM SORT ONLY	whaight.BHI_ED_claims_master;
ANALYZE				whaight.BHI_ED_claims_master;


SELECT	COUNT( * )
FROM	whaight.BHI_ED_claims_master;
--	10,611,146	PRO



SELECT	COUNT( * )
FROM	whaight.BHI_ED_claims_master;
--	6,372,221	FAC



SELECT	COUNT( * )
FROM	whaight.BHI_ED_claims_master;
--	16,983,367  BOTH


GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_ED_claims_master
TO				aprivett;

vacuum;