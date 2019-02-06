/********************************************************************************/
/*																				*/
/*	FILE:			BHI_ED_claims												*/
/*	PROGRAMMED BY:	Will Haight (wthii)											*/
/*	DATE:			October, 2018												*/
/*	NOTES:			The following tables are established in this file:			*/
/*					whaight.BHI_Facility_claims_clean							*/
/*					whaight.BHI_Facility_claims_clean_icd10						*/
/*					whaight.BHI_ED_Facility_claims_clean_icd10	(dropped)		*/
/*					whaight.BHI_ED_Facility_claims_clean_icd10_reduced			*/
/*					whaight.BHI_ED_Facility_claims_clean_icd10_alt				*/
/*					whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced		*/
/*					whaight.BHI_Professional_claims_clean						*/
/*					whaight.BHI_Professional_claims_clean_icd10					*/
/*					whaight.BHI_ED_Professional_claims_clean_icd10	(dropped)	*/
/*					whaight.BHI_ED_Facility_claims_clean_icd10_reduced			*/
/*					whaight.BHI_ED_Professional_claims_clean_icd10_alt			*/
/*					whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced	*/
/*																				*/
/*	MODIFICATIONS																*/
/*																				*/
/*		1.	BY:		wthii														*/
/*			DATE:	12/10/2018													*/
/*			NOTES:	Inserted documentation.										*/
/*																				*/
/*		2.	BY:		wthii														*/
/*			DATE:	12/31/2018													*/
/*			NOTES:	Created the tables											*/
/*					whaight.BHI_ED_Facility_claims_clean_icd10_alt				*/
/*					whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced		*/
/*					whaight.BHI_ED_Professional_claims_clean_icd10_alt			*/
/*					whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced	*/
/*																				*/
/*																				*/
/*																				*/
/********************************************************************************/



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI facility claims.  These data	*/
/*	were received in two tables, clean_raw.BHI_Facility_Claim_Header and		*/
/*	clean_raw.BHI_Facility_Claim_Detail											*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Facility_claims_clean;
CREATE TABLE 			whaight.BHI_Facility_claims_clean
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )		ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	procedure_Modifier_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	revenue_Code						VARCHAR(  4 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	admitting_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code4				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code5				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code6				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code7				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code8				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code9				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code10			VARCHAR(  7 )		ENCODE	ZSTD
	,	principal_ICD9_Procedure_Code		VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code1		VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code2		VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code3		VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code4		VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code5		VARCHAR(  6 )		ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )		ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD10_Procedure_Code		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code1		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code2		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code3		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code4		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code5		VARCHAR(  7 )		ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	first_Date_Of_Service
	,	last_Date_Of_Service
	,	primary_ICD9_DX_Code
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It joins the two	*/
/*	tables 	clean_raw.BHI_Facility_Claim_Header and								*/
/*	clean_raw.BHI_Facility_Claim_Detail and "cleans" certain columns: the		*/
/*	ICD DX and procedure codes have non-alphanumeric characters removed.		*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Facility_claims_clean
(	SELECT
			header.claim_ID								::	VARCHAR( 12 )		AS	claim_ID
		,	header.member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	header.category_Of_Service_Code				::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	header.place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	header.admission_Source_Code				::	VARCHAR(  2 )		AS	admission_Source_Code
		,	header.admission_Type_Code					::	VARCHAR(  2 )		AS	admission_Type_Code
		,	header.claimTypeCode						::	VARCHAR(  2 )		AS	claimTypeCode
		,	header.discharge_Status_Code				::	VARCHAR(  2 )		AS	discharge_Status_Code
		,	header.type_Of_Bill_Code					::	VARCHAR(  3 )		AS	type_Of_Bill_Code
		,	detail.claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	detail.CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	detail.procedure_Modifier_Code				::	VARCHAR(  2 )		AS	procedure_Modifier_Code
		,	detail.revenue_Code							::	VARCHAR(  4 )		AS	revenue_Code
		,	detail.number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	detail.type_Of_Service_Code					::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	detail.claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	detail.non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	detail.TCRRV_Amount							::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
		,	header.first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	header.last_Date_Of_Service					::	DATE				AS	last_Date_Of_Service
		,	REGEXP_REPLACE( header.admitting_ICD9_DX_Code, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	admitting_ICD9_DX_Code
		,	REGEXP_REPLACE( header.primary_ICD9_DX_Code, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	primary_ICD9_DX_Code
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code1, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code1
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code2, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code2
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code3, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code3
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code4, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code4
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code5, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code5
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code6, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code6
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code7, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code7
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code8, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code8
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code9, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code9
		,	REGEXP_REPLACE( header.secondary_ICD9_DX_Code10, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code10
		,	REGEXP_REPLACE( header.principal_ICD9_Procedure_Code, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  6 )		AS	principal_ICD9_Proc_Code
		,	REGEXP_REPLACE( header.secondary_ICD9_Procedure_Code1, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code1
		,	REGEXP_REPLACE( header.secondary_ICD9_Procedure_Code2, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code2
		,	REGEXP_REPLACE( header.secondary_ICD9_Procedure_Code3, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code3
		,	REGEXP_REPLACE( header.secondary_ICD9_Procedure_Code4, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code4
		,	REGEXP_REPLACE( header.secondary_ICD9_Procedure_Code5, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code5
		,	header.billing_Provider_NPI					::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	header.billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	header.billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	header.billing_Provide_rMedicare_ID			::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	header.rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	header.rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
		,	header.rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
		,	header.claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )		AS	claims_System_Assigned_DRG_Code
		,	header.claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )		AS	claims_System_Assigned_MDC_Code
		,	header.ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	REGEXP_REPLACE( header.admitting_ICD10_DX_Code, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	admitting_ICD10_DX_Code
		,	REGEXP_REPLACE( header.primary_ICD10_DX_Code, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code1, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code2, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code3, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code4, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code4
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code5, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code5
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code6, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code6
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code7, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code7
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code8, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code8
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code9, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code9
		,	REGEXP_REPLACE( header.secondary_ICD10_DX_Code10, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code10
		,	REGEXP_REPLACE( header.principal_ICD10_Procedure_Code, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	principal_ICD10_Proc_Code
		,	REGEXP_REPLACE( header.secondary_ICD10_Procedure_Code1, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code1
		,	REGEXP_REPLACE( header.secondary_ICD10_Procedure_Code2, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code2
		,	REGEXP_REPLACE( header.secondary_ICD10_Procedure_Code3, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code3
		,	REGEXP_REPLACE( header.secondary_ICD10_Procedure_Code4, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code4
		,	REGEXP_REPLACE( header.secondary_ICD10_Procedure_Code5, '[^a-zA-Z0-9]+', '' )
														::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code5
	FROM
					clean_raw.BHI_Facility_Claim_Header		header
		JOIN		clean_raw.BHI_Facility_Claim_Detail		detail
		ON			header.member_ID	=	detail.member_ID
				AND	header.claim_ID		=	detail.claim_ID
);
--ANALYZE COMPRESSION		whaight.BHI_Facility_claims_clean;
ANALYZE					whaight.BHI_Facility_claims_clean;
VACUUM SORT ONLY		whaight.BHI_Facility_claims_clean;
ANALYZE					whaight.BHI_Facility_claims_clean;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI facility claims with all ICD	*/
/*	codes included in the ICD 10 code set.										*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Facility_claims_clean_icd10;
CREATE TABLE			whaight.BHI_Facility_claims_clean_icd10
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )		ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	procedure_Modifier_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	revenue_Code						VARCHAR(  4 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	admitting_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code4				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code5				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code6				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code7				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code8				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code9				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code10			VARCHAR(  7 )		ENCODE	ZSTD
	,	admitting_ICD9_AS_10_DX_Code		VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD9_AS_10_DX_Code			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code1		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code2		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code3		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code4		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code5		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code6		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code7		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code8		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code9		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code10		VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD9_Proc_Code			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code1			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code2			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code3			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code4			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code5			VARCHAR(  6 )		ENCODE	ZSTD
	,	principal_ICD9_AS_10_Proc_Code		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code1		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code2		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code3		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code4		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code5		VARCHAR(  7 )		ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )		ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD10_Proc_Code			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code1			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code2			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code3			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code4			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code5			VARCHAR(  7 )		ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	first_Date_Of_Service
	,	last_Date_Of_Service
	,	primary_ICD9_DX_Code
	,	claim_Line_Num
	,	CPT_HCPCS_Code
	,	procedure_Modifier_Code
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_Facility_claims_clean, and accomplishes its		*/
/*	essential function:   it populates the new columns with ICD 10 translations	*/
/*	of ICD 9 DX and procedure codes when the claims were not submitted with		*/
/*	ICD 10 codes.  Translation is accomplished via the GEM xwalk tables from 	*/
/*	CMS, whaight.BHI_ICD9_to_ICD10_xwalk.										*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Facility_claims_clean_icd10
(	SELECT
			claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	admission_Source_Code				::	VARCHAR(  2 )		AS	admission_Source_Code
		,	admission_Type_Code					::	VARCHAR(  2 )		AS	admission_Type_Code
		,	claimTypeCode						::	VARCHAR(  2 )		AS	claimTypeCode
		,	discharge_Status_Code				::	VARCHAR(  2 )		AS	discharge_Status_Code
		,	type_Of_Bill_Code					::	VARCHAR(  3 )		AS	type_Of_Bill_Code
		,	claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	procedure_Modifier_Code				::	VARCHAR(  2 )		AS	procedure_Modifier_Code
		,	revenue_Code						::	VARCHAR(  4 )		AS	revenue_Code
		,	number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
		,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
		,	admitting_ICD9_DX_Code				::	VARCHAR(  7 )		AS	admitting_ICD9_DX_Code
		,	primary_ICD9_DX_Code				::	VARCHAR(  7 )		AS	primary_ICD9_DX_Code
		,	secondary_ICD9_DX_Code1				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code1
		,	secondary_ICD9_DX_Code2				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code2
		,	secondary_ICD9_DX_Code3				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code3
		,	secondary_ICD9_DX_Code4				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code4
		,	secondary_ICD9_DX_Code5				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code5
		,	secondary_ICD9_DX_Code6				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code6
		,	secondary_ICD9_DX_Code7				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code7
		,	secondary_ICD9_DX_Code8				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code8
		,	secondary_ICD9_DX_Code9				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code9
		,	secondary_ICD9_DX_Code10			::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code10
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	admitting_ICD10_DX_Code
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	admitting_ICD9_DX_Code	)
			END									::	VARCHAR(  8 )		AS	admitting_ICD9_AS_10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	primary_ICD10_DX_Code
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	primary_ICD9_DX_Code	)
			END									::	VARCHAR(  8 )		AS	primary_ICD9_AS_10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code1
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code1	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code1
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code2
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code2	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code2
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code3
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code3	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code3
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code4
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code4	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code4
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code5
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code5	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code5
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code6
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code6	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code6
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code7
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code7	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code7
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code8
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code8	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code8
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code9
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code9	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code9
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code10
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code10	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code10
		,	principal_ICD9_Procedure_Code		::	VARCHAR(  6 )		AS	principal_ICD9_Proc_Code
		,	secondary_ICD9_Procedure_Code1		::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code1
		,	secondary_ICD9_Procedure_Code2		::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code2
		,	secondary_ICD9_Procedure_Code3		::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code3
		,	secondary_ICD9_Procedure_Code4		::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code4
		,	secondary_ICD9_Procedure_Code5		::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code5

		,	CASE	ICD_Code_Type
				WHEN	2	THEN	principal_ICD10_Procedure_Code
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	principal_ICD9_Procedure_Code	)
			END									::	VARCHAR(  8 )		AS	principal_ICD9_AS_10_Proc_Code
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_Procedure_Code1
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_Procedure_Code1	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_Proc_Code1
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_Procedure_Code2
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_Procedure_Code2	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_Proc_Code2
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_Procedure_Code3
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_Procedure_Code3	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_Proc_Code3
		,	CASE	ICD_Code_Type
				WHEN	2	THEN		secondary_ICD10_Procedure_Code4
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_Procedure_Code4	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_Proc_Code4
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_Procedure_Code5
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_Procedure_Code5	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_Proc_Code5
		,	billing_Provider_NPI				::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
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
		,	principal_ICD10_Procedure_Code		::	VARCHAR(  7 )		AS	principal_ICD10_Proc_Code
		,	secondary_ICD10_Procedure_Code1		::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code1
		,	secondary_ICD10_Procedure_Code2		::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code2
		,	secondary_ICD10_Procedure_Code3		::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code3
		,	secondary_ICD10_Procedure_Code4		::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code4
		,	secondary_ICD10_Procedure_Code5		::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code5
	FROM
		whaight.BHI_Facility_claims_clean
);
--ANALYZE COMPRESSION		whaight.BHI_Facility_claims_clean_icd10;
ANALYZE					whaight.BHI_Facility_claims_clean_icd10;
VACUUM SORT ONLY		whaight.BHI_Facility_claims_clean_icd10;
ANALYZE					whaight.BHI_Facility_claims_clean_icd10;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI facility claims involving	*/
/*	an emergency department.  These are ED claims in a table preserving them	*/
/*	flat file structure of the original BHI facility claims tables.				*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Facility_claims_clean_icd10;
CREATE TABLE			whaight.BHI_ED_Facility_claims_clean_icd10
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )		ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	procedure_Modifier_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	revenue_Code						VARCHAR(  4 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	admitting_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code4				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code5				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code6				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code7				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code8				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code9				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code10			VARCHAR(  7 )		ENCODE	ZSTD
	,	admitting_ICD9_AS_10_DX_Code		VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD9_AS_10_DX_Code			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code1		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code2		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code3		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code4		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code5		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code6		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code7		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code8		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code9		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code10		VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD9_Proc_Code			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code1			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code2			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code3			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code4			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code5			VARCHAR(  6 )		ENCODE	ZSTD
	,	principal_ICD9_AS_10_Proc_Code		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code1		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code2		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code3		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code4		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code5		VARCHAR(  7 )		ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )		ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD10_Proc_Code			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code1			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code2			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code3			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code4			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code5			VARCHAR(  7 )		ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	first_Date_Of_Service
	,	last_Date_Of_Service
	,	primary_ICD9_DX_Code
	,	claim_Line_Num
	,	CPT_HCPCS_Code
	,	procedure_Modifier_Code
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_Facility_claims_clean_icd10, and accomplishes	*/
/*	one essential function:  it filters for claims ONLY involving emergency		*/
/*	departments.																*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ED_Facility_claims_clean_icd10
(	SELECT	*
	FROM
		whaight.BHI_Facility_claims_clean_icd10
	WHERE
--			claim_Payment_Status_Code	=	'P'
--		AND	
			(		CPT_HCPCS_Code	IN	(	'99281',	'99282',	'99283',	'99284',	'99285',
											'G0380',	'G0381',	'G0382',	'G0383',	'G0384',
											'99220',	'99217',	'99236',	'99291',	'99292'		)
				OR	BTRIM( place_Of_Service_Code )				=	'23'
--				OR	BTRIM( admission_Type_Code )				=	'1'
--				OR	BTRIM( admission_Source_Code )				=	'7'
				OR	SUBSTRING( BTRIM( revenue_Code ), 1, 3 )	=	'045'
				OR	BTRIM( revenue_Code )						=	'0981'
			)
);
--ANALYZE COMPRESSION		whaight.BHI_ED_Facility_claims_clean_icd10;
ANALYZE					whaight.BHI_ED_Facility_claims_clean_icd10;
VACUUM SORT ONLY		whaight.BHI_ED_Facility_claims_clean_icd10;
ANALYZE					whaight.BHI_ED_Facility_claims_clean_icd10;



/********************************************************************************/
/*																				*/
/*	ADDED 12/31/2018															*/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI facility claims involving	*/
/*	an emergency department.  These are ED claims in a table preserving them	*/
/*	flat file structure of the original BHI facility claims tables.				*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Facility_claims_clean_icd10_alt;
CREATE TABLE			whaight.BHI_ED_Facility_claims_clean_icd10_alt
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )		ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	procedure_Modifier_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	revenue_Code						VARCHAR(  4 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	admitting_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code4				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code5				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code6				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code7				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code8				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code9				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code10			VARCHAR(  7 )		ENCODE	ZSTD
	,	admitting_ICD9_AS_10_DX_Code		VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD9_AS_10_DX_Code			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code1		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code2		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code3		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code4		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code5		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code6		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code7		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code8		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code9		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_DX_Code10		VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD9_Proc_Code			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code1			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code2			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code3			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code4			VARCHAR(  6 )		ENCODE	ZSTD
	,	secondary_ICD9_Proc_Code5			VARCHAR(  6 )		ENCODE	ZSTD
	,	principal_ICD9_AS_10_Proc_Code		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code1		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code2		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code3		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code4		VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_AS_10_Proc_Code5		VARCHAR(  7 )		ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )		ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD10_Proc_Code			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code1			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code2			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code3			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code4			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code5			VARCHAR(  7 )		ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	first_Date_Of_Service
	,	last_Date_Of_Service
	,	primary_ICD9_DX_Code
	,	claim_Line_Num
	,	CPT_HCPCS_Code
	,	procedure_Modifier_Code
);



/********************************************************************************/
/*																				*/
/*	ADDED 12/31/2018															*/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_Facility_claims_clean_icd10, and accomplishes	*/
/*	one essential function:  it filters for claims ONLY involving emergency		*/
/*	departments.																*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ED_Facility_claims_clean_icd10_alt
(	SELECT	claims.claim_ID								::	VARCHAR( 12 )		AS	claim_ID
		,	claims.member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	claims.category_Of_Service_Code				::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	claims.place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	claims.admission_Source_Code				::	VARCHAR(  2 )		AS	admission_Source_Code
		,	claims.admission_Type_Code					::	VARCHAR(  2 )		AS	admission_Type_Code
		,	claims.claimTypeCode						::	VARCHAR(  2 )		AS	claimTypeCode
		,	claims.discharge_Status_Code				::	VARCHAR(  2 )		AS	discharge_Status_Code
		,	claims.type_Of_Bill_Code					::	VARCHAR(  3 )		AS	type_Of_Bill_Code
		,	claims.claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	claims.CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	claims.procedure_Modifier_Code				::	VARCHAR(  2 )		AS	procedure_Modifier_Code
		,	claims.revenue_Code							::	VARCHAR(  4 )		AS	revenue_Code
		,	claims.number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	claims.type_Of_Service_Code					::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	claim_Payment_Status_Code					::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	claims.non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	claims.TCRRV_Amount							::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
		,	claims.first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	claims.last_Date_Of_Service					::	DATE				AS	last_Date_Of_Service
		,	claims.admitting_ICD9_DX_Code				::	VARCHAR(  7 )		AS	admitting_ICD9_DX_Code
		,	claims.primary_ICD9_DX_Code					::	VARCHAR(  7 )		AS	primary_ICD9_DX_Code
		,	claims.secondary_ICD9_DX_Code1				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code1
		,	claims.secondary_ICD9_DX_Code2				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code2
		,	claims.secondary_ICD9_DX_Code3				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code3
		,	claims.secondary_ICD9_DX_Code4				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code4
		,	claims.secondary_ICD9_DX_Code5				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code5
		,	claims.secondary_ICD9_DX_Code6				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code6
		,	claims.secondary_ICD9_DX_Code7				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code7
		,	claims.secondary_ICD9_DX_Code8				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code8
		,	claims.secondary_ICD9_DX_Code9				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code9
		,	claims.secondary_ICD9_DX_Code10				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code10
		,	claims.admitting_ICD9_AS_10_DX_Code			::	VARCHAR(  8 )		AS	admitting_ICD9_AS_10_DX_Code
		,	claims.primary_ICD9_AS_10_DX_Code			::	VARCHAR(  8 )		AS	primary_ICD9_AS_10_DX_Code
		,	claims.secondary_ICD9_AS_10_DX_Code1		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code1
		,	claims.secondary_ICD9_AS_10_DX_Code2		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code2
		,	claims.secondary_ICD9_AS_10_DX_Code3		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code3
		,	claims.secondary_ICD9_AS_10_DX_Code4		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code4
		,	claims.secondary_ICD9_AS_10_DX_Code5		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code5
		,	claims.secondary_ICD9_AS_10_DX_Code6		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code6
		,	claims.secondary_ICD9_AS_10_DX_Code7		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code7
		,	claims.secondary_ICD9_AS_10_DX_Code8		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code8
		,	claims.secondary_ICD9_AS_10_DX_Code9		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code9
		,	claims.secondary_ICD9_AS_10_DX_Code10		::	VARCHAR(  8 )		AS	secondary_ICD9_AS_10_DX_Code10
		,	claims.principal_ICD9_Proc_Code				::	VARCHAR(  6 )		AS	principal_ICD9_Proc_Code
		,	claims.secondary_ICD9_Proc_Code1			::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code1
		,	claims.secondary_ICD9_Proc_Code2			::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code2
		,	claims.secondary_ICD9_Proc_Code3			::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code3
		,	claims.secondary_ICD9_Proc_Code4			::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code4
		,	claims.secondary_ICD9_Proc_Code5			::	VARCHAR(  6 )		AS	secondary_ICD9_Proc_Code5
		,	claims.principal_ICD9_AS_10_Proc_Code		::	VARCHAR(  7 )		AS	principal_ICD9_AS_10_Proc_Code
		,	claims.secondary_ICD9_AS_10_Proc_Code1		::	VARCHAR(  7 )		AS	secondary_ICD9_AS_10_Proc_Code1
		,	claims.secondary_ICD9_AS_10_Proc_Code2		::	VARCHAR(  7 )		AS	secondary_ICD9_AS_10_Proc_Code2
		,	claims.secondary_ICD9_AS_10_Proc_Code3		::	VARCHAR(  7 )		AS	secondary_ICD9_AS_10_Proc_Code3
		,	claims.secondary_ICD9_AS_10_Proc_Code4		::	VARCHAR(  7 )		AS	secondary_ICD9_AS_10_Proc_Code4
		,	claims.secondary_ICD9_AS_10_Proc_Code5		::	VARCHAR(  7 )		AS	secondary_ICD9_AS_10_Proc_Code5
		,	claims.billing_Provider_NPI					::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	claims.billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	claims.billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	claims.billing_Provider_Medicare_ID			::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	claims.rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	claims.rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
		,	claims.rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
		,	claims.claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )		AS	claims_System_Assigned_DRG_Code
		,	claims.claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )		AS	claims_System_Assigned_MDC_Code
		,	claims.ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	claims.admitting_ICD10_DX_Code				::	VARCHAR(  8 )		AS	admitting_ICD10_DX_Code
		,	claims.primary_ICD10_DX_Code				::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	claims.secondary_ICD10_DX_Code1				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	claims.secondary_ICD10_DX_Code2				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	claims.secondary_ICD10_DX_Code3				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	claims.secondary_ICD10_DX_Code4				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code4
		,	claims.secondary_ICD10_DX_Code5				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code5
		,	claims.secondary_ICD10_DX_Code6				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code6
		,	claims.secondary_ICD10_DX_Code7				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code7
		,	claims.secondary_ICD10_DX_Code8				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code8
		,	claims.secondary_ICD10_DX_Code9				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code9
		,	claims.secondary_ICD10_DX_Code10			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code10
		,	claims.principal_ICD10_Proc_Code			::	VARCHAR(  7 )		AS	principal_ICD10_Proc_Code
		,	claims.secondary_ICD10_Proc_Code1			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code1
		,	claims.secondary_ICD10_Proc_Code2			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code2
		,	claims.secondary_ICD10_Proc_Code3			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code3
		,	claims.secondary_ICD10_Proc_Code4			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code4
		,	claims.secondary_ICD10_Proc_Code5			::	VARCHAR(  7 )		AS	secondary_ICD10_Proc_Code5

	FROM
				whaight.BHI_Facility_claims_clean_icd10	claims
		JOIN	(	SELECT DISTINCT		claim_ID
									,	member_ID
					FROM			whaight.BHI_Facility_claims_clean_icd10
					WHERE				CPT_HCPCS_Code	IN	(	'99281',	'99282',	'99283',	'99284',	'99285',
																'G0380',	'G0381',	'G0382',	'G0383',	'G0384',
																'99220',	'99217',	'99236',	'99291',	'99292'		)
									OR	BTRIM( place_Of_Service_Code )				=	'23'
									OR	SUBSTRING( BTRIM( revenue_Code ), 1, 3 )	=	'045'
									OR	BTRIM( revenue_Code )						=	'0981'
				)										pairs
		ON			claims.claim_ID		=	pairs.claim_ID
				AND	claims.member_ID	=	pairs.member_ID
);
--ANALYZE COMPRESSION		whaight.BHI_ED_Facility_claims_clean_icd10_alt;
ANALYZE					whaight.BHI_ED_Facility_claims_clean_icd10_alt;
VACUUM SORT ONLY		whaight.BHI_ED_Facility_claims_clean_icd10_alt;
ANALYZE					whaight.BHI_ED_Facility_claims_clean_icd10_alt;

select	count(*)
from	whaight.BHI_ED_Facility_claims_clean_icd10;
--	25,483,540

select	count(*)
from	whaight.BHI_ED_Facility_claims_clean_icd10_alt;
--	72,908,811

GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_ED_Facility_claims_clean_icd10_alt
TO				aprivett;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI facility claims involving	*/
/*	an emergency department, in which all ICD DX and procedure codes are 		*/
/*	recorded using the ICD 10 codeset.											*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Facility_claims_clean_icd10_reduced;
CREATE TABLE			whaight.BHI_ED_Facility_claims_clean_icd10_reduced
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )		ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	procedure_Modifier_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	revenue_Code						VARCHAR(  4 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )		ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD10_Proc_Code			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code1			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code2			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code3			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code4			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code5			VARCHAR(  7 )		ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	first_Date_Of_Service
	,	last_Date_Of_Service
	,	primary_ICD10_DX_Code
	,	claim_Line_Num
	,	CPT_HCPCS_Code
	,	procedure_Modifier_Code
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_ED_Facility_claims_clean_icd10, and includes		*/
/*	only ICD10 DX and procedure codes.  Depending on how the code was entered,	*/
/*	either the original code is included, or its translation via the GEM		*/
/*	xwalk tables from CMS, whaight.BHI_ICD9_to_ICD10_xwalk, is included.		*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ED_Facility_claims_clean_icd10_reduced
(	SELECT
			claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	admission_Source_Code				::	VARCHAR(  2 )		AS	admission_Source_Code
		,	admission_Type_Code					::	VARCHAR(  2 )		AS	admission_Type_Code
		,	claimTypeCode						::	VARCHAR(  2 )		AS	claimTypeCode
		,	discharge_Status_Code				::	VARCHAR(  2 )		AS	discharge_Status_Code
		,	type_Of_Bill_Code					::	VARCHAR(  3 )		AS	type_Of_Bill_Code
		,	claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	procedure_Modifier_Code				::	VARCHAR(  2 )		AS	procedure_Modifier_Code
		,	revenue_Code						::	VARCHAR(  4 )		AS	revenue_Code
		,	number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
		,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
		,	billing_Provider_NPI				::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
		,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
		,	claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )		AS	claims_System_Assigned_DRG_Code
		,	claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )		AS	claims_System_Assigned_MDC_Code
		,	ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	admitting_ICD9_AS_10_DX_Code
				WHEN	2	THEN	admitting_ICD10_DX_Code
			END									::	VARCHAR(  8 )		AS	admitting_ICD10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	primary_ICD9_AS_10_DX_Code
				WHEN	2	THEN	primary_ICD10_DX_Code
			END									::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code1
				WHEN	2	THEN	secondary_ICD10_DX_Code1
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code2
				WHEN	2	THEN	secondary_ICD10_DX_Code2
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code3
				WHEN	2	THEN	secondary_ICD10_DX_Code3
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code4
				WHEN	2	THEN	secondary_ICD10_DX_Code4
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code4
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code5
				WHEN	2	THEN	secondary_ICD10_DX_Code5
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code5
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code6
				WHEN	2	THEN	secondary_ICD10_DX_Code6
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code6
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code7
				WHEN	2	THEN	secondary_ICD10_DX_Code7
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code7
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code8
				WHEN	2	THEN	secondary_ICD10_DX_Code8
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code8
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code9
				WHEN	2	THEN	secondary_ICD10_DX_Code9
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code9
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code10
				WHEN	2	THEN	secondary_ICD10_DX_Code10
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code10
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	principal_ICD9_AS_10_Proc_Code
				WHEN	2	THEN	principal_ICD10_Proc_Code
			END									::	VARCHAR(  8 )		AS	principal_ICD10_Proc_Code
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code1
				WHEN	2	THEN	secondary_ICD10_Proc_Code1
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code1
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code2
				WHEN	2	THEN	secondary_ICD10_Proc_Code2
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code2
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code3
				WHEN	2	THEN	secondary_ICD10_Proc_Code3
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code3
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code4
				WHEN	2	THEN	secondary_ICD10_Proc_Code4
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code4
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code5
				WHEN	2	THEN	secondary_ICD10_Proc_Code5
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code5
	FROM
		whaight.BHI_ED_Facility_claims_clean_icd10
);
--ANALYZE COMPRESSION		whaight.BHI_ED_Facility_claims_clean_icd10_reduced;
ANALYZE					whaight.BHI_ED_Facility_claims_clean_icd10_reduced;
VACUUM SORT ONLY		whaight.BHI_ED_Facility_claims_clean_icd10_reduced;
ANALYZE					whaight.BHI_ED_Facility_claims_clean_icd10_reduced;




/********************************************************************************/
/*																				*/
/*	ADDED 12/31/2018															*/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI facility claims involving	*/
/*	an emergency department, in which all ICD DX and procedure codes are 		*/
/*	recorded using the ICD 10 codeset.											*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced;
CREATE TABLE			whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )		ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	procedure_Modifier_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	revenue_Code						VARCHAR(  4 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )		ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )		ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )		ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )		ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )		ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )		ENCODE	ZSTD
	,	principal_ICD10_Proc_Code			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code1			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code2			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code3			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code4			VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD10_Proc_Code5			VARCHAR(  7 )		ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	rendering_Provider_NPI
	,	first_Date_Of_Service
	,	last_Date_Of_Service
	,	primary_ICD10_DX_Code
	,	claim_Line_Num
	,	CPT_HCPCS_Code
	,	procedure_Modifier_Code
);



/********************************************************************************/
/*																				*/
/*	ADDED 12/31/2018															*/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_ED_Facility_claims_clean_icd10, and includes		*/
/*	only ICD10 DX and procedure codes.  Depending on how the code was entered,	*/
/*	either the original code is included, or its translation via the GEM		*/
/*	xwalk tables from CMS, whaight.BHI_ICD9_to_ICD10_xwalk, is included.		*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced
(	SELECT
			claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	admission_Source_Code				::	VARCHAR(  2 )		AS	admission_Source_Code
		,	admission_Type_Code					::	VARCHAR(  2 )		AS	admission_Type_Code
		,	claimTypeCode						::	VARCHAR(  2 )		AS	claimTypeCode
		,	discharge_Status_Code				::	VARCHAR(  2 )		AS	discharge_Status_Code
		,	type_Of_Bill_Code					::	VARCHAR(  3 )		AS	type_Of_Bill_Code
		,	claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	procedure_Modifier_Code				::	VARCHAR(  2 )		AS	procedure_Modifier_Code
		,	revenue_Code						::	VARCHAR(  4 )		AS	revenue_Code
		,	number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
		,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
		,	billing_Provider_NPI				::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
		,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
		,	claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )		AS	claims_System_Assigned_DRG_Code
		,	claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )		AS	claims_System_Assigned_MDC_Code
		,	ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	admitting_ICD9_AS_10_DX_Code
				WHEN	2	THEN	admitting_ICD10_DX_Code
			END									::	VARCHAR(  8 )		AS	admitting_ICD10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	primary_ICD9_AS_10_DX_Code
				WHEN	2	THEN	primary_ICD10_DX_Code
			END									::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code1
				WHEN	2	THEN	secondary_ICD10_DX_Code1
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code2
				WHEN	2	THEN	secondary_ICD10_DX_Code2
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code3
				WHEN	2	THEN	secondary_ICD10_DX_Code3
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code4
				WHEN	2	THEN	secondary_ICD10_DX_Code4
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code4
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code5
				WHEN	2	THEN	secondary_ICD10_DX_Code5
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code5
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code6
				WHEN	2	THEN	secondary_ICD10_DX_Code6
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code6
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code7
				WHEN	2	THEN	secondary_ICD10_DX_Code7
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code7
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code8
				WHEN	2	THEN	secondary_ICD10_DX_Code8
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code8
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code9
				WHEN	2	THEN	secondary_ICD10_DX_Code9
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code9
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_DX_Code10
				WHEN	2	THEN	secondary_ICD10_DX_Code10
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code10
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	principal_ICD9_AS_10_Proc_Code
				WHEN	2	THEN	principal_ICD10_Proc_Code
			END									::	VARCHAR(  8 )		AS	principal_ICD10_Proc_Code
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code1
				WHEN	2	THEN	secondary_ICD10_Proc_Code1
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code1
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code2
				WHEN	2	THEN	secondary_ICD10_Proc_Code2
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code2
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code3
				WHEN	2	THEN	secondary_ICD10_Proc_Code3
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code3
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code4
				WHEN	2	THEN	secondary_ICD10_Proc_Code4
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code4
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_AS_10_Proc_Code5
				WHEN	2	THEN	secondary_ICD10_Proc_Code5
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_Proc_Code5
	FROM
		whaight.BHI_ED_Facility_claims_clean_icd10_alt
);
--ANALYZE COMPRESSION		whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced;
ANALYZE					whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced;
VACUUM SORT ONLY		whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced;
ANALYZE					whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced;



GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_ED_Facility_claims_clean_icd10_alt_reduced
TO				aprivett;



/********************************************************************************/
/*																				*/
/*	This table was useful in the build process but can now be discarded.		*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Facility_claims_clean_icd10;



/********************************************************************************/
/*																				*/
/*	Make sure the right people can get at this table.							*/
/*																				*/
/********************************************************************************/
GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_ED_Facility_claims_clean_icd10_reduced
TO				aprivett;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims.  These 	*/
/*	data were received in the table clean_raw.BHI_Professional_Claims.			*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Professional_claims_clean;
CREATE TABLE			whaight.BHI_Professional_claims_clean
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	CPT_Modifier_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
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
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_Line_Num
	,	rendering_Provider_NPI
	,	primary_ICD9_DX_Code
	,	CPT_HCPCS_Code
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
INSERT INTO	whaight.BHI_Professional_claims_clean
(	SELECT
			pro.claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	pro.claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	pro.member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	pro.category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	pro.place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	pro.claim_Type_Code						::	VARCHAR(  2 )		AS	claim_Type_Code
		,	pro.CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	pro.CPT_Modifier_Code					::	VARCHAR(  2 )		AS	CPT_Modifier_Code
		,	pro.number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	pro.type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
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
		,	pro.TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
	FROM
		clean_raw.BHI_Professional_Claims		pro
);
--ANALYZE COMPRESSION	whaight.BHI_Professional_claims_clean;
ANALYZE				whaight.BHI_Professional_claims_clean;
VACUUM SORT ONLY	whaight.BHI_Professional_claims_clean;
ANALYZE				whaight.BHI_Professional_claims_clean;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims with		*/
/*	all ICD DX and procedure codes included in the ICD 10 code set.				*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Professional_claims_clean_icd10;
CREATE TABLE			whaight.BHI_Professional_claims_clean_icd10
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	CPT_Modifier_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD
	,	primary_ICD9_as_10_DX_Code			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code1		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code2		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code3		VARCHAR(  8 )		ENCODE	ZSTD
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
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_Line_Num
	,	rendering_Provider_NPI
	,	primary_ICD9_DX_Code
	,	CPT_HCPCS_Code
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
INSERT INTO	whaight.BHI_Professional_claims_clean_icd10
(	SELECT
			claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	claim_Type_Code						::	VARCHAR(  2 )		AS	claim_Type_Code
		,	CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	CPT_Modifier_Code					::	VARCHAR(  2 )		AS	CPT_Modifier_Code
		,	number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
		,	primary_ICD9_DX_Code				::	VARCHAR(  7 )		AS	primary_ICD9_DX_Code
		,	secondary_ICD9_DX_Code1				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code1
		,	secondary_ICD9_DX_Code2				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code2
		,	secondary_ICD9_DX_Code3				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code3
		,	CASE	ICD_Code_Type						--<-- indicates ICD9 (1) or ICD10 (2)
				WHEN	2	THEN	primary_ICD10_DX_Code	--<-- when it's 2, just copy the present ICD10 code
				WHEN	1	THEN								--<-- when it's 1, find the equivalent ICD10 code
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	primary_ICD9_DX_Code	)
						--<-- OK, so here we concatenate all ICD10 codes corresponding to the ICD9 in the where clause,
						--<-- concatenate them with '***' in the middle via LISTAGG, ordered by icd10cm,
						--<-- and use substring to yank out the first one.  It's a prayer.
			END									::	VARCHAR(  8 )		AS	primary_ICD9_as_10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code1
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code1	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_as_10_DX_Code1
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code2
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code2	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_as_10_DX_Code2
		,	CASE	ICD_Code_Type
				WHEN	2	THEN	secondary_ICD10_DX_Code3
				WHEN	1	THEN
					(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
									0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
						FROM	whaight.BHI_ICD9_to_ICD10_xwalk
						WHERE	icd9cm	=	secondary_ICD9_DX_Code3	)
			END									::	VARCHAR(  8 )		AS	secondary_ICD9_as_10_DX_Code3
		,	billing_Provider_NPI				::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
		,	rendering_Provider_Type_Code		::	VARCHAR(  2 )		AS	rendering_Provider_Type_Code
		,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
		,	ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	primary_ICD10_DX_Code				::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	secondary_ICD10_DX_Code1			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	secondary_ICD10_DX_Code2			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	secondary_ICD10_DX_Code3			::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
	FROM
		whaight.BHI_Professional_claims_clean
);
--ANALYZE COMPRESSION	whaight.BHI_Professional_claims_clean_icd10;
ANALYZE				whaight.BHI_Professional_claims_clean_icd10;
VACUUM SORT ONLY	whaight.BHI_Professional_claims_clean_icd10;
ANALYZE				whaight.BHI_Professional_claims_clean_icd10;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims			*/
/*	involving an emergency department.  These are ED claims in a table			*/
/*	preserving the flat file structure of the original BHI professional claims	*/
/*	table.																		*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Professional_claims_clean_icd10;
CREATE TABLE			whaight.BHI_ED_Professional_claims_clean_icd10
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	BYTEDICT
	,	CPT_Modifier_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD
	,	primary_ICD9_as_10_DX_Code			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code1		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code2		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code3		VARCHAR(  8 )		ENCODE	ZSTD
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
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	BYTEDICT
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_Line_Num
	,	rendering_Provider_NPI
	,	primary_ICD9_DX_Code
	,	CPT_HCPCS_Code
	,	first_Date_Of_Service
	,	last_Date_Of_Service
);



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_Professional_claims_clean_icd10, and				*/
/*	accomplishes one essential function:  it filters for claims ONLY involving	*/
/*	emergency departments.														*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ED_Professional_claims_clean_icd10
(	SELECT	*
	FROM
		whaight.BHI_Professional_claims_clean_icd10
	WHERE
--			claim_Payment_Status_Code	=	'P'
--		AND
			(		CPT_HCPCS_Code	IN	(	'99281',	'99282',	'99283',	'99284',	'99285',
											'G0380',	'G0381',	'G0382',	'G0383',	'G0384',
											'99220',	'99217',	'99236',	'99291',	'99292'		)
				OR	BTRIM( place_Of_Service_Code )	=	'23'
			)
);
--ANALYZE COMPRESSION	whaight.BHI_ED_Professional_claims_clean_icd10;
ANALYZE				whaight.BHI_ED_Professional_claims_clean_icd10;
VACUUM SORT ONLY	whaight.BHI_ED_Professional_claims_clean_icd10;
ANALYZE				whaight.BHI_ED_Professional_claims_clean_icd10;



/********************************************************************************/
/*																				*/
/*	ADDED 12/31/2018															*/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims			*/
/*	involving an emergency department.  These are ED claims in a table			*/
/*	preserving the flat file structure of the original BHI professional claims	*/
/*	table.																		*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Professional_claims_clean_icd10_alt;
CREATE TABLE			whaight.BHI_ED_Professional_claims_clean_icd10_alt
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	BYTEDICT
	,	CPT_Modifier_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )		ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )		ENCODE	ZSTD
	,	primary_ICD9_as_10_DX_Code			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code1		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code2		VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD9_as_10_DX_Code3		VARCHAR(  8 )		ENCODE	ZSTD
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
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	BYTEDICT
)
DISTSTYLE KEY
DISTKEY( member_ID )
COMPOUND SORTKEY(
		member_ID
	,	claim_ID
	,	claim_Line_Num
	,	rendering_Provider_NPI
	,	primary_ICD9_DX_Code
	,	CPT_HCPCS_Code
	,	first_Date_Of_Service
	,	last_Date_Of_Service
);



/********************************************************************************/
/*																				*/
/*	ADDED 12/31/2018															*/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_Professional_claims_clean_icd10, and				*/
/*	accomplishes one essential function:  it filters for claims ONLY involving	*/
/*	emergency departments.														*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ED_Professional_claims_clean_icd10_alt
(	SELECT	claims.claim_ID								::	VARCHAR( 12 )		AS	claim_ID
		,	claims.claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	claims.member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	claims.category_Of_Service_Code				::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	claims.place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	claims.claim_Type_Code						::	VARCHAR(  2 )		AS	claim_Type_Code
		,	claims.CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	claims.CPT_Modifier_Code					::	VARCHAR(  2 )		AS	CPT_Modifier_Code
		,	claims.number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	claims.type_Of_Service_Code					::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	claims.first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	claims.last_Date_Of_Service					::	DATE				AS	last_Date_Of_Service
		,	claims.primary_ICD9_DX_Code					::	VARCHAR(  7 )		AS	primary_ICD9_DX_Code
		,	claims.secondary_ICD9_DX_Code1				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code1
		,	claims.secondary_ICD9_DX_Code2				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code2
		,	claims.secondary_ICD9_DX_Code3				::	VARCHAR(  7 )		AS	secondary_ICD9_DX_Code3
		,	claims.primary_ICD9_as_10_DX_Code			::	VARCHAR(  8 )		AS	primary_ICD9_as_10_DX_Code
		,	claims.secondary_ICD9_as_10_DX_Code1		::	VARCHAR(  8 )		AS	secondary_ICD9_as_10_DX_Code1
		,	claims.secondary_ICD9_as_10_DX_Code2		::	VARCHAR(  8 )		AS	secondary_ICD9_as_10_DX_Code2
		,	claims.secondary_ICD9_as_10_DX_Code3		::	VARCHAR(  8 )		AS	secondary_ICD9_as_10_DX_Code3
		,	claims.billing_Provider_NPI					::	VARCHAR( 10 )		AS	billing_Provider_NPI
		,	claims.billing_Provider_Specialty_Code		::	VARCHAR(  2 )		AS	billing_Provider_Specialty_Code
		,	claims.billing_Provider_Zip_Code			::	VARCHAR(  5 )		AS	billing_Provider_Zip_Code
		,	claims.billing_Provider_Medicare_ID			::	VARCHAR( 20 )		AS	billing_Provider_Medicare_ID
		,	claims.rendering_Provider_NPI				::	VARCHAR( 10 )		AS	rendering_Provider_NPI
		,	claims.rendering_Provider_Specialty_Code	::	VARCHAR(  2 )		AS	rendering_Provider_Specialty_Code
		,	claims.rendering_Provider_Type_Code			::	VARCHAR(  2 )		AS	rendering_Provider_Type_Code
		,	claims.rendering_Provider_Zip_Code			::	VARCHAR(  5 )		AS	rendering_Provider_Zip_Code
		,	claims.ICD_Code_Type						::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	claims.primary_ICD10_DX_Code				::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	claims.secondary_ICD10_DX_Code1				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	claims.secondary_ICD10_DX_Code2				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	claims.secondary_ICD10_DX_Code3				::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	claims.claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	claims.non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	claims.TCRRV_Amount							::	NUMERIC( 10, 2 )	AS	TCRRV_Amount

	FROM
				whaight.BHI_Professional_claims_clean_icd10	claims
		JOIN	(	SELECT DISTINCT		claim_ID
									,	member_ID
					FROM			whaight.BHI_Professional_claims_clean_icd10
					WHERE				CPT_HCPCS_Code	IN	(	'99281',	'99282',	'99283',	'99284',	'99285',
																'G0380',	'G0381',	'G0382',	'G0383',	'G0384',
																'99220',	'99217',	'99236',	'99291',	'99292'		)
									OR	BTRIM( place_Of_Service_Code )	=	'23'
				)											pairs
		ON			claims.claim_ID		=	pairs.claim_ID
				AND	claims.member_ID	=	pairs.member_ID
);
--ANALYZE COMPRESSION	whaight.BHI_ED_Professional_claims_clean_icd10_alt;
ANALYZE				whaight.BHI_ED_Professional_claims_clean_icd10_alt;
VACUUM SORT ONLY	whaight.BHI_ED_Professional_claims_clean_icd10_alt;
ANALYZE				whaight.BHI_ED_Professional_claims_clean_icd10_alt;



select	count(*)
from	whaight.BHI_ED_Professional_claims_clean_icd10;
--	13,501,771

select	count(*)
from	whaight.BHI_ED_Professional_claims_clean_icd10_alt;
--	14,538,797

GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_ED_Professional_claims_clean_icd10_alt
TO				aprivett;


/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims			*/
/*	involving an emergency department, in which all ICD DX and procedure		*/
/*	codes are recorded using the ICD 10 codeset.								*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Professional_claims_clean_icd10_reduced;
CREATE TABLE			whaight.BHI_ED_Professional_claims_clean_icd10_reduced
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	CPT_Modifier_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
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
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
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



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_ED_Professional_claims_clean_icd10, and includes	*/
/*	only ICD10 DX and procedure codes.  Depending on how the code was entered,	*/
/*	either the original code is included, or its translation via the GEM		*/
/*	xwalk tables from CMS, whaight.BHI_ICD9_to_ICD10_xwalk, is included.		*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ED_Professional_claims_clean_icd10_reduced
(	SELECT
			claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	claim_Type_Code						::	VARCHAR(  2 )		AS	claim_Type_Code
		,	CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	CPT_Modifier_Code					::	VARCHAR(  2 )		AS	CPT_Modifier_Code
		,	number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
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
				WHEN	1	THEN	primary_ICD9_as_10_DX_Code
				WHEN	2	THEN	primary_ICD10_DX_Code
			END									::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_as_10_DX_Code1
				WHEN	2	THEN	secondary_ICD10_DX_Code1
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_as_10_DX_Code2
				WHEN	2	THEN	secondary_ICD10_DX_Code2
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_as_10_DX_Code3
				WHEN	2	THEN	secondary_ICD10_DX_Code3
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
	FROM
		whaight.BHI_ED_Professional_claims_clean_icd10
);
--ANALYZE COMPRESSION		whaight.BHI_ED_Professional_claims_clean_icd10_reduced;
ANALYZE					whaight.BHI_ED_Professional_claims_clean_icd10_reduced;
VACUUM SORT ONLY		whaight.BHI_ED_Professional_claims_clean_icd10_reduced;
ANALYZE					whaight.BHI_ED_Professional_claims_clean_icd10_reduced;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below defines a table of BHI professional claims			*/
/*	involving an emergency department, in which all ICD DX and procedure		*/
/*	codes are recorded using the ICD 10 codeset.								*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced;
CREATE TABLE			whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced
(		claim_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	claim_Line_Num						INTEGER				ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )		ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	claim_Type_Code						VARCHAR(  2 )		ENCODE	ZSTD
	,	CPT_HCPCS_Code						VARCHAR(  6 )		ENCODE	ZSTD
	,	CPT_Modifier_Code					VARCHAR(  2 )		ENCODE	ZSTD
	,	number_Of_Units						NUMERIC( 10, 3 )	ENCODE	ZSTD
	,	type_Of_Service_Code				VARCHAR(  5 )		ENCODE	ZSTD
	,	first_Date_Of_Service				DATE				ENCODE	ZSTD
	,	last_Date_Of_Service				DATE				ENCODE	ZSTD
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
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )		ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )		ENCODE	ZSTD
	,	claim_Payment_Status_Code			VARCHAR(  1 )		ENCODE	ZSTD
	,	non_Covered_Reason_Code				VARCHAR(  2 )		ENCODE	ZSTD
	,	TCRRV_Amount						NUMERIC( 10, 2 )	ENCODE	ZSTD
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



/********************************************************************************/
/*																				*/
/*	The INSERT command populates the table defined ablove.  It draws its data	*/
/*	from the table whaight.BHI_ED_Professional_claims_clean_icd10, and includes	*/
/*	only ICD10 DX and procedure codes.  Depending on how the code was entered,	*/
/*	either the original code is included, or its translation via the GEM		*/
/*	xwalk tables from CMS, whaight.BHI_ICD9_to_ICD10_xwalk, is included.		*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced
(	SELECT
			claim_ID							::	VARCHAR( 12 )		AS	claim_ID
		,	claim_Line_Num						::	INTEGER				AS	claim_Line_Num
		,	member_ID							::	VARCHAR( 12 )		AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )		AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )		AS	place_Of_Service_Code
		,	claim_Type_Code						::	VARCHAR(  2 )		AS	claim_Type_Code
		,	CPT_HCPCS_Code						::	VARCHAR(  6 )		AS	CPT_HCPCS_Code
		,	CPT_Modifier_Code					::	VARCHAR(  2 )		AS	CPT_Modifier_Code
		,	number_Of_Units						::	NUMERIC( 10, 3 )	AS	number_Of_Units
		,	type_Of_Service_Code				::	VARCHAR(  5 )		AS	type_Of_Service_Code
		,	first_Date_Of_Service				::	DATE				AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE				AS	last_Date_Of_Service
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
				WHEN	1	THEN	primary_ICD9_as_10_DX_Code
				WHEN	2	THEN	primary_ICD10_DX_Code
			END									::	VARCHAR(  8 )		AS	primary_ICD10_DX_Code
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_as_10_DX_Code1
				WHEN	2	THEN	secondary_ICD10_DX_Code1
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code1
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_as_10_DX_Code2
				WHEN	2	THEN	secondary_ICD10_DX_Code2
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code2
		,	CASE	ICD_Code_Type
				WHEN	1	THEN	secondary_ICD9_as_10_DX_Code3
				WHEN	2	THEN	secondary_ICD10_DX_Code3
			END									::	VARCHAR(  8 )		AS	secondary_ICD10_DX_Code3
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )		AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )		AS	non_Covered_Reason_Code
		,	TCRRV_Amount						::	NUMERIC( 10, 2 )	AS	TCRRV_Amount
	FROM
		whaight.BHI_ED_Professional_claims_clean_icd10_alt
);
--ANALYZE COMPRESSION		whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced;
ANALYZE					whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced;
VACUUM SORT ONLY		whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced;
ANALYZE					whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced;



GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_ED_Professional_claims_clean_icd10_alt_reduced
TO				aprivett;



/********************************************************************************/
/*																				*/
/*	This table was useful in the build process but can now be discarded.		*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ED_Professional_claims_clean_icd10;



/********************************************************************************/
/*																				*/
/*	Make sure the right people can get at this table.							*/
/*																				*/
/********************************************************************************/
GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_ED_Professional_claims_clean_icd10_reduced
TO				aprivett;



GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.BHI_ED_claims_common_info
TO				aprivett;

