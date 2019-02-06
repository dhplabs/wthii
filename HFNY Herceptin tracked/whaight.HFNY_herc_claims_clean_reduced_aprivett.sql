


SELECT DISTINCT	TypeofService
FROM			ESRD_clean_raw.medical_claims
ORDER BY		TypeofService;



DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_clean_reduced_aprivett;
CREATE TABLE			whaight.HFNY_herc_claims_clean_reduced_aprivett
(		claim_ID					VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID					VARCHAR( 15 )	ENCODE	ZSTD
	,	type_Of_Service				VARCHAR(  2 )	ENCODE	ZSTD
	,	place_Of_Service			VARCHAR(  2 )	ENCODE	ZSTD
	,	admit_Source				VARCHAR(  1 )	ENCODE	ZSTD
	,	admit_Type					VARCHAR(  2 )	ENCODE	ZSTD
	,	claim_Type					VARCHAR(  1 )	ENCODE	ZSTD
	,	discharge_Status			VARCHAR(  2 )	ENCODE	ZSTD
	,	bill_Type					VARCHAR(  3 )	ENCODE	ZSTD
	,	first_DOS					DATE			ENCODE	ZSTD
	,	last_DOS					DATE			ENCODE	ZSTD
	,	bill_Prov_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	bill_Prov_Specialty_Code	VARCHAR(  2 )	ENCODE	ZSTD
	,	bill_Prov_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	bill_Prov_Medicare_ID		VARCHAR( 20 )	ENCODE	ZSTD
	,	bill_prov_Taxonomy			VARCHAR( 21 )	ENCODE	ZSTD
	,	rend_Prov_NPI				VARCHAR( 10 )	ENCODE	ZSTD
	,	rend_Prov_Specialty_Code	VARCHAR(  2 )	ENCODE	ZSTD
	,	rend_Prov_Zip_Code			VARCHAR(  5 )	ENCODE	ZSTD
	,	DRG_Code					VARCHAR(  5 )	ENCODE	ZSTD
--	there is no MDC code in HFNY
	,	ICD_Code_Type				VARCHAR(  1 )	ENCODE	ZSTD
	,	claim_Status				VARCHAR(  1 )	ENCODE	ZSTD
	,	disallowed_Reason_1			VARCHAR(  1 )	ENCODE	LZO
	,	disallowed_Reason_2			VARCHAR(  1 )	ENCODE	LZO
	,	disallowed_Reason_3			VARCHAR(  1 )	ENCODE	LZO
	,	procedure_Code				VARCHAR(  6 )	ENCODE	ZSTD
	,	procedure_Code_modifier_1	VARCHAR(  2 )	ENCODE	ZSTD
	,	procedure_Code_modifier_2	VARCHAR(  2 )	ENCODE	ZSTD
	,	procedure_Code_modifier_3	VARCHAR(  2 )	ENCODE	ZSTD
	,	procedure_Code_modifier_4	VARCHAR(  2 )	ENCODE	LZO
)
DISTSTYLE	KEY
DISTKEY( member_ID )
INTERLEAVED SORTKEY(
		claim_ID
	,	ICD_Code_Type
	,	first_DOS	);



INSERT INTO	whaight.HFNY_herc_claims_clean_reduced_aprivett
(	WITH
		prov	AS
			(	SELECT DISTINCT		ProviderID
								,	ProviderNPI
								,	PrimarySpecialty
								,	ProviderZipCode
								,	MedicareNumber
								,	HealthcareProviderTaxonomyCode
				FROM			ESRD_clean_raw.provider_info
				WHERE			LEN( BTRIM( ProviderNPI ) )	>	0	)
	SELECT
			claims.claim_ID						::	VARCHAR( 13 )	AS	claim_ID
		,	claims.member_ID					::	VARCHAR( 15 )	AS	member_ID
		,	claims.type_Of_Service				::	VARCHAR(  2 )	AS	type_Of_Service
		,	claims.place_Of_Service				::	VARCHAR(  2 )	AS	place_Of_Service
		,	claims.admit_Source					::	VARCHAR(  1 )	AS	admit_Source
		,	claims.admit_Type					::	VARCHAR(  2 )	AS	admit_Type
		,	claims.claim_Type					::	VARCHAR(  1 )	AS	claim_Type
		,	claims.discharge_Status				::	VARCHAR(  2 )	AS	discharge_Status
		,	claims.bill_Type					::	VARCHAR(  3 )	AS	bill_Type
		,	claims.first_DOS					::	DATE			AS	first_DOS
		,	claims.last_DOS						::	DATE			AS	last_DOS
		,	bill.ProviderNPI					::	VARCHAR( 10 )	AS	bill_Prov_NPI
		,	(	SELECT	med_Spec_Code
				FROM	HFNY_Specialty_Taxonomy_xwalk
				WHERE	prov_Taxonomy_Code	=	bill.HealthcareProviderTaxonomyCode
			)									::	VARCHAR(  2 )	AS	bill_Prov_Specialty_Code
		,	bill.ProviderZipCode				::	VARCHAR(  5 )	AS	bill_Prov_Zip_Code
		,	bill.MedicareNumber					::	VARCHAR( 20 )	AS	bill_Prov_Medicare_ID
		,	rend.ProviderNPI					::	VARCHAR( 10 )	AS	rend_Prov_NPI
		,	(	SELECT	med_Spec_Code
				FROM	HFNY_Specialty_Taxonomy_xwalk
				WHERE	prov_Taxonomy_Code	=	rend.HealthcareProviderTaxonomyCode
			)									::	VARCHAR(  2 )	AS	rend_Prov_Specialty_Code
		,	rend.ProviderZipCode				::	VARCHAR(  5 )	AS	rend_Prov_Zip_Code
		,	claims.DRG_Code						::	VARCHAR(  5 )	AS	DRG_Code
--	there is no MDC code in HFNY
		,	claims.ICD_Code_Type				::	VARCHAR(  1 )	AS	ICD_Code_Type
		,	claims.claim_Status					::	VARCHAR(  1 )	AS	claim_Status
		,	claims.disallowed_Reason_1			::	VARCHAR(  1 )	AS	disallowed_Reason_1
		,	claims.disallowed_Reason_2			::	VARCHAR(  1 )	AS	disallowed_Reason_2
		,	claims.disallowed_Reason_3			::	VARCHAR(  1 )	AS	disallowed_Reason_3
		,	claims.procedure_Code				::	VARCHAR(  6 )	AS	procedure_Code
		,	claims.procedure_Code_modifier_1	::	VARCHAR(  2 )	AS	procedure_Code_modifier_1
		,	claims.procedure_Code_modifier_2	::	VARCHAR(  2 )	AS	procedure_Code_modifier_2
		,	claims.procedure_Code_modifier_3	::	VARCHAR(  2 )	AS	procedure_Code_modifier_3
		,	claims.procedure_Code_modifier_4	::	VARCHAR(  2 )	AS	procedure_Code_modifier_4
	FROM
				whaight.HFNY_herc_claims_clean_reduced	claims
		JOIN	prov									bill
		ON		claims.billing_Provider_ID	=	bill.ProviderID
		JOIN	prov									rend
		ON		claims.perf_Provider_ID		=	rend.ProviderID
	WHERE
		DATEDIFF( DAY, '2017-10-01', first_DOS )	>=	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_clean_reduced_aprivett;
ANALYZE					whaight.HFNY_herc_claims_clean_reduced_aprivett;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_clean_reduced_aprivett;
ANALYZE					whaight.HFNY_herc_claims_clean_reduced_aprivett;



WITH		provider	AS
				(	SELECT DISTINCT		ProviderID
									,	ProviderNPI
									,	PrimarySpecialty
									,	ProviderZipCode
									,	MedicareNumber
									,	HealthcareProviderTaxonomyCode
					FROM			ESRD_clean_raw.provider_info
					WHERE			LEN( BTRIM( ProviderNPI ) )	>	0	)
SELECT			prov.ProviderNPI
			,	prov.PrimarySpecialty
			,	prov.HealthcareProviderTaxonomyCode
			,	xw.med_Spec_Code
FROM			HFNY_Specialty_Taxonomy_xwalk	xw
			,	provider						prov
WHERE		prov_Taxonomy_Code	=	prov.HealthcareProviderTaxonomyCode
ORDER BY	prov.ProviderNPI
LIMIT		1000
;


SELECT DISTINCT		ProviderID
				,	ProviderNPI
				,	PrimarySpecialty
				,	ProviderZipCode
				,	MedicareNumber
				,	HealthcareProviderTaxonomyCode
FROM			ESRD_clean_raw.provider_info
WHERE				LEN( BTRIM( HealthcareProviderTaxonomyCode ) )	>		0
				AND	HealthcareProviderTaxonomyCode					IS NOT	NULL
LIMIT			1000;




GRANT USAGE
ON SCHEMA		whaight
TO				aprivett;

GRANT SELECT
ON TABLE		whaight.HFNY_herc_claims_clean_reduced_aprivett
TO				aprivett;


SELECT DISTINCT	COUNT( claim_ID )
FROM			whaight.HFNY_herc_claims_clean_reduced_aprivett;


SELECT		claim_ID, COUNT( claim_ID ), bill_Prov_NPI, rend_Prov_NPI
FROM		whaight.HFNY_herc_claims_clean_reduced_aprivett
GROUP BY	claim_ID, bill_Prov_NPI, rend_Prov_NPI
ORDER BY	claim_ID
;


SELECT		ProviderID, ProviderNPI--, COUNT( ProviderID ) ct
FROM		ESRD_clean_raw.provider_info
--GROUP BY	ProviderID, ProviderNPI
ORDER BY	ProviderID	desc
;



WITH
		prov	AS
			(	SELECT DISTINCT		ProviderID
								,	ProviderNPI
								,	PrimarySpecialty
								,	ProviderZipCode
								,	MedicareNumber
				FROM			ESRD_clean_raw.provider_info
				WHERE			LEN( BTRIM( ProviderNPI ) )	>	0	)
--	,	rend	AS
--			(	SELECT DISTINCT		ProviderID
--								,	ProviderNPI
--								,	PrimarySpecialty
--								,	ProviderZipCode
--								,	MedicareNumber
--				FROM			ESRD_clean_raw.provider_info
--				WHERE			LEN( BTRIM( ProviderNPI ) )	>	0	)
SELECT
		claims.claim_ID						::	VARCHAR( 13 )	AS	claim_ID
	,	claims.member_ID					::	VARCHAR( 15 )	AS	member_ID
	,	claims.type_Of_Service				::	VARCHAR(  2 )	AS	type_Of_Service
--	there is no place of service code in HFNY
	,	claims.admit_Source					::	VARCHAR(  1 )	AS	admit_Source
	,	claims.admit_Type					::	VARCHAR(  2 )	AS	admit_Type
	,	claims.claim_Type					::	VARCHAR(  1 )	AS	claim_Type
	,	claims.discharge_Status				::	VARCHAR(  2 )	AS	discharge_Status
	,	claims.bill_Type					::	VARCHAR(  3 )	AS	bill_Type
	,	claims.first_DOS					::	DATE			AS	first_DOS
	,	claims.last_DOS						::	DATE			AS	last_DOS
	,	bill.ProviderNPI					::	VARCHAR( 10 )	AS	bill_Prov_NPI
	,	bill.PrimarySpecialty				::	VARCHAR(  2 )	AS	bill_Prov_Specialty_Code
	,	bill.ProviderZipCode				::	VARCHAR(  5 )	AS	bill_Prov_Zip_Code
	,	bill.MedicareNumber					::	VARCHAR( 20 )	AS	bill_Prov_Medicare_ID
	,	rend.ProviderNPI					::	VARCHAR( 10 )	AS	rend_Prov_NPI
	,	rend.PrimarySpecialty				::	VARCHAR(  2 )	AS	rend_Prov_Specialty_Code
	,	rend.ProviderZipCode				::	VARCHAR(  5 )	AS	rend_Prov_Zip_Code
	,	claims.DRG_Code						::	VARCHAR(  5 )	AS	DRG_Code
--	there is no MDC code in HFNY
	,	claims.ICD_Code_Type				::	VARCHAR(  1 )	AS	ICD_Code_Type
	,	claims.claim_Status					::	VARCHAR(  1 )	AS	claim_Status
	,	claims.disallowed_Reason_1			::	VARCHAR(  1 )	AS	disallowed_Reason_1
	,	claims.disallowed_Reason_2			::	VARCHAR(  1 )	AS	disallowed_Reason_2
	,	claims.disallowed_Reason_3			::	VARCHAR(  1 )	AS	disallowed_Reason_3
	,	claims.procedure_Code				::	VARCHAR(  6 )	AS	procedure_Code
--	,	claims.procedure_Code_modifier_1	::	VARCHAR(  2 )	AS	procedure_Code_modifier_1
--	,	claims.procedure_Code_modifier_2	::	VARCHAR(  2 )	AS	procedure_Code_modifier_2
--	,	claims.procedure_Code_modifier_3	::	VARCHAR(  2 )	AS	procedure_Code_modifier_3
--	,	claims.procedure_Code_modifier_4	::	VARCHAR(  2 )	AS	procedure_Code_modifier_4
FROM
			whaight.HFNY_herc_claims_clean_reduced	claims
	JOIN	prov									bill
	ON		claims.billing_Provider_ID	=	bill.ProviderID
	JOIN	prov									rend
	ON		claims.perf_Provider_ID		=	rend.ProviderID
;



SELECT DISTINCT		ProviderNPI
								,	PrimarySpecialty
								,	ProviderZipCode
								,	MedicareNumber
				FROM			ESRD_clean_raw.provider_info
				WHERE			LEN( BTRIM( ProviderNPI ) )	>	0	;



SELECT DISTINCT	place_Of_Service
FROM			whaight.HFNY_herc_claims_clean_reduced_aprivett
ORDER BY		place_Of_Service
;