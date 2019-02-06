/********************************************************************************/
/*																				*/
/*	FILE:			HFNY_GEM_xwalks.sql											*/
/*	PROGRAMMED BY:	Will Haight (wthii)											*/
/*	DATE:			November, 2018												*/
/*	NOTES:			The following tables are established in this file:			*/
/*					whaight.HFNY_ICD9_to_ICD10_xwalk	(deleted)				*/
/*					whaight.HFNY_ICD10_to_ICD9_xwalk	(deleted)				*/
/*					whaight.HFNY_ICD9_descriptions		(deleted)				*/
/*					whaight.HFNY_ICD10_descriptions		(deleted)				*/
/*					whaight.HFNY_ICD9_to_ICD10_xwalk_desc						*/
/*					whaight.HFNY_ICD10_to_ICD9_xwalk_desc						*/
/*																				*/
/*	MODIFICATIONS																*/
/*																				*/
/*		1.	BY:		wthii														*/
/*			DATE:	12/14/2018													*/
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
DROP TABLE IF EXISTS	whaight.HFNY_ICD9_to_ICD10_xwalk;
CREATE TABLE			whaight.HFNY_ICD9_to_ICD10_xwalk
(		icd9cm			VARCHAR( 5 )	ENCODE	RAW
	,	icd10cm			VARCHAR( 7 )	ENCODE	RAW
	,	flags			VARCHAR( 5 )	ENCODE	RAW
)
COMPOUND SORTKEY(
		icd9cm
	,	icd10cm
);



/********************************************************************************/
/*																				*/
/*	This command copies raw data from an S3 bucket at amazon into the table		*/
/*	whaight.HFNY_ICD9_to_ICD10_xwalk.  											*/
/*																				*/
/********************************************************************************/
COPY		whaight.HFNY_ICD9_to_ICD10_xwalk
FROM		's3://dhp-randlab-s3/users/whaight/2018_I9gem.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 0 TRIMBLANKS DELIMITER '\t' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;

--ANALYZE COMPRESSION	whaight.HFNY_ICD9_to_ICD10_xwalk;
ANALYZE				whaight.HFNY_ICD9_to_ICD10_xwalk;
VACUUM SORT ONLY	whaight.HFNY_ICD9_to_ICD10_xwalk;
ANALYZE				whaight.HFNY_ICD9_to_ICD10_xwalk;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define the GEM xwalk table for "translating"		*/
/*	ICD 10 codes to ICD 9 codes.												*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.HFNY_ICD10_to_ICD9_xwalk;
CREATE TABLE			whaight.HFNY_ICD10_to_ICD9_xwalk
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
/*	whaight.HFNY_ICD9_to_ICD10_xwalk.  											*/
/*																				*/
/********************************************************************************/
COPY			whaight.HFNY_ICD10_to_ICD9_xwalk
FROM			's3://dhp-randlab-s3/users/whaight/2018_I10gem.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 0 TRIMBLANKS DELIMITER '\t' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;

--ANALYZE COMPRESSION	whaight.HFNY_ICD9_to_ICD10_xwalk;
ANALYZE				whaight.HFNY_ICD9_to_ICD10_xwalk;
VACUUM SORT ONLY	whaight.HFNY_ICD9_to_ICD10_xwalk;
ANALYZE				whaight.HFNY_ICD9_to_ICD10_xwalk;



/********************************************************************************/
/*																				*/
/*	Some queries useful in debugging.  											*/
/*																				*/
/********************************************************************************/
--select	* from	stl_load_errors	order by starttime desc;

--SELECT		MAX( LEN( icd10cm ) )	icd10
--		,	MAX( LEN( icd9cm ) )	icd9
--		,	MAX( LEN( flags ) )		flags
--FROM	whaight.HFNY_ICD10_to_ICD9_xwalk;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define a table to receive icd9 code descriptions.	*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.HFNY_ICD9_descriptions;
CREATE TABLE			whaight.HFNY_ICD9_descriptions
(		icd9cm		VARCHAR(   5 )	ENCODE	RAW
	,	long_desc	VARCHAR( 224 )	ENCODE	ZSTD
	,	short_desc	VARCHAR(  27 )	ENCODE	RAW
)
COMPOUND SORTKEY( icd9cm );



/********************************************************************************/
/*																				*/
/*	This command copies raw data from an S3 bucket at amazon into the table		*/
/*	whaight.HFNY_ICD9_descriptions.  											*/
/*																				*/
/********************************************************************************/
COPY			whaight.HFNY_ICD9_descriptions
FROM			's3://dhp-randlab-s3/users/whaight/ICD9_DESC_LONG_SHORT_DX.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 1 TRIMBLANKS DELIMITER '\t' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;

--ANALYZE COMPRESSION	whaight.HFNY_ICD9_descriptions;
ANALYZE				whaight.HFNY_ICD9_descriptions;
VACUUM SORT ONLY	whaight.HFNY_ICD9_descriptions;
ANALYZE				whaight.HFNY_ICD9_descriptions;



/********************************************************************************/
/*																				*/
/*	Some queries useful in debugging.  											*/
/*																				*/
/********************************************************************************/
--SELECT		MAX( LEN( icd9cm ) )		icd9cm
--		,	MAX( LEN( long_desc ) )		long_desc
--		,	MAX( LEN( short_desc ) )	short_desc
--FROM	whaight.HFNY_ICD9_descriptions;

--select	* from	stl_load_errors	order by starttime desc;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define a table to receive icd10 code descriptions.	*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.HFNY_ICD10_descriptions;
CREATE TABLE			whaight.HFNY_ICD10_descriptions
(		icd10cm		VARCHAR(   7 )	ENCODE	ZSTD
	,	long_desc	VARCHAR( 230 )	ENCODE	ZSTD
)
COMPOUND SORTKEY( icd10cm );



/********************************************************************************/
/*																				*/
/*	This command copies raw data from an S3 bucket at amazon into the table		*/
/*	whaight.HFNY_ICD9_descriptions.  											*/
/*																				*/
/********************************************************************************/
COPY			whaight.HFNY_ICD10_descriptions
FROM			's3://dhp-randlab-s3/users/whaight/icd10cm_codes_2019_desc.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/Data_Wranglers'
ACCEPTANYDATE ACCEPTINVCHARS '^' BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES DATEFORMAT 'auto'
IGNOREHEADER 0 TRIMBLANKS DELIMITER '\t' STATUPDATE ON MAXERROR 0 COMPUPDATE ON;

--ANALYZE COMPRESSION	whaight.HFNY_ICD10_descriptions;
ANALYZE				whaight.HFNY_ICD10_descriptions;
VACUUM SORT ONLY	whaight.HFNY_ICD10_descriptions;
ANALYZE				whaight.HFNY_ICD10_descriptions;



/********************************************************************************/
/*																				*/
/*	Some queries useful in debugging.  											*/
/*																				*/
/********************************************************************************/
--SELECT	MAX( LEN( icd10cm ) )		icd10cm
--		,	MAX( LEN( long_desc ) )		long_desc
--FROM	whaight.HFNY_ICD10_descriptions;

--select	* from	stl_load_errors	order by starttime desc;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define an enhanced GEM xwalk table (icd9 to icd10)	*/
/*	including both sets of code descriptions.									*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.HFNY_ICD9_to_ICD10_xwalk_desc;
CREATE TABLE			whaight.HFNY_ICD9_to_ICD10_xwalk_desc
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
INSERT INTO	whaight.HFNY_ICD9_to_ICD10_xwalk_desc
(	SELECT		xw.icd9cm			::	VARCHAR(   7 )	AS	icd9cm
			,	xw.icd10cm			::	VARCHAR(   7 )	AS	icd10cm
			,	CASE	xw.flags
					WHEN	'0'	THEN	'00000'
					ELSE				xw.flags
				END					::	VARCHAR(   5 )	AS	flags
			,	icd9.long_desc		::	VARCHAR( 230 )	AS	icd9_desc
			,	icd10.long_desc		::	VARCHAR( 230 )	AS	icd10_desc
	FROM				whaight.HFNY_ICD9_to_ICD10_xwalk	xw
			LEFT JOIN	whaight.HFNY_ICD9_descriptions		icd9
			ON			xw.icd9cm	=	icd9.icd9cm
			LEFT JOIN	whaight.HFNY_ICD10_descriptions		icd10
			ON			xw.icd10cm	=	icd10.icd10cm
);
--ANALYZE COMPRESSION	whaight.HFNY_ICD9_to_ICD10_xwalk_desc;
ANALYZE				whaight.HFNY_ICD9_to_ICD10_xwalk_desc;
VACUUM SORT ONLY	whaight.HFNY_ICD9_to_ICD10_xwalk_desc;
ANALYZE				whaight.HFNY_ICD9_to_ICD10_xwalk_desc;



/********************************************************************************/
/*																				*/
/*	The DROP & CREATE below define an enhanced GEM xwalk table (icd10 to icd9)	*/
/*	including both sets of code descriptions.									*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.HFNY_ICD10_to_ICD9_xwalk_desc;
CREATE TABLE			whaight.HFNY_ICD10_to_ICD9_xwalk_desc
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
INSERT INTO		whaight.HFNY_ICD10_to_ICD9_xwalk_desc
(	SELECT		xw.icd10cm			::	VARCHAR(   7 )	AS	icd10cm
			,	xw.icd9cm			::	VARCHAR(   7 )	AS	icd9cm
			,	CASE	xw.flags
					WHEN	'0'	THEN	'00000'
					ELSE				xw.flags
				END					::	VARCHAR(   5 )	AS	flags
			,	icd9.long_desc		::	VARCHAR( 230 )	AS	icd9_desc
			,	icd10.long_desc		::	VARCHAR( 230 )	AS	icd10_desc
	FROM				whaight.HFNY_ICD10_to_ICD9_xwalk	xw
			LEFT JOIN	whaight.HFNY_ICD9_descriptions		icd9
			ON			xw.icd9cm	=	icd9.icd9cm
			LEFT JOIN	whaight.HFNY_ICD10_descriptions		icd10
			ON			xw.icd10cm	=	icd10.icd10cm
);
--ANALYZE COMPRESSION	whaight.HFNY_ICD10_to_ICD9_xwalk_desc;
ANALYZE				whaight.HFNY_ICD10_to_ICD9_xwalk_desc;
VACUUM SORT ONLY	whaight.HFNY_ICD10_to_ICD9_xwalk_desc;
ANALYZE				whaight.HFNY_ICD10_to_ICD9_xwalk_desc;



/********************************************************************************/
/*																				*/
/*	These tables are dropped because they were only necessary to build the		*/
/*	tables whaight.HFNY_ICD10_to_ICD9_xwalk_desc and							*/
/*	whaight.HFNY_ICD9_to_ICD10_xwalk_desc										*/
/*																				*/
/********************************************************************************/
DROP TABLE IF EXISTS	whaight.HFNY_ICD9_to_ICD10_xwalk;
DROP TABLE IF EXISTS	whaight.HFNY_ICD10_to_ICD9_xwalk;
DROP TABLE IF EXISTS	whaight.HFNY_ICD9_descriptions;
DROP TABLE IF EXISTS	whaight.HFNY_ICD10_descriptions;



/********************************************************************************/
/*																				*/
/*	Make sure the right people can get at this table.							*/
/*																				*/
/********************************************************************************/
GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.HFNY_ICD9_to_ICD10_xwalk_desc
TO				aprivett;
GRANT SELECT
ON TABLE		whaight.HFNY_ICD10_to_ICD9_xwalk_desc
TO				aprivett;
