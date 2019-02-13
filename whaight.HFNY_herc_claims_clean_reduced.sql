


DROP TABLE IF EXISTS	whaight.HFNY_herc_claims_clean_reduced;
CREATE TABLE			whaight.HFNY_herc_claims_clean_reduced
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
	,	acct_Plan_Group_ID				VARCHAR( 12 )		ENCODE	ZSTD
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
	,	DHP_Med_Claim_Load_Month		INTEGER				ENCODE	RAW
	,	DHP_ci_ID						VARCHAR( 15 )		ENCODE	ZSTD
	,	DHP_s_ID						VARCHAR( 15 )		ENCODE	ZSTD
	,	DHP_a_ID						VARCHAR( 12 )		ENCODE	ZSTD
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
	,	CH_Acct_2_Segment				VARCHAR( 30 )		ENCODE	ZSTD
	,	CH_Acct_3_Segment				VARCHAR(  7 )		ENCODE	ZSTD
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



INSERT INTO	whaight.HFNY_herc_claims_clean_reduced
(	SELECT
			claim_ID						::	VARCHAR( 13 )		AS	claim_ID
		,	adj_Claim						::	VARCHAR( 13 )		AS	adj_Claim
		,	claim_Status					::	VARCHAR(  1 )		AS	claim_Status
		,	claim_Type						::	VARCHAR(  1 )		AS	claim_Type
		,	check_Num						::	VARCHAR( 11 )		AS	check_Num
		,	check_Date						::	DATE				AS	check_Date
		,	processed_Date					::	DATE				AS	processed_Date
		,	received_Date					::	DATE				AS	received_Date
		,	member_ID						::	VARCHAR( 15 )		AS	member_ID
		,	ci_ID							::	VARCHAR( 15 )		AS	ci_ID
		,	admit_Date						::	DATE				AS	admit_Date
		,	admit_Hour						::	VARCHAR(  2 )		AS	admit_Hour
		,	admit_Source					::	VARCHAR(  1 )		AS	admit_Source
		,	admit_Type						::	VARCHAR(  2 )		AS	admit_Type
		,	discharge_Date					::	DATE				AS	discharge_Date
		,	discharge_Hour					::	VARCHAR(  2 )		AS	discharge_Hour
		,	discharge_Status				::	VARCHAR(  2 )		AS	discharge_Status
		,	acct_Plan_Group_ID				::	VARCHAR( 12 )		AS	acct_Plan_Group_ID
		,	bill_Type						::	VARCHAR(  3 )		AS	bill_Type
		,	invoice_Num						::	VARCHAR(  1 )		AS	invoice_Num
		,	claim_Submitted_charge_Amt		::	NUMERIC( 10, 2 )	AS	claim_Submitted_charge_Amt
		,	claim_Disallowed_Amt			::	NUMERIC( 10, 2 )	AS	claim_Disallowed_Amt
		,	disallowed_Reason_1				::	VARCHAR(  1 )		AS	disallowed_Reason_1
		,	disallowed_Reason_2				::	VARCHAR(  1 )		AS	disallowed_Reason_2
		,	disallowed_Reason_3				::	VARCHAR(  1 )		AS	disallowed_Reason_3
		,	claim_Allowed_Amt				::	NUMERIC( 10, 2 )	AS	claim_Allowed_Amt
		,	claim_Paid_Amt					::	NUMERIC( 10, 2 )	AS	claim_Paid_Amt
		,	ICD_Code_Type					::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	DRG_Code						::	VARCHAR(  5 )		AS	DRG_Code
		,	DRG_Version						::	VARCHAR(  1 )		AS	DRG_Version
		,	accident_Date					::	DATE				AS	accident_Date
		,	ER_Flag							::	VARCHAR(  1 )		AS	ER_Flag
		,	MVA_Flag						::	VARCHAR(  1 )		AS	MVA_Flag
		,	work_Comp_Flag					::	VARCHAR(  1 )		AS	work_Comp_Flag
		,	accident_Flag					::	VARCHAR(  1 )		AS	accident_Flag
		,	accident_State					::	VARCHAR(  2 )		AS	accident_State
		,	accident_Hour					::	VARCHAR(  2 )		AS	accident_Hour
		,	in_Network_Flag					::	VARCHAR(  1 )		AS	in_Network_Flag
		,	referring_Provider_ID			::	VARCHAR(  1 )		AS	referring_Provider_ID
		,	billing_Provider_ID				::	VARCHAR( 15 )		AS	billing_Provider_ID
		,	prov_Patient_Acct_Num			::	VARCHAR( 20 )		AS	prov_Patient_Acct_Num
		,	med_Record_Num					::	VARCHAR( 30 )		AS	med_Record_Num
		,	payee_Code						::	VARCHAR(  1 )		AS	payee_Code
		,	line_Num						::	VARCHAR(  3 )		AS	line_Num
		,	procedure_Code					::	VARCHAR(  6 )		AS	procedure_Code
		,	revenue_Code					::	VARCHAR(  1 )		AS	revenue_Code
		,	accommodation_Revenue_Code		::	VARCHAR(  1 )		AS	accommodation_Revenue_Code
		,	accommodation_Rate				::	VARCHAR(  1 )		AS	accommodation_Rate
		,	ancillary_Revenue_Code			::	VARCHAR(  1 )		AS	ancillary_Revenue_Code
		,	emergency_Indicator				::	VARCHAR(  1 )		AS	emergency_Indicator
		,	NDC_Code						::	VARCHAR(  1 )		AS	NDC_Code
		,	date_Written					::	DATE				AS	date_Written
		,	first_DOS						::	DATE				AS	first_DOS
		,	last_DOS						::	DATE				AS	last_DOS
		,	units							::	VARCHAR(  9 )		AS	units
		,	anaesthesia						::	VARCHAR(  1 )		AS	anaesthesia
		,	charge_Amt						::	NUMERIC( 11, 2 )	AS	charge_Amt
		,	allowed_Amt						::	NUMERIC( 11, 2 )	AS	allowed_Amt
		,	not_Allowed_Amt					::	NUMERIC( 11, 2 )	AS	not_Allowed_Amt
		,	deductible_Amt					::	NUMERIC( 10, 2 )	AS	deductible_Amt
		,	copay_Amt						::	NUMERIC( 10, 2 )	AS	copay_Amt
		,	coinsurance_Amt					::	NUMERIC( 10, 2 )	AS	coinsurance_Amt
		,	would_Pay_Amt					::	NUMERIC( 10, 2 )	AS	would_Pay_Amt
		,	benefit_Amt						::	NUMERIC( 11, 2 )	AS	benefit_Amt
		,	prov_Discount_Amt				::	NUMERIC( 10, 2 )	AS	prov_Discount_Amt
		,	place_Of_Service				::	VARCHAR(  2 )		AS	place_Of_Service
		,	type_Of_Service					::	VARCHAR(  2 )		AS	type_Of_Service
		,	perf_Provider_ID				::	VARCHAR( 15 )		AS	perf_Provider_ID
		,	COB_Indicator					::	VARCHAR(  1 )		AS	COB_Indicator
		,	COB_Amt							::	NUMERIC( 10, 2 )	AS	COB_Amt
		,	COB_Payer						::	VARCHAR(  3 )		AS	COB_Payer
		,	COB_Date						::	DATE				AS	COB_Date
		,	capitated_Indicator				::	VARCHAR(  1 )		AS	capitated_Indicator
		,	remarks							::	VARCHAR(  1 )		AS	remarks
		,	DHP_Ch_LDOS						::	DATE				AS	DHP_Ch_LDOS
		,	DHP_Med_Claim_Load_Month		::	INTEGER				AS	DHP_Med_Claim_Load_Month
		,	DHP_ci_ID						::	VARCHAR( 15 )		AS	DHP_ci_ID
		,	DHP_s_ID						::	VARCHAR( 15 )		AS	DHP_s_ID
		,	DHP_a_ID						::	VARCHAR( 12 )		AS	DHP_a_ID
		,	DHP_Paid_Amt					::	NUMERIC( 11, 2 )	AS	DHP_Paid_Amt
		,	DHP_Performing_Provider_ID		::	VARCHAR( 17 )		AS	DHP_Performing_Provider_ID
		,	DHP_Billing_Provider_ID			::	VARCHAR( 17 )		AS	DHP_Billing_Provider_ID
		,	DHP_CH_Claim_Status_CD			::	VARCHAR(  1 )		AS	DHP_CH_Claim_Status_CD
		,	DHP_Client_Capitated_Indicator	::	INTEGER				AS	DHP_Client_Capitated_Indicator
		,	DHP_CH_ER_Indicator				::	INTEGER				AS	DHP_CH_ER_Indicator
		,	DHP_CH_MVA_Indicator			::	INTEGER				AS	DHP_CH_MVA_Indicator
		,	DHP_CH_Acc_Indicator			::	INTEGER				AS	DHP_CH_Acc_Indicator
		,	DHP_CH_Amb_Indicator			::	INTEGER				AS	DHP_CH_Amb_Indicator
		,	DHP_CH_WC_Indicator				::	INTEGER				AS	DHP_CH_WC_Indicator
		,	DHP_CH_COB_Indicator			::	INTEGER				AS	DHP_CH_COB_Indicator
		,	DHP_Check_Num					::	INTEGER				AS	DHP_Check_Num
		,	CH_Acct_1_Segment				::	VARCHAR(  7 )		AS	CH_Acct_1_Segment
		,	CH_Acct_2_Segment				::	VARCHAR( 30 )		AS	CH_Acct_2_Segment
		,	CH_Acct_3_Segment				::	VARCHAR(  7 )		AS	CH_Acct_3_Segment
		,	CH_Acct_4_Segment				::	VARCHAR(  7 )		AS	CH_Acct_4_Segment
		,	CH_Acct_5_Segment				::	VARCHAR(  7 )		AS	CH_Acct_5_Segment
		,	CH_Acct_Name					::	VARCHAR( 29 )		AS	CH_Acct_Name
		,	A_Funding_CD					::	VARCHAR( 13 )		AS	A_Funding_CD
		,	cycle_SK						::	INTEGER				AS	cycle_SK
		,	EIC_SK							::	INTEGER				AS	EIC_SK
		,	CL_SK							::	INTEGER				AS	CL_SK
		,	cycle_Created_Date				::	DATE				AS	cycle_Created_Date
		,	filename						::	VARCHAR( 39 )		AS	filename
		,	DHP_CH_Claim_Num				::	VARCHAR( 27 )		AS	DHP_CH_Claim_Num
		,	DHP_CH_Claim_Line_Num			::	VARCHAR(  3 )		AS	DHP_CH_Claim_Line_Num
		,	DHP_Claim_Form_Type				::	INTEGER				AS	DHP_Claim_Form_Type
		,	DHP_Charge_Amt					::	NUMERIC( 11, 2 )	AS	DHP_Charge_Amt
		,	CH_Payment_Status_CD_SK			::	INTEGER				AS	CH_Payment_Status_CD_SK
		,	CH_Received_Date				::	DATE				AS	CH_Received_Date
		,	EIC_Extract_Date				::	DATE				AS	EIC_Extract_Date
		,	DHP_Client_Status_CD			::	VARCHAR(  1 )		AS	DHP_Client_Status_CD
		,	DHP_Claim_Status				::	VARCHAR(  1 )		AS	DHP_Claim_Status
		,	DHP_Proc_Code					::	VARCHAR(  6 )		AS	DHP_Proc_Code
	FROM
		whaight.HFNY_herc_claims_clean
--	WHERE
--		DATEDIFF( DAY, '2017-05-01', first_DOS )	>=	0
);
--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_clean_reduced;
ANALYZE					whaight.HFNY_herc_claims_clean_reduced;
VACUUM SORT ONLY		whaight.HFNY_herc_claims_clean_reduced;
ANALYZE					whaight.HFNY_herc_claims_clean_reduced;



DROP TABLE IF EXISTS	whaight.HFNY_herc_member_claims_time_window;
CREATE TABLE			whaight.HFNY_herc_member_claims_time_window
(		claim_ID	VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID	VARCHAR( 15 )	ENCODE	ZSTD
	,	first_DOS	DATE			ENCODE	ZSTD
)
DISTSTYLE	KEY
DISTKEY( member_ID )
INTERLEAVED SORTKEY(
		claim_ID
	,	member_ID
	,	first_DOS
);



INSERT INTO	whaight.HFNY_herc_member_claims_time_window
(	SELECT
			claim_ID	::	VARCHAR( 13 )	AS	claim_ID
		,	member_ID	::	VARCHAR( 15 )	AS	member_ID
		,	first_DOS	::	DATE			AS	first_DOS
	FROM
		whaight.HFNY_herc_claims_clean_reduced
	WHERE
		DATEDIFF( DAY, '2017-05-01', first_DOS )	>=	0
);
--ANALYZE COMPRESSION		whaight.HFNY_herc_member_claims_time_window;
ANALYZE					whaight.HFNY_herc_member_claims_time_window;
VACUUM SORT ONLY		whaight.HFNY_herc_member_claims_time_window;
ANALYZE					whaight.HFNY_herc_member_claims_time_window;



SELECT DISTINCT	COUNT( claim_ID )
FROM			whaight.HFNY_herc_claims_clean_reduced;



SELECT TOP	1	first_DOS
FROM			whaight.HFNY_herc_claims_clean_reduced
ORDER BY		first_DOS	DESC;




SELECT TOP	1	FirstDOS
FROM			ESRD_clean_raw.medical_claims
ORDER BY		FirstDOS	DESC;
