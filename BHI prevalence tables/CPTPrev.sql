DROP TABLE IF EXISTS		clean_raw.BHI_prevalence_CPT;
CREATE TABLE				clean_raw.BHI_prevalence_CPT
(		CPT_Code							VARCHAR( 14 )		ENCODE	RAW
	,	patients_With_CPT_Code_Count		INTEGER				ENCODE	RAW
	,	CPT_Code_Prevalence_in_BHI		FLOAT8				ENCODE	RAW
)
DISTKEY( CPT_Code )
COMPOUND SORTKEY( CPT_Code );



INSERT INTO		clean_raw.BHI_prevalence_CPT
(	WITH				Aggregate	AS
						(	SELECT	COUNT( member_ID )	AS	member_count
							FROM		clean_raw.bhi_members
						)
				,	Claims		AS
						(	SELECT DISTINCT		CPT_Code
											,	member_ID
							FROM				(	SELECT		CPT_HCPCS_Code	AS	CPT_Code
														,	member_ID
												FROM		clean_raw.bhi_facility_claim_detail	)
									UNION	(	SELECT		CPT_HCPCS_Code	AS	CPT_Code
														,	member_ID
												FROM		clean_raw.bhi_Professional_Claims	)
						)
	SELECT			Claims.CPT_Code				AS	CPT_Code
				,	COUNT( Claims.member_ID )	AS	patients_With_CPT_Code_Count
				,	CONVERT( DOUBLE PRECISION, 1.0*COUNT( Claims.member_ID )/Aggregate.member_count )
												AS	CPT_Code_Prevalence_in_BHI
	FROM				Claims
				,	Aggregate
	GROUP BY			CPT_Code
				,	Aggregate.member_count
	ORDER BY		CPT_Code
);
