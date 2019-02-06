

DROP TABLE IF EXISTS		clean_raw.BHI_prevalence_NDC;
CREATE TABLE				clean_raw.BHI_prevalence_NDC
(		NDC_Code							VARCHAR( 12 )	ENCODE	ZSTD
	,	patients_With_NDC_Code_Count		INTEGER			ENCODE	ZSTD
	,	NDC_Code_Prevalence_in_BHI		FLOAT8			ENCODE	ZSTD
)
DISTKEY( NDC_Code )
COMPOUND SORTKEY( NDC_Code );



INSERT INTO		clean_raw.BHI_prevalence_NDC
(	WITH			Aggregate		AS
						(	SELECT	COUNT( member_ID )	AS	member_count
							FROM		clean_raw.bhi_members
						)
				,	pharm_Claims		AS
						(	SELECT DISTINCT		member_ID
											,	NDC_Code
							FROM				clean_raw.BHI_Pharmacy_Claims
						)
	SELECT			pharm_Claims.NDC_Code				AS	NDC_Code
				,	COUNT( pharm_Claims.member_ID )		AS	patients_With_NDC_Code_Count
				,	CONVERT( DOUBLE PRECISION, 1.0*COUNT( pharm_Claims.member_ID )/Aggregate.member_count )
														AS	NDC_Code_Prevalence_in_BHI
	FROM				pharm_Claims
				,	Aggregate
	GROUP BY			NDC_Code
				,	Aggregate.member_count
	ORDER BY		NDC_Code
);