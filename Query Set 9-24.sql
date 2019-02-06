DROP TABLE IF EXISTS whaight.HOSPICE_canonical_mmr;
CREATE TABLE whaight.HOSPICE_canonical_mmr
(		PaymentDate							DATE				ENCODE	BYTEDICT
	,	run_file_date						DATE				ENCODE	BYTEDICT
	,	HICN								VARCHAR( 12 )		ENCODE	ZSTD
	,	Surname								VARCHAR(  7 )		ENCODE	ZSTD
	,	Sex									VARCHAR(  1 )		ENCODE	ZSTD
	,	name_sex_dob						VARCHAR( 32 )		ENCODE	ZSTD
	,	BirthDate							DATE				ENCODE	ZSTD
	,	Hospice								VARCHAR(  1 )		ENCODE	ZSTD
--	,	ESRD								VARCHAR(  8 )		ENCODE	ZSTD
	,	AdjustmentReasonCode				VARCHAR(  2 )		ENCODE	ZSTD
--	,	has_ESRD							BOOLEAN				ENCODE	ZSTD
--	,	might_have_ESRD						BOOLEAN				ENCODE	ZSTD
	,	has_Hospice							BOOLEAN				ENCODE	ZSTD
	,	might_have_Hospice					BOOLEAN				ENCODE	ZSTD
	,	monthlypaymt_adjustmt_amounta		NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	monthlypaymt_adjustmt_amountb		NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	msapaymt_adjustmt_start_date		DATE				ENCODE	ZSTD
	,	msapaymt_adjustmt_end_date			DATE				ENCODE	ZSTD
--	,	msapaymt_adjustmt_start_date		VARCHAR( 10 )		ENCODE	ZSTD
--	,	msapaymt_adjustmt_end_date			VARCHAR( 10 )		ENCODE	ZSTD
	,	paymt_adjustmt_month_total_parta	VARCHAR( 32 )		ENCODE	ZSTD
	,	paymt_adjustmt_month_total_partb	VARCHAR( 32 ) 		ENCODE	ZSTD
	,	esrd_msp_flag						VARCHAR( 16 ) 		ENCODE	ZSTD
	,	parta_ma_paymt_total				NUMERIC( 10, 2 ) 	ENCODE	ZSTD
	,	partb_ma_paymt_total				NUMERIC( 10, 2 ) 	ENCODE	ZSTD
	,	ma_paymt_total						NUMERIC( 10, 2 ) 	ENCODE	ZSTD
)
DISTSTYLE EVEN
--DISTKEY( CoveredIndividualId )
COMPOUND SORTKEY( hicn, PaymentDate, Surname, BirthDate, Sex )
;	/*	CREATE whaight.HOSPICE_canonical_mmr	*/



INSERT INTO whaight.HOSPICE_canonical_mmr
(	SELECT DISTINCT
			PaymentDate													::	DATE
		,	run_file_date												::	DATE
		,	HICN														::	VARCHAR( 12 )
		,	Surname														::	VARCHAR(  7 )
		,	Sex															::	VARCHAR(  1 )
		,	UPPER( LEFT( BTRIM( Surname ), 7 ) || ':::' || Sex || ':::' || TO_CHAR( BirthDate, 'YYYY-MM-DD' ) )
																		::	VARCHAR( 32	)		AS	name_sex_dob
		,	BirthDate													::	DATE
		,	Hospice														::	VARCHAR(  1 )
--		,	ESRD														::	VARCHAR(  8 )
		,	AdjustmentReasonCode										::	VARCHAR(  2 )
--		,	( ESRD_month = 'Y' OR month_has_08 > 0 )					::	BOOLEAN				AS	has_ESRD
--		,	( ESRD_month NOT IN ( 'Y', 'N' ) AND month_has_08 = 0 )		::	BOOLEAN				AS	might_have_ESRD
		,	( Hospice_month = 'Y' OR month_has_07 > 0 )					::	BOOLEAN				AS	has_Hospice
		,	( Hospice_month NOT IN ( 'Y', 'N' ) AND month_has_07 = 0 )	::	BOOLEAN				AS	might_have_Hospice
		,	monthlypaymt_adjustmt_amounta								::	NUMERIC( 10, 2 )
		,	monthlypaymt_adjustmt_amountb								::	NUMERIC( 10, 2 )
		,	msapaymt_adjustmt_start_date								::	DATE
		,	msapaymt_adjustmt_end_date									::	DATE
--		,	msapaymt_adjustmt_start_date								::	VARCHAR( 10 )
--		,	msapaymt_adjustmt_end_date									::	VARCHAR( 10 )
		,	paymt_adjustmt_month_total_parta							::	VARCHAR(  2 )
		,	paymt_adjustmt_month_total_partb							::	VARCHAR(  2 )
		,	esrd_msp_flag												::	VARCHAR(  1 )
		,	parta_ma_paymt_total										::	NUMERIC( 10, 2 )
		,	partb_ma_paymt_total										::	NUMERIC( 10, 2 )
		,	ma_paymt_total												::	NUMERIC( 10, 2 )
	FROM
		(	SELECT DISTINCT
					mmr.payment_date				AS	PaymentDate
				,	mmr.run_file_date
				,	mmr.hicn						AS	HICN
				,	UPPER( mmr.surname )			AS	Surname
				,	UPPER( mmr.sex )				AS	Sex
				,	mmr.birth_date					AS	BirthDate
				,	COALESCE( mmr.hospice, 'N' )	AS	Hospice
				,	COALESCE( mmr.esrd, 'N' )		AS	ESRD
				,	mmr.adjustmt_reason_code		AS	AdjustmentReasonCode
				,	SUM(	CASE	WHEN	mmr.adjustmt_reason_code = '07'
									THEN	1
									ELSE	0
							END	)	OVER	(	PARTITION BY	PaymentDate, HICN	)	AS	month_has_07
				,	SUM(	CASE	WHEN	mmr.adjustmt_reason_code = '08'
									THEN	1
									ELSE	0
							END	)	OVER	(	PARTITION BY	PaymentDate, HICN	)	AS	month_has_08
				,	LISTAGG( DISTINCT COALESCE( mmr.hospice, 'N' ), ':::' )
						WITHIN GROUP ( ORDER BY Hospice )
							OVER ( PARTITION BY	HICN, PaymentDate )						AS	Hospice_month
				,	LISTAGG( DISTINCT COALESCE( mmr.esrd, 'N' ), ':::' )
						WITHIN GROUP ( ORDER BY ESRD )
							OVER ( PARTITION BY HICN, PaymentDate )						AS	ESRD_month
				,	monthlypaymt_adjustmt_amounta
				,	monthlypaymt_adjustmt_amountb
				,	TRUNC( msapaymt_adjustmt_start_date )	AS	msapaymt_adjustmt_start_date
				,	TRUNC( msapaymt_adjustmt_end_date )		AS	msapaymt_adjustmt_end_date
--				,	to_char(msapaymt_adjustmt_start_date,'MM/DD/YYYY')	AS	msapaymt_adjustmt_start_date
--				,	to_char(msapaymt_adjustmt_end_date,'MM/DD/YYYY')	AS	msapaymt_adjustmt_end_date
				,	paymt_adjustmt_month_total_parta
				,	paymt_adjustmt_month_total_partb
				,	esrd_msp_flag
				,	parta_ma_paymt_total
				,	partb_ma_paymt_total
				,	ma_paymt_total
			FROM
				ESRD_clean_raw.mmr mmr
		)
);	/*	POPULATE whaight.HOSPICE_canonical_mmr	*/
--ANALYZE COMPRESSION	whaight.HOSPICE_canonical_mmr;
ANALYZE					whaight.HOSPICE_canonical_mmr;
VACUUM SORT ONLY		whaight.HOSPICE_canonical_mmr;
ANALYZE					whaight.HOSPICE_canonical_mmr;



DROP TABLE IF EXISTS	whaight.Hospice_canonical_xwalk;
CREATE TABLE	whaight.Hospice_canonical_xwalk
(		hicn		VARCHAR( 15 )
	,	ci_id_01	VARCHAR( 20 )
	,	ci_id_02	VARCHAR( 20 )
	,	ci_id_03	VARCHAR( 20 )
	,	ci_id_04	VARCHAR( 20 )
);	/*	CREATE	whaight.Hospice_canonical_xwalk	*/



INSERT INTO	whaight.Hospice_canonical_xwalk
	(	WITH	ci_ids_by_hicn	AS
			(	SELECT			row_number() OVER ( partition BY CoveredIndividualHICN )	AS	ci_id_index
							,	CoveredIndividualHICN
							,	CoveredIndividualID
				FROM		(	SELECT DISTINCT	
										mi.CoveredIndividualHICN
									,	mi.CoveredIndividualID
								FROM
									esrd_clean_raw.member_info	AS	mi
							)
				WHERE		CoveredIndividualHICN	IN
							(	SELECT DISTINCT	mmr.hicn
								FROM			esrd_clean_raw.mmr	AS	mmr
--								WHERE				mmr.hospice					=	'Y'
--												OR	mmr.adjustmt_reason_code	=	'01'
--												OR	mmr.adjustmt_reason_code	=	'02'
--												OR	mmr.adjustmt_reason_code	=	'03'
--												OR	mmr.adjustmt_reason_code	=	'07'
--												OR	mmr.adjustmt_reason_code	=	'12'
							)
			)
		SELECT DISTINCT
				first_hit.CoveredIndividualHICN	::	VARCHAR( 15 )	AS	hicn
			,	first_hit.CoveredIndividualID	::	VARCHAR( 20 )	AS	ci_id_01
			,	second_hit.CoveredIndividualID	::	VARCHAR( 20 )	AS	ci_id_02
			,	third_hit.CoveredIndividualID	::	VARCHAR( 20 )	AS	ci_id_03
			,	fourth_hit.CoveredIndividualID	::	VARCHAR( 20 )	AS	ci_id_04
		FROM
			(	SELECT DISTINCT
							lefty.CoveredIndividualHICN
						,	righty.CoveredIndividualID
				FROM	ci_ids_by_hicn	lefty
				LEFT OUTER JOIN
						ci_ids_by_hicn	righty
				ON		lefty.CoveredIndividualHICN = righty.CoveredIndividualHICN
				WHERE	righty.ci_id_index 			= 1
			)	first_hit
		LEFT OUTER JOIN
			(	SELECT DISTINCT
							lefty.CoveredIndividualHICN
						,	righty.CoveredIndividualID
				FROM	ci_ids_by_hicn	lefty
				LEFT OUTER JOIN
						ci_ids_by_hicn	righty
				ON		lefty.CoveredIndividualHICN = righty.CoveredIndividualHICN
				WHERE	righty.ci_id_index 			= 2
			)	second_hit
		ON		first_hit.CoveredIndividualHICN = second_hit.CoveredIndividualHICN
		LEFT OUTER JOIN
			(	SELECT DISTINCT
							lefty.CoveredIndividualHICN
						,	righty.CoveredIndividualID
				FROM	ci_ids_by_hicn	lefty
				LEFT OUTER JOIN
						ci_ids_by_hicn	righty
				ON		lefty.CoveredIndividualHICN = righty.CoveredIndividualHICN
				WHERE	righty.ci_id_index 			= 3
			)	third_hit
		ON		first_hit.CoveredIndividualHICN = third_hit.CoveredIndividualHICN
		LEFT OUTER JOIN
			(	SELECT DISTINCT
							lefty.CoveredIndividualHICN
						,	righty.CoveredIndividualID
				FROM	ci_ids_by_hicn	lefty
				LEFT OUTER JOIN
						ci_ids_by_hicn	righty
				ON		lefty.CoveredIndividualHICN = righty.CoveredIndividualHICN
				WHERE	righty.ci_id_index 			= 4
			)	fourth_hit
		ON		first_hit.CoveredIndividualHICN = fourth_hit.CoveredIndividualHICN
	);	/*	POPULATE whaight.Hospice_canonical_xwalk	*/
--ANALYZE COMPRESSION	whaight.Hospice_canonical_xwalk;
ANALYZE					whaight.Hospice_canonical_xwalk;
VACUUM SORT ONLY		whaight.Hospice_canonical_xwalk;
ANALYZE					whaight.Hospice_canonical_xwalk;



SELECT DISTINCT
		xw.hicn						AS	HICN
	,	mc.Subscriber_ID						/*	It may be worth noting that these two	*/
	,	mc.CoveredIndividualID		AS	ci_id	/*	columns are identical.  Is it obvious?	*/
	,	mc.ClaimNumber
	,	mc.Adjusted_Claim
--	,	mc.Claim_Status
--	,	mc.Claim_Type
--	,	mc.Check_Date
--	,	mc.FirstDOS
--	,	mc.LastDOS
FROM
	whaight.HOSPICE_canonical_xwalk			AS	xw
LEFT JOIN
	whaight.HOSPICE_canonical_med_clm_hdr	AS	mc
ON
		(	mc.CoveredIndividualID = xw.ci_id_01	)
	OR	(	mc.CoveredIndividualID = xw.ci_id_02	)
	OR	(	mc.CoveredIndividualID = xw.ci_id_03	)
	OR	(	mc.CoveredIndividualID = xw.ci_id_04	)
WHERE
		HICN||':::'||ci_id				IN
			(			(	SELECT DISTINCT	hicn||':::'||ci_id_01
							FROM			whaight.HOSPICE_canonical_xwalk	)
				UNION	(	SELECT DISTINCT	hicn||':::'||ci_id_02
							FROM			whaight.HOSPICE_canonical_xwalk	)
				UNION	(	SELECT DISTINCT	hicn||':::'||ci_id_03
							FROM			whaight.HOSPICE_canonical_xwalk	)
				UNION	(	SELECT DISTINCT	hicn||':::'||ci_id_04
							FROM			whaight.HOSPICE_canonical_xwalk	)	)
	AND	TRIM( mc.CoveredIndividualID )	IS NOT	NULL
	AND	HICN IN ( '005565863A', '010921416M', '021621531A', '024560145A', '024766617M', '027463819A', '029323954D', '029587574A' )
ORDER BY
	HICN, mc.CoveredIndividualID
LIMIT	1000
;



SELECT		*
FROM		whaight.HOSPICE_canonical_xwalk
ORDER BY	hicn, ci_id_01
LIMIT		1000
;



SELECT DISTINCT
		hicn
	,	ci_id_01
FROM
	whaight.HOSPICE_canonical_xwalk
LIMIT	1000
;



SELECT
		HICN
	,	AdjustmentReasonCode			AS	ARCode
	,	msapaymt_adjustmt_start_date	AS	StartDate
	,	msapaymt_adjustmt_end_date		AS	EndDate
	,	run_file_date					AS	RunDate
	,	Surname
	,	BirthDate
	,	Hospice
	,	PaymentDate
--	,	has_Hospice
--	,	might_have_Hospice
	,	ma_paymt_total
FROM
	whaight.HOSPICE_canonical_mmr
WHERE
		Hospice = 'Y'
	OR	AdjustmentReasonCode IN ( '01', '02', '03', '07' )
ORDER BY
	HICN, run_file_date, msapaymt_adjustmt_start_date
LIMIT
	1000
;



SELECT	Hospice
FROM
	whaight.HOSPICE_canonical_mmr
ORDER BY
	Hospice	DESC
LIMIT
	1000;
	
select	count(*)
from	ESRD_clean_raw.mmr
where	hicn IS NULL OR len( trim( hicn ) ) = 0
--limit	1000
;


select	max( len( adjustmt_reason_code ) )
from	ESRD_clean_raw.mmr
--where	hospice = 'Y' AND NOT
--limit	1000
;



SELECT DISTINCT
		mmr.hicn					AS	HICN
	,	( NULL )					AS	MBI
	,	ci.Cov_Indl_L_Name			AS	memberLastName
	,	ci.Cov_Indl_FName			AS	memberFirstName
	,	ci.Cov_Indl_Birthdate		AS	memberDateOfBirth
--	,	mmr.memberHospiceStartDate1	AS	memberHospiceStartDate1
--	,	mmr.memberHospiceEndDate1	AS	memberHospiceEndDate1
--	,	mmr.memberHospiceStartDate2	AS	memberHospiceStartDate2
--	,	mmr.memberHospiceEndDate2	AS	memberHospiceEndDate2
--	,	mmr.memberHospiceStartDate3	AS	memberHospiceStartDate3
--	,	mmr.memberHospiceEndDate3	AS	memberHospiceEndDate3
	,	mc.ClaimNumber				AS	claimNumber
	,	mc.Adjusted_Claim			AS	adjustedClaim
	,	mc.Claim_Status				AS	claimStatus
	,	mc.Claim_Type				AS	claimType
	,	mc.Check_Number				AS	checkNumber
	,	mc.Check_Date				AS	checkDate
	,	mc.Subscriber_ID						/*	It may be worth noting that these two	*/
	,	mc.CoveredIndividualID		AS	ci_id	/*	columns are identical.  Is it obvious?	*/
	,	mc.FirstDOS
	,	mc.LastDOS
FROM
	whaight.HOSPICE_canonical_mmr						AS	mmr
LEFT JOIN
	whaight.HOSPICE_canonical_HICN_ciid_hash			AS	hash
ON
	mmr.HICN	=	hash.HICN
LEFT JOIN
	whaight.HOSPICE_canonical_med_clm_hdr				AS	mc
ON
	hash.ci_id	=	mc.CoveredIndividualID
LEFT JOIN
	whaight.HOSPICE_canonical_covered_individual_info	AS	ci
ON
	hash.HICN	=	ci.Cov_Indl_HICN
--WHERE
--		mmr.HICN||':::'||ci_id				IN
--			(			(	SELECT DISTINCT	mmr.hicn||':::'||ci_id_01
--							FROM			whaight.HOSPICE_canonical_xwalk	)
--				UNION	(	SELECT DISTINCT	mmr.hicn||':::'||ci_id_02
--							FROM			whaight.HOSPICE_canonical_xwalk	)
--				UNION	(	SELECT DISTINCT	mmr.hicn||':::'||ci_id_03
--							FROM			whaight.HOSPICE_canonical_xwalk	)
--				UNION	(	SELECT DISTINCT	mmr.hicn||':::'||ci_id_04
--							FROM			whaight.HOSPICE_canonical_xwalk	)	)
--	AND	TRIM( mc.CoveredIndividualID )	IS NOT	NULL
ORDER BY
	HICN, mc.CoveredIndividualID
LIMIT	1000
;



SELECT DISTINCT	*
FROM			whaight.hospice_canonical_xwalk
ORDER BY		HICN
LIMIT			10000;



select distinct	LEN( HICN )
FROM			whaight.HOSPICE_canonical_HICN_ciid_hash
LIMIT			10000;



select distinct	COUNT( HICN )
FROM			whaight.HOSPICE_canonical_HICN_ciid_hash
--LIMIT			10000
;



select distinct	COUNT( ci_id )
FROM			whaight.HOSPICE_canonical_HICN_ciid_hash
--LIMIT			10000
;



DROP TABLE IF EXISTS whaight.HOSPICE_canonical_HICN_ciid_hash;
CREATE TABLE whaight.HOSPICE_canonical_HICN_ciid_hash
(		HICN	VARCHAR( 15 )	ENCODE	ZSTD
	,	ci_id	VARCHAR( 20 )	ENCODE	LZO
);	/*	CREATE whaight.HOSPICE_canonical_HICN_ciid_hash	*/



INSERT INTO whaight.HOSPICE_canonical_HICN_ciid_hash
(	SELECT
			HICN
		,	ci_id
	FROM
		(			(	SELECT DISTINCT
								xw.hicn			AS	HICN
							,	xw.ci_id_01		AS	ci_id
						FROM	whaight.HOSPICE_canonical_xwalk		xw
					)
			UNION	(	SELECT DISTINCT		
								xw.hicn			AS	HICN
							,	xw.ci_id_02		AS	ci_id
						FROM	whaight.HOSPICE_canonical_xwalk		xw
					)
			UNION	(	SELECT DISTINCT
								xw.hicn			AS	HICN
							,	xw.ci_id_03		AS	ci_id
						FROM	whaight.HOSPICE_canonical_xwalk		xw
					)
			UNION	(	SELECT DISTINCT
								xw.hicn			AS	HICN
							,	xw.ci_id_04		AS	ci_id
						FROM	whaight.HOSPICE_canonical_xwalk		xw
					)
		)
	WHERE
			(	ci_id IS NOT NULL				)
		AND	(	LEN( BTRIM( ci_id ) )	>	0	)
	ORDER BY
			HICN
		,	ci_id
);	/*	POPULATE whaight.HOSPICE_canonical_HICN_ciid_hash	*/
--ANALYZE COMPRESSION whaight.HOSPICE_canonical_HICN_ciid_hash;
ANALYZE whaight.HOSPICE_canonical_HICN_ciid_hash;
VACUUM SORT ONLY whaight.HOSPICE_canonical_HICN_ciid_hash;
ANALYZE whaight.HOSPICE_canonical_HICN_ciid_hash;



SELECT		*
FROM		whaight.HOSPICE_canonical_HICN_ciid_hash
ORDER BY	ci_id, hicn
;



SELECT DISTINCT 	ci_id
FROM				whaight.HOSPICE_canonical_HICN_ciid_hash
;



SELECT
		HICN
	,	ci_id
FROM
	(			(	SELECT DISTINCT
							xw.hicn			AS	HICN
						,	xw.ci_id_01		AS	ci_id
					FROM	whaight.HOSPICE_canonical_xwalk		xw
				)
		UNION	(	SELECT DISTINCT		
							xw.hicn			AS	HICN
						,	xw.ci_id_02		AS	ci_id
					FROM	whaight.HOSPICE_canonical_xwalk		xw
				)
		UNION	(	SELECT DISTINCT
							xw.hicn			AS	HICN
						,	xw.ci_id_03		AS	ci_id
					FROM	whaight.HOSPICE_canonical_xwalk		xw
				)
		UNION	(	SELECT DISTINCT
							xw.hicn			AS	HICN
						,	xw.ci_id_04		AS	ci_id
					FROM	whaight.HOSPICE_canonical_xwalk		xw
				)
	)
WHERE
		(	ci_id IS NOT NULL				)
	AND	(	LEN( BTRIM( ci_id ) )	>	0	)
--	AND	HICN IN ( '005565863A', '010921416M', '021621531A', '024560145A', '024766617M', '027463819A', '029323954D', '029587574A' )
ORDER BY
		HICN
	,	ci_id
--LIMIT	1000
;


select	count(*)
from	whaight.Hospice_canonical_xwalk;



DROP TABLE IF EXISTS	whaight.BHI_cpt_codes;
CREATE TABLE			whaight.BHI_cpt_codes
(		HCPCS_CPT_Code		VARCHAR(  16 )
	,	Short_Description	VARCHAR( 128 )
	,	Year				VARCHAR(  16 )
);	/*	create	whaight.BHI_cpt_codes	*/


COPY		whaight.BHI_cpt_codes
FROM		's3://dhp-randlab-s3/users/mpazen/codesets/CPT.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers';


DROP TABLE IF EXISTS	whaight.BHI_ICD9_codes;
CREATE TABLE			whaight.BHI_ICD9_codes
(		dx_code			VARCHAR(  16 )
	,	First			DATE
	,	Last			DATE
	,	dx_short_desc	VARCHAR(  64 )
	,	version			VARCHAR(   2 )
	,	dx_long_desc	VARCHAR( 256 )
	,	CLASS			VARCHAR( 128 )
	,	SubCLASS		VARCHAR( 256 )
	,	SUBSubCLASS		VARCHAR( 128 )
);	/*	create			whaight.BHI_ICD9_codes	*/



COPY		whaight.BHI_ICD9_codes
FROM		's3://dhp-randlab-s3/users/mpazen/codesets/ICD9.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 0;



SELECT	*
FROM	stl_load_errors;



DROP TABLE IF EXISTS	whaight.BHI_ICD10_codes;
CREATE TABLE			whaight.BHI_ICD10_codes
(		Code			VARCHAR(  16 )
	,	First			DATE
	,	Last			DATE
	,	dx_short_desc	VARCHAR(  64 )
	,	Version			VARCHAR(   2 )
	,	dx_long_desc	VARCHAR( 256 )
);	/*	create			whaight.BHI_ICD10_codes	*/



COPY		whaight.BHI_ICD10_codes
FROM		's3://dhp-randlab-s3/users/mpazen/codesets/icd10.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 0;



SELECT	*
FROM	whaight.BHI_ICD10_codes;



DROP TABLE IF EXISTS	whaight.BHI_ndc_codes;
CREATE TABLE			whaight.BHI_ndc_codes
(		PRODUCTID							VARCHAR(  64 )
	,	PRODUCTNDC							VARCHAR(  16 )
	,	STARTMARKETINGDATE					DATE
	,	ENDMARKETINGDATE					DATE
	,	NDC_EXCLUDE_FLAG					VARCHAR(   2 )
	,	NDCPACKAGECODE						VARCHAR(  64 )
	,	PACKAGEDESCRIPTION					VARCHAR( 256 )
	,	SAMPLE_PACKAGE						VARCHAR( 128 )
	,	PRODUCTTYPENAME						VARCHAR( 128 )
	,	PROPRIETARYNAME						VARCHAR( 256 )
	,	PROPRIETARYNAMESUFFIX				VARCHAR( 128 )
	,	NONPROPRIETARYNAME					VARCHAR( 256 )
	,	DOSAGEFORMNAME						VARCHAR( 128 )
	,	ROUTENAME							VARCHAR( 256 )
	,	MARKETINGCATEGORYNAME				VARCHAR( 128 )
	,	APPLICATIONNUMBER					VARCHAR( 128 )
	,	LABELERNAME							VARCHAR( 128 )
	,	SUBSTANCENAME						VARCHAR( 256 )
	,	ACTIVE_NUMERATOR_STRENGTH			VARCHAR( 256 )
	,	ACTIVE_INGRED_UNIT					VARCHAR( 256 )
	,	PHARM_CLASSES						VARCHAR( 256 )
	,	DEASCHEDULE							VARCHAR( 128 )
	,	LISTING_RECORD_CERTIFIED_THROUGH	VARCHAR( 128 )
);	/*	create	whaight.BHI_ndc_codes	*/



COPY		whaight.BHI_ndc_codes
FROM		's3://dhp-randlab-s3/users/mpazen/codesets/NDC_Pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 0;



SELECT	*
FROM	stl_load_errors;


