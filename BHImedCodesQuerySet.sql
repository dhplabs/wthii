DROP TABLE IF EXISTS		whaight.BHI_cpt_codes;
CREATE TABLE				whaight.BHI_cpt_codes
(		HCPCS_CPT_Code		VARCHAR( 14 )	ENCODE	RAW
	,	Short_Description	VARCHAR( 28 )	ENCODE	RAW
	,	Year					VARCHAR(  4 )	ENCODE	RAW
);	/*	create	whaight.BHI_cpt_codes	*/



COPY		whaight.BHI_cpt_codes
FROM		's3://dhp-randlab-s3/users/mpazen/codesets/CPT.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers' COMPUPDATE ON;



analyze compression whaight.BHI_cpt_codes;



select	"column", type, encoding 
from		pg_table_def
where	tablename = 'whaight.BHI_ICD9_codes';



select		max( len( HCPCS_CPT_Code ) )
		,	max( len( Short_Description ) )
		,	max( len( Year ) )
from		whaight.BHI_cpt_codes;



DROP TABLE IF EXISTS		whaight.BHI_ICD9_codes;
CREATE TABLE				whaight.BHI_ICD9_codes
(		dx_code			VARCHAR(  5 )	ENCODE	ZSTD
	,	First			DATE			ENCODE	ZSTD
	,	Last				DATE			ENCODE	ZSTD
	,	dx_short_desc	VARCHAR(  24 )	ENCODE	ZSTD
	,	version			VARCHAR(   1 )	ENCODE	ZSTD
	,	dx_long_desc		VARCHAR( 222 )	ENCODE	ZSTD
	,	CLASS			VARCHAR(  69 )	ENCODE	ZSTD
	,	SubCLASS			VARCHAR( 156 )	ENCODE	ZSTD
	,	SUBSubCLASS		VARCHAR( 156 )	ENCODE	ZSTD
);	/*	create			whaight.BHI_ICD9_codes	*/


/*
select	max( len( dx_code ) )		AS	MAX_dx_code
	,	max( len( dx_short_desc ) )	AS	MAX_dx_short_desc
	,	max( len( version ) )		AS	MAX_version
	,	max( len( dx_long_desc ) )	AS	MAX_dx_long_desc
	,	max( len( CLASS ) )			AS	MAX_CLASS
	,	max( len( SubCLASS ) )		AS	MAX_SubCLASS
	,	max( len( SUBSubCLASS ) )	AS	MAX_SUBSubCLASS
from	whaight.BHI_ICD9_codes;
*/


COPY		whaight.BHI_ICD9_codes
FROM		's3://dhp-randlab-s3/users/mpazen/codesets/ICD9.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;



analyze compression whaight.BHI_ICD9_codes;



SELECT	*
FROM		stl_load_errors;



select		max( len( Code ) )			AS	MAX_Code
		,	max( len( dx_short_desc ) )	AS	MAX_dx_short_desc
		,	max( len( Version ) )		AS	MAX_Version
		,	max( len( dx_long_desc ) )	AS	MAX_dx_long_desc
from		whaight.BHI_ICD10_codes;



DROP TABLE IF EXISTS		whaight.BHI_ICD10_codes;
CREATE TABLE				whaight.BHI_ICD10_codes
(		Code				VARCHAR(   7 )	ENCODE	ZSTD
	,	First			DATE				ENCODE	RAW
	,	Last				DATE				ENCODE	RAW
	,	dx_short_desc	VARCHAR(  60 )	ENCODE	ZSTD
	,	Version			VARCHAR(   1 )	ENCODE	ZSTD
	,	dx_long_desc		VARCHAR( 228 )	ENCODE	ZSTD
);	/*	create			whaight.BHI_ICD10_codes	*/



COPY		whaight.BHI_ICD10_codes
FROM		's3://dhp-randlab-s3/users/mpazen/codesets/icd10.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;



analyze compression whaight.BHI_ICD10_codes;



select	max( len( PRODUCTID ) )							AS	MAX_prod_id
	,	max( len( PRODUCTNDC ) )							AS	MAX_prod_ndc
	,	max( len( NDC_EXCLUDE_FLAG ) )					AS	MAX_excl_flag
	,	max( len( NDCPACKAGECODE ) )						AS	MAX_pkg_code
	,	max( len( PACKAGEDESCRIPTION ) )					AS	MAX_pkg_desc
	,	max( len( SAMPLE_PACKAGE ) )						AS	MAX_samp_pkg
	,	max( len( PRODUCTTYPENAME ) )					AS	MAX_prod_type
	,	max( len( PROPRIETARYNAME ) )					AS	MAX_prop_nm
	,	max( len( PROPRIETARYNAMESUFFIX ) )				AS	MAX_prop_nm_suff
	,	max( len( NONPROPRIETARYNAME ) )					AS	MAX_non_prop_name
	,	max( len( DOSAGEFORMNAME ) )						AS	MAX_dsg_form_name
	,	max( len( ROUTENAME ) )							AS	MAX_rt_name
	,	max( len( MARKETINGCATEGORYNAME ) )				AS	MAX_mktg_cat_name
	,	max( len( APPLICATIONNUMBER ) )					AS	MAX_appl_num
	,	max( len( LABELERNAME ) )						AS	MAX_labeler_name
	,	max( len( SUBSTANCENAME ) )						AS	MAX_subst_name
	,	max( len( ACTIVE_NUMERATOR_STRENGTH ) )			AS	MAX_act_num_stren
	,	max( len( ACTIVE_INGRED_UNIT ) )					AS	MAX_act_ingr_unit
	,	max( len( PHARM_CLASSES ) )						AS	MAX_pharm_class
	,	max( len( DEASCHEDULE ) )						AS	MAX_dea_sched
	,	max( len( LISTING_RECORD_CERTIFIED_THROUGH ) )	AS	MAX_list_rec_cert
from	whaight.BHI_ndc_codes;



DROP TABLE IF EXISTS		whaight.BHI_ndc_codes;
CREATE TABLE				whaight.BHI_ndc_codes
(		PRODUCTID							VARCHAR(  47 )	ENCODE	ZSTD
	,	PRODUCTNDC							VARCHAR(  10 )	ENCODE	ZSTD
	,	STARTMARKETINGDATE					DATE				ENCODE	ZSTD
	,	ENDMARKETINGDATE						DATE				ENCODE	RAW
	,	NDC_EXCLUDE_FLAG						VARCHAR(   1 )	ENCODE	ZSTD
	,	NDCPACKAGECODE						VARCHAR(  12 )	ENCODE	ZSTD
	,	PACKAGEDESCRIPTION					VARCHAR( 256 )	ENCODE	ZSTD
	,	SAMPLE_PACKAGE						VARCHAR(   1 )	ENCODE	ZSTD
	,	PRODUCTTYPENAME						VARCHAR(  27 )	ENCODE	ZSTD
	,	PROPRIETARYNAME						VARCHAR( 226 )	ENCODE	ZSTD
	,	PROPRIETARYNAMESUFFIX				VARCHAR( 126 )	ENCODE	ZSTD
	,	NONPROPRIETARYNAME					VARCHAR( 256 )	ENCODE	ZSTD
	,	DOSAGEFORMNAME						VARCHAR(  46 )	ENCODE	ZSTD
	,	ROUTENAME							VARCHAR( 143 )	ENCODE	ZSTD
	,	MARKETINGCATEGORYNAME				VARCHAR(  40 )	ENCODE	ZSTD
	,	APPLICATIONNUMBER					VARCHAR(  15 )	ENCODE	ZSTD
	,	LABELERNAME							VARCHAR( 121 )	ENCODE	ZSTD
	,	SUBSTANCENAME						VARCHAR( 256 )	ENCODE	ZSTD
	,	ACTIVE_NUMERATOR_STRENGTH			VARCHAR( 256 )	ENCODE	ZSTD
	,	ACTIVE_INGRED_UNIT					VARCHAR( 256 )	ENCODE	ZSTD
	,	PHARM_CLASSES						VARCHAR( 256 )	ENCODE	ZSTD
	,	DEASCHEDULE							VARCHAR(   4 )	ENCODE	RAW
	,	LISTING_RECORD_CERTIFIED_THROUGH		VARCHAR(  27 )	ENCODE	ZSTD
);	/*	create	whaight.BHI_ndc_codes	*/



COPY		whaight.BHI_ndc_codes
FROM		's3://dhp-randlab-s3/users/mpazen/codesets/NDC_Pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 0  COMPUPDATE ON;



analyze compression whaight.BHI_ndc_codes;

