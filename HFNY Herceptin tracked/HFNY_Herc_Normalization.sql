


DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_clean;
CREATE TABLE				whaight.HFNY_herc_claims_clean
(		claim_ID							VARCHAR( 13 )		ENCODE	ZSTD
	,	adj_Claim						VARCHAR( 13 )		ENCODE	ZSTD
	,	claim_Status						VARCHAR(  1 )		ENCODE	ZSTD
	,	claim_Type						VARCHAR(  1 )		ENCODE	ZSTD
	,	check_Num						VARCHAR( 11 )		ENCODE	ZSTD
	,	check_Date						DATE					ENCODE	ZSTD
	,	processed_Date					DATE					ENCODE	ZSTD
	,	received_Date					DATE					ENCODE	ZSTD
	,	member_ID						VARCHAR( 15 )		ENCODE	ZSTD
	,	ci_ID							VARCHAR( 15 )		ENCODE	ZSTD
	,	admit_Date						DATE					ENCODE	ZSTD
	,	admit_Hour						VARCHAR(  1 )		ENCODE	LZO
	,	admit_Source						VARCHAR(  1 )		ENCODE	ZSTD
	,	admit_Type						VARCHAR(  2 )		ENCODE	ZSTD
	,	discharge_Date					DATE					ENCODE	ZSTD
	,	discharge_Hour 					VARCHAR(  1 )		ENCODE	LZO
	,	discharge_Status					VARCHAR(  2 )		ENCODE	ZSTD
	,	acct_Plan_Group_ID				VARCHAR( 12 )		ENCODE	ZSTD
	,	bill_Type						VARCHAR(  3 )		ENCODE	ZSTD
	,	invoice_Num						VARCHAR(  1 )		ENCODE	LZO
	,	claim_Submitted_charge_Amt		NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	claim_Disallowed_Amt				NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	disallowed_Reason_1				VARCHAR(  1 )		ENCODE	LZO
	,	disallowed_Reason_2				VARCHAR(  1 )		ENCODE	LZO
	,	disallowed_Reason_3				VARCHAR(  1 )		ENCODE	LZO
	,	claim_Allowed_Amt				NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	claim_Paid_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	ICD_Code_Type					VARCHAR(  1 )		ENCODE	ZSTD
	,	principal_Proc_Code				VARCHAR(  7 )		ENCODE	ZSTD
	,	principal_Proc_Date				DATE					ENCODE	ZSTD
	,	ICD_Proc_Code_2					VARCHAR(  7 )		ENCODE	ZSTD
	,	ICD_Proc_Date_2					DATE					ENCODE	ZSTD
	,	ICD_Proc_Code_3					VARCHAR(  7 )		ENCODE	ZSTD
	,	ICD_Proc_Date_3					DATE					ENCODE	ZSTD
	,	ICD_Proc_Code_4					VARCHAR(  7 )		ENCODE	ZSTD
	,	ICD_Proc_Date_4					DATE					ENCODE	ZSTD
	,	ICD_Proc_Code_5					VARCHAR(  7 )		ENCODE	ZSTD
	,	ICD_Proc_Date_5					DATE					ENCODE	ZSTD
	,	ICD_Proc_Code_6					VARCHAR(  7 )		ENCODE	ZSTD
	,	ICD_Proc_Date_6					DATE					ENCODE	ZSTD
	,	CPT_Code_1						VARCHAR(  6 )		ENCODE	ZSTD
	,	CPT_Date_1						DATE					ENCODE	ZSTD
	,	CPT_Code_2						VARCHAR(  6 )		ENCODE	LZO
	,	CPT_Date_2						DATE					ENCODE	ZSTD
	,	CPT_Code_3						VARCHAR(  6 )		ENCODE	LZO
	,	CPT_Date_3						DATE					ENCODE	ZSTD
	,	CPT_Code_4						VARCHAR(  6 )		ENCODE	LZO
	,	CPT_Date_4						DATE					ENCODE	ZSTD
	,	CPT_Code_5						VARCHAR(  6 )		ENCODE	LZO
	,	CPT_Date_5						DATE					ENCODE	ZSTD
	,	ICD_DX_Code_Admitting			VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_Primary				VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_2					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_3					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_4					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_5					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_6					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_7					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_8					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_9					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_10					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_11 					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_12					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_13					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_14					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_15					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_16					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_17					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_18					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_19					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_20					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_21					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_22					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_23					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_24					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_25					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_26					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_27					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_28					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_29					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_30					VARCHAR(  8 )		ENCODE	ZSTD
	,	ICD_DX_Code_31					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_32					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_33					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_34					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_35					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_36					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_37					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_38					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_39					VARCHAR(  8 )		ENCODE	LZO
	,	ICD_DX_Code_40					VARCHAR(  8 )		ENCODE	LZO
	,	DRG_Code							VARCHAR(  5 )		ENCODE	ZSTD
	,	DRG_Version						VARCHAR(  1 )		ENCODE	LZO
	,	accident_Date					DATE					ENCODE	ZSTD
	,	ER_Flag							VARCHAR(  1 )		ENCODE	ZSTD
	,	MVA_Flag							VARCHAR(  1 )		ENCODE	LZO
	,	work_Comp_Flag					VARCHAR(  1 )		ENCODE	LZO
	,	accident_Flag					VARCHAR(  1 )		ENCODE	LZO
	,	accident_State					VARCHAR(  2 )		ENCODE	LZO
	,	accident_Hour					VARCHAR(  2 )		ENCODE	LZO
	,	in_Network_Flag					VARCHAR(  1 )		ENCODE	ZSTD
	,	referring_Provider_ID			VARCHAR(  1 )		ENCODE	LZO
	,	billing_Provider_ID				VARCHAR( 15 )		ENCODE	ZSTD
	,	prov_Patient_Acct_Num			VARCHAR( 20 )		ENCODE	ZSTD
	,	med_Record_Num					VARCHAR( 30 )		ENCODE	ZSTD
	,	occ_Code_1						VARCHAR(  2 )		ENCODE	ZSTD
	,	occ_Code_1_Date					DATE					ENCODE	ZSTD
	,	occ_Code_2						VARCHAR(  2 )		ENCODE	ZSTD
	,	occ_Code_2_Date					DATE					ENCODE	ZSTD
	,	occ_Code_3						VARCHAR(  2 )		ENCODE	ZSTD
	,	occ_Code_3_Date					DATE					ENCODE	ZSTD
	,	occ_Code_4						VARCHAR(  2 )		ENCODE	ZSTD
	,	occ_Code_4_Date					DATE					ENCODE	ZSTD
	,	occ_Span_Code_1					VARCHAR(  2 )		ENCODE	ZSTD
	,	occ_Span_Code_1_From_Date		DATE					ENCODE	ZSTD
	,	occ_Span_Code_1_To_Date			DATE					ENCODE	ZSTD
	,	occ_Span_Code_2					VARCHAR(  2 )		ENCODE	ZSTD
	,	occ_Span_Code_2_From_Date		DATE					ENCODE	ZSTD
	,	occ_Span_Code_2_To_Date			DATE					ENCODE	ZSTD
	,	cond_Code_1						VARCHAR(  2 )		ENCODE	ZSTD
	,	cond_Code_2						VARCHAR(  2 )		ENCODE	ZSTD
	,	cond_Code_3						VARCHAR(  2 )		ENCODE	ZSTD
	,	cond_Code_4						VARCHAR(  2 )		ENCODE	ZSTD
	,	cond_Code_5						VARCHAR(  2 )		ENCODE	ZSTD
	,	cond_Code_6						VARCHAR(  2 )		ENCODE	LZO
	,	cond_Code_7						VARCHAR(  2 )		ENCODE	LZO
	,	cond_Code_8						VARCHAR(  2 )		ENCODE	LZO
	,	cond_Code_9						VARCHAR(  2 )		ENCODE	LZO
	,	cond_Code_10						VARCHAR(  2 )		ENCODE	LZO
	,	cond_Code_11						VARCHAR(  2 )		ENCODE	LZO
	,	cond_Code_12						VARCHAR(  2 )		ENCODE	LZO
	,	value_Code_1						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_1_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_2						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_2_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_3						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_3_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_4						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_4_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_5						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_5_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_6						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_6_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_7						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_7_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_8						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_8_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_9						VARCHAR(  2 )		ENCODE	ZSTD
	,	value_Code_9_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_10					VARCHAR(  2 )		ENCODE	LZO
	,	value_Code_10_Amt				NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_11					VARCHAR(  2 )		ENCODE	LZO
	,	value_Code_11_Amt				NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	value_Code_12					VARCHAR(  2 )		ENCODE	LZO
	,	value_Code_12_Amt				NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	payee_Code						VARCHAR(  1 )		ENCODE	ZSTD
	,	line_Num							VARCHAR(  3 )		ENCODE	ZSTD
	,	DX_Code_pointer_1				VARCHAR(  2 )		ENCODE	LZO
	,	DX_Code_pointer_2				VARCHAR(  2 )		ENCODE	LZO
	,	DX_Code_pointer_3				VARCHAR(  2 )		ENCODE	LZO
	,	DX_Code_pointer_4				VARCHAR(  2 )		ENCODE	LZO
	,	procedure_Code					VARCHAR(  6 )		ENCODE	ZSTD
	,	procedure_Code_modifier_1		VARCHAR(  2 )		ENCODE	ZSTD
	,	procedure_Code_modifier_2		VARCHAR(  2 )		ENCODE	ZSTD
	,	procedure_Code_modifier_3		VARCHAR(  2 )		ENCODE	ZSTD
	,	procedure_Code_modifier_4		VARCHAR(  2 )		ENCODE	LZO
	,	revenue_Code						VARCHAR(  1 )		ENCODE	LZO
	,	accommodation_Revenue_Code		VARCHAR(  1 )		ENCODE	LZO
	,	accommodation_Rate				VARCHAR(  1 )		ENCODE	LZO
	,	ancillary_Revenue_Code			VARCHAR(  1 )		ENCODE	LZO
	,	emergency_Indicator				VARCHAR(  1 )		ENCODE	ZSTD
	,	NDC_Code							VARCHAR(  1 )		ENCODE	LZO
	,	date_Written						DATE					ENCODE	ZSTD
	,	first_DOS						DATE					ENCODE	ZSTD
	,	last_DOS							DATE					ENCODE	ZSTD
	,	units							VARCHAR(  9 )		ENCODE	ZSTD
	,	anaesthesia						VARCHAR(  1 )		ENCODE	LZO
	,	charge_Amt						NUMERIC( 11, 2 )		ENCODE	ZSTD
	,	allowed_Amt						NUMERIC( 11, 2 )		ENCODE	ZSTD
	,	not_Allowed_Amt					NUMERIC( 11, 2 )		ENCODE	ZSTD
	,	deductible_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	copay_Amt						NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	coinsurance_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	would_Pay_Amt					NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	benefit_Amt						NUMERIC( 11, 2 )		ENCODE	ZSTD
	,	prov_Discount_Amt				NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	place_Of_Service					VARCHAR(  2 )		ENCODE	ZSTD
	,	type_Of_Service					VARCHAR(  2 )		ENCODE	ZSTD
	,	perf_Provider_ID					VARCHAR( 15 )		ENCODE	ZSTD
	,	COB_Indicator					VARCHAR(  1 )		ENCODE	LZO
	,	COB_Amt							NUMERIC( 10, 2 )		ENCODE	ZSTD
	,	COB_Payer						VARCHAR(  3 )		ENCODE	ZSTD
	,	COB_Date							DATE					ENCODE	ZSTD
	,	capitated_Indicator				VARCHAR(  1 )		ENCODE	ZSTD
	,	remarks							VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_1		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_2		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_3		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_4		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_5		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_6		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_7		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_8		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_9		VARCHAR(  1 )		ENCODE	LZO
	,	claim_Client_Spec_Field_10		VARCHAR(  1 )		ENCODE	LZO
	,	DHP_Ch_LDOS						DATE					ENCODE	ZSTD
	,	DHP_Med_Claim_Load_Month			INTEGER				ENCODE	RAW
	,	DHP_ci_ID						VARCHAR( 15 )		ENCODE	ZSTD
	,	DHP_s_ID							VARCHAR( 15 )		ENCODE	ZSTD
	,	DHP_a_ID							VARCHAR( 12 )		ENCODE	ZSTD
	,	DHP_Paid_Amt						NUMERIC( 11, 2 )		ENCODE	ZSTD
	,	DHP_Performing_Provider_ID		VARCHAR( 17 )		ENCODE	ZSTD
	,	DHP_Billing_Provider_ID			VARCHAR( 17 )		ENCODE	ZSTD
	,	DHP_CH_Claim_Status_CD			VARCHAR(  1 )		ENCODE	ZSTD
	,	DHP_Client_Capitated_Indicator	INTEGER				ENCODE	ZSTD
	,	DHP_CH_ER_Indicator				INTEGER				ENCODE	ZSTD
	,	DHP_CH_MVA_Indicator				INTEGER				ENCODE	ZSTD
	,	DHP_CH_Acc_Indicator				INTEGER				ENCODE	ZSTD
	,	DHP_CH_Amb_Indicator				INTEGER				ENCODE	ZSTD
	,	DHP_CH_WC_Indicator				INTEGER				ENCODE	ZSTD
	,	DHP_CH_COB_Indicator				INTEGER				ENCODE	ZSTD
	,	DHP_Check_Num					INTEGER				ENCODE	ZSTD
	,	CH_Acct_1_Segment				VARCHAR(  7 )		ENCODE	ZSTD
	,	CH_Acct_2_Segment				VARCHAR( 30 )		ENCODE	ZSTD
	,	CH_Acct_3_Segment				VARCHAR(  7 )		ENCODE	ZSTD
	,	CH_Acct_4_Segment				VARCHAR(  7 )		ENCODE	ZSTD
	,	CH_Acct_5_Segment				VARCHAR(  7 )		ENCODE	LZO
	,	CH_Acct_Name						VARCHAR( 29 )		ENCODE	ZSTD
	,	A_Funding_CD						VARCHAR( 13 )		ENCODE	ZSTD
	,	cycle_SK							INTEGER				ENCODE	ZSTD
	,	EIC_SK							INTEGER				ENCODE	ZSTD
	,	CL_SK							INTEGER				ENCODE	ZSTD
	,	cycle_Created_Date				DATE					ENCODE	ZSTD
	,	filename							VARCHAR( 39 )		ENCODE	ZSTD
	,	DHP_CH_Claim_Num					VARCHAR( 27 )		ENCODE	ZSTD
	,	DHP_CH_Claim_Line_Num			VARCHAR(  3 )		ENCODE	ZSTD
	,	DHP_Claim_Form_Type				INTEGER				ENCODE	ZSTD
	,	DHP_Charge_Amt					NUMERIC( 11, 2 )		ENCODE	ZSTD
	,	CH_Payment_Status_CD_SK			INTEGER				ENCODE	ZSTD
	,	CH_Received_Date					DATE					ENCODE	ZSTD
	,	EIC_Extract_Date					DATE					ENCODE	ZSTD
	,	DHP_Client_Status_CD				VARCHAR(  1 )		ENCODE	LZO
	,	DHP_Claim_Status					VARCHAR(  1 )		ENCODE	ZSTD
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



INSERT INTO	whaight.HFNY_herc_claims_clean
(	SELECT
			crmc.claimNumber						::	VARCHAR( 13 )		AS	claim_ID
		,	crmc.AdjustedClaim					::	VARCHAR( 13 )		AS	adj_Claim
		,	crmc.ClaimStatus						::	VARCHAR(  1 )		AS	claim_Status		-- Values are 'D' and 'F'
		,	crmc.ClaimType						::	VARCHAR(  1 )		AS	claim_Type		-- Values are 'I' and 'P'
		,	crmc.CheckNumber						::	VARCHAR( 11 )		AS	check_Num
		,	crmc.CheckDate						::	DATE					AS	check_Date	
		,	crmc.ProcessedDate					::	DATE					AS	processed_Date
		,	crmc.ReceivedDate					::	DATE					AS	received_Date
		,	crmc.MemberID						::	VARCHAR( 15 )		AS	member_ID
		,	crmc.CoveredIndividualID				::	VARCHAR( 15 )		AS	ci_ID
		,	crmc.AdmitDate						::	DATE					AS	admit_Date
		,	crmc.AdmissionHour					::	VARCHAR(  2 )		AS	admit_Hour
		,	crmc.AdmissionSource					::	VARCHAR(  1 )		AS	admit_Source
		,	crmc.AdmitType						::	VARCHAR(  2 )		AS	admit_Type
		,	crmc.DischargeDate					::	DATE					AS	discharge_Date
		,	crmc.DischargeHour 					::	VARCHAR(  2 )		AS	discharge_Hour
		,	crmc.DischargeStatus					::	VARCHAR(  2 )		AS	discharge_Status
		,	crmc.Account_Plan_GroupID			::	VARCHAR( 12 )		AS	acct_Plan_Group_ID
		,	crmc.TypeOfBill						::	VARCHAR(  3 )		AS	bill_Type
		,	crmc.InvoiceNumber					::	VARCHAR(  1 )		AS	invoice_Num
		,	crmc.ClaimSubmittedChargeAmount		::	NUMERIC( 10, 2 )		AS	claim_Submitted_charge_Amt
		,	crmc.ClaimDisallowedAmount			::	NUMERIC( 10, 2 )		AS	claim_Disallowed_Amt
		,	crmc.DisallowedReason1				::	VARCHAR(  1 )		AS	disallowed_Reason_1
		,	crmc.DisallowedReason2				::	VARCHAR(  1 )		AS	disallowed_Reason_2
		,	crmc.DisallowedReason3				::	VARCHAR(  1 )		AS	disallowed_Reason_3
		,	crmc.ClaimAllowedAmount				::	NUMERIC( 10, 2 )		AS	claim_Allowed_Amt
		,	crmc.ClaimPaidAmount					::	NUMERIC( 10, 2 )		AS	claim_Paid_Amt
		,	CASE	crmc.ICD_10Indicator
				WHEN	'N'	THEN	'1'
				WHEN	'Y'	THEN	'2'
			END									::	VARCHAR(  1 )		AS	ICD_Code_Type
		,	REGEXP_REPLACE( crmc.PrincipalProcedureCode, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )		AS	principal_Proc_Code
		,	PrincipalProcedureDate				::	DATE					AS	principal_Proc_Date
		,	REGEXP_REPLACE( crmc.ICDProcedureCode2, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )		AS	ICD_Proc_Code_2
		,	ICDProcedureDate2					::	DATE					AS	ICD_Proc_Date_2
		,	REGEXP_REPLACE( crmc.ICDProcedureCode3, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )		AS	ICD_Proc_Code_3
		,	ICDProcedureDate3					::	DATE					AS	ICD_Proc_Date_3
		,	REGEXP_REPLACE( crmc.ICDProcedureCode4, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )		AS	ICD_Proc_Code_4
		,	ICDProcedureDate4					::	DATE					AS	ICD_Proc_Date_4
		,	REGEXP_REPLACE( crmc.ICDProcedureCode5, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )		AS	ICD_Proc_Code_5
		,	ICDProcedureDate5					::	DATE					AS	ICD_Proc_Date_5
		,	REGEXP_REPLACE( crmc.ICDProcedureCode6, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  7 )		AS	ICD_Proc_Code_6
		,	ICDProcedureDate6					::	DATE					AS	ICD_Proc_Date_6
		,	REGEXP_REPLACE( crmc.CPTCode1, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )		AS	CPT_Code_1
		,	CPT1Date								::	DATE					AS	CPT_Date_1
		,	REGEXP_REPLACE( crmc.CPTCode2, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )		AS	CPT_Code_2
		,	CPT2Date								::	DATE					AS	CPT_Date_2
		,	REGEXP_REPLACE( crmc.CPTCode3, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )		AS	CPT_Code_3
		,	CPT3Date								::	DATE					AS	CPT_Date_3
		,	REGEXP_REPLACE( crmc.CPTCode4, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )		AS	CPT_Code_4
		,	CPT4Date								::	DATE					AS	CPT_Date_4
		,	REGEXP_REPLACE( crmc.CPTCode5, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  6 )		AS	CPT_Code_5
		,	CPT5Date								::	DATE					AS	CPT_Date_5
		,	REGEXP_REPLACE( crmc.AdmittingDXCode, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_Admitting
		,	REGEXP_REPLACE( crmc.PrimaryDXCode, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_Primary
		,	REGEXP_REPLACE( crmc.DXCode2, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_2
		,	REGEXP_REPLACE( crmc.DXCode3, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_3
		,	REGEXP_REPLACE( crmc.DXCode4, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_4
		,	REGEXP_REPLACE( crmc.DXCode5, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_5
		,	REGEXP_REPLACE( crmc.DXCode6, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_6
		,	REGEXP_REPLACE( crmc.DXCode7, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_7
		,	REGEXP_REPLACE( crmc.DXCode8, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_8
		,	REGEXP_REPLACE( crmc.DXCode9, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_9
		,	REGEXP_REPLACE( crmc.DXCode10, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_10
		,	REGEXP_REPLACE( crmc.DXCode11, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_11
		,	REGEXP_REPLACE( crmc.DXCode12, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_12
		,	REGEXP_REPLACE( crmc.DXCode13, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_13
		,	REGEXP_REPLACE( crmc.DXCode14, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_14
		,	REGEXP_REPLACE( crmc.DXCode15, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_15
		,	REGEXP_REPLACE( crmc.DXCode16, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_16
		,	REGEXP_REPLACE( crmc.DXCode17, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_17
		,	REGEXP_REPLACE( crmc.DXCode18, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_18
		,	REGEXP_REPLACE( crmc.DXCode19, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_19
		,	REGEXP_REPLACE( crmc.DXCode20, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_20
		,	REGEXP_REPLACE( crmc.DXCode21, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_21
		,	REGEXP_REPLACE( crmc.DXCode22, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_22
		,	REGEXP_REPLACE( crmc.DXCode23, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_23
		,	REGEXP_REPLACE( crmc.DXCode24, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_24
		,	REGEXP_REPLACE( crmc.DXCode25, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_25
		,	REGEXP_REPLACE( crmc.DXCode26, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_26
		,	REGEXP_REPLACE( crmc.DXCode27, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_27
		,	REGEXP_REPLACE( crmc.DXCode28, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_28
		,	REGEXP_REPLACE( crmc.DXCode29, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_29
		,	REGEXP_REPLACE( crmc.DXCode30, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_30
		,	REGEXP_REPLACE( crmc.DXCode31, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_31
		,	REGEXP_REPLACE( crmc.DXCode32, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_32
		,	REGEXP_REPLACE( crmc.DXCode33, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_33
		,	REGEXP_REPLACE( crmc.DXCode34, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_34
		,	REGEXP_REPLACE( crmc.DXCode35, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_35
		,	REGEXP_REPLACE( crmc.DXCode36, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_36
		,	REGEXP_REPLACE( crmc.DXCode37, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_37
		,	REGEXP_REPLACE( crmc.DXCode38, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_38
		,	REGEXP_REPLACE( crmc.DXCode39, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_39
		,	REGEXP_REPLACE( crmc.DXCode40, '[^a-zA-Z0-9]+', '' )
												::	VARCHAR(  8 )		AS	ICD_DX_Code_40
		,	crmc.DRGCode							::	VARCHAR(  5 )		AS	DRG_Code
		,	crmc.DRGVersion						::	VARCHAR(  1 )		AS	DRG_Version
		,	crmc.DateOfAccident					::	DATE					AS	accident_Date
		,	crmc.EmergencyRoomFlag				::	VARCHAR(  1 )		AS	ER_Flag
		,	crmc.MVAFlag							::	VARCHAR(  1 )		AS	MVA_Flag
		,	crmc.WorkCompFlag					::	VARCHAR(  1 )		AS	work_Comp_Flag
		,	crmc.AccidentFlag					::	VARCHAR(  1 )		AS	accident_Flag
		,	crmc.AccidentState					::	VARCHAR(  2 )		AS	accident_State
		,	crmc.AccidentHour					::	VARCHAR(  2 )		AS	accident_Hour
		,	crmc.InNetwork_OutofNetworkIndicator::	VARCHAR(  1 )		AS	in_Network_Flag
		,	crmc.ReferringProviderIdentifier		::	VARCHAR(  1 )		AS	referring_Provider_ID
		,	crmc.BillingProviderIdentifier		::	VARCHAR( 15 )		AS	billing_Provider_ID
		,	crmc.ProviderPatientAccountNumber	::	VARCHAR( 20 )		AS	prov_Patient_Acct_Num
		,	crmc.MedicalRecordNumber				::	VARCHAR( 30 )		AS	med_Record_Num
		,	crmc.OccurrenceCode1					::	VARCHAR(  2 )		AS	occ_Code_1
		,	crmc.OccurrenceCode1Date				::	DATE					AS	occ_Code_1_Date
		,	crmc.OccurrenceCode2					::	VARCHAR(  2 )		AS	occ_Code_2
		,	crmc.OccurrenceCode2Date				::	DATE					AS	occ_Code_2_Date
		,	crmc.OccurrenceCode3					::	VARCHAR(  2 )		AS	occ_Code_3
		,	crmc.OccurrenceCode3Date				::	DATE					AS	occ_Code_3_Date
		,	crmc.OccurrenceCode4					::	VARCHAR(  2 )		AS	occ_Code_4
		,	crmc.OccurrenceCode4Date				::	DATE					AS	occ_Code_4_Date
		,	crmc.OccurrenceSpanCode1				::	VARCHAR(  2 )		AS	occ_Span_Code_1
		,	crmc.OccurrenceSpanFromDate1			::	DATE					AS	occ_Span_Code_1_From_Date
		,	crmc.OccurrenceSpanToDate1			::	DATE					AS	occ_Span_Code_1_To_Date
		,	crmc.OccurrenceSpanCode2				::	VARCHAR(  2 )		AS	occ_Span_Code_2
		,	crmc.OccurrenceSpanFromDate2			::	DATE					AS	occ_Span_Code_2_From_Date
		,	crmc.OccurrenceSpanToDate2			::	DATE					AS	occ_Span_Code_2_To_Date
		,	crmc.ConditionCode1					::	VARCHAR(  2 )		AS	cond_Code_1
		,	crmc.ConditionCode2					::	VARCHAR(  2 )		AS	cond_Code_2
		,	crmc.ConditionCode3					::	VARCHAR(  2 )		AS	cond_Code_3
		,	crmc.ConditionCode4					::	VARCHAR(  2 )		AS	cond_Code_4
		,	crmc.ConditionCode5					::	VARCHAR(  2 )		AS	cond_Code_5
		,	crmc.ConditionCode6					::	VARCHAR(  2 )		AS	cond_Code_6
		,	crmc.ConditionCode7					::	VARCHAR(  2 )		AS	cond_Code_7
		,	crmc.ConditionCode8					::	VARCHAR(  2 )		AS	cond_Code_8
		,	crmc.ConditionCode9					::	VARCHAR(  2 )		AS	cond_Code_9
		,	crmc.ConditionCode10					::	VARCHAR(  2 )		AS	cond_Code_10
		,	crmc.ConditionCode11					::	VARCHAR(  2 )		AS	cond_Code_11
		,	crmc.ConditionCode12					::	VARCHAR(  2 )		AS	cond_Code_12
		,	crmc.ValueCode1						::	VARCHAR(  2 )		AS	value_Code_1
		,	crmc.ValueCode1Amount				::	NUMERIC( 10, 2 )		AS	value_Code_1_Amt
		,	crmc.ValueCode2						::	VARCHAR(  2 )		AS	value_Code_2
		,	crmc.ValueCode2Amount				::	NUMERIC( 10, 2 )		AS	value_Code_2_Amt
		,	crmc.ValueCode3						::	VARCHAR(  2 )		AS	value_Code_3
		,	crmc.ValueCode3Amount				::	NUMERIC( 11, 2 )		AS	value_Code_3_Amt
		,	crmc.ValueCode4						::	VARCHAR(  2 )		AS	value_Code_4
		,	crmc.ValueCode4Amount				::	NUMERIC( 10, 2 )		AS	value_Code_4_Amt
		,	crmc.ValueCode5						::	VARCHAR(  2 )		AS	value_Code_5
		,	crmc.ValueCode5Amount				::	NUMERIC( 10, 2 )		AS	value_Code_5_Amt
		,	crmc.ValueCode6						::	VARCHAR(  2 )		AS	value_Code_6
		,	crmc.ValueCode6Amount				::	NUMERIC( 10, 2 )		AS	value_Code_6_Amt
		,	crmc.ValueCode7						::	VARCHAR(  2 )		AS	value_Code_7
		,	crmc.ValueCode7Amount				::	NUMERIC( 10, 2 )		AS	value_Code_7_Amt
		,	crmc.ValueCode8						::	VARCHAR(  2 )		AS	value_Code_8
		,	crmc.ValueCode8Amount				::	NUMERIC( 10, 2 )		AS	value_Code_8_Amt
		,	crmc.ValueCode9						::	VARCHAR(  2 )		AS	value_Code_9
		,	crmc.ValueCode9Amount				::	NUMERIC( 10, 2 )		AS	value_Code_9_Amt
		,	crmc.ValueCode10						::	VARCHAR(  2 )		AS	value_Code_10
		,	crmc.ValueCode10Amount				::	NUMERIC( 10, 2 )		AS	value_Code_10_Amt
		,	crmc.ValueCode11						::	VARCHAR(  2 )		AS	value_Code_11
		,	crmc.ValueCode11Amount				::	NUMERIC( 10, 2 )		AS	value_Code_11_Amt
		,	crmc.ValueCode12						::	VARCHAR(  2 )		AS	value_Code_12
		,	crmc.ValueCode12Amount				::	NUMERIC( 10, 2 )		AS	value_Code_12_Amt
		,	crmc.PayeeCode						::	VARCHAR(  1 )		AS	payee_Code
		,	crmc.LineNumber						::	VARCHAR(  3 )		AS	line_Num
		,	crmc.DiagnosisCodePointer1			::	VARCHAR(  1 )		AS	DX_Code_pointer_1
		,	crmc.DiagnosisCodePointer2			::	VARCHAR(  1 )		AS	DX_Code_pointer_2
		,	crmc.DiagnosisCodePointer3			::	VARCHAR(  1 )		AS	DX_Code_pointer_3
		,	crmc.DiagnosisCodePointer4			::	VARCHAR(  1 )		AS	DX_Code_pointer_4
		,	crmc.ProcedureCode					::	VARCHAR(  6 )		AS	procedure_Code
		,	crmc.ProcedureCodeModifier1			::	VARCHAR(  2 )		AS	procedure_Code_modifier_1
		,	crmc.ProcedureCodeModifier2			::	VARCHAR(  2 )		AS	procedure_Code_modifier_2
		,	crmc.ProcedureCodeModifier3			::	VARCHAR(  2 )		AS	procedure_Code_modifier_3
		,	crmc.ProcedureCodeModifier4			::	VARCHAR(  2 )		AS	procedure_Code_modifier_4
		,	crmc.RevenueCode						::	VARCHAR(  1 )		AS	revenue_Code
		,	crmc.AccommodationRevenueCode		::	VARCHAR(  1 )		AS	accommodation_Revenue_Code
		,	crmc.AccommodationRate				::	VARCHAR(  1 )		AS	accommodation_Rate
		,	crmc.AncillaryRevenueCode			::	VARCHAR(  1 )		AS	ancillary_Revenue_Code
		,	crmc.EmergencyIndicator				::	VARCHAR(  1 )		AS	emergency_Indicator
		,	crmc.NDCCode							::	VARCHAR(  1 )		AS	NDC_Code
		,	crmc.DateWritten						::	DATE					AS	date_Written
		,	crmc.FirstDOS						::	DATE					AS	first_DOS
		,	crmc.LastDOS							::	DATE					AS	last_DOS
		,	crmc.Units							::	VARCHAR(  9 )		AS	units
		,	crmc.Anesthesia						::	VARCHAR(  1 )		AS	anaesthesia
		,	crmc.ChargeAmount					::	NUMERIC( 11, 2 )		AS	charge_Amt
		,	crmc.AllowedAmount					::	NUMERIC( 11, 2 )		AS	allowed_Amt
		,	crmc.NotAllowedAmount				::	NUMERIC( 11, 2 )		AS	not_Allowed_Amt
		,	crmc.DeductibleAmount				::	NUMERIC( 10, 2 )		AS	deductible_Amt
		,	crmc.CopayAmount						::	NUMERIC( 10, 2 )		AS	copay_Amt
		,	crmc.CoinsuranceAmount				::	NUMERIC( 10, 2 )		AS	coinsurance_Amt
		,	crmc.WouldPayAmount					::	NUMERIC( 10, 2 )		AS	would_Pay_Amt
		,	crmc.BenefitAmount					::	NUMERIC( 11, 2 )		AS	benefit_Amt
		,	crmc.ProviderDiscountAmount			::	NUMERIC( 10, 2 )		AS	prov_Discount_Amt
		,	crmc.PlaceofService					::	VARCHAR(  2 )		AS	place_Of_Service
		,	crmc.TypeofService					::	VARCHAR(  2 )		AS	type_Of_Service
		,	crmc.PerformingProviderIdentifier	::	VARCHAR( 15 )		AS	perf_Provider_ID
		,	crmc.COBIndicator					::	VARCHAR(  1 )		AS	COB_Indicator
		,	crmc.COBAmount						::	NUMERIC( 10, 2 )		AS	COB_Amt
		,	crmc.COBPayer						::	VARCHAR(  3 )		AS	COB_Payer
		,	crmc.COBDate							::	DATE					AS	COB_Date
		,	crmc.CapitatedIndicator				::	VARCHAR(  1 )		AS	capitated_Indicator
		,	crmc.Remarks							::	VARCHAR(  1 )		AS	remarks
		,	crmc.ClaimClientSpecificField1		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_1
		,	crmc.ClaimClientSpecificField2		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_2
		,	crmc.ClaimClientSpecificField3		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_3
		,	crmc.ClaimClientSpecificField4		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_4
		,	crmc.ClaimClientSpecificField5		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_5
		,	crmc.ClaimClientSpecificField6		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_6
		,	crmc.ClaimClientSpecificField7		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_7
		,	crmc.ClaimClientSpecificField8		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_8
		,	crmc.ClaimClientSpecificField9		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_9
		,	crmc.ClaimClientSpecificField10		::	VARCHAR(  1 )		AS	claim_Client_Spec_Field_10
		,	crmc.dhp_ch_ldos						::	DATE					AS	DHP_Ch_LDOS
		,	crmc.dhp_medclm_load_mo				::	INTEGER				AS	DHP_Med_Claim_Load_Month
		,	crmc.dhp_ci_id						::	VARCHAR( 15 )		AS	DHP_ci_ID
		,	crmc.dhp_s_id						::	VARCHAR( 15 )		AS	DHP_s_ID
		,	crmc.dhp_a_id						::	VARCHAR( 12 )		AS	DHP_a_ID
		,	crmc.dhp_paid_amt					::	NUMERIC( 11, 2 )		AS	DHP_Paid_Amt
		,	crmc.dhp_perf_prv_id					::	VARCHAR( 17 )		AS	DHP_Perf_Provider_ID
		,	crmc.dhp_bill_prv_id					::	VARCHAR( 17 )		AS	DHP_Billing_Provider_ID
		,	crmc.dhp_ch_claim_status_cd			::	VARCHAR(  1 )		AS	DHP_CH_Claim_Status_CD
		,	crmc.dhp_cli_capitated_ind			::	INTEGER				AS	DHP_Client_Capitated_Indicator
		,	crmc.dhp_ch_emrg_room_ind			::	INTEGER				AS	DHP_CH_ER_Indicator
		,	crmc.dhp_ch_mva_ind					::	INTEGER				AS	DHP_CH_MVA_Indicator
		,	crmc.dhp_ch_acc_ind					::	INTEGER				AS	DHP_CH_Acc_Indicator
		,	crmc.dhp_ch_amb_ind					::	INTEGER				AS	DHP_CH_Amb_Indicator
		,	crmc.dhp_ch_wc_ind					::	INTEGER				AS	DHP_CH_WC_Indicator
		,	crmc.dhp_ch_cob_ind					::	INTEGER				AS	DHP_CH_COB_Indicator
		,	crmc.dhp_check_nbr					::	INTEGER				AS	DHP_Check_Num
		,	crmc.ch_acct1_segment				::	VARCHAR(  7 )		AS	CH_Acct_1_Segment
		,	crmc.ch_acct2_segment				::	VARCHAR( 30 )		AS	CH_Acct_2_Segment
		,	crmc.ch_acct3_segment				::	VARCHAR(  7 )		AS	CH_Acct_3_Segment
		,	crmc.ch_acct4_segment				::	VARCHAR(  7 )		AS	CH_Acct_4_Segment
		,	crmc.ch_acct5_segment				::	VARCHAR(  7 )		AS	CH_Acct_5_Segment
		,	crmc.ch_acct_name					::	VARCHAR( 29 )		AS	CH_Acct_Name
		,	crmc.a_funding_cd					::	VARCHAR( 13 )		AS	A_Funding_CD
		,	crmc.cycle_sk						::	INTEGER				AS	cycle_SK
		,	crmc.eic_sk							::	INTEGER				AS	EIC_SK
		,	crmc.cl_sk							::	INTEGER				AS	CL_SK
		,	crmc.cycle_created_date				::	DATE					AS	cycle_Created_Date
		,	crmc.filename						::	VARCHAR( 39 )		AS	filename
		,	crmc.dhp_ch_claim_nbr				::	VARCHAR( 27 )		AS	DHP_CH_Claim_Num
		,	crmc.dhp_ch_clm_line_nbr				::	VARCHAR(  3 )		AS	DHP_CH_Claim_Line_Num
		,	crmc.dhp_claim_form_type				::	INTEGER				AS	DHP_Claim_Form_Type
		,	crmc.dhp_charge_amt					::	NUMERIC( 11, 2 )		AS	DHP_Charge_Amt
		,	crmc.ch_payment_status_cd_sk			::	INTEGER				AS	CH_Payment_Status_CD_SK
		,	crmc.ch_received_date				::	DATE					AS	CH_Received_Date
		,	crmc.eic_extract_dt					::	DATE					AS	EIC_Extract_Date
		,	crmc.dhp_cli_status_cd				::	VARCHAR(  1 )		AS	DHP_Client_Status_CD
		,	crmc.dhp_claim_status				::	VARCHAR(  1 )		AS	DHP_Claim_Status
		,	crmc.dhp_proc_code					::	VARCHAR(  6 )		AS	DHP_Proc_Code
	FROM
			ESRD_clean_raw.medical_claims		crmc
	WHERE
			CPT_Code_1			IN ( 'J9355' )
		OR	CPT_Code_2			IN ( 'J9355' )
		OR	CPT_Code_3			IN ( 'J9355' )
		OR	CPT_Code_4			IN ( 'J9355' )
		OR	CPT_Code_5			IN ( 'J9355' )
		OR	procedure_Code		IN ( 'J9355' )
		OR	NDC_Code				IN ( '50242013201', '50242013401', '50242033301' )
		OR	(		ICD_Code_Type			=	'1'
				AND	(		ICD_DX_Code_Admitting
								=	ANY(		SELECT DISTINCT	icd9cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_Primary
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_2
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_3
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_4
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_5
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_6
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_7
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_8
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_9
								=	ANY(	SELECT DISTINCT	icd10cm
											FROM			whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_10
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_11
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_12
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_13
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_14
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_15
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_16
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_17
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_18
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_19
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_20
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_21
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_22
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_23
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_24
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_25
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_26
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_27
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_28
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_29
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_30
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_31
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_32
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_33
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_34
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_35
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_36
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_37
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_38
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_39
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_40
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
					)
			)
		OR	(		ICD_Code_Type					=	'2'
				AND	(		ICD_DX_Code_Admitting
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_Primary
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_2
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_3
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_4
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_5
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_6
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_7
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_8
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_9
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_10
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_11
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_12
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_13
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_14
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_15
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_16
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_17
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_18
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_19
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_20
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_21
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_22
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_23
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_24
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_25
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_26
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_27
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_28
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_29
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_30
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_31
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_32
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_33
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_34
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_35
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_36
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_37
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_38
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_39
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
						OR	ICD_DX_Code_40
								=	ANY(		SELECT DISTINCT	icd10cm
											FROM				whaight.HFNY_ICD10_to_ICD9_xwalk
											WHERE			icd10cm IN	(	'C155',		'C160',		'C161',		'C162',		'C163',
																			'C164',		'C165',		'C166',		'C168',		'C50011',
																			'C50012',	'C50021',	'C50022',	'C50111',	'C50112',
																			'C50121',	'C50122',	'C50211',	'C50212',	'C50221',
																			'C50222',	'C50311',	'C50312',	'C50321',	'C50322',
																			'C50411',	'C50412',	'C50421',	'C50422',	'C50511',
																			'C50512',	'C50521',	'C50522',	'C50611',	'C50612',
																			'C50621',	'C50622',	'C50811',	'C50812',	'C50821',
																			'C50822',	'C50911',	'C50912',	'C50921',	'C50922'		)	)
					)
			)
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_clean;
ANALYZE					whaight.HFNY_herc_claims_clean;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_clean;
ANALYZE					whaight.HFNY_herc_claims_clean;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_ICD_Proc_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_ICD_Proc_Codes
(		claim_ID				VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID			VARCHAR( 15 )	ENCODE	ZSTD
	,	ICD_Code_Type		VARCHAR(  1 )	ENCODE	ZSTD		/*	'Y' means ICD_10;  'N' means ICD_9	*/
	,	ICD_Proc_Code		VARCHAR(  7 )	ENCODE	ZSTD
	,	ICD_Proc_Date		DATE				ENCODE	ZSTD
	,	ICD_Proc_Status		VARCHAR(  1 )	ENCODE	ZSTD		/*	'P': Principal;  'S': Secondary	*/
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_ICD_Proc_Codes
(			SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	principal_Proc_Code		::	VARCHAR(  7 )	AS	ICD_Proc_Code
					,	principal_Proc_Date		::	DATE				AS	ICD_Proc_Date
					,	'P'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_2			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_2			::	DATE				AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_3			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_3			::	DATE				AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_4			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_4			::	DATE				AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_5			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_5			::	DATE				AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_Proc_Code_6			::	VARCHAR(  8 )	AS	ICD_Proc_Code
					,	ICD_Proc_Date_6			::	DATE				AS	ICD_Proc_Date
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Proc_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_Proc_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_Proc_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_ICD_Proc_Codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_Proc_Codes;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_ICD_Proc_Codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_Proc_Codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_CPT_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_CPT_Codes
(		claim_ID		VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID	VARCHAR( 15 )	ENCODE	ZSTD
	,	CPT_Code		VARCHAR(  5 )	ENCODE	ZSTD
	,	CPT_Date		DATE				ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_CPT_Codes
(			SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_1	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_1	::	DATE				AS	CPT_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_2	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_2	::	DATE				AS	CPT_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_3	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_3	::	DATE				AS	CPT_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_4	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_4	::	DATE				AS	CPT_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
	UNION	SELECT		claim_ID		::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID	::	VARCHAR( 15 )	AS	member_ID
					,	CPT_Code_5	::	VARCHAR(  5 )	AS	CPT_Code
					,	CPT_Date_5	::	DATE				AS	CPT_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		CPT_Code						IS	NOT NULL
					AND LEN( BTRIM( CPT_Code ) )		>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_CPT_Codes;
ANALYZE					whaight.HFNY_herc_claims_CPT_Codes;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_CPT_Codes;
ANALYZE					whaight.HFNY_herc_claims_CPT_Codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_ICD_DX_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_ICD_DX_Codes
(		claim_ID			VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID		VARCHAR( 15 )	ENCODE	ZSTD
	,	ICD_Code_Type	VARCHAR(  1 )	ENCODE	ZSTD		/*	'Y' means ICD_10;  'N' means ICD_9	*/
	,	ICD_DX_Code		VARCHAR(  8 )	ENCODE	ZSTD
	,	ICD_Status		VARCHAR(  1 )	ENCODE	ZSTD		/*	'A": Admitting;  'P': Primary;  'S': Secondary	*/
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_ICD_DX_Codes
(			SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_Admitting	::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'A'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_Primary		::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'P'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_2			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_3			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_4			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_5			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_6			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_7			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_8			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_9			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_10			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_11			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_12			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_13			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_14			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_15			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_16			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_17			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_18			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_19			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_20			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_21			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_22			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_23			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_24			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_25			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_26			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_27			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_28			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_29			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_30			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_31			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_32			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_33			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_34			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_35			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_36			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_37			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_38			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_39			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
	UNION	SELECT		claim_ID					::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID				::	VARCHAR( 15 )	AS	member_ID
					,	ICD_Code_Type			::	VARCHAR(  1 )	AS	ICD_Code_Type
					,	ICD_DX_Code_40			::	VARCHAR(  8 )	AS	ICD_DX_Code
					,	'S'						::	VARCHAR(  1 )	AS	ICD_Status
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		ICD_DX_Code					IS	NOT NULL
					AND LEN( BTRIM( ICD_DX_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_ICD_DX_Codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_DX_Codes;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_ICD_DX_Codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_DX_Codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_ICD_10_DX_codes;
CREATE TABLE				whaight.HFNY_herc_claims_ICD_10_DX_codes
(		claim_ID				VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID			VARCHAR( 15 )	ENCODE	ZSTD
	,	ICD_Code_Type		VARCHAR(  1 )	ENCODE	ZSTD
	,	ICD_10_DX_Code		VARCHAR(  8 )	ENCODE	ZSTD
	,	ICD_Status			VARCHAR(  1 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO whaight.HFNY_herc_claims_ICD_10_DX_codes
(	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
			,	member_ID		::	VARCHAR( 15 )	AS	member_ID
			,	ICD_Code_Type	::	VARCHAR(  1 )	AS	ICD_Code_Type
			,	CASE		ICD_Code_Type
					WHEN		'2'	THEN		ICD_DX_Code
					WHEN		'1'	THEN		(	SELECT	SUBSTRING( LISTAGG( DISTINCT icd10cm, '***' ) WITHIN GROUP ( ORDER BY icd10cm ),
																	0, CHARINDEX( '***', LISTAGG( DISTINCT icd10cm, '***' ) ) )
											FROM		whaight.HFNY_ICD9_to_ICD10_xwalk
											WHERE	icd9cm	=	ICD_DX_Code			)
					END			::	VARCHAR(  8 )	AS	ICD_10_DX_Code
			,	ICD_Status		::	VARCHAR(  1 )	AS	ICD_Status
	FROM		whaight.HFNY_herc_claims_ICD_DX_Codes
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_ICD_10_DX_codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_10_DX_codes;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_ICD_10_DX_codes;
ANALYZE					whaight.HFNY_herc_claims_ICD_10_DX_codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_Occurrence_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_Occurrence_Codes
(		claim_ID		VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID	VARCHAR( 15 )	ENCODE	ZSTD
	,	OCC_Code		VARCHAR(  2 )	ENCODE	ZSTD
	,	OCC_Date		DATE				ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_Occurrence_Codes
(			SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	occ_Code_1		::	VARCHAR(  2 )	AS	OCC_Code
					,	occ_Code_1_Date	::	DATE				AS	OCC_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		OCC_Code						IS	NOT NULL
					AND LEN( BTRIM( OCC_Code ) )		>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	occ_Code_2		::	VARCHAR(  2 )	AS	OCC_Code
					,	occ_Code_2_Date	::	DATE				AS	OCC_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		OCC_Code						IS	NOT NULL
					AND LEN( BTRIM( OCC_Code ) )		>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	occ_Code_3		::	VARCHAR(  2 )	AS	OCC_Code
					,	occ_Code_3_Date	::	DATE				AS	OCC_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		OCC_Code						IS	NOT NULL
					AND LEN( BTRIM( OCC_Code ) )		>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	occ_Code_4		::	VARCHAR(  2 )	AS	OCC_Code
					,	occ_Code_4_Date	::	DATE				AS	OCC_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		OCC_Code						IS	NOT NULL
					AND LEN( BTRIM( OCC_Code ) )		>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_Occurrence_Codes;
ANALYZE					whaight.HFNY_herc_claims_Occurrence_Codes;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_Occurrence_Codes;
ANALYZE					whaight.HFNY_herc_claims_Occurrence_Codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_Occ_Span_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_Occ_Span_Codes
(		claim_ID					VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID				VARCHAR( 15 )	ENCODE	ZSTD
	,	OCC_Span_Code			VARCHAR(  2 )	ENCODE	ZSTD
	,	OCC_Span_From_Date		DATE				ENCODE	ZSTD
	,	OCC_Span_To_Date			DATE				ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_Occ_Span_Codes
(			SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	occ_Span_Code_1				::	VARCHAR(  2 )	AS	OCC_Span_Code
					,	occ_Span_Code_1_From_Date	::	DATE				AS	OCC_Span_From_Date
					,	occ_Span_Code_1_To_Date		::	DATE				AS	OCC_Span_To_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		OCC_Span_Code					IS	NOT NULL
					AND LEN( BTRIM( OCC_Span_Code ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	occ_Span_Code_2				::	VARCHAR(  2 )	AS	OCC_Span_Code
					,	occ_Span_Code_2_From_Date	::	DATE				AS	OCC_Span_From_Date
					,	occ_Span_Code_2_To_Date		::	DATE				AS	OCC_Span_To_Date
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		OCC_Span_Code					IS	NOT NULL
					AND LEN( BTRIM( OCC_Span_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_Occ_Span_Codes;
ANALYZE					whaight.HFNY_herc_claims_Occ_Span_Codes;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_Occ_Span_Codes;
ANALYZE					whaight.HFNY_herc_claims_Occ_Span_Codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_Condition_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_Condition_Codes
(		claim_ID		VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID	VARCHAR( 15 )	ENCODE	ZSTD
	,	Cond_Code	VARCHAR(  2 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_Condition_Codes
(			SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_1		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_2		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_3		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_4		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_5		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_6		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_7		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_8		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_9		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_10		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_11		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
	UNION	SELECT		claim_ID			::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID		::	VARCHAR( 15 )	AS	member_ID
					,	cond_Code_12		::	VARCHAR(  2 )	AS	Cond_Code
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Cond_Code					IS	NOT NULL
					AND LEN( BTRIM( Cond_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_Condition_Codes;
ANALYZE					whaight.HFNY_herc_claims_Condition_Codes;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_Condition_Codes;
ANALYZE					whaight.HFNY_herc_claims_Condition_Codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_Value_Codes;
CREATE TABLE				whaight.HFNY_herc_claims_Value_Codes
(		claim_ID			VARCHAR( 13 )		ENCODE	ZSTD
	,	member_ID		VARCHAR( 15 )		ENCODE	ZSTD
	,	Value_Code		VARCHAR(  2 )		ENCODE	ZSTD
	,	Value_Code_Amt	NUMERIC( 10, 2 )		ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_Value_Codes
(			SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_1			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_1_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_2			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_2_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_3			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_3_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_4			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_4_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_5			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_5_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_6			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_6_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_7			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_7_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_8			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_8_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_9			::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_9_Amt		::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_10		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_10_Amt	::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_11		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_11_Amt	::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )		AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )		AS	member_ID
					,	value_Code_12		::	VARCHAR(  2 )		AS	Value_Code
					,	value_Code_12_Amt	::	NUMERIC( 10, 2 )		AS	Value_Code_Amt
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Value_Code					IS	NOT NULL
					AND LEN( BTRIM( Value_Code ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_Value_Codes;
ANALYZE					whaight.HFNY_herc_claims_Value_Codes;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_Value_Codes;
ANALYZE					whaight.HFNY_herc_claims_Value_Codes;



DROP TABLE IF EXISTS		whaight.HFNY_herc_claims_DX_Code_Ptrs;
CREATE TABLE				whaight.HFNY_herc_claims_DX_Code_Ptrs
(		claim_ID			VARCHAR( 13 )	ENCODE	RAW
	,	member_ID		VARCHAR( 15 )	ENCODE	RAW
	,	DX_Code_Ptr		VARCHAR(  2 )	ENCODE	RAW
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_claims_DX_Code_Ptrs
(			SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )	AS	member_ID
					,	DX_Code_pointer_1	::	VARCHAR(  2 )	AS	DX_Code_Ptr
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		DX_Code_Ptr					IS	NOT NULL
					AND LEN( BTRIM( DX_Code_Ptr ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )	AS	member_ID
					,	DX_Code_pointer_2	::	VARCHAR(  2 )	AS	DX_Code_Ptr
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		DX_Code_Ptr					IS	NOT NULL
					AND LEN( BTRIM( DX_Code_Ptr ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )	AS	member_ID
					,	DX_Code_pointer_3	::	VARCHAR(  2 )	AS	DX_Code_Ptr
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		DX_Code_Ptr					IS	NOT NULL
					AND LEN( BTRIM( DX_Code_Ptr ) )	>	0
	UNION	SELECT		claim_ID				::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID			::	VARCHAR( 15 )	AS	member_ID
					,	DX_Code_pointer_4	::	VARCHAR(  2 )	AS	DX_Code_Ptr
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		DX_Code_Ptr					IS	NOT NULL
					AND LEN( BTRIM( DX_Code_Ptr ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_claims_DX_Code_Ptrs;
ANALYZE					whaight.HFNY_herc_claims_DX_Code_Ptrs;
VACUUM SORT ONLY			whaight.HFNY_herc_claims_DX_Code_Ptrs;
ANALYZE					whaight.HFNY_herc_claims_DX_Code_Ptrs;



DROP TABLE IF EXISTS		whaight.HFNY_herc_Proc_Code_Modifiers;
CREATE TABLE				whaight.HFNY_herc_Proc_Code_Modifiers
(		claim_ID			VARCHAR( 13 )	ENCODE	ZSTD
	,	member_ID		VARCHAR( 15 )	ENCODE	ZSTD
	,	Proc_Code_Mod	VARCHAR(  2 )	ENCODE	ZSTD
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_Proc_Code_Modifiers
(			SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	procedure_Code_modifier_1	::	VARCHAR(  2 )	AS	Proc_Code_Mod
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Proc_Code_Mod					IS	NOT NULL
					AND LEN( BTRIM( Proc_Code_Mod ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	procedure_Code_modifier_2	::	VARCHAR(  2 )	AS	Proc_Code_Mod
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Proc_Code_Mod					IS	NOT NULL
					AND LEN( BTRIM( Proc_Code_Mod ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	procedure_Code_modifier_3	::	VARCHAR(  2 )	AS	Proc_Code_Mod
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Proc_Code_Mod					IS	NOT NULL
					AND LEN( BTRIM( Proc_Code_Mod ) )	>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	procedure_Code_modifier_4	::	VARCHAR(  2 )	AS	Proc_Code_Mod
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Proc_Code_Mod					IS	NOT NULL
					AND LEN( BTRIM( Proc_Code_Mod ) )	>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_Proc_Code_Modifiers;
ANALYZE					whaight.HFNY_herc_Proc_Code_Modifiers;
VACUUM SORT ONLY			whaight.HFNY_herc_Proc_Code_Modifiers;
ANALYZE					whaight.HFNY_herc_Proc_Code_Modifiers;



DROP TABLE IF EXISTS		whaight.HFNY_herc_Claim_Cli_Spec_Fields;
CREATE TABLE				whaight.HFNY_herc_Claim_Cli_Spec_Fields
(		claim_ID					VARCHAR( 13 )	ENCODE	RAW
	,	member_ID				VARCHAR( 15 )	ENCODE	RAW
	,	Claim_Cli_Spec_Field		VARCHAR(  1 )	ENCODE	RAW
)
DISTSTYLE KEY
DISTKEY( claim_ID )
SORTKEY( claim_ID, member_ID );



INSERT INTO	whaight.HFNY_herc_Claim_Cli_Spec_Fields
(			SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_1	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_2	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_3	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_4	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_5	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_6	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_7	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_8	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_9	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
	UNION	SELECT		claim_ID						::	VARCHAR( 13 )	AS	claim_ID
					,	member_ID					::	VARCHAR( 15 )	AS	member_ID
					,	claim_Client_Spec_Field_10	::	VARCHAR(  1 )	AS	Claim_Cli_Spec_Field
			FROM		whaight.HFNY_herc_claims_clean
			WHERE		Claim_Cli_Spec_Field						IS	NOT NULL
					AND LEN( BTRIM( Claim_Cli_Spec_Field ) )		>	0
);

--ANALYZE COMPRESSION		whaight.HFNY_herc_Claim_Cli_Spec_Fields;
ANALYZE					whaight.HFNY_herc_Claim_Cli_Spec_Fields;
VACUUM SORT ONLY			whaight.HFNY_herc_Claim_Cli_Spec_Fields;
ANALYZE					whaight.HFNY_herc_Claim_Cli_Spec_Fields;


