


/*
It is useful in subsequent queries to have a single column table containing only the straight-up ICD9 diagnosis codes from
the table of ICD9 diagnosis codes.
*/
DROP TABLE IF EXISTS		clean_raw.legit_ICD9_DX_Codes;
CREATE TABLE				clean_raw.legit_ICD9_DX_Codes
(	ICD9_DX_Code		VARCHAR( 5 )		ENCODE	ZSTD	)
DISTKEY( ICD9_DX_Code )
COMPOUND SORTKEY( ICD9_DX_Code );



INSERT INTO				clean_raw.legit_ICD9_DX_Codes
(	SELECT DISTINCT		ICD9_DX_Code	AS	ICD9_DX_Code
	FROM					clean_raw.BHI_ICD9_DX_codes
	WHERE					ICD9_DX_Code						IS NOT	NULL
						AND	LEN( BTRIM( ICD9_DX_Code ) )		>		0
	ORDER BY				ICD9_DX_Code
);



--ANALYZE COMPRESSION		clean_raw.legit_ICD9_DX_Codes;
ANALYZE					clean_raw.legit_ICD9_DX_Codes;
VACUUM SORT ONLY		clean_raw.legit_ICD9_DX_Codes;
ANALYZE					clean_raw.legit_ICD9_DX_Codes;



/*
OK, so this one is going to take some explanation.  I wanted to get an exhaustive list of ICD9 diagnosis codes as listed in the BHI claims data
along with the raw count of patients who have been issued the diagnosis code at some point in their history, such as we have it.  ICD9 diagnosis
codes appear in BHI claims data in BHI_Facility_Claim_Header (twelve possible columns) and BHI_Professional_Claims (four possible columns).  Member
IDs per (cleaned) ICD9 diagnosis code are gathered from each column;  then the column information is aggregated and the counts are calculated so
that the rows of the table contain all present ICD 10 diagnosis codes listed separately, together with a count of all patients who have been so
diagnosed at least once.
*/

DROP TABLE IF EXISTS		clean_raw.ICD9_DX_Codes_in_BHI_Claims;
CREATE TABLE				clean_raw.ICD9_DX_Codes_in_BHI_Claims
(		ICD9_DX_Code					VARCHAR( 7 )		ENCODE	ZSTD
	,	count_Of_Patients_per_Code	INTEGER			ENCODE	ZSTD
)
DISTKEY( ICD9_DX_Code )
COMPOUND SORTKEY( ICD9_DX_Code );



INSERT INTO				clean_raw.ICD9_DX_Codes_in_BHI_Claims
(	SELECT DISTINCT
			DX_Code				AS	ICD9_DX_Code
		,	COUNT( member_ID )	AS	count_Of_Patients_per_Code
	FROM
		(		(	SELECT DISTINCT		( REGEXP_REPLACE( admitting_ICD9_DX_Code, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( primary_ICD9_DX_Code, '[^A-Z0-9]+', '' ) )			AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code1, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code2, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code3, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code4, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code5, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code6, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code7, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code8, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code9, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code10, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Facility_Claim_Header
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( primary_ICD9_DX_Code, '[^A-Z0-9]+', '' ) )			AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Professional_Claims
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code1, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Professional_Claims
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code2, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Professional_Claims
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)
			UNION
				(	SELECT DISTINCT		( REGEXP_REPLACE( secondary_ICD9_DX_Code3, '[^A-Z0-9]+', '' ) )		AS	DX_Code
									,	member_ID															AS	member_ID
					FROM				clean_raw.BHI_Professional_Claims
					WHERE				ICD_Code_Type	=		'1'
									AND	DX_Code			IS NOT	NULL
									AND	DX_Code			!=		''		)	)	BIG_PILE_O_MEMBERS_N_CODES
	GROUP BY		BIG_PILE_O_MEMBERS_N_CODES.DX_Code
	ORDER BY		BIG_PILE_O_MEMBERS_N_CODES.DX_Code
);



--ANALYZE COMPRESSION	clean_raw.ICD9_DX_Codes_in_BHI_Claims;
ANALYZE					clean_raw.ICD9_DX_Codes_in_BHI_Claims;
VACUUM SORT ONLY			clean_raw.ICD9_DX_Codes_in_BHI_Claims;
ANALYZE					clean_raw.ICD9_DX_Codes_in_BHI_Claims;



/*
Here the prevalences are actually calculated and stored off in a table.  Included are the ICD9 diagnosis codes (in order), a count of patients who
have at least one claim in the data including the stated diagnosis, and a third column containing the proportion of all members which have received 
such diagnosis (or, equivalently, the probability that a randomly selected member has received said diagnosis at some point during coverage).
*/
DROP TABLE IF EXISTS		clean_raw.BHI_prevalence_ICD9_DX;
CREATE TABLE				clean_raw.BHI_prevalence_ICD9_DX
(		ICD9_DX_Code							VARCHAR( 7 )		ENCODE	RAW
	,	patients_With_ICD9_DX_Code_Count		INTEGER			ENCODE	RAW
	,	ICD9_DX_Code_Prevalence_in_BHI		FLOAT8			ENCODE	RAW
)
DISTKEY( ICD9_DX_Code )
COMPOUND SORTKEY( ICD9_DX_Code );



INSERT INTO		clean_raw.BHI_prevalence_ICD9_DX
(	WITH			Aggregate	AS
					(	SELECT	COUNT( member_ID )	AS	member_count
						FROM		clean_raw.bhi_members					)
	SELECT			Claims.ICD9_DX_Code					AS	this_ICD9_DX_Code
				,	Claims.count_Of_Patients_per_Code	AS	patients_With_ICD9_DX_Code_Count
				,	CONVERT( DOUBLE PRECISION, 1.0*Claims.count_Of_Patients_per_Code/Aggregate.member_count )
														AS	ICD9_DX_Code_Prevalence_in_BHI
	FROM					clean_raw.ICD9_DX_Codes_in_BHI_Claims 	Claims
				JOIN		clean_raw.legit_ICD9_DX_Codes			Codes
				ON		Claims.ICD9_DX_Code		=	Codes.ICD9_DX_Code,
				Aggregate
	GROUP BY			this_ICD9_DX_Code
				,	patients_With_ICD9_DX_Code_Count
				,	Aggregate.member_count
	ORDER BY		this_ICD9_DX_Code
);
