/********************************************************************************/
/*																				*/
/*	FILE:			BHI_Normalization											*/
/*	PROGRAMMED BY:	Will Haight (wthii)											*/
/*	DATE:			November, 2018												*/
/*	NOTES:			The following tables are established in this file:			*/
/*					whaight.BHI_ICD9_to_ICD10_xwalk		(deleted)				*/
/*					whaight.BHI_ICD10_to_ICD9_xwalk		(deleted)				*/
/*					whaight.BHI_ICD9_descriptions		(deleted)				*/
/*					whaight.BHI_ICD10_descriptions		(deleted)				*/
/*					whaight.BHI_ICD9_to_ICD10_xwalk_desc							*/
/*					whaight.BHI_ICD10_to_ICD9_xwalk_desc							*/
/*					whaight.BHI_Facility_Claim_Header_step_0						*/
/*					whaight.BHI_Facility_Claim_Header_step_1						*/
/*					whaight.BHI_claims_ICD_DX_Codes								*/
/*					whaight.BHI_claims_ICD9_Proc_Codes							*/
/*					whaight.BHI_claims_ICD10_Proc_Codes							*/
/*					whaight.BHI_Facility_Claim_Header_1NF						*/
/*																				*/
/*	MODIFICATIONS																*/
/*																				*/
/*		1.	BY:		wthii														*/
/*			DATE:	12/7/2018													*/
/*			NOTES:	Inserted documentation.										*/
/*																				*/
/*		2.	BY:																	*/
/*			DATE:																*/
/*			NOTES:																*/
/*																				*/
/********************************************************************************/



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define the GEM xwalk table for "translating"		*/
/*	ICD 9 codes to ICD 10 codes.												*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ICD9_to_ICD10_xwalk;
CREATE TABLE			whaight.BHI_ICD9_to_ICD10_xwalk
(		icd9cm			VARCHAR( 5 )		ENCODE	RAW
	,	icd10cm			VARCHAR( 7 )		ENCODE	RAW
	,	flags			VARCHAR( 5 )		ENCODE	RAW
)
COMPOUND SORTKEY(
		icd9cm
	,	icd10cm
);



/********************************************************************************/
/*																				*/
/*	This command copies raw data from an S3 bucket at amazon into the table		*/
/*	whaight.BHI_ICD9_to_ICD10_xwalk.  											*/
/*																				*/
/********************************************************************************/
COPY		whaight.BHI_ICD9_to_ICD10_xwalk
FROM		's3://dhp-randlab-s3/users/whaight/2018_I9gem.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 0 TRIMBLANKS DELIMITER '\t' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;

--ANALYZE COMPRESSION	whaight.BHI_ICD9_to_ICD10_xwalk;
ANALYZE				whaight.BHI_ICD9_to_ICD10_xwalk;
VACUUM SORT ONLY	whaight.BHI_ICD9_to_ICD10_xwalk;
ANALYZE				whaight.BHI_ICD9_to_ICD10_xwalk;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define the GEM xwalk table for "translating"		*/
/*	ICD 10 codes to ICD 9 codes.												*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ICD10_to_ICD9_xwalk;
CREATE TABLE			whaight.BHI_ICD10_to_ICD9_xwalk
(		icd10cm		VARCHAR( 6 )	ENCODE	RAW
	,	icd9cm		VARCHAR( 7 )	ENCODE	RAW
	,	flags		VARCHAR( 5 )	ENCODE	RAW
)
COMPOUND SORTKEY(
		icd9cm
	,	icd10cm
);



/********************************************************************************/
/*																				*/
/*	This command copies raw data from an S3 bucket at amazon into the table		*/
/*	whaight.BHI_ICD9_to_ICD10_xwalk.  											*/
/*																				*/
/********************************************************************************/
COPY			whaight.BHI_ICD10_to_ICD9_xwalk
FROM			's3://dhp-randlab-s3/users/whaight/2018_I10gem.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 0 TRIMBLANKS DELIMITER '\t' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;

--ANALYZE COMPRESSION	whaight.BHI_ICD9_to_ICD10_xwalk;
ANALYZE				whaight.BHI_ICD9_to_ICD10_xwalk;
VACUUM SORT ONLY	whaight.BHI_ICD9_to_ICD10_xwalk;
ANALYZE				whaight.BHI_ICD9_to_ICD10_xwalk;



/********************************************************************************/
/*																				*/
/*	Some queries useful in debugging.  											*/
/*																				*/
/********************************************************************************/
--select	* from	stl_load_errors	order by starttime desc;

--SELECT		MAX( LEN( icd10cm ) )	icd10
--		,	MAX( LEN( icd9cm ) )	icd9
--		,	MAX( LEN( flags ) )		flags
--FROM	whaight.BHI_ICD10_to_ICD9_xwalk;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define a table to receive icd9 code descriptions.	*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ICD9_descriptions;
CREATE TABLE			whaight.BHI_ICD9_descriptions
(		icd9cm		VARCHAR(   5 )	ENCODE	RAW
	,	long_desc	VARCHAR( 224 )	ENCODE	ZSTD
	,	short_desc	VARCHAR(  27 )	ENCODE	RAW
)
COMPOUND SORTKEY( icd9cm );



/********************************************************************************/
/*																				*/
/*	This command copies raw data from an S3 bucket at amazon into the table		*/
/*	whaight.BHI_ICD9_descriptions.  											*/
/*																				*/
/********************************************************************************/
COPY			whaight.BHI_ICD9_descriptions
FROM			's3://dhp-randlab-s3/users/whaight/ICD9_DESC_LONG_SHORT_DX.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 1 TRIMBLANKS DELIMITER '\t' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;

--ANALYZE COMPRESSION	whaight.BHI_ICD9_descriptions;
ANALYZE				whaight.BHI_ICD9_descriptions;
VACUUM SORT ONLY	whaight.BHI_ICD9_descriptions;
ANALYZE				whaight.BHI_ICD9_descriptions;



/********************************************************************************/
/*																				*/
/*	Some queries useful in debugging.  											*/
/*																				*/
/********************************************************************************/
--SELECT		MAX( LEN( icd9cm ) )		icd9cm
--		,	MAX( LEN( long_desc ) )		long_desc
--		,	MAX( LEN( short_desc ) )	short_desc
--FROM	whaight.BHI_ICD9_descriptions;

--select	* from	stl_load_errors	order by starttime desc;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define a table to receive icd10 code descriptions.	*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ICD10_descriptions;
CREATE TABLE			whaight.BHI_ICD10_descriptions
(		icd10cm		VARCHAR(   7 )	ENCODE	ZSTD
	,	long_desc	VARCHAR( 230 )	ENCODE	ZSTD
)
COMPOUND SORTKEY( icd10cm );



/********************************************************************************/
/*																				*/
/*	This command copies raw data from an S3 bucket at amazon into the table		*/
/*	whaight.BHI_ICD9_descriptions.  											*/
/*																				*/
/********************************************************************************/
COPY			whaight.BHI_ICD10_descriptions
FROM			's3://dhp-randlab-s3/users/whaight/icd10cm_codes_2019_desc.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 0 TRIMBLANKS DELIMITER '\t' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;

--ANALYZE COMPRESSION	whaight.BHI_ICD10_descriptions;
ANALYZE				whaight.BHI_ICD10_descriptions;
VACUUM SORT ONLY	whaight.BHI_ICD10_descriptions;
ANALYZE				whaight.BHI_ICD10_descriptions;



/********************************************************************************/
/*																				*/
/*	Some queries useful in debugging.  											*/
/*																				*/
/********************************************************************************/
--SELECT		MAX( LEN( icd10cm ) )		icd10cm
--		,	MAX( LEN( long_desc ) )		long_desc
--FROM	whaight.BHI_ICD10_descriptions;

--select	* from	stl_load_errors	order by starttime desc;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define an enhanced GEM xwalk table (icd9 to icd10)	*/
/*	including both sets of code descriptions.									*/
/*																				*/
/********************************************************************************/
CREATE TABLE	whaight.BHI_ICD9_to_ICD10_xwalk_desc
(		icd9cm		VARCHAR(   7 )	ENCODE	RAW
	,	icd10cm		VARCHAR(   7 )	ENCODE	RAW
	,	flags		VARCHAR(   5 )	ENCODE	RAW
	,	icd9_desc	VARCHAR( 230 )	ENCODE	ZSTD
	,	icd10_desc	VARCHAR( 230 )	ENCODE	ZSTD
)
COMPOUND SORTKEY(
		icd9cm
	,	icd10cm
);



/********************************************************************************/
/*																				*/
/*	The INSERT below populates the table defined immediately above.  Note the	*/
/*	joins for adding the description columns to the previously established		*/
/*	xwalk.																		*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_ICD9_to_ICD10_xwalk_desc
(	SELECT		xw.icd9cm			::	VARCHAR(   7 )	AS	icd9cm
			,	xw.icd10cm			::	VARCHAR(   7 )	AS	icd10cm
			,	CASE	xw.flags
					WHEN	'0'	THEN	'00000'
					ELSE				xw.flags
				END					::	VARCHAR(   5 )	AS	flags
			,	icd9.long_desc		::	VARCHAR( 230 )	AS	icd9_desc
			,	icd10.long_desc		::	VARCHAR( 230 )	AS	icd10_desc
	FROM				whaight.BHI_ICD9_to_ICD10_xwalk	xw
			LEFT JOIN	whaight.BHI_ICD9_descriptions		icd9
			ON			xw.icd9cm	=	icd9.icd9cm
			LEFT JOIN	whaight.BHI_ICD10_descriptions		icd10
			ON			xw.icd10cm	=	icd10.icd10cm
);
--ANALYZE COMPRESSION	whaight.BHI_ICD9_to_ICD10_xwalk_desc;
ANALYZE				whaight.BHI_ICD9_to_ICD10_xwalk_desc;
VACUUM SORT ONLY	whaight.BHI_ICD9_to_ICD10_xwalk_desc;
ANALYZE				whaight.BHI_ICD9_to_ICD10_xwalk_desc;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define an enhanced GEM xwalk table (icd10 to icd9)	*/
/*	including both sets of code descriptions.									*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ICD10_to_ICD9_xwalk_desc;
CREATE TABLE			whaight.BHI_ICD10_to_ICD9_xwalk_desc
(		icd10cm		VARCHAR(   7 )	ENCODE	ZSTD
	,	icd9cm		VARCHAR(   7 )	ENCODE	ZSTD
	,	flags		VARCHAR(   5 )	ENCODE	ZSTD
	,	icd9_desc	VARCHAR( 230 )	ENCODE	ZSTD
	,	icd10_desc	VARCHAR( 230 )	ENCODE	ZSTD
)
COMPOUND SORTKEY(
		icd9cm
	,	icd10cm
);



/********************************************************************************/
/*																				*/
/*	The INSERT below populates the table defined immediately above.  Note the	*/
/*	joins for adding the description columns to the previously established		*/
/*	xwalk.																		*/
/*																				*/
/********************************************************************************/
INSERT INTO		whaight.BHI_ICD10_to_ICD9_xwalk_desc
(	SELECT		xw.icd10cm			::	VARCHAR(   7 )	AS	icd10cm
			,	xw.icd9cm			::	VARCHAR(   7 )	AS	icd9cm
			,	CASE	xw.flags
					WHEN	'0'	THEN	'00000'
					ELSE				xw.flags
				END					::	VARCHAR(   5 )	AS	flags
			,	icd9.long_desc		::	VARCHAR( 230 )	AS	icd9_desc
			,	icd10.long_desc		::	VARCHAR( 230 )	AS	icd10_desc
	FROM				whaight.BHI_ICD10_to_ICD9_xwalk	xw
			LEFT JOIN	whaight.BHI_ICD9_descriptions		icd9
			ON			xw.icd9cm	=	icd9.icd9cm
			LEFT JOIN	whaight.BHI_ICD10_descriptions		icd10
			ON			xw.icd10cm	=	icd10.icd10cm
);
--ANALYZE COMPRESSION	whaight.BHI_ICD10_to_ICD9_xwalk_desc;
ANALYZE				whaight.BHI_ICD10_to_ICD9_xwalk_desc;
VACUUM SORT ONLY	whaight.BHI_ICD10_to_ICD9_xwalk_desc;
ANALYZE				whaight.BHI_ICD10_to_ICD9_xwalk_desc;



/********************************************************************************/
/*																				*/
/*	These tables are dropped because they were only necessary to build the		*/
/*	tables whaight.BHI_ICD10_to_ICD9_xwalk_desc and								*/
/*	whaight.BHI_ICD9_to_ICD10_xwalk_desc										*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_ICD9_to_ICD10_xwalk;
DROP TABLE IF EXISTS	whaight.BHI_ICD10_to_ICD9_xwalk;
DROP TABLE IF EXISTS	whaight.BHI_ICD9_descriptions;
DROP TABLE IF EXISTS	whaight.BHI_ICD10_descriptions;



/********************************************************************************/
/*																				*/
/*	The next several commands construct a sequence of tables pushing the BHI	*/
/*	claims tables toward 1NF.  The first creates a copy of the facility claims	*/
/*	header table in which the ICD DX and procedure codes have been cleaned.		*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Facility_Claim_Header_step_0;
CREATE TABLE 			whaight.BHI_Facility_Claim_Header_step_0
(		claim_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )	ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )	ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )	ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE			ENCODE	ZSTD
	,	last_Date_Of_Service				DATE			ENCODE	ZSTD
	,	admitting_ICD9_DX_Code				VARCHAR(  7 )	ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code4				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code5				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code6				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code7				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code8				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code9				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code10			VARCHAR(  7 )	ENCODE	ZSTD
	,	principal_ICD9_Procedure_Code		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code1		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code2		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code3		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code4		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code5		VARCHAR(  6 )	ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )	ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )	ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )	ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )	ENCODE	ZSTD
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )	ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )	ENCODE	ZSTD
	,	principal_ICD10_Procedure_Code		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code1		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code2		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code3		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code4		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code5		VARCHAR(  7 )	ENCODE	ZSTD
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
	,	primary_ICD9_DX_Code
);



/********************************************************************************/
/*																				*/
/*	The INSERT below populates the table defined immediately above.  Note the	*/
/*	use of REGEXP_REPLACE in removing non-alphanumeric characters from the		*/
/*	ICD codes.																	*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Facility_Claim_Header_step_0
(	SELECT	DISTINCT
			claim_ID							::	VARCHAR( 12 )	AS	claim_ID
		,	member_ID							::	VARCHAR( 12 )	AS	member_ID
		,	category_Of_Service_Code			::	VARCHAR(  3 )	AS	category_Of_Service_Code
		,	place_Of_Service_Code				::	VARCHAR(  2 )	AS	place_Of_Service_Code
		,	admission_Source_Code				::	VARCHAR(  2 )	AS	admission_Source_Code
		,	admission_Type_Code					::	VARCHAR(  2 )	AS	admission_Type_Code
		,	claimTypeCode						::	VARCHAR(  2 )	AS	claimTypeCode
		,	discharge_Status_Code				::	VARCHAR(  2 )	AS	discharge_Status_Code
		,	type_Of_Bill_Code					::	VARCHAR(  3 )	AS	type_Of_Bill_Code
		,	first_Date_Of_Service				::	DATE			AS	first_Date_Of_Service
		,	last_Date_Of_Service				::	DATE			AS	last_Date_Of_Service
		,	REGEXP_REPLACE( admitting_ICD9_DX_Code, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	admitting_ICD9_DX_Code
		,	REGEXP_REPLACE( primary_ICD9_DX_Code, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	primary_ICD9_DX_Code
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code1, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code1
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code2, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code2
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code3, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code3
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code4, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code4
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code5, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code5
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code6, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code6
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code7, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code7
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code8, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code8
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code9, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code9
		,	REGEXP_REPLACE( secondary_ICD9_DX_Code10, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD9_DX_Code10
		,	REGEXP_REPLACE( principal_ICD9_Procedure_Code, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )	AS	principal_ICD9_Procedure_Code
		,	REGEXP_REPLACE( secondary_ICD9_Procedure_Code1, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )	AS	secondary_ICD9_Procedure_Code1
		,	REGEXP_REPLACE( secondary_ICD9_Procedure_Code2, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )	AS	secondary_ICD9_Procedure_Code2
		,	REGEXP_REPLACE( secondary_ICD9_Procedure_Code3, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )	AS	secondary_ICD9_Procedure_Code3
		,	REGEXP_REPLACE( secondary_ICD9_Procedure_Code4, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )	AS	secondary_ICD9_Procedure_Code4
		,	REGEXP_REPLACE( secondary_ICD9_Procedure_Code5, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )	AS	secondary_ICD9_Procedure_Code5
		,	billing_Provider_NPI				::	VARCHAR( 10 )	AS	billing_Provider_NPI
		,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )	AS	billing_Provider_Specialty_Code
		,	billing_Provider_Zip_Code			::	VARCHAR(  5 )	AS	billing_Provider_Zip_Code
		,	billing_Provide_rMedicare_ID		::	VARCHAR( 20 )	AS	billing_Provider_Medicare_ID
		,	rendering_Provider_NPI				::	VARCHAR( 10 )	AS	rendering_Provider_NPI
		,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )	AS	rendering_Provider_Specialty_Code
		,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )	AS	rendering_Provider_Zip_Code
		,	claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )	AS	claims_System_Assigned_DRG_Code
		,	claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )	AS	claims_System_Assigned_MDC_Code
		,	ICD_Code_Type						::	VARCHAR(  1 )	AS	ICD_Code_Type
		,	REGEXP_REPLACE( admitting_ICD10_DX_Code, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	admitting_ICD10_DX_Code
		,	REGEXP_REPLACE( primary_ICD10_DX_Code, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	primary_ICD10_DX_Code
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code1, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code1
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code2, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code2
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code3, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code3
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code4, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code4
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code5, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code5
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code6, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code6
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code7, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code7
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code8, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code8
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code9, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code9
		,	REGEXP_REPLACE( secondary_ICD10_DX_Code10, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_DX_Code10
		,	REGEXP_REPLACE( principal_ICD10_Procedure_Code, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	principal_ICD10_Procedure_Code
		,	REGEXP_REPLACE( secondary_ICD10_Procedure_Code1, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_Procedure_Code1
		,	REGEXP_REPLACE( secondary_ICD10_Procedure_Code2, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_Procedure_Code2
		,	REGEXP_REPLACE( secondary_ICD10_Procedure_Code3, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_Procedure_Code3
		,	REGEXP_REPLACE( secondary_ICD10_Procedure_Code4, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_Procedure_Code4
		,	REGEXP_REPLACE( secondary_ICD10_Procedure_Code5, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )	AS	secondary_ICD10_Procedure_Code5
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )	AS	claim_Payment_Status_Code
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )	AS	non_Covered_Reason_Code
	FROM
		clean_raw.BHI_Facility_Claim_Header
);
--ANALYZE COMPRESSION	whaight.BHI_Facility_Claim_Header_step_0;
ANALYZE				whaight.BHI_Facility_Claim_Header_step_0;
VACUUM SORT ONLY	whaight.BHI_Facility_Claim_Header_step_0;
ANALYZE				whaight.BHI_Facility_Claim_Header_step_0;



/********************************************************************************/
/*																				*/
/*	Now that we have clean codes, we can commence with the translation of the	*/
/*	ICD 9 DX codes to their ICD 10 counterparts.  As this is repeating 			*/
/*	information, it needs to be spun off into its own repeating table, but at	*/
/*	the time of the translation we have the opportunity to capture the GEM		*/
/*	flags.  These report information on the quality of the translation via the	*/
/*	GEM xwalk.  We create columns for these now and populate in the INSERT		*/
/*	below.																		*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Facility_Claim_Header_step_1;
CREATE TABLE 			whaight.BHI_Facility_Claim_Header_step_1
(		claim_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )	ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )	ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )	ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE			ENCODE	ZSTD
	,	last_Date_Of_Service				DATE			ENCODE	ZSTD
	,	admitting_ICD9_DX_Code				VARCHAR(  7 )	ENCODE	ZSTD
	,	primary_ICD9_DX_Code				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code1				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code2				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code3				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code4				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code5				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code6				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code7				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code8				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code9				VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD9_DX_Code10			VARCHAR(  7 )	ENCODE	ZSTD
	,	principal_ICD9_Procedure_Code		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code1		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code2		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code3		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code4		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code5		VARCHAR(  6 )	ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )	ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )	ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )	ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )	ENCODE	ZSTD
	,	admitting_ICD10_DX_Code				VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_Admitting					VARCHAR(  5 )	ENCODE	ZSTD
	,	primary_ICD10_DX_Code				VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_Primary					VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code1			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_1							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code2			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_2							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code3			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_3							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code4			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_4							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code5			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_5							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code6			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_6							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code7			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_7							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code8			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_8							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code9			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_9							VARCHAR(  5 )	ENCODE	ZSTD
	,	secondary_ICD10_DX_Code10			VARCHAR(  8 )	ENCODE	ZSTD
	,	GEM_Flags_10						VARCHAR(  5 )	ENCODE	ZSTD
	,	principal_ICD10_Procedure_Code		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code1		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code2		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code3		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code4		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code5		VARCHAR(  7 )	ENCODE	ZSTD
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
/*	The step_1 table is populated by reading the step_0 table, translating		*/
/*	ICD9 DX codes as necessary and recording the associated GEM xwalk flags.	*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Facility_Claim_Header_step_1
(	SELECT	DISTINCT
				claim_ID							::	VARCHAR( 12 )
			,	member_ID							::	VARCHAR( 12 )
			,	category_Of_Service_Code			::	VARCHAR(  3 )
			,	place_Of_Service_Code				::	VARCHAR(  2 )
			,	admission_Source_Code				::	VARCHAR(  2 )
			,	admission_Type_Code					::	VARCHAR(  2 )
			,	claimTypeCode						::	VARCHAR(  2 )
			,	discharge_Status_Code				::	VARCHAR(  2 )
			,	type_Of_Bill_Code					::	VARCHAR(  3 )
			,	first_Date_Of_Service				::	DATE
			,	last_Date_Of_Service				::	DATE
			,	admitting_ICD9_DX_Code				::	VARCHAR(  7 )	AS	ICD9_DX_Code_admitting
			,	primary_ICD9_DX_Code				::	VARCHAR(  7 )	AS	ICD9_DX_Code_primary
			,	secondary_ICD9_DX_Code1				::	VARCHAR(  7 )	AS	ICD9_DX_Code1
			,	secondary_ICD9_DX_Code2				::	VARCHAR(  7 )	AS	ICD9_DX_Code2
			,	secondary_ICD9_DX_Code3				::	VARCHAR(  7 )	AS	ICD9_DX_Code3
			,	secondary_ICD9_DX_Code4				::	VARCHAR(  7 )	AS	ICD9_DX_Code4
			,	secondary_ICD9_DX_Code5				::	VARCHAR(  7 )	AS	ICD9_DX_Code5
			,	secondary_ICD9_DX_Code6				::	VARCHAR(  7 )	AS	ICD9_DX_Code6
			,	secondary_ICD9_DX_Code7				::	VARCHAR(  7 )	AS	ICD9_DX_Code7
			,	secondary_ICD9_DX_Code8				::	VARCHAR(  7 )	AS	ICD9_DX_Code8
			,	secondary_ICD9_DX_Code9				::	VARCHAR(  7 )	AS	ICD9_DX_Code9
			,	secondary_ICD9_DX_Code10			::	VARCHAR(  7 )	AS	ICD9_DX_Code10
			,	principal_ICD9_Procedure_Code		::	VARCHAR(  6 )
			,	secondary_ICD9_Procedure_Code1		::	VARCHAR(  6 )
			,	secondary_ICD9_Procedure_Code2		::	VARCHAR(  6 )
			,	secondary_ICD9_Procedure_Code3		::	VARCHAR(  6 )
			,	secondary_ICD9_Procedure_Code4		::	VARCHAR(  6 )
			,	secondary_ICD9_Procedure_Code5		::	VARCHAR(  6 )
			,	billing_Provider_NPI				::	VARCHAR( 10 )
			,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )
			,	billing_Provider_Zip_Code			::	VARCHAR(  5 )
			,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )
			,	rendering_Provider_NPI				::	VARCHAR( 10 )
			,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )
			,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )
			,	claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )
			,	claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )
			,	ICD_Code_Type						::	VARCHAR(  1 )
			,	CASE	ICD_Code_Type
					WHEN	'2'	THEN	admitting_ICD10_DX_Code
					WHEN	'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code_admitting			)
					END								::	VARCHAR(  8 )	AS	admitting_ICD10_DX_Code
			,	CASE	ICD_Code_Type
					WHEN	'2'	THEN	NULL
					WHEN	'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code_admitting			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_Admitting
			,	CASE	ICD_Code_Type
					WHEN		'2'	THEN		primary_ICD10_DX_Code
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code_primary			)
					END								::	VARCHAR(  8 )	AS	primary_ICD10_DX_Code
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code_primary			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_Primary
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code1
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code1			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code1
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	secondary_ICD10_DX_Code1			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_1
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code2
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code2			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code2
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	secondary_ICD10_DX_Code2			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_2
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code3
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code3			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code3
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code3			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_3
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code4
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code4			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code4
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code4			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_4
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code5
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code5			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code5
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code5			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_5
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code6
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code6			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code6
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code6			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_6
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code7
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code7			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code7
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code7			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_7
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code8
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code8			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code8
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code8			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_8
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code9
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code9			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code9
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code9			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_9
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		secondary_ICD10_DX_Code10
					WHEN		'1'	THEN	
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
							FROM		whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code10			)
					END								::	VARCHAR(  8 )	AS	secondary_ICD10_DX_Code10
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		NULL
					WHEN		'1'	THEN
						(	SELECT	SUBSTRING( LISTAGG( DISTINCT flags, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
										0, CHARINDEX( '***', LISTAGG( DISTINCT flags, '***' ) ) )
							FROM	whaight.BHI_ICD9_to_ICD10_xwalk_desc
							WHERE	icd9cm	=	ICD9_DX_Code10			)
					END								::	VARCHAR(  8 )	AS	GEM_Flags_10
			,	principal_ICD10_Procedure_Code		::	VARCHAR(  7 )
			,	secondary_ICD10_Procedure_Code1		::	VARCHAR(  7 )
			,	secondary_ICD10_Procedure_Code2		::	VARCHAR(  7 )
			,	secondary_ICD10_Procedure_Code3		::	VARCHAR(  7 )
			,	secondary_ICD10_Procedure_Code4		::	VARCHAR(  7 )
			,	secondary_ICD10_Procedure_Code5		::	VARCHAR(  7 )
			,	claim_Payment_Status_Code			::	VARCHAR(  1 )
			,	non_Covered_Reason_Code				::	VARCHAR(  2 )
	FROM	whaight.BHI_Facility_Claim_Header_step_0
--	WHERE	DATEDIFF( DAY, '2016-01-01', first_Date_Of_Service ) >= 0
);
--ANALYZE COMPRESSION	whaight.BHI_Facility_Claim_Header_step_1;
ANALYZE				whaight.BHI_Facility_Claim_Header_step_1;
VACUUM SORT ONLY	whaight.BHI_Facility_Claim_Header_step_1;
ANALYZE				whaight.BHI_Facility_Claim_Header_step_1;



/********************************************************************************/
/*																				*/
/*	Please find below the definition of that repeating table of ICD 10 DX		*/
/*	codes.  The ICD_Status column indicates whether the listed code (keyed		*/
/*	by claim_ID and member_ID) appeared in the original table as an admitting	*/
/*	code, a primary code or one of several secondary codes.						*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_claims_ICD_DX_Codes;
CREATE TABLE			whaight.BHI_claims_ICD_DX_Codes
(		claim_ID		VARCHAR( 15 )	ENCODE	ZSTD
	,	member_ID		VARCHAR( 12 )	ENCODE	ZSTD
	,	ICD10_DX_Code	VARCHAR(  8 )	ENCODE	ZSTD
	,	ICD_Status		VARCHAR(  1 )	ENCODE	ZSTD	/*	'A": Admitting;  'P': Primary;  'S': Secondary	*/
	,	GEM_Flags		VARCHAR(  5 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID );



/********************************************************************************/
/*																				*/
/*	We read the step_1 table for all the ICD 10 DX code information.  We		*/
/*	capture all the admitting, primary and secondary codes (along with			*/
/*	associated columns) and take the union to populate this table.				*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_claims_ICD_DX_Codes
(			SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	admitting_ICD10_DX_Code		::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'A'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_Admitting			::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	primary_ICD10_DX_Code		::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'P'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_Primary			::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code1	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_1					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code2	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_2					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code3	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_3					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code4	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_4					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code5	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_5					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code6	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_6					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code7	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_7					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code8	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_8					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code9	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_9					::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_DX_Code10	::	VARCHAR(  8 )	AS	ICD10_DX_Code
					,	'S'							::	VARCHAR(  1 )	AS	ICD_Status
					,	GEM_Flags_10				::	VARCHAR(  1 )	AS	GEM_Flags
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		ICD10_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD10_DX_Code ) )	>	0
);
--ANALYZE COMPRESSION	whaight.BHI_claims_ICD_DX_Codes;
ANALYZE				whaight.BHI_claims_ICD_DX_Codes;
VACUUM SORT ONLY	whaight.BHI_claims_ICD_DX_Codes;
ANALYZE				whaight.BHI_claims_ICD_DX_Codes;



/********************************************************************************/
/*																				*/
/*	Please find below the definition of that repeating table of ICD 9 proc		*/
/*	codes.  The ICD9_proc_status column indicates whether the listed code 		*/
/*	(keyed by claim_ID and member_ID) appeared in the original table as a		*/
/*	primary code or one of several secondary codes.								*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_claims_ICD9_Proc_Codes;
CREATE TABLE			whaight.BHI_claims_ICD9_Proc_Codes
(		claim_ID			VARCHAR( 15 )	ENCODE	ZSTD
	,	member_ID			VARCHAR( 12 )	ENCODE	ZSTD
	,	ICD9_Proc_Code		VARCHAR(  6 )	ENCODE	ZSTD
	,	ICD9_Proc_Status	VARCHAR(  1 )	ENCODE	ZSTD		/*	'P': Principal;  'S': Secondary	*/
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID )
;



/********************************************************************************/
/*																				*/
/*	We read the step_1 table for all the ICD 9 proc code information.  We		*/
/*	capture all the primary and secondary codes (along with	associated columns)	*/
/*	and take the union to populate this table.									*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_claims_ICD9_Proc_Codes
(			SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	principal_ICD9_Procedure_Code	::	VARCHAR(  6 )	AS	ICD9_Proc_Code
					,	'P'								::	VARCHAR(  1 )	AS	ICD9_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		principal_ICD9_Procedure_Code					IS	NOT NULL
					AND LEN( BTRIM( principal_ICD9_Procedure_Code ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD9_Procedure_Code1	::	VARCHAR(  6 )	AS	ICD9_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD9_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD9_Procedure_Code1					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD9_Procedure_Code1 ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD9_Procedure_Code2	::	VARCHAR(  6 )	AS	ICD9_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD9_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD9_Procedure_Code2					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD9_Procedure_Code2 ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD9_Procedure_Code3	::	VARCHAR(  6 )	AS	ICD9_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD9_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD9_Procedure_Code3					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD9_Procedure_Code3 ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD9_Procedure_Code4	::	VARCHAR(  6 )	AS	ICD9_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD9_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD9_Procedure_Code4					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD9_Procedure_Code4 ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD9_Procedure_Code5	::	VARCHAR(  6 )	AS	ICD9_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD9_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD9_Procedure_Code5					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD9_Procedure_Code5 ) )	>	0
);

--ANALYZE COMPRESSION		whaight.BHI_claims_ICD9_Proc_Codes;
ANALYZE					whaight.BHI_claims_ICD9_Proc_Codes;
VACUUM SORT ONLY		whaight.BHI_claims_ICD9_Proc_Codes;
ANALYZE					whaight.BHI_claims_ICD9_Proc_Codes;



/********************************************************************************/
/*																				*/
/*	Please find below the definition of that repeating table of ICD 10 proc		*/
/*	codes.  The ICD10_proc_status column indicates whether the listed code 		*/
/*	(keyed by claim_ID and member_ID) appeared in the original table as a		*/
/*	primary code or one of several secondary codes.								*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_claims_ICD10_Proc_Codes;
CREATE TABLE			whaight.BHI_claims_ICD10_Proc_Codes
(		claim_ID			VARCHAR( 15 )	ENCODE	ZSTD
	,	member_ID			VARCHAR( 12 )	ENCODE	ZSTD
	,	ICD10_Proc_Code		VARCHAR(  7 )	ENCODE	ZSTD
	,	ICD10_Proc_Status	VARCHAR(  1 )	ENCODE	ZSTD		/*	'P': Principal;  'S': Secondary	*/
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID )
;



/********************************************************************************/
/*																				*/
/*	We read the step_1 table for all the ICD 10 proc code information.  We		*/
/*	capture all the primary and secondary codes (along with	associated columns)	*/
/*	and take the union to populate this table.									*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_claims_ICD10_Proc_Codes
(			SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	principal_ICD10_Procedure_Code	::	VARCHAR(  7 )	AS	ICD10_Proc_Code
					,	'P'								::	VARCHAR(  1 )	AS	ICD10_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		principal_ICD10_Procedure_Code					IS	NOT NULL
					AND LEN( BTRIM( principal_ICD10_Procedure_Code ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_Procedure_Code1	::	VARCHAR(  7 )	AS	ICD10_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD10_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD10_Procedure_Code1					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD10_Procedure_Code1 ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_Procedure_Code2	::	VARCHAR(  7 )	AS	ICD10_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD10_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD10_Procedure_Code2					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD10_Procedure_Code2 ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_Procedure_Code3	::	VARCHAR(  7 )	AS	ICD10_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD10_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD10_Procedure_Code3					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD10_Procedure_Code3 ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_Procedure_Code4	::	VARCHAR(  7 )	AS	ICD10_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD10_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD10_Procedure_Code4					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD10_Procedure_Code4 ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 15 )	AS	claim_ID
					,	member_ID						::	VARCHAR( 12 )	AS	member_ID
					,	secondary_ICD10_Procedure_Code5	::	VARCHAR(  7 )	AS	ICD10_Proc_Code
					,	'S'								::	VARCHAR(  1 )	AS	ICD10_Proc_Status
			FROM	whaight.BHI_Facility_Claim_Header_step_1
			WHERE		secondary_ICD10_Procedure_Code5					IS	NOT NULL
					AND LEN( BTRIM( secondary_ICD10_Procedure_Code5 ) )	>	0
);

--ANALYZE COMPRESSION		whaight.BHI_claims_ICD10_Proc_Codes;
ANALYZE					whaight.BHI_claims_ICD10_Proc_Codes;
VACUUM SORT ONLY		whaight.BHI_claims_ICD10_Proc_Codes;
ANALYZE					whaight.BHI_claims_ICD10_Proc_Codes;



/********************************************************************************/
/*																				*/
/*	BEHOLD!  Having spun off the repeating information off into their own		*/
/*	tables, we construct a first normal form table of residual information as	*/
/*	found in whaight.BHI_Facility_Claim_Header_step_1.  One may reconstruct		*/
/*	all information contained in the original table by artfully joining this	*/
/*	table to the repeating tables.												*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.BHI_Facility_Claim_Header_1NF;
CREATE TABLE 			whaight.BHI_Facility_Claim_Header_1NF
(		claim_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )	ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )	ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )	ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE			ENCODE	ZSTD
	,	last_Date_Of_Service				DATE			ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )	ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )	ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )	ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )	ENCODE	ZSTD
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
/*	The INSERT below populates the table defined above with residual									*/
/*																				*/
/********************************************************************************/
INSERT INTO	whaight.BHI_Facility_Claim_Header_1NF
(	SELECT	DISTINCT														/*	In HFNY?		*/
				claim_ID							::	VARCHAR( 12 )	--		Y	medical_claims, claim_ID
			,	member_ID							::	VARCHAR( 12 )	--		Y	medical_claims, member_ID
			,	category_Of_Service_Code			::	VARCHAR(  3 )	--		Y	medical_claims, type_Of_Service
			,	place_Of_Service_Code				::	VARCHAR(  2 )	--		Y	medical_claims,	place_Of_Service
			,	admission_Source_Code				::	VARCHAR(  2 )	--		Y	medical_claims, admit_Source
			,	admission_Type_Code					::	VARCHAR(  2 )	--		Y	medical_claims, admit_Type
			,	claimTypeCode						::	VARCHAR(  2 )	--		Y	medical_claims, claim_Type
			,	discharge_Status_Code				::	VARCHAR(  2 )	--		Y	medical_claims, discharge_Status
			,	type_Of_Bill_Code					::	VARCHAR(  3 )	--		Y	medical_claims, bill_Type
			,	first_Date_Of_Service				::	DATE			--		Y	medical_claims, first_DOS
			,	last_Date_Of_Service				::	DATE			--		Y	medical_claims, last_DOS
			,	billing_Provider_NPI				::	VARCHAR( 10 )	--		Y	provider_info, ProviderNPI
			,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )	--		Y	provider_info, PrimarySpecialty
			,	billing_Provider_Zip_Code			::	VARCHAR(  5 )	--		Y	provider_info, ProviderZipCode
			,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )	--		Y	provider_info, MedicareNumber
			,	rendering_Provider_NPI				::	VARCHAR( 10 )	--		Y	provider_info, ProviderNPI
			,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )	--		Y	provider_info, PrimarySpecialty
			,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )	--		Y	provider_info, ProviderZipCode
			,	claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )	--		Y	medical_claims, DRG_Code
			,	claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )	--		Not Here
			,	ICD_Code_Type						::	VARCHAR(  1 )	--		Y	medical_claims, ICD_Code_Type
			,	claim_Payment_Status_Code			::	VARCHAR(  1 )	--		Y	medical_claims, claim_Status
			,	non_Covered_Reason_Code				::	VARCHAR(  2 )	--		Y	medical_claims, disallowed_Reason_1 2 3
	FROM	whaight.BHI_Facility_Claim_Header_step_1
);

--ANALYZE COMPRESSION	whaight.BHI_Facility_Claim_Header_1NF;
ANALYZE				whaight.BHI_Facility_Claim_Header_1NF;
VACUUM SORT ONLY	whaight.BHI_Facility_Claim_Header_1NF;
ANALYZE				whaight.BHI_Facility_Claim_Header_1NF;



grant select on table whaight.BHI_claims_ICD9_Proc_Codes to aprivett;
grant select on table whaight.BHI_claims_ICD10_Proc_Codes to aprivett;
grant select on table whaight.BHI_Facility_Claim_Header_1NF to aprivett;
grant select on table whaight.BHI_Facility_Claim_Header_step_0 to aprivett;
grant select on table whaight.BHI_Facility_Claim_Header_step_1 to aprivett;
grant select on table whaight.BHI_claims_ICD_DX_Codes to aprivett;
grant select on table whaight.BHI_Facility_Claim_Header_1NF to aprivett;



/********************************************************************************/
/*																				*/
/*	What sits below are commands which define and populate a table I no longer	*/
/*	deem necessary.  It's in no way complex, but I preserve it only to cover	*/
/*	the eventuality that I decide I need it after all.  Otherwise, ignore.		*/
/*																				*/
/********************************************************************************/
/*DROP TABLE IF EXISTS	whaight.BHI_Facility_Claim_Header_ICD10;
CREATE TABLE 			whaight.BHI_Facility_Claim_Header_ICD10
(		claim_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	member_ID							VARCHAR( 12 )	ENCODE	ZSTD
	,	category_Of_Service_Code			VARCHAR(  3 )	ENCODE	ZSTD
	,	place_Of_Service_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	admission_Source_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	admission_Type_Code					VARCHAR(  2 )	ENCODE	ZSTD
	,	claimTypeCode						VARCHAR(  2 )	ENCODE	ZSTD
	,	discharge_Status_Code				VARCHAR(  2 )	ENCODE	ZSTD
	,	type_Of_Bill_Code					VARCHAR(  3 )	ENCODE	ZSTD
	,	first_Date_Of_Service				DATE			ENCODE	ZSTD
	,	last_Date_Of_Service				DATE			ENCODE	ZSTD
	,	principal_ICD9_Procedure_Code		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code1		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code2		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code3		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code4		VARCHAR(  6 )	ENCODE	ZSTD
	,	secondary_ICD9_Procedure_Code5		VARCHAR(  6 )	ENCODE	ZSTD
	,	billing_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	billing_Provider_Specialty_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	billing_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	billing_Provider_Medicare_ID		VARCHAR( 20 )	ENCODE	ZSTD
	,	rendering_Provider_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	rendering_Provider_Specialty_Code	VARCHAR(  2 )	ENCODE	ZSTD
	,	rendering_Provider_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	claims_System_Assigned_DRG_Code		VARCHAR(  4 )	ENCODE	ZSTD
	,	claims_System_Assigned_MDC_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	ICD_Code_Type						VARCHAR(  1 )	ENCODE	ZSTD
	,	principal_ICD10_Procedure_Code		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code1		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code2		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code3		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code4		VARCHAR(  7 )	ENCODE	ZSTD
	,	secondary_ICD10_Procedure_Code5		VARCHAR(  7 )	ENCODE	ZSTD
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



INSERT INTO	whaight.BHI_Facility_Claim_Header_ICD10
(	SELECT	DISTINCT
			claim_ID							::	VARCHAR( 12 )
		,	member_ID							::	VARCHAR( 12 )
		,	category_Of_Service_Code			::	VARCHAR(  3 )
		,	place_Of_Service_Code				::	VARCHAR(  2 )
		,	admission_Source_Code				::	VARCHAR(  2 )
		,	admission_Type_Code					::	VARCHAR(  2 )
		,	claimTypeCode						::	VARCHAR(  2 )
		,	discharge_Status_Code				::	VARCHAR(  2 )
		,	type_Of_Bill_Code					::	VARCHAR(  3 )
		,	first_Date_Of_Service				::	DATE
		,	last_Date_Of_Service				::	DATE
		,	principal_ICD9_Procedure_Code		::	VARCHAR(  6 )
		,	secondary_ICD9_Procedure_Code1		::	VARCHAR(  6 )
		,	secondary_ICD9_Procedure_Code2		::	VARCHAR(  6 )
		,	secondary_ICD9_Procedure_Code3		::	VARCHAR(  6 )
		,	secondary_ICD9_Procedure_Code4		::	VARCHAR(  6 )
		,	secondary_ICD9_Procedure_Code5		::	VARCHAR(  6 )
		,	billing_Provider_NPI				::	VARCHAR( 10 )
		,	billing_Provider_Specialty_Code		::	VARCHAR(  2 )
		,	billing_Provider_Zip_Code			::	VARCHAR(  5 )
		,	billing_Provider_Medicare_ID		::	VARCHAR( 20 )
		,	rendering_Provider_NPI				::	VARCHAR( 10 )
		,	rendering_Provider_Specialty_Code	::	VARCHAR(  2 )
		,	rendering_Provider_Zip_Code			::	VARCHAR(  5 )
		,	claims_System_Assigned_DRG_Code		::	VARCHAR(  4 )
		,	claims_System_Assigned_MDC_Code		::	VARCHAR(  2 )
		,	ICD_Code_Type						::	VARCHAR(  1 )
		,	principal_ICD10_Procedure_Code		::	VARCHAR(  7 )
		,	secondary_ICD10_Procedure_Code1		::	VARCHAR(  7 )
		,	secondary_ICD10_Procedure_Code2		::	VARCHAR(  7 )
		,	secondary_ICD10_Procedure_Code3		::	VARCHAR(  7 )
		,	secondary_ICD10_Procedure_Code4		::	VARCHAR(  7 )
		,	secondary_ICD10_Procedure_Code5		::	VARCHAR(  7 )
		,	claim_Payment_Status_Code			::	VARCHAR(  1 )
		,	non_Covered_Reason_Code				::	VARCHAR(  2 )
	FROM
		whaight.BHI_Facility_Claim_Header_step_1
);
--ANALYZE COMPRESSION	whaight.BHI_Facility_Claim_Header_ICD10;
ANALYZE					whaight.BHI_Facility_Claim_Header_ICD10;
VACUUM SORT ONLY		whaight.BHI_Facility_Claim_Header_ICD10;
ANALYZE					whaight.BHI_Facility_Claim_Header_ICD10;
*/




