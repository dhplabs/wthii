


DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_ICD_Proc_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_ICD_Proc_Codes
(		claim_ID			VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID			VARCHAR( 15 )	ENCODE	ZSTD
	,	ICD_Code_Type		VARCHAR(  1 )	ENCODE	ZSTD		/*	'Y' means ICD_10;  'N' means ICD_9	*/
	,	ICD_Proc_Code		VARCHAR(  7 )	ENCODE	ZSTD
	,	ICD_Proc_Date		DATE			ENCODE	ZSTD
	,	ICD_Proc_Status		VARCHAR(  1 )	ENCODE	ZSTD		/*	'P': Principal;  'S': Secondary	*/
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_ICD_Proc_Codes
(			SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	principal_Proc_Code		::	VARCHAR(  7 )	AS	ICD_Proc_Code
					,	principal_Proc_Date		::	DATE			AS	ICD_Proc_Date
					,	'P'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_2			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_2			::	DATE			AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_3			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_3			::	DATE			AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_4			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_4			::	DATE			AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_5			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_5			::	DATE			AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_6			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_6			::	DATE			AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_ICD_Proc_Codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_Proc_Codes;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_ICD_Proc_Codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_Proc_Codes;



DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_CPT_Codes;
CREATE TABLE			whaight.HFNY_herc_claims_CPT_Codes
(		claim_ID	VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID	VARCHAR( 15 )	ENCODE	ZSTD
	,	CPT_Code	VARCHAR(  5 )	ENCODE	ZSTD
	,	CPT_Date	DATE			ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_CPT_Codes
(			SELECT		claim_ID	::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_1	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_1	::	DATE			AS	CPT_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
	UNION	SELECT		claim_ID	::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_2	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_2	::	DATE			AS	CPT_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
	UNION	SELECT		claim_ID	::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_3	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_3	::	DATE			AS	CPT_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
	UNION	SELECT		claim_ID	::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_4	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_4	::	DATE			AS	CPT_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
	UNION	SELECT		claim_ID	::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_5	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_5	::	DATE			AS	CPT_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_CPT_Codes;
ANALYZE					whaight.HFNY_herc_claims_CPT_Codes;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_CPT_Codes;
ANALYZE					whaight.HFNY_herc_claims_CPT_Codes;



DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_ICD_DX_Codes;
CREATE TABLE			whaight.HFNY_herc_claims_ICD_DX_Codes
(		claim_ID		VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID		VARCHAR( 15 )	ENCODE	ZSTD
	,	ICD_Code_Type	VARCHAR(  1 )	ENCODE	ZSTD		/*	'Y' means ICD_10;  'N' means ICD_9	*/
	,	ICD_DX_Code		VARCHAR(  8 )	ENCODE	ZSTD
	,	ICD_Status		VARCHAR(  1 )	ENCODE	ZSTD		/*	'A": Admitting;  'P': Primary;  'S': Secondary	*/
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_ICD_DX_Codes
(			SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_Admitting	::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'A'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_Primary		::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'P'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_2			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_3			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_4			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_5			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_6			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_7			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_8			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_9			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_10			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_11			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_12			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_13			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_14			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_15			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_16			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_17			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_18			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_19			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_20			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_21			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_22			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_23			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_24			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_25			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_26			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_27			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_28			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_29			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_30			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_31			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_32			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_33			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_34			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_35			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_36			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_37			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_38			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_39			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_40			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_ICD_DX_Codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_DX_Codes;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_ICD_DX_Codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_DX_Codes;



DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_ICD_10_DX_codes;
CREATE TABLE			whaight.HFNY_herc_claims_ICD_10_DX_codes
(		claim_ID		VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID		VARCHAR( 15 )	ENCODE	ZSTD
	,	ICD_Code_Type	VARCHAR(  1 )	ENCODE	ZSTD
	,	ICD_10_DX_Code	VARCHAR(  8 )	ENCODE	ZSTD
	,	ICD_Status		VARCHAR(  1 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO whaight.HFNY_herc_claims_ICD_10_DX_codes
(	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
			,	member_ID		::	VARCHAR( 15 )	AS	member_ID
			,	ICD_Code_Type	::	VARCHAR(  1 )	AS	ICD_Code_Type
			,	CASE		ICD_Code_Type
					WHEN	'2'	THEN	ICD_DX_Code
					WHEN	'1'	THEN	(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
																	0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
											FROM	whaight.HFNY_ICD9_to_ICD10_xwalk
											WHERE	icd9cm	=	ICD_DX_Code			)
					END			::	VARCHAR(  8 )	AS	ICD_10_DX_Code
			,	ICD_Status		::	VARCHAR(  1 )	AS	ICD_Status
	FROM	whaight.HFNY_herc_claims_ICD_DX_Codes
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_ICD_10_DX_codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_10_DX_codes;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_ICD_10_DX_codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_10_DX_codes;



DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_Occurrence_Codes;
CREATE TABLE			whaight.HFNY_herc_claims_Occurrence_Codes
(		claim_ID	VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID	VARCHAR( 15 )	ENCODE	ZSTD
	,	OCC_Code	VARCHAR(  2 )	ENCODE	ZSTD
	,	OCC_Date	DATE			ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_Occurrence_Codes
(			SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	occ_Code_1		::	VARCHAR(  2 )	AS	OCC_Code
					,	occ_Code_1_Date	::	DATE			AS	OCC_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		OCC_Code						IS	NOT NULL
					AND LEN( BTRIM( OCC_Code ) )		>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	occ_Code_2		::	VARCHAR(  2 )	AS	OCC_Code
					,	occ_Code_2_Date	::	DATE			AS	OCC_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		OCC_Code						IS	NOT NULL
					AND LEN( BTRIM( OCC_Code ) )		>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	occ_Code_3		::	VARCHAR(  2 )	AS	OCC_Code
					,	occ_Code_3_Date	::	DATE			AS	OCC_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		OCC_Code						IS	NOT NULL
					AND LEN( BTRIM( OCC_Code ) )		>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	occ_Code_4		::	VARCHAR(  2 )	AS	OCC_Code
					,	occ_Code_4_Date	::	DATE			AS	OCC_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		OCC_Code						IS	NOT NULL
					AND LEN( BTRIM( OCC_Code ) )		>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_Occurrence_Codes;
ANALYZE					whaight.HFNY_herc_claims_Occurrence_Codes;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_Occurrence_Codes;
ANALYZE					whaight.HFNY_herc_claims_Occurrence_Codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_Occ_Span_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_Occ_Span_Codes
(		claim_ID			VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID			VARCHAR( 15 )	ENCODE	ZSTD
	,	OCC_Span_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	OCC_Span_From_Date	DATE			ENCODE	ZSTD
	,	OCC_Span_To_Date	DATE			ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_Occ_Span_Codes
(			SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	occ_Span_Code_1				::	VARCHAR(  2 )	AS	OCC_Span_Code
					,	occ_Span_Code_1_From_Date	::	DATE			AS	OCC_Span_From_Date
					,	occ_Span_Code_1_To_Date		::	DATE			AS	OCC_Span_To_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		OCC_Span_Code					IS	NOT NULL
					AND LEN( BTRIM( OCC_Span_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	occ_Span_Code_2				::	VARCHAR(  2 )	AS	OCC_Span_Code
					,	occ_Span_Code_2_From_Date	::	DATE			AS	OCC_Span_From_Date
					,	occ_Span_Code_2_To_Date		::	DATE			AS	OCC_Span_To_Date
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		OCC_Span_Code					IS	NOT NULL
					AND LEN( BTRIM( OCC_Span_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_Occ_Span_Codes;
ANALYZE					whaight.HFNY_herc_claims_Occ_Span_Codes;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_Occ_Span_Codes;
ANALYZE					whaight.HFNY_herc_claims_Occ_Span_Codes;



DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_Condition_Codes;
CREATE TABLE			whaight.HFNY_herc_claims_Condition_Codes
(		claim_ID	VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID	VARCHAR( 15 )	ENCODE	ZSTD
	,	Cond_Code	VARCHAR(  2 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_Condition_Codes
(			SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_1		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_2		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_3		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_4		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_5		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_6		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_7		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_8		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_9		::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_10	::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_11	::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_12	::	VARCHAR(  2 )	AS	Cond_Code
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_Condition_Codes;
ANALYZE					whaight.HFNY_herc_claims_Condition_Codes;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_Condition_Codes;
ANALYZE					whaight.HFNY_herc_claims_Condition_Codes;



DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_Value_Codes;
CREATE TABLE			whaight.HFNY_herc_claims_Value_Codes
(		claim_ID		VARCHAR( 13 )		ENCODE	ZSTD
	,	member_ID		VARCHAR( 15 )		ENCODE	ZSTD
	,	Value_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	Value_Code_Amt	NUMERIC( 10, 2 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_Value_Codes
(			SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_1		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_1_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_2		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_2_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_3		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_3_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_4		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_4_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_5		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_5_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_6		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_6_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_7		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_7_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_8		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_8_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_9		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_9_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_10		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_10_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_11		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_11_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_12		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_12_Amt	::	NUMERIC( 10, 2 )	AS	Value_Code_Amt
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_Value_Codes;
ANALYZE					whaight.HFNY_herc_claims_Value_Codes;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_Value_Codes;
ANALYZE					whaight.HFNY_herc_claims_Value_Codes;



DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_DX_Code_Ptrs;
CREATE TABLE			whaight.HFNY_herc_claims_DX_Code_Ptrs
(		claim_ID		VARCHAR( 13 )	ENCODE	RAW
	,	member_ID		VARCHAR( 15 )	ENCODE	RAW
	,	DX_Code_Ptr		VARCHAR(  2 )	ENCODE	RAW
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_DX_Code_Ptrs
(			SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )	AS	member_ID
					,	DX_Code_pointer_1	::	VARCHAR(  2 )	AS	DX_Code_Ptr
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		DX_Code_Ptr					IS	NOT NULL
					AND LEN( BTRIM( DX_Code_Ptr ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )	AS	member_ID
					,	DX_Code_pointer_2	::	VARCHAR(  2 )	AS	DX_Code_Ptr
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		DX_Code_Ptr					IS	NOT NULL
					AND LEN( BTRIM( DX_Code_Ptr ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )	AS	member_ID
					,	DX_Code_pointer_3	::	VARCHAR(  2 )	AS	DX_Code_Ptr
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		DX_Code_Ptr					IS	NOT NULL
					AND LEN( BTRIM( DX_Code_Ptr ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )	AS	member_ID
					,	DX_Code_pointer_4	::	VARCHAR(  2 )	AS	DX_Code_Ptr
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		DX_Code_Ptr					IS	NOT NULL
					AND LEN( BTRIM( DX_Code_Ptr ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_DX_Code_Ptrs;
ANALYZE					whaight.HFNY_herc_claims_DX_Code_Ptrs;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_DX_Code_Ptrs;
ANALYZE					whaight.HFNY_herc_claims_DX_Code_Ptrs;



DROP TABLE IF EXISTS	whaight.HFNY_herc_Proc_Code_Modifiers;
CREATE TABLE			whaight.HFNY_herc_Proc_Code_Modifiers
(		claim_ID		VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID		VARCHAR( 15 )	ENCODE	ZSTD
	,	Proc_Code_Mod	VARCHAR(  2 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_Proc_Code_Modifiers
(			SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	procedure_Code_modifier_1	::	VARCHAR(  2 )	AS	Proc_Code_Mod
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Proc_Code_Mod					IS	NOT NULL
					AND LEN( BTRIM( Proc_Code_Mod ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	procedure_Code_modifier_2	::	VARCHAR(  2 )	AS	Proc_Code_Mod
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Proc_Code_Mod					IS	NOT NULL
					AND LEN( BTRIM( Proc_Code_Mod ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	procedure_Code_modifier_3	::	VARCHAR(  2 )	AS	Proc_Code_Mod
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Proc_Code_Mod					IS	NOT NULL
					AND LEN( BTRIM( Proc_Code_Mod ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	procedure_Code_modifier_4	::	VARCHAR(  2 )	AS	Proc_Code_Mod
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Proc_Code_Mod					IS	NOT NULL
					AND LEN( BTRIM( Proc_Code_Mod ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_Proc_Code_Modifiers;
ANALYZE					whaight.HFNY_herc_Proc_Code_Modifiers;
VACUUM SORT ONLY		whaight.HFNY_herc_Proc_Code_Modifiers;
ANALYZE					whaight.HFNY_herc_Proc_Code_Modifiers;



DROP TABLE IF EXISTS	whaight.HFNY_herc_Claim_Cli_Spec_Fields;
CREATE TABLE			whaight.HFNY_herc_Claim_Cli_Spec_Fields
(		claim_ID				VARCHAR( 13 )	ENCODE	RAW
	,	member_ID				VARCHAR( 15 )	ENCODE	RAW
	,	Claim_Cli_Spec_Field	VARCHAR(  1 )	ENCODE	RAW
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_Claim_Cli_Spec_Fields
(			SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_1	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_2	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_3	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_4	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_5	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_6	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_7	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_8	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_9	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_10	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM	whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field					IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_Claim_Cli_Spec_Fields;
ANALYZE					whaight.HFNY_herc_Claim_Cli_Spec_Fields;
VACUUM SORT ONLY		whaight.HFNY_herc_Claim_Cli_Spec_Fields;
ANALYZE					whaight.HFNY_herc_Claim_Cli_Spec_Fields;


