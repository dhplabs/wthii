


DROP TABLE IF EXISTS	whaight.HFNY_ED_claims_clean_reduced;
CREATE TABLE			whaight.HFNY_ED_claims_clean_reduced
(		claim_ID						VARCHAR( 13 )		ENCODE	ZSTD
	,	adj_Claim						VARCHAR( 13 )		ENCODE	ZSTD
	,	claim_Status					VARCHAR(  1 )		ENCODE	ZSTD
	,	claim_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	check_Num						VARCHAR( 11 )		ENCODE	ZSTD
	,	check_Date						DATE				ENCODE	ZSTD
	,	processed_Date					DATE				ENCODE	ZSTD
	,	received_Date					DATE				ENCODE	ZSTD
	,	member_ID						VARCHAR( 15 )		ENCODE	ZSTD
	,	ci_ID							VARCHAR( 15 )		ENCODE	ZSTD
	,	admit_Date						DATE				ENCODE	ZSTD
	,	admit_Hour						VARCHAR(  1 )		ENCODE	LZO
	,	admit_Source					VARCHAR(  1 )		ENCODE	ZSTD
	,	admit_Type						VARCHAR(  2 )		ENCODE	ZSTD
	,	discharge_Date					DATE				ENCODE	ZSTD
	,	discharge_Hour 					VARCHAR(  1 )		ENCODE	LZO
	,	discharge_Status				VARCHAR(  2 )		ENCODE	ZSTD
	,	acct_Plan_Group_ID				VARCHAR( 12 )		ENCODE	BYTEDICT
	,	bill_Type						VARCHAR(  3 )		ENCODE	ZSTD
	,	invoice_Num						VARCHAR(  1 )		ENCODE	LZO
	,	claim_Submitted_charge_Amt		NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	claim_Disallowed_Amt			NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	disallowed_Reason_1				VARCHAR(  1 )		ENCODE	LZO
	,	disallowed_Reason_2				VARCHAR(  1 )		ENCODE	LZO
	,	disallowed_Reason_3				VARCHAR(  1 )		ENCODE	LZO
	,	claim_Allowed_Amt				NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	claim_Paid_Amt					NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	ICD_Code_Type					VARCHAR(  1 )		ENCODE	ZSTD
	,	DRG_Code						VARCHAR(  5 )		ENCODE	ZSTD
	,	DRG_Version						VARCHAR(  1 )		ENCODE	LZO
	,	accident_Date					DATE				ENCODE	ZSTD
	,	ER_Flag							VARCHAR(  1 )		ENCODE	ZSTD
	,	MVA_Flag						VARCHAR(  1 )		ENCODE	LZO
	,	work_Comp_Flag					VARCHAR(  1 )		ENCODE	LZO
	,	accident_Flag					VARCHAR(  1 )		ENCODE	LZO
	,	accident_State					VARCHAR(  2 )		ENCODE	LZO
	,	accident_Hour					VARCHAR(  2 )		ENCODE	LZO
	,	in_Network_Flag					VARCHAR(  1 )		ENCODE	ZSTD
	,	referring_Provider_ID			VARCHAR(  1 )		ENCODE	LZO
	,	billing_Provider_ID				VARCHAR( 15 )		ENCODE	ZSTD
	,	prov_Patient_Acct_Num			VARCHAR( 20 )		ENCODE	ZSTD
	,	med_Record_Num					VARCHAR( 30 )		ENCODE	ZSTD
	,	payee_Code						VARCHAR(  1 )		ENCODE	ZSTD
	,	line_Num						VARCHAR(  3 )		ENCODE	ZSTD
	,	procedure_Code					VARCHAR(  6 )		ENCODE	ZSTD
	,	revenue_Code					VARCHAR(  1 )		ENCODE	LZO
	,	accommodation_Revenue_Code		VARCHAR(  1 )		ENCODE	LZO
	,	accommodation_Rate				VARCHAR(  1 )		ENCODE	LZO
	,	ancillary_Revenue_Code			VARCHAR(  1 )		ENCODE	LZO
	,	emergency_Indicator				VARCHAR(  1 )		ENCODE	ZSTD
	,	NDC_Code						VARCHAR(  1 )		ENCODE	LZO
	,	date_Written					DATE				ENCODE	ZSTD
	,	first_DOS						DATE				ENCODE	ZSTD
	,	last_DOS						DATE				ENCODE	ZSTD
	,	units							VARCHAR(  9 )		ENCODE	ZSTD
	,	anaesthesia						VARCHAR(  1 )		ENCODE	LZO
	,	charge_Amt						NUMERIC( 11, 2 )	ENCODE	ZSTD
	,	allowed_Amt						NUMERIC( 11, 2 )	ENCODE	ZSTD
	,	not_Allowed_Amt					NUMERIC( 11, 2 )	ENCODE	ZSTD
	,	deductible_Amt					NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	copay_Amt						NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	coinsurance_Amt					NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	would_Pay_Amt					NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	benefit_Amt						NUMERIC( 11, 2 )	ENCODE	ZSTD
	,	prov_Discount_Amt				NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	place_Of_Service				VARCHAR(  2 )		ENCODE	ZSTD
	,	type_Of_Service					VARCHAR(  2 )		ENCODE	ZSTD
	,	perf_Provider_ID				VARCHAR( 15 )		ENCODE	ZSTD
	,	COB_Indicator					VARCHAR(  1 )		ENCODE	LZO
	,	COB_Amt							NUMERIC( 10, 2 )	ENCODE	ZSTD
	,	COB_Payer						VARCHAR(  3 )		ENCODE	ZSTD
	,	COB_Date						DATE				ENCODE	ZSTD
	,	capitated_Indicator				VARCHAR(  1 )		ENCODE	ZSTD
	,	remarks							VARCHAR(  1 )		ENCODE	LZO
	,	DHP_Ch_LDOS						DATE				ENCODE	ZSTD
	,	DHP_Med_Claim_Load_Month		INTEGER				ENCODE	LZO
	,	DHP_ci_ID						VARCHAR( 15 )		ENCODE	ZSTD
	,	DHP_s_ID						VARCHAR( 15 )		ENCODE	ZSTD
	,	DHP_a_ID						VARCHAR( 12 )		ENCODE	BYTEDICT
	,	DHP_Paid_Amt					NUMERIC( 11, 2 )	ENCODE	ZSTD
	,	DHP_Performing_Provider_ID		VARCHAR( 17 )		ENCODE	ZSTD
	,	DHP_Billing_Provider_ID			VARCHAR( 17 )		ENCODE	ZSTD
	,	DHP_CH_Claim_Status_CD			VARCHAR(  1 )		ENCODE	ZSTD
	,	DHP_Client_Capitated_Indicator	INTEGER				ENCODE	ZSTD
	,	DHP_CH_ER_Indicator				INTEGER				ENCODE	ZSTD
	,	DHP_CH_MVA_Indicator			INTEGER				ENCODE	ZSTD
	,	DHP_CH_Acc_Indicator			INTEGER				ENCODE	ZSTD
	,	DHP_CH_Amb_Indicator			INTEGER				ENCODE	ZSTD
	,	DHP_CH_WC_Indicator				INTEGER				ENCODE	ZSTD
	,	DHP_CH_COB_Indicator			INTEGER				ENCODE	ZSTD
	,	DHP_Check_Num					INTEGER				ENCODE	ZSTD
	,	CH_Acct_1_Segment				VARCHAR(  7 )		ENCODE	ZSTD
	,	CH_Acct_2_Segment				VARCHAR( 30 )		ENCODE	BYTEDICT
	,	CH_Acct_3_Segment				VARCHAR(  7 )		ENCODE	BYTEDICT
	,	CH_Acct_4_Segment				VARCHAR(  7 )		ENCODE	ZSTD
	,	CH_Acct_5_Segment				VARCHAR(  7 )		ENCODE	LZO
	,	CH_Acct_Name					VARCHAR( 29 )		ENCODE	ZSTD
	,	A_Funding_CD					VARCHAR( 13 )		ENCODE	ZSTD
	,	cycle_SK						INTEGER				ENCODE	ZSTD
	,	EIC_SK							INTEGER				ENCODE	ZSTD
	,	CL_SK							INTEGER				ENCODE	ZSTD
	,	cycle_Created_Date				DATE				ENCODE	ZSTD
	,	filename						VARCHAR( 39 )		ENCODE	ZSTD
	,	DHP_CH_Claim_Num				VARCHAR( 27 )		ENCODE	ZSTD
	,	DHP_CH_Claim_Line_Num			VARCHAR(  3 )		ENCODE	ZSTD
	,	DHP_Claim_Form_Type				INTEGER				ENCODE	ZSTD
	,	DHP_Charge_Amt					NUMERIC( 11, 2 )	ENCODE	ZSTD
	,	CH_Payment_Status_CD_SK			INTEGER				ENCODE	ZSTD
	,	CH_Received_Date				DATE				ENCODE	ZSTD
	,	EIC_Extract_Date				DATE				ENCODE	ZSTD
	,	DHP_Client_Status_CD			VARCHAR(  1 )		ENCODE	LZO
	,	DHP_Claim_Status				VARCHAR(  1 )		ENCODE	ZSTD
	,	DHP_Proc_Code					VARCHAR(  6 )		ENCODE	ZSTD
)
DISTSTYLE	KEY
DISTKEY( ci_ID )
INTERLEAVED SORTKEY(
		claim_ID
	,	ICD_Code_Type
	,	first_DOS
	,	perf_Provider_ID
	,	billing_Provider_ID	);

--select distinct	claim_status	from	whaight.HFNY_claims_clean_reduced;

INSERT INTO	whaight.HFNY_ED_claims_clean_reduced
(	WITH	ED_restricted_claims	AS
				(			SELECT DISTINCT		claim_ID
											,	member_ID
							FROM				whaight.hfny_claims_cpt_codes
							WHERE				CPT_Code	IN	(	'99281',	'99282',	'99283',	'99284',	'99285',
																	'G0380',	'G0381',	'G0382',	'G0383',	'G0384',
																	'99220',	'99217',	'99236',	'99291',	'99292'		)
					UNION	SELECT DISTINCT		claim_ID
											,	member_ID
							FROM			whaight.HFNY_claims_clean_reduced
							WHERE			BTRIM( place_Of_Service )	=	'23'
				)
	SELECT
			claims.claim_ID							::	VARCHAR( 13 )		AS	claim_ID
		,	claims.adj_Claim						::	VARCHAR( 13 )		AS	adj_Claim
		,	claims.claim_Status						::	VARCHAR(  1 )		AS	claim_Status
		,	claims.claim_Type						::	VARCHAR(  1 )		AS	claim_Type
		,	claims.check_Num						::	VARCHAR( 11 )		AS	check_Num
		,	claims.check_Date						::	DATE				AS	check_Date
		,	claims.processed_Date					::	DATE				AS	processed_Date
		,	claims.received_Date					::	DATE				AS	received_Date
		,	claims.member_ID						::	VARCHAR( 15 )		AS	member_ID
		,	claims.ci_ID							::	VARCHAR( 15 )		AS	ci_ID
		,	claims.admit_Date						::	DATE				AS	admit_Date
		,	claims.admit_Hour						::	VARCHAR(  2 )		AS	admit_Hour
		,	claims.admit_Source						::	VARCHAR(  1 )		AS	admit_Source
		,	claims.admit_Type						::	VARCHAR(  2 )		AS	admit_Type
		,	claims.discharge_Date					::	DATE				AS	discharge_Date
		,	claims.discharge_Hour					::	VARCHAR(  2 )		AS	discharge_Hour
		,	claims.discharge_Status					::	VARCHAR(  2 )		AS	discharge_Status
		,	claims.acct_Plan_Group_ID				::	VARCHAR( 12 )		AS	acct_Plan_Group_ID
		,	claims.bill_Type						::	VARCHAR(  3 )		AS	bill_Type
		,	claims.invoice_Num						::	VARCHAR(  1 )		AS	invoice_Num
		,	claims.claim_Submitted_charge_Amt		::	NUMERIC( 10, 2 )	AS	claim_Submitted_charge_Amt
		,	claims.claim_Disallowed_Amt				::	NUMERIC( 10, 2 )	AS	claim_Disallowed_Amt
		,	claims.disallowed_Reason_1				::	VARCHAR(  1 )		AS	disallowed_Reason_1
		,	claims.disallowed_Reason_2				::	VARCHAR(  1 )		AS	disallowed_Reason_2
		,	claims.disallowed_Reason_3				::	VARCHAR(  1 )		AS	disallowed_Reason_3
		,	claims.claim_Allowed_Amt				::	NUMERIC( 10, 2 )	AS	claim_Allowed_Amt
		,	claims.claim_Paid_Amt					::	NUMERIC( 10, 2 )	AS	claim_Paid_Amt
		,	claims.ICD_Code_Type					::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	claims.DRG_Code							::	VARCHAR(  5 )		AS	DRG_Code
		,	claims.DRG_Version						::	VARCHAR(  1 )		AS	DRG_Version
		,	claims.accident_Date					::	DATE				AS	accident_Date
		,	claims.ER_Flag							::	VARCHAR(  1 )		AS	ER_Flag
		,	claims.MVA_Flag							::	VARCHAR(  1 )		AS	MVA_Flag
		,	claims.work_Comp_Flag					::	VARCHAR(  1 )		AS	work_Comp_Flag
		,	claims.accident_Flag					::	VARCHAR(  1 )		AS	accident_Flag
		,	claims.accident_State					::	VARCHAR(  2 )		AS	accident_State
		,	claims.accident_Hour					::	VARCHAR(  2 )		AS	accident_Hour
		,	claims.in_Network_Flag					::	VARCHAR(  1 )		AS	in_Network_Flag
		,	claims.referring_Provider_ID			::	VARCHAR(  1 )		AS	referring_Provider_ID
		,	claims.billing_Provider_ID				::	VARCHAR( 15 )		AS	billing_Provider_ID
		,	claims.prov_Patient_Acct_Num			::	VARCHAR( 20 )		AS	prov_Patient_Acct_Num
		,	claims.med_Record_Num					::	VARCHAR( 30 )		AS	med_Record_Num
		,	claims.payee_Code						::	VARCHAR(  1 )		AS	payee_Code
		,	claims.line_Num							::	VARCHAR(  3 )		AS	line_Num
		,	claims.procedure_Code					::	VARCHAR(  6 )		AS	procedure_Code
		,	claims.revenue_Code						::	VARCHAR(  1 )		AS	revenue_Code
		,	claims.accommodation_Revenue_Code		::	VARCHAR(  1 )		AS	accommodation_Revenue_Code
		,	claims.accommodation_Rate				::	VARCHAR(  1 )		AS	accommodation_Rate
		,	claims.ancillary_Revenue_Code			::	VARCHAR(  1 )		AS	ancillary_Revenue_Code
		,	claims.emergency_Indicator				::	VARCHAR(  1 )		AS	emergency_Indicator
		,	claims.NDC_Code							::	VARCHAR(  1 )		AS	NDC_Code
		,	claims.date_Written						::	DATE				AS	date_Written
		,	claims.first_DOS						::	DATE				AS	first_DOS
		,	claims.last_DOS							::	DATE				AS	last_DOS
		,	claims.units							::	VARCHAR(  9 )		AS	units
		,	claims.anaesthesia						::	VARCHAR(  1 )		AS	anaesthesia
		,	claims.charge_Amt						::	NUMERIC( 11, 2 )	AS	charge_Amt
		,	claims.allowed_Amt						::	NUMERIC( 11, 2 )	AS	allowed_Amt
		,	claims.not_Allowed_Amt					::	NUMERIC( 11, 2 )	AS	not_Allowed_Amt
		,	claims.deductible_Amt					::	NUMERIC( 10, 2 )	AS	deductible_Amt
		,	claims.copay_Amt						::	NUMERIC( 10, 2 )	AS	copay_Amt
		,	claims.coinsurance_Amt					::	NUMERIC( 10, 2 )	AS	coinsurance_Amt
		,	claims.would_Pay_Amt					::	NUMERIC( 10, 2 )	AS	would_Pay_Amt
		,	claims.benefit_Amt						::	NUMERIC( 11, 2 )	AS	benefit_Amt
		,	claims.prov_Discount_Amt				::	NUMERIC( 10, 2 )	AS	prov_Discount_Amt
		,	claims.place_Of_Service					::	VARCHAR(  2 )		AS	place_Of_Service
		,	claims.type_Of_Service					::	VARCHAR(  2 )		AS	type_Of_Service
		,	claims.perf_Provider_ID					::	VARCHAR( 15 )		AS	perf_Provider_ID
		,	claims.COB_Indicator					::	VARCHAR(  1 )		AS	COB_Indicator
		,	claims.COB_Amt							::	NUMERIC( 10, 2 )	AS	COB_Amt
		,	claims.COB_Payer						::	VARCHAR(  3 )		AS	COB_Payer
		,	claims.COB_Date							::	DATE				AS	COB_Date
		,	claims.capitated_Indicator				::	VARCHAR(  1 )		AS	capitated_Indicator
		,	claims.remarks							::	VARCHAR(  1 )		AS	remarks
		,	claims.DHP_Ch_LDOS						::	DATE				AS	DHP_Ch_LDOS
		,	claims.DHP_Med_Claim_Load_Month			::	INTEGER				AS	DHP_Med_Claim_Load_Month
		,	claims.DHP_ci_ID						::	VARCHAR( 15 )		AS	DHP_ci_ID
		,	claims.DHP_s_ID							::	VARCHAR( 15 )		AS	DHP_s_ID
		,	claims.DHP_a_ID							::	VARCHAR( 12 )		AS	DHP_a_ID
		,	claims.DHP_Paid_Amt						::	NUMERIC( 11, 2 )	AS	DHP_Paid_Amt
		,	claims.DHP_Performing_Provider_ID		::	VARCHAR( 17 )		AS	DHP_Performing_Provider_ID
		,	claims.DHP_Billing_Provider_ID			::	VARCHAR( 17 )		AS	DHP_Billing_Provider_ID
		,	claims.DHP_CH_Claim_Status_CD			::	VARCHAR(  1 )		AS	DHP_CH_Claim_Status_CD
		,	claims.DHP_Client_Capitated_Indicator	::	INTEGER				AS	DHP_Client_Capitated_Indicator
		,	claims.DHP_CH_ER_Indicator				::	INTEGER				AS	DHP_CH_ER_Indicator
		,	claims.DHP_CH_MVA_Indicator				::	INTEGER				AS	DHP_CH_MVA_Indicator
		,	claims.DHP_CH_Acc_Indicator				::	INTEGER				AS	DHP_CH_Acc_Indicator
		,	claims.DHP_CH_Amb_Indicator				::	INTEGER				AS	DHP_CH_Amb_Indicator
		,	claims.DHP_CH_WC_Indicator				::	INTEGER				AS	DHP_CH_WC_Indicator
		,	claims.DHP_CH_COB_Indicator				::	INTEGER				AS	DHP_CH_COB_Indicator
		,	claims.DHP_Check_Num					::	INTEGER				AS	DHP_Check_Num
		,	claims.CH_Acct_1_Segment				::	VARCHAR(  7 )		AS	CH_Acct_1_Segment
		,	claims.CH_Acct_2_Segment				::	VARCHAR( 30 )		AS	CH_Acct_2_Segment
		,	claims.CH_Acct_3_Segment				::	VARCHAR(  7 )		AS	CH_Acct_3_Segment
		,	claims.CH_Acct_4_Segment				::	VARCHAR(  7 )		AS	CH_Acct_4_Segment
		,	claims.CH_Acct_5_Segment				::	VARCHAR(  7 )		AS	CH_Acct_5_Segment
		,	claims.CH_Acct_Name						::	VARCHAR( 29 )		AS	CH_Acct_Name
		,	claims.A_Funding_CD						::	VARCHAR( 13 )		AS	A_Funding_CD
		,	claims.cycle_SK							::	INTEGER				AS	cycle_SK
		,	claims.EIC_SK							::	INTEGER				AS	EIC_SK
		,	claims.CL_SK							::	INTEGER				AS	CL_SK
		,	claims.cycle_Created_Date				::	DATE				AS	cycle_Created_Date
		,	claims.filename							::	VARCHAR( 39 )		AS	filename
		,	claims.DHP_CH_Claim_Num					::	VARCHAR( 27 )		AS	DHP_CH_Claim_Num
		,	claims.DHP_CH_Claim_Line_Num			::	VARCHAR(  3 )		AS	DHP_CH_Claim_Line_Num
		,	claims.DHP_Claim_Form_Type				::	INTEGER				AS	DHP_Claim_Form_Type
		,	claims.DHP_Charge_Amt					::	NUMERIC( 11, 2 )	AS	DHP_Charge_Amt
		,	claims.CH_Payment_Status_CD_SK			::	INTEGER				AS	CH_Payment_Status_CD_SK
		,	claims.CH_Received_Date					::	DATE				AS	CH_Received_Date
		,	claims.EIC_Extract_Date					::	DATE				AS	EIC_Extract_Date
		,	claims.DHP_Client_Status_CD				::	VARCHAR(  1 )		AS	DHP_Client_Status_CD
		,	claims.DHP_Claim_Status					::	VARCHAR(  1 )		AS	DHP_Claim_Status
		,	claims.DHP_Proc_Code					::	VARCHAR(  6 )		AS	DHP_Proc_Code
	FROM			ED_restricted_claims				edrc
	LEFT OUTER JOIN	whaight.HFNY_claims_clean_reduced	claims
	ON					claims.claim_ID		=	edrc.claim_ID
					AND	claims.member_ID	=	edrc.member_ID
	WHERE
		claims.claim_Status	=	'F'
);

--ANALYZE COMPRESSION		whaight.HFNY_ED_claims_clean_reduced;
ANALYZE					whaight.HFNY_ED_claims_clean_reduced;
VACUUM SORT ONLY		whaight.HFNY_ED_claims_clean_reduced;
ANALYZE					whaight.HFNY_ED_claims_clean_reduced;



WITH	ED_restricted_claims	AS
			(			SELECT DISTINCT		claim_ID
										,	member_ID
						FROM			whaight.hfny_claims_cpt_codes
						WHERE			CPT_Code	IN	(	'99281',	'99282',	'99283',	'99284',	'99285',
															'G0380',	'G0381',	'G0382',	'G0383',	'G0384',
															'99220',	'99217',	'99236',	'99291',	'99292'		)
				UNION	SELECT DISTINCT		claim_ID
										,	member_ID
						FROM			whaight.HFNY_claims_clean_reduced
						WHERE			BTRIM( place_Of_Service )	=	'23'
			)
SELECT		claims.claim_ID				claim_ID
		,	claims.member_ID			member_ID
		,	claims.place_Of_Service		place_of_service
FROM					ED_restricted_claims				edrc
		LEFT OUTER JOIN	whaight.HFNY_claims_clean_reduced	claims
		ON					claims.claim_ID		=	edrc.claim_ID
						AND	claims.member_ID	=	edrc.member_ID
WHERE	claims.claim_Status	=	'F'
limit 1000;



SELECT	claims.claim_ID, cpt_codes.CPT_Code
FROM	whaight.HFNY_ED_claims_clean_reduced	claims
JOIN	whaight.hfny_claims_cpt_codes			cpt_codes
ON			claims.claim_ID		=	cpt_codes.claim_ID
		AND	claims.member_ID	=	cpt_codes.member_ID
--WHERE	claims.claim_Status	!=	'F'
order by claim_id
limit	1000
;

SELECT	*
FROM	whaight.HFNY_ED_claims_clean_reduced
order by claim_id
limit	1000
;