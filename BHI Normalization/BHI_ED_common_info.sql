DROP TABLE IF EXISTS	whaight.BHI_ED_claims_common_info;
CREATE TABLE			whaight.BHI_ED_claims_common_info
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD	--  both
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD	--  both
	/*	Facility claims table, 'F', Professional table, 'P'	*/
    ,   claim_Source                        VARCHAR(  1 )		ENCODE	ZSTD	--	NEW!
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD	--  both
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD	--  both
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD	--  both
	,	admission_Source_Code				VARCHAR(  2 )		ENCODE	ZSTD	--	NOT in Professional
	,	admission_Type_Code					VARCHAR(  2 )		ENCODE	ZSTD	--  NOT in Professional
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD	--  both
	,	discharge_Status_Code				VARCHAR(  2 )		ENCODE	ZSTD	--	NOT in Professional
	,	type_Of_Bill_Code					VARCHAR(  3 )		ENCODE	ZSTD	--	NOT in Professional
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD	--  both
	,	CPT_Modifier_Code					VARCHAR(  2 )		ENCODE	ZSTD	--  both
	,	revenue_Code						VARCHAR(  4 )		ENCODE	ZSTD	--	NOT in Professional
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD	--  both
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD	--  both
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD	--  both
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD	--  both
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD	--  both
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD	--  both
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD	--  both
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD	--  both
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD	--  both
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD	--  both
	,	rendering_Provider_Type_Code		VARCHAR(  2 )		ENCODE	ZSTD	--	NOT in Facility
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD	--  both
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )		ENCODE	ZSTD	--	NOT in Professional
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )		ENCODE	ZSTD	--	NOT in Professional
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD	--  both
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD	--	NOT in Professional
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD	--  both
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD	--  both
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD	--  both
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD	--  both
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )		ENCODE	ZSTD	--  NOT in Professional
	,	principal_ICD10_Proc_Code			VARCHAR(  7 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_Proc_Code1			VARCHAR(  7 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_Proc_Code2			VARCHAR(  7 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_Proc_Code3			VARCHAR(  7 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_Proc_Code4			VARCHAR(  7 )		ENCODE	ZSTD	--  NOT in Professional
	,	secondary_ICD10_Proc_Code5			VARCHAR(  7 )		ENCODE	ZSTD	--  NOT in Professional
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD	--  both
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD    --  both
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD	--  both
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_Line_Num
	,	rendering_Provider_NPI
	,	primary_ICD10_DX_Code
	,	CPT_HCPCS_Code
	,	first_Date_Of_Service
	,	last_Date_Of_Service
);



INSERT INTO	whaight.BHI_ED_claims_common_info
(		SELECT
				claim_ID							::	VARCHAR( 12 )		AS	claim_ID
            ,	member_ID							::	VARCHAR( 12 )		AS	member_ID
            ,   'F'                                 ::  VARCHAR(  1 )		AS  claim_Source
			,	claim_Line_Num						::	INTEGER				AS	claim_Line_Num
			,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
			,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
			,	admission_Source_Code				::	VARCHAR(  2 )		AS	admission_Source_Code
			,	admission_Type_Code					::	VARCHAR(  2 )		AS	admission_Type_Code
			,	claimTypeCode						::	VARCHAR(  2 )		AS	claim_Type_Code
			,	discharge_Status_Code				::	VARCHAR(  2 )		AS	discharge_Status_Code
			,	type_Of_Bill_Code					::	VARCHAR(  3 )		AS	type_Of_Bill_Code
			,	CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
			,	procedure_Modifier_Code				::	VARCHAR(  2 )		AS	CPT_Modifier_Code
			,	revenue_Code						::	VARCHAR(  4 )		AS	revenue_Code
			,	number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
			,	type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
			,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
			,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
			,	billing_Provider_NPI				::	VARCHAR( 10 )		AS	billing_Provider_NPI
			,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
            ,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
			,	billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
			,	rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
			,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
			,	NULL								::	VARCHAR(  2 )		AS	rendering_Provider_Type_Code
			,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
			,	claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )		AS	claims_System_Assigned_DRG_Code
			,	claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )		AS	claims_System_Assigned_MDC_Code
			,	ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
			,	admitting_ICD10_DX_Code				::	VARCHAR(  8 )		AS	admitting_ICD10_DX_Code
			,	primary_ICD10_DX_Code				::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
			,	secondary_ICD10_DX_Code1			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
			,	secondary_ICD10_DX_Code2			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
			,	secondary_ICD10_DX_Code3			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
			,	secondary_ICD10_DX_Code4			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code4
			,	secondary_ICD10_DX_Code5			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code5
			,	secondary_ICD10_DX_Code6			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code6
			,	secondary_ICD10_DX_Code7			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code7
			,	secondary_ICD10_DX_Code8			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code8
			,	secondary_ICD10_DX_Code9			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code9
			,	secondary_ICD10_DX_Code10			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code10
			,	principal_ICD10_Proc_Code			::	VARCHAR(  7 )		AS	principal_ICD10_Proc_Code
			,	secondary_ICD10_Proc_Code1			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code1
			,	secondary_ICD10_Proc_Code2			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code2
			,	secondary_ICD10_Proc_Code3			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code3
			,	secondary_ICD10_Proc_Code4			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code4
			,	secondary_ICD10_Proc_Code5			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code5
			,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
			,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
			,	TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
		FROM
			whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced
    UNION
	    SELECT
				claim_ID							::	VARCHAR( 12 )		AS	claim_ID
            ,	member_ID							::	VARCHAR( 12 )		AS	member_ID
            ,   'P'                                 ::  VARCHAR(  1 )		AS  claim_Source
		    ,	claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		    ,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		    ,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
			,	NULL								::	VARCHAR(  2 )		AS	admission_Source_Code
			,	NULL								::	VARCHAR(  2 )		AS	admission_Type_Code
		    ,	claim_Type_Code						::	VARCHAR(  2 )		AS	claim_Type_Code
			,	NULL								::	VARCHAR(  2 )		AS	discharge_Status_Code
			,	NULL								::	VARCHAR(  3 )		AS	type_Of_Bill_Code
		    ,	CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		    ,	CPT_Modifier_Code					::	VARCHAR(  2 )		AS	CPT_Modifier_Code
			,	NULL								::	VARCHAR(  4 )		AS	revenue_Code
		    ,	number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		    ,	type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
		    ,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		    ,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
		    ,	billing_Provider_NPI				::	VARCHAR( 10 )		AS	billing_Provider_NPI
		    ,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
            ,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		    ,	billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		    ,	rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		    ,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
			,	rendering_Provider_Type_Code		::	VARCHAR(  2 )		AS	rendering_Provider_Type_Code
		    ,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
			,	NULL								::	VARCHAR(  4 )		AS	claims_System_Assigned_DRG_Code
			,	NULL								::	VARCHAR(  2 )		AS	claims_System_Assigned_MDC_Code
		    ,	ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
			,	NULL								::	VARCHAR(  8 )		AS	admitting_ICD10_DX_Code
		    ,	primary_ICD10_DX_Code				::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		    ,	secondary_ICD10_DX_Code1			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		    ,	secondary_ICD10_DX_Code2			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		    ,	secondary_ICD10_DX_Code3			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
			,	NULL								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code4
			,	NULL								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code5
			,	NULL								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code6
			,	NULL								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code7
			,	NULL								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code8
			,	NULL								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code9
			,	NULL								::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code10
			,	NULL								::	VARCHAR(  7 )		AS	principal_ICD10_Proc_Code
			,	NULL								::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code1
			,	NULL								::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code2
			,	NULL								::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code3
			,	NULL								::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code4
			,	NULL								::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code5
		    ,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
	        ,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
	        ,	TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
		FROM
			whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced
    ORDER BY
        first_Date_Of_Service   DESC
);
--ANALYZE COMPRESSION		whaight.BHI_ED_claims_common_info;
ANALYZE					whaight.BHI_ED_claims_common_info;
VACUUM SORT ONLY		whaight.BHI_ED_claims_common_info;
ANALYZE					whaight.BHI_ED_claims_common_info;



/*	First shot.  Didn't work.  Subquery won't work as a function.	*/
WITH	prev_claim	AS
	(	SELECT TOP 1		claim_ID				AS	claim_ID
						,	member_ID				AS	member_ID
						,	claim_Line_Num			AS	claim_Line_Num
						,	first_Date_Of_Service	AS	FDOS
		FROM			whaight.BHI_ED_claims_common_info
		WHERE				DATE_CMP( prev_claim.first_Date_Of_Service, claims.first_Date_Of_Service ) < 0
						AND prev_claims.member_ID				=	claims.member_ID
						AND	(		prev_claim.claim_ID			!=	claims.claim_ID
								OR	prev_claim.claim_Line_Num	!=	claims.claim_Line_Num	)
		ORDER BY		first_Date_Of_Service   DESC
	)
SELECT		claims.claim_ID
		,	claims.member_ID
		,	claims.claim_Line_Num
		,	claims.first_Date_Of_Service
		,	prev_claim.claim_ID
		,	prev_claim.member_ID
		,	prev_claim.claim_Line_Num
		,	prev_claim.FDOS
FROM	whaight.BHI_ED_claims_common_info	claims
LIMIT	100;



/*	Second try.  Moving the subquery from the WITH to the FROM didn't fix anything.	*/
SELECT		claims.claim_ID
		,	claims.member_ID
		,	claims.claim_Line_Num
		,	claims.first_Date_Of_Service
		,	prev_claim.claim_ID
		,	prev_claim.member_ID
		,	prev_claim.claim_Line_Num
		,	prev_claim.FDOS
FROM		whaight.BHI_ED_claims_common_info	claims
		,	(	SELECT DISTINCT		claim_ID				AS	claim_ID
								,	member_ID				AS	member_ID
								,	claim_Line_Num			AS	claim_Line_Num
								,	first_Date_Of_Service	AS	FDOS
				FROM			whaight.BHI_ED_claims_common_info
				WHERE				DATE_CMP( prev_claim.first_Date_Of_Service, claims.first_Date_Of_Service ) < 0
								AND prev_claims.member_ID				=	claims.member_ID
								AND	(		prev_claim.claim_ID			!=	claims.claim_ID
										OR	prev_claim.claim_Line_Num	!=	claims.claim_Line_Num	)
				ORDER BY		first_Date_Of_Service   DESC
			)									prev_claim
LIMIT	100;


SELECT	count(*)
FROM	whaight.BHI_ED_Professional_claims_clean_icd10_reduced;
--	27,003,542



SELECT	distinct count(*)
FROM	whaight.BHI_ED_Facility_claims_clean_icd10_reduced;
--	25,483,540


SELECT	distinct count(claim_ID)
FROM	whaight.BHI_ED_Facility_claims_clean_icd10_reduced;
--	25,483,540


choose two adjacent E&M codes 99283 and 99284
And equivalent G codes
Look for claims icd10s
find claims with levels 3 or 4 (CPTs, final digit gives level (quandria codes)))
look for level 4 claims which look otherwise more like level 3 claims under clustering


SELECT	COUNT( * )
FROM	whaight.BHI_ED_claims_common_info
--	WHERE	CPT_HCPCS_Code IN	( '99283', '99284', 'G0383', 'G0384' )
;