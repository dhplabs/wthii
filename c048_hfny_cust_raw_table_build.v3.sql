
--select top 10000
--	claimnumber,CoveredIndividualID,
--	CheckDate,ProcessedDate,ReceivedDate,AdmitDate,DischargeDate,
--	FirstDOS,LastDOS
--from ESRD_clean_raw.medical_claims
--where firstdos != lastdos and claimtype = 'P'
--order by CoveredIndividualID,claimnumber;
--
--select distinct min(admitdate), min(dischargedate), min(firstdos), min(lastdos), min(cpt2date) from ESRD_clean_raw.medical_claims;

-- drop table if exists ESRD_clean_raw.medical_claims;
create table ESRD_clean_raw.medical_claims
(
	ClaimNumber	varchar(50),
	AdjustedClaim	varchar(50),
	ClaimStatus	varchar(15),
	ClaimType	varchar(1),
	CheckNumber	varchar(20),
	CheckDate	date,
	ProcessedDate	date,
	ReceivedDate	date,
	MemberID	varchar(20),
	CoveredIndividualID	varchar(20),
	AdmitDate	date,
	AdmissionHour	varchar(2),
	AdmissionSource	varchar(2),
	AdmitType	varchar(2),
	DischargeDate	date,
	DischargeHour 	varchar(2),
	DischargeStatus	varchar(10),
	Account_Plan_GroupID	varchar(30),
	TypeOfBill	varchar(4),
	InvoiceNumber	varchar(100),
	ClaimSubmittedChargeAmount	numeric(10,2),
	ClaimDisallowedAmount	numeric(10,2),
	DisallowedReason1	varchar(100),
	DisallowedReason2	varchar(100),
	DisallowedReason3	varchar(100),
	ClaimAllowedAmount	numeric(10,2),
	ClaimPaidAmount	numeric(10,2),
	ICD_10Indicator	varchar(1),
	PrincipalProcedureCode	varchar(10),
	PrincipalProcedureDate	date,
	ICDProcedureCode2	varchar(10),
	ICDProcedureDate2	date,
	ICDProcedureCode3	varchar(10),
	ICDProcedureDate3	date,
	ICDProcedureCode4	varchar(10),
	ICDProcedureDate4	date,
	ICDProcedureCode5	varchar(10),
	ICDProcedureDate5	date,
	ICDProcedureCode6	varchar(10),
	ICDProcedureDate6	date,
	CPTCode1	varchar(10),
	CPT1Date	date,
	CPTCode2	varchar(10),
	CPT2Date	date,
	CPTCode3	varchar(10),
	CPT3Date	date,
	CPTCode4	varchar(10),
	CPT4Date	date,
	CPTCode5	varchar(10),
	CPT5Date	date,
	AdmittingDXCode	varchar(10),
	PrimaryDXCode	varchar(10),
	DXCode2	varchar(10),
	DXCode3	varchar(10),
	DXCode4	varchar(10),
	DXCode5	varchar(10),
	DXCode6	varchar(10),
	DXCode7	varchar(10),
	DXCode8	varchar(10),
	DXCode9	varchar(10),
	DXCode10	varchar(10),
	DXCode11 	varchar(10),
	DXCode12	varchar(10),
	DXCode13	varchar(10),
	DXCode14	varchar(10),
	DXCode15	varchar(10),
	DXCode16	varchar(10),
	DXCode17	varchar(10),
	DXCode18	varchar(10),
	DXCode19	varchar(10),
	DXCode20	varchar(10),
	DXCode21	varchar(10),
	DXCode22	varchar(10),
	DXCode23	varchar(10),
	DXCode24	varchar(10),
	DXCode25	varchar(10),
	DXCode26	varchar(10),
	DXCode27	varchar(10),
	DXCode28	varchar(10),
	DXCode29	varchar(10),
	DXCode30	varchar(10),
	DXCode31	varchar(10),
	DXCode32	varchar(10),
	DXCode33	varchar(10),
	DXCode34	varchar(10),
	DXCode35	varchar(10),
	DXCode36	varchar(10),
	DXCode37	varchar(10),
	DXCode38	varchar(10),
	DXCode39	varchar(10),
	DXCode40	varchar(10),
	DRGCode	varchar(10),
	DRGVersion	varchar(20),
	DateOfAccident	date,
	EmergencyRoomFlag	varchar(1),
	MVAFlag	varchar(1),
	WorkCompFlag	varchar(1),
	AccidentFlag	varchar(1),
	AccidentState	varchar(2),
	AccidentHour	varchar(2),
	InNetwork_OutofNetworkIndicator	varchar(1),
	ReferringProviderIdentifier	varchar(15),
	BillingProviderIdentifier	varchar(15),
	ProviderPatientAccountNumber	varchar(30),
	MedicalRecordNumber	varchar(30),
	OccurrenceCode1	varchar(2),
	OccurrenceCode1Date	date,
	OccurrenceCode2	varchar(2),
	OccurrenceCode2Date	date,
	OccurrenceCode3	varchar(2),
	OccurrenceCode3Date	date,
	OccurrenceCode4	varchar(2),
	OccurrenceCode4Date	date,
	OccurrenceSpanCode1 varchar(2),
	OccurrenceSpanFromDate1	date,
	OccurrenceSpanToDate1	date,
	OccurrenceSpanCode2	varchar(2),
	OccurrenceSpanFromDate2	date,
	OccurrenceSpanToDate2	date,
	ConditionCode1	varchar(2),
	ConditionCode2	varchar(2),
	ConditionCode3	varchar(2),
	ConditionCode4	varchar(2),
	ConditionCode5	varchar(2),
	ConditionCode6	varchar(2),
	ConditionCode7	varchar(2),
	ConditionCode8	varchar(2),
	ConditionCode9	varchar(2),
	ConditionCode10	varchar(2),
	ConditionCode11	varchar(2),
	ConditionCode12	varchar(2),
	ValueCode1	varchar(2),
	ValueCode1Amount	numeric(10,2),
	ValueCode2	varchar(2),
	ValueCode2Amount	numeric(10,2),
	ValueCode3	varchar(2),
	ValueCode3Amount	numeric(10,2),
	ValueCode4	varchar(2),
	ValueCode4Amount	numeric(10,2),
	ValueCode5	varchar(2),
	ValueCode5Amount	numeric(10,2),
	ValueCode6	varchar(2),
	ValueCode6Amount	numeric(10,2),
	ValueCode7	varchar(2),
	ValueCode7Amount	numeric(10,2),
	ValueCode8	varchar(2),
	ValueCode8Amount	numeric(10,2),
	ValueCode9	varchar(2),
	ValueCode9Amount	numeric(10,2),
	ValueCode10	varchar(2),
	ValueCode10Amount	numeric(10,2),
	ValueCode11	varchar(2),
	ValueCode11Amount	numeric(10,2),
	ValueCode12	varchar(2),
	ValueCode12Amount	numeric(10,2),
	PayeeCode	varchar(10),
	LineNumber	varchar(15),
	DiagnosisCodePointer1	varchar(2),
	DiagnosisCodePointer2	varchar(2),
	DiagnosisCodePointer3	varchar(2),
	DiagnosisCodePointer4	varchar(2),
	ProcedureCode	varchar(10),
	ProcedureCodeModifier1	varchar(2),
	ProcedureCodeModifier2	varchar(2),
	ProcedureCodeModifier3	varchar(2),
	ProcedureCodeModifier4	varchar(2),
	RevenueCode	varchar(10),
	AccommodationRevenueCode	varchar(10),
	AccommodationRate	varchar(10),
	AncillaryRevenueCode	varchar(10),
	EmergencyIndicator	varchar(1),
	NDCCode	varchar(15),
	DateWritten	date,
	FirstDOS	date,
	LastDOS	date,
	Units	varchar(100),
	Anesthesia	varchar(100),
	ChargeAmount	numeric(10,2),
	AllowedAmount	numeric(10,2),
	NotAllowedAmount	numeric(10,2),
	DeductibleAmount	numeric(10,2),
	CopayAmount	numeric(10,2),
	CoinsuranceAmount	numeric(10,2),
	WouldPayAmount	numeric(10,2),
	BenefitAmount	numeric(10,2),
	ProviderDiscountAmount	numeric(10,2),
	PlaceofService	varchar(2),
	TypeofService	varchar(3),
	PerformingProviderIdentifier	varchar(15),
	COBIndicator	varchar(1),
	COBAmount	numeric(10,2),
	COBPayer	varchar(100),
	COBDate	date,
	CapitatedIndicator	varchar(1),
	Remarks	varchar(100),
	ClaimClientSpecificField1	varchar(50),
	ClaimClientSpecificField2	varchar(50),
	ClaimClientSpecificField3	varchar(50),
	ClaimClientSpecificField4	varchar(50),
	ClaimClientSpecificField5	varchar(50),
	ClaimClientSpecificField6	varchar(50),
	ClaimClientSpecificField7	varchar(50),
	ClaimClientSpecificField8	varchar(50),
	ClaimClientSpecificField9	varchar(50),
	ClaimClientSpecificField10	varchar(50),
	dhp_ch_ldos	date,
	dhp_medclm_load_mo	int,
	dhp_ci_id	varchar(50),
	dhp_s_id	varchar(50),
	dhp_a_id	varchar(100),
	dhp_paid_amt	numeric(10,2),
	dhp_perf_prv_id	varchar(50),
	dhp_bill_prv_id	varchar(50),
	dhp_ch_claim_status_cd	varchar(30),
	dhp_cli_capitated_ind	smallint,
	dhp_ch_emrg_room_ind	smallint,
	dhp_ch_mva_ind	smallint,
	dhp_ch_acc_ind	smallint,
	dhp_ch_amb_ind	smallint,
	dhp_ch_wc_ind	smallint,
	dhp_ch_cob_ind	smallint,
	dhp_check_nbr	int,
	ch_acct1_segment	varchar(50),
	ch_acct2_segment	varchar(50),
	ch_acct3_segment	varchar(50),
	ch_acct4_segment	varchar(50),
	ch_acct5_segment	varchar(50),
	ch_acct_name	varchar(100),
	a_funding_cd	varchar(50),
	cycle_sk	int,
	eic_sk	int,
	cl_sk	int,
	cycle_created_date	timestamp,
	filename	varchar(1000),
	dhp_ch_claim_nbr	varchar(100),
	dhp_ch_clm_line_nbr	varchar(50),
	dhp_claim_form_type	int,
	dhp_charge_amt	numeric(10,2),
	ch_payment_status_cd_sk	int,
	ch_received_date	timestamp,
	eic_extract_dt	timestamp,
	dhp_cli_status_cd	varchar(50),
	dhp_claim_status	varchar(15),
	dhp_proc_code	varchar(10)
)
diststyle	key
distkey(CoveredIndividualID)
interleaved sortkey(ClaimNumber, ICD_10Indicator,FirstDOS,PerformingProviderIdentifier,BillingProviderIdentifier)
;

copy ESRD_clean_raw.medical_claims from 's3://dhp-randlab-s3/multi_tenant_clients/c048_hfny/esrd/clean_raw/medclm_history.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/administrator_role'
ACCEPTINVCHARS BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 250;

set statement_timeout to 0;

copy ESRD_clean_raw.medical_claims from 's3://dhp-randlab-s3/multi_tenant_clients/c048_hfny/esrd/clean_raw/medclm_history_p'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/administrator_role'
ACCEPTINVCHARS BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 2000;

vacuum reindex ESRD_clean_raw.medical_claims;

-- drop table if exists ESRD_clean_raw.provider_info;
create table ESRD_clean_raw.provider_info
(
	ProviderID varchar(20),
	ProviderNPI varchar(30),
	ReplacementNPI varchar(100),
	NPIDeactivationDate date,
	NPIDeactivationReason varchar(100),
	NPIReactivationDate date,
	ProviderLicenseNumber varchar(100),
	ProviderLicenseStateCode varchar(100),
	EntityTypeCode varchar(100),
	ProviderName varchar(100),
	ProviderOtherName varchar(100),
	ProviderOrgName varchar(100),
	ProviderTaxID varchar(30),
	ProviderNumber varchar(30),
	MedicareNumber varchar(30),
	ProviderStreet1 varchar(100),
	ProviderStreet2 varchar(100),
	ProviderCity varchar(50),
	ProviderState varchar(2),
	ProviderZipCode varchar(10),
	ProviderPhone1 varchar(20),
	ProviderPhone1extension varchar(10),
	ProviderGenderCode varchar(100),
	AuthorizedOfficialContactName varchar(100),
	Street1 varchar(100),
	Street2 varchar(100),
	AuthorizedOfficialContactProviderCity varchar(50),
	AuthorizedOfficialContactProviderState varchar(2),
	AuthorizedOfficialContactProviderZipCode varchar(10),
	Phone1 varchar(100),
	Phone1Extension varchar(100),
	BillingProviderID varchar(30),
	ProviderFAX varchar(20),
	NetworkAffiliation varchar(100),
	Network varchar(1),
	PCP varchar(1),
	ParNonPar varchar(1),
	HealthcareProviderTaxonomyCode varchar(100),
	OtherProviderIdentifier varchar(100),
	OtherProviderIdentifierTypeCode varchar(100),
	ProviderEnumerationDate date,
	ProviderEmailAddress varchar(50),
	PrimarySpecialty varchar(10),
	SecondarySpecialty varchar(10),
	LastUpdateDate date,
	ProviderClientSpecificField1 varchar(50),
	ProviderClientSpecificField2 varchar(50),
	ProviderClientSpecificField3 varchar(50),
	ProviderClientSpecificField4 varchar(50),
	ProviderClientSpecificField5 varchar(50),
	ProviderClientSpecificField6 varchar(50),
	ProviderClientSpecificField7 varchar(50),
	ProviderClientSpecificField8 varchar(50),
	ProviderClientSpecificField9 varchar(50),
	ProviderClientSpecificField10 varchar(50),
	dhp_prv_nbr varchar(50),
	dhp_prv_name varchar(100),
	dhp_state_cd varchar(50),
	dhp_state_cd_sk int,
	cycle_sk int,
	eic_sk int,
	cl_sk int,
	cycle_created_date timestamp,
	filename varchar(1000),
	dhp_tax_id varchar(50)
)
diststyle even
interleaved sortkey(ProviderID,ProviderNPI)
;

copy ESRD_clean_raw.provider_info from 's3://dhp-randlab-s3/multi_tenant_clients/c048_hfny/esrd/clean_raw/tmp/prv_history.psv'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/administrator_role'
ACCEPTINVCHARS BLANKSASNULL EMPTYASNULL IGNOREBLANKLINES IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 25;

copy ESRD_clean_raw.provider_info from 's3://dhp-randlab-s3/multi_tenant_clients/c048_hfny/esrd/clean_raw/prv_history.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/administrator_role'
ACCEPTINVCHARS BLANKSASNULL EMPTYASNULL IGNOREBLANKLINES IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 25;

-- drop table if exists ESRD_clean_raw.member_info;
create table ESRD_clean_raw.member_info
(
	MemberID varchar(20),
	FamilyID varchar(10),
	CoveredIndividualsFamilyIDSuffix varchar(10),
	CoveredIndividualID varchar(20),
	CoveredIndividualSSN varchar(15),
	CoveredIndividualHICN varchar(15),
	CoveredIndividualAlternateID varchar(20),
	COBFlag varchar(1),
	COBCompany varchar(100),
	COBPolicyNumber varchar(50),
	COBLetterDate date,
	COBEligibilityStartDate date,
	COBEligibilityEndDate date,
	CoveredIndividualRelationToMember varchar(6),
	CoveredIndividualFirstName varchar(25),
	CoveredIndividualMiddleName varchar(25),
	CoveredIndividualLastName varchar(50),
	CoveredIndividualStreet1 varchar(100),
	CoveredIndividualStreet2 varchar(100),
	CoveredIndividualCity varchar(50),
	CoveredIndividualState varchar(2),
	CoveredIndividualZipCode varchar(15),
	CoveredIndividualPhone1 varchar(20),
	CoveredIndividualPhone1Extension varchar(10),
	CoveredIndividualPhone2 varchar(20),
	CoveredIndividualPhone2Extension varchar(10),
	CoveredIndividualEmail varchar(100),
	CoveredIndividualGender varchar(1),
	CoveredIndividualDateOfBirth date,
	CoveredIndividualDateOfDeath date,
	CoveredIndividualHIPAAIndicator varchar(1),
	CoveredIndividualSpecialHandling varchar(1),
	AccountPlanGroupID varchar(30),
	CoveredIndividualEffectiveDate date,
	CoveredIndividualTerminationDate date,
	TypeofCoverage varchar(1),
	CoverageElection varchar(1),
	EmployeeStatus varchar(1),
	PCP varchar(15),
	AlternateAddressName varchar(75),
	AlternateAddress1 varchar(100),
	AlternateAddress2 varchar(100),
	AlternateCity varchar(50),
	AlternateState varchar(2),
	AlternateZipCode varchar(10),
	AlternatePhone1 varchar(20),
	AlternatePhone1Ext varchar(10),
	AlternatePhone2 varchar(20),
	AlternatePhone2Ext varchar(10),
	AlternateBeginDate date,
	AlternateEndDate date,
	PrivateAddressName varchar(75),
	PrivateAddress1 varchar(100),
	PrivateAddress2 varchar(100),
	PrivateCity varchar(50),
	PrivateState varchar(2),
	PrivateZipCode varchar(10),
	PrivatePhone1 varchar(20),
	PrivatePhone1Ext varchar(10),
	PrivatePhone2 varchar(20),
	PrivatePhone2Ext varchar(10),
	PrivateBeginDate date,
	PrivateEndDate date,
	MembershipClientSpecificField1 varchar(50),
	MembershipClientSpecificField2 varchar(50),
	MembershipClientSpecificField3 varchar(50),
	MembershipClientSpecificField4 varchar(50),
	MembershipClientSpecificField5 varchar(50),
	MembershipClientSpecificField6 varchar(50),
	MembershipClientSpecificField7 varchar(50),
	MembershipClientSpecificField8 varchar(50),
	MembershipClientSpecificField9 varchar(50),
	MembershipClientSpecificField10 varchar(50),
	MBR_PERS_PART_KEY smallint,
	xfrm_subs_fk_err_ind smallint,
	xfrm_err_dup_err_ind smallint,
	xfrm_rel_cd_err_ind smallint,
	xfrm_sex_cd_err_ind smallint,
	xfrm_state_cd_err_ind smallint,
	dhp_eff_dt date,
	dhp_term_dt date,
	dhp_rel_cd varchar(50),
	dhp_sex_cd varchar(50),
	dhp_state_cd varchar(50),
	dhp_rel_cd_sk int,
	dhp_sex_cd_sk int,
	dhp_state_cd_sk int,
	dhp_dob date,
	cycle_sk int,
	eic_sk int,
	cl_sk int,
	cycle_created_date timestamp,
	filename varchar(1000),
	dhp_dod date,
	dhp_hipaa_ind int,
	dhp_CoveredIndividualSSN varchar(9),
	dhp_CoveredIndividualZipCode varchar(5)
)
diststyle key
distkey(CoveredIndividualID)
interleaved sortkey(CoveredIndividualHICN,CoveredIndividualEffectiveDate,CoveredIndividualTerminationDate)
;

copy ESRD_clean_raw.member_info from 's3://dhp-randlab-s3/multi_tenant_clients/c048_hfny/esrd/clean_raw/tmp/mbr_history.psv'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/administrator_role'
ACCEPTINVCHARS BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 25 NOLOAD;

copy ESRD_clean_raw.member_info from 's3://dhp-randlab-s3/multi_tenant_clients/c048_hfny/esrd/clean_raw/mbr_history.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/administrator_role'
ACCEPTINVCHARS BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 25 NOLOAD;


-- drop table if exists ESRD_clean_raw.mmr;
create table ESRD_clean_raw.mmr
(
	mmro_sk	int,
	created_by	int,
	created_date	datetime,
	modified_by	int,
	modified_date	datetime,
	mspc_sk	int,
	mco_contract_number	varchar(5),
	run_file_date	datetime,
 	payment_date	datetime,					/**/
	hicn	varchar(12),						/**/
	surname	varchar(7),							/**/
	first_initial	varchar(1),
	sex	varchar(1),								/**/
	birth_date	datetime,						/**/
	age_group	varchar(4),
	county_code	varchar(5),
	out_area_indicator	varchar(1),
	parta_entitlement	varchar(1),
	partb_entitlement	varchar(1),
	hospice	varchar(1),							/**/
	esrd	varchar(1),							/**/
	msp_aged_disabled	varchar(1),
	institutional	varchar(1),
	nhc	varchar(1),
	new_medicaid_status	varchar(1),
	lti_flag	varchar(1),
	medicaid_indicator	varchar(1),
	pip_dcg	varchar(2),
	risk_factor_code	varchar(1),
	risk_adjuster_factora	varchar(7),
	risk_adjuster_factorb	varchar(7),
	paymt_adjustmt_month_total_parta	varchar(2),
	paymt_adjustmt_month_total_partb	varchar(2),
	adjustmt_reason_code	varchar(2),			/**/
	msapaymt_adjustmt_start_date	datetime,
	msapaymt_adjustmt_end_date	datetime,
	demogrpaymt_adjustmt_amounta	varchar(9),
	demogrpaymt_adjustmt_amountb	varchar(9),
	monthlypaymt_adjustmt_amounta	varchar(9),
	monthlypaymt_adjustmt_amountb	varchar(9),
	lis_premium_subsidy	varchar(8),
	esrd_msp_flag	varchar(1),
	msadeposit_recovery_parta	varchar(8),
	msadeposit_recovery_partb	varchar(8),
	msadeposit_recovery_months	varchar(2),
	current_medicaid_status	varchar(1),
	risk_adjuster_agegroup_raag	varchar(4),
	previous_disable_ratio_prdib	varchar(7),
	de_minimis	varchar(1),
	beneficiary_dualand_partd_enrollment_status	varchar(1),
	plan_benefit_packageid	varchar(3),
	race_code	varchar(1),
	rafactor_type_code	varchar(2),
	frailty_indicator	varchar(1),
	original_reason_entitlement_code_orec	varchar(1),
	lag_indicator	varchar(1),
	segment_id	varchar(3),
	enrollment_source	varchar(1),
	eghp_flag	varchar(1),
	partc_basic_premium_parta_amount	varchar(8),
	partc_basic_premium_partb_amount	varchar(8),
	rebate_parta_costsharing_reduction	varchar(8),
	rebate_partb_costsharing_reduction	varchar(8),
	rebate_otherparta_mandatory_supplemental_benefits	varchar(8),
	rebate_otherpartb_mandatory_supplemental_benefits	varchar(8),
	rebate_partb_premium_reduction_parta_amount	varchar(8),
	rebate_partb_premium_reduction_partb_amount	varchar(8),
	rebate_partd_supplemental_benefits_parta_amount	varchar(8),
	rebate_partd_supplemental_benefits_partb_amount	varchar(8),
	parta_ma_paymt_total	varchar(10),
	partb_ma_paymt_total	varchar(10),
	ma_paymt_total	varchar(11),
	partd_ra_factor	varchar(7),
	partd_lowincome_indicator	varchar(1),
	partd_lowincome_multiplier	varchar(7),
	partd_longterm_institutional_indicator	varchar(1),
	partd_longterm_institutional_multiplier	varchar(7),
	rebate_partd_basicpremium_reduction	varchar(8),
	partd_basicpremium_amount	varchar(8),
	partd_direct_subsidy_monthly_amount	varchar(10),
	reinsurance_subsidy_amount	varchar(10),
	lowincome_subsidy_costsharing_amount	varchar(10),
	partd_payment_total	varchar(11),
	paymt_adjustmt_months_partd	varchar(2),
	pace_premium_addon	varchar(10),
	pace_cost_sharing_addon	varchar(10),
	partc_frailty_score_factor	varchar(7),
	msp_factor	varchar(7),
	msp_reduction_adjustment_amount_parta	varchar(10),
	msp_reduction_adjustment_amount_partb	varchar(10),
	medicaid_dual_status_code	varchar(2),
	partd_coveragegap_discount_amount	varchar(8),
	partd_ra_factor_type	varchar(2),
	partd_risk_factor_code	varchar(1),
	parta_risk_adjusted_monthly_rate_pymt_adj	varchar(9),
	partb_risk_adjusted_monthly_rate_pymt_adj	varchar(9),
	partd_risk_adjusted_monthly_rate_pymt_adj	varchar(9),
	mmro_isAnticipatedAdj	boolean,
	hm_sk	int
)
diststyle	even
interleaved	sortkey(hicn,payment_date,esrd,adjustmt_reason_code)
;
copy ESRD_clean_raw.mmr from 's3://dhp-randlab-s3/multi_tenant_clients/c048_hfny/esrd/clean_raw/mmr_original.txt'
credentials 'aws_iam_role=arn:aws:iam::722648170004:role/administrator_role'
ACCEPTINVCHARS BLANKSASNULL EMPTYASNULL NULL AS 'NULL' IGNOREBLANKLINES IGNOREHEADER 1 TRIMBLANKS DELIMITER '|' STATUPDATE ON MAXERROR 250 NOLOAD;




drop table if exists ESRD_canonical.covered_individual_info;
CREATE TABLE ESRD_canonical.covered_individual_info
(  
	
    Subscriber_ID	varchar(20)
	,Family_ID	varchar(10)
	,Cov_Indl_Family_ID_Suffix	varchar(10)
	,Cov_Indl_ID	varchar(20)
	,Cov_Indl_SSN	varchar(9)
	,Cov_Indl_HICN	varchar(15)
	,Cov_Indl_MBI	varchar(15)
	,Covg_Eff_Dt	date
	,Covg_Term_Dt	date
	,Covg_Most_Recent_Eff_Dt	date
	,Cov_Indl_Reln_To_Subscr	varchar(6)
	,Cov_Indl_FName	varchar(25)
	,Cov_Indl_L_Name	varchar(25)
	,Cov_Indl_Street1	varchar(100)
	,Cov_Indl_Street2	varchar(100)
	,Cov_Indl_City	varchar(50)
 	,Cov_Indl_State	varchar(2)
	,Cov_Indl_Zip	varchar(10)
 	,Cov_Indl_Phone1	varchar(20)
	,Cov_Indl_Phone1_Ext	int
	,Cov_Indl_Phone2	varchar(20)
	,Cov_Indl_Phone2_Ext	int
	,Cov_Indl_Email	varchar(100)
	,Cov_Indl_Gender	varchar (1)
	,Cov_Indl_DOB	date
	,Cov_Indl_DOD	date
	,Cov_Indl_HIPAA_Indicator	boolean
	,Cov_Indl_Special_Handling 	boolean
	,Covg_Type	varchar(1)
	,Covg_Election	varchar(1)
	,Empl_Status	varchar(1)
	,PCP	varchar(15)
)
diststyle key
distkey(Cov_Indl_ID)
interleaved sortkey(Cov_Indl_HICN,Covg_Eff_Dt,Covg_Term_Dt)
; 

select top 1000 * from ESRD_canonical.covered_individual_info where Covg_Most_Recent_Eff_Dt != Covg_Eff_Dt;
insert into ESRD_canonical.covered_individual_info
	(
	select distinct
		  (MemberID)::varchar(20) as    Subscriber_ID
		, (FamilyID)::varchar(10) as Family_ID
		, (CoveredIndividualsFamilyIDSuffix)::varchar(10) as Cov_Indl_Family_ID_Suffix
		, (a.CoveredIndividualID)::varchar(20) as Cov_Indl_ID
		, (CoveredIndividualSSN)::varchar(9) as Cov_Indl_SSN
		, (CoveredIndividualHICN)::varchar(15) as Cov_Indl_HICN
		, (null)::varchar(15) as Cov_Indl_MBI
		, (CoveredIndividualEffectiveDate)::date as Covg_Eff_Dt
		, (case when lead(CoveredIndividualEffectiveDate) over (partition by a.CoveredIndividualID order by CoveredIndividualEffectiveDate) < CoveredIndividualTerminationDate
				then lead(CoveredIndividualEffectiveDate) over (partition by a.CoveredIndividualID order by CoveredIndividualEffectiveDate)
				else CoveredIndividualTerminationDate
				end)::date
			as Covg_Term_Dt
		, (b.Covg_Most_Recent_Eff_Dt)::date as Covg_Most_Recent_Eff_Dt
		, (CoveredIndividualRelationToMember)::varchar(6) as Cov_Indl_Reln_To_Subscr
		, (CoveredIndividualFirstName)::varchar(25) as Cov_Indl_FName
		, (CoveredIndividualLastName)::varchar(25) as Cov_Indl_L_Name
		, (CoveredIndividualStreet1)::varchar(100) as Cov_Indl_Street1
		, (CoveredIndividualStreet2)::varchar(100) as Cov_Indl_Street2
		, (CoveredIndividualCity)::varchar(50) as Cov_Indl_City
		, (CoveredIndividualState)::varchar(2) as Cov_Indl_State
		, (CoveredIndividualZipCode)::varchar(10) as Cov_Indl_Zip
		, (CoveredIndividualPhone1)::varchar(20) as Cov_Indl_Phone1
		, (CoveredIndividualPhone1Extension)::int as Cov_Indl_Phone1_Ext
		, (CoveredIndividualPhone2)::varchar(20) as Cov_Indl_Phone2
		, (CoveredIndividualPhone2Extension)::int as Cov_Indl_Phone2_Ext
		, (CoveredIndividualEmail)::varchar(100) as Cov_Indl_Email
		, (CoveredIndividualGender)::varchar (1) as Cov_Indl_Gender
		, (CoveredIndividualDateOfBirth)::date as Cov_Indl_DOB
		, (CoveredIndividualDateOfDeath)::date as Cov_Indl_DOD
		, (case when upper(CoveredIndividualHIPAAIndicator) = 'Y' then true
				when upper(CoveredIndividualHIPAAIndicator) = 'N' then false else null end)::boolean as Cov_Indl_HIPAA_Indicator
		, (case when upper(CoveredIndividualSpecialHandling) = 'Y' then true
				when upper(CoveredIndividualSpecialHandling) = 'N' then false else null end)::boolean as Cov_Indl_Special_Handling
		, (TypeofCoverage)::varchar(1) as Covg_Type
		, (CoverageElection)::varchar(1) as Covg_Election
		, (EmployeeStatus)::varchar(1) as Empl_Status
		, (PCP)::varchar(15) as PCP
	from ESRD_clean_raw.member_info a
	inner join
		(
		select
			CoveredIndividualID
			, max(CoveredIndividualEffectiveDate) as Covg_Most_Recent_Eff_Dt
		from ESRD_clean_raw.member_info
		group by CoveredIndividualID
		) b
	on a.CoveredIndividualID = b.CoveredIndividualID
	)
;


-- drop table if exists ESRD_canonical.mmr;
create table ESRD_canonical.mmr
(	
	PaymentDate	date
	, HICN	varchar(12)
	, CoveredIndividualId	varchar(20)
	, Surname	varchar(7)
	, Sex	varchar(1)
	, BirthDate	datetime
	, Hospice	varchar(1)
	, ESRD	varchar(1)
	, AdjustmentReasonCode	varchar(2)
)
diststyle key
distkey(CoveredIndividualId)
interleaved sortkey(hicn,PaymentDate,esrd,AdjustmentReasonCode)
;


insert into ESRD_canonical.mmr
	( 
	select distinct
		mmr.payment_date::date as PaymentDate,
		mmr.hicn::varchar(12) as HICN,
		(coalesce(mbr_1.Cov_Indl_ID,mbr_2.Cov_Indl_ID))::varchar(20) as CoveredIndividualId,
		mmr.surname::varchar(7) as Surname,
		mmr.sex::varchar(1) as Sex,
		mmr.birth_date::datetime as BirthDate,
		mmr.hospice::varchar(1) as Hospice,
		mmr.esrd::varchar(1) as ESRD,
		mmr.adjustmt_reason_code::varchar(2) as AdjustmentReasonCode
	from ESRD_clean_raw.mmr mmr
	left outer join 
		(
		select distinct
			Cov_Indl_ID
			, Cov_Indl_HICN
		from ESRD_canonical.covered_individual_info mbr_1
		) mbr_1
	on mbr_1.Cov_Indl_HICN = mmr.hicn
	left outer join
		(
		select distinct
			Cov_Indl_ID
			, Cov_Indl_MBI
		from ESRD_canonical.covered_individual_info mbr_1
		) mbr_2
	on mbr_2.Cov_Indl_MBI = mmr.hicn
	)
;

--select 'r', count(*) from ESRD_clean_raw.mmr
--union all
--select 'c', count(*) from ESRD_canonical.mmr;
--
--select distinct hicn, CoveredIndividualId from ESRD_canonical.mmr 
--where hicn in (select hicn from (select distinct hicn, CoveredIndividualId from ESRD_canonical.mmr) group by hicn having count(*) > 1)
--order by hicn;
--
--select distinct hicn, CoveredIndividualId from ESRD_canonical.mmr where CoveredIndividualId is null;

-- drop table if exists ESRD_canonical.provider_info;
CREATE TABLE ESRD_canonical.provider_info
(
	provider_id	varchar(20) 
	,provider_NPI	varchar(10)
	,provider_Name	varchar(100)
	,provider_Other_Nm	varchar(100)
	,provider_Org_Name	varchar(100) 
	,provider_Tax_ID	varchar(10)
	,provider_Street1	varchar(100)
	,provider_Street2	varchar(100)
	,provider_City	varchar(50)
	,provider_State	varchar(2)
	,provider_Zip_Code	varchar(10)
	,provider_Phone1	varchar(20)
	,provider_Ph1_ext	varchar(10)
	,provider_Fax	varchar(20)
)
diststyle even
interleaved sortkey(provider_id)
;

insert into ESRD_canonical.provider_info
	(
	select distinct
		ProviderID::varchar(20)  as provider_id
		, ProviderNPI::varchar(10) as provider_NPI
		, ProviderName::varchar(100) as provider_name
		, ProviderOtherName::varchar(100) as provider_Other_Name
		, ProviderOrgName::varchar(100)  as provider_Org_Name
		, ProviderTaxID::varchar(10) as provider_Tax_ID
		, ProviderStreet1::varchar(100) as provider_Street1
		, ProviderStreet2::varchar(100) as provider_Street2
		, ProviderCity::varchar(50) as provider_City
		, ProviderState::varchar(2) as provider_State
		, ProviderZipCode::varchar(10) as provider_Zip_Code
		, ProviderPhone1::varchar(20) as provider_Phone1
		, ProviderPhone1extension::varchar(10) as provider_Ph1_ext
		, ProviderFAX::varchar(20) as provider_Fax
	from ESRD_clean_raw.provider_info
	)
;






drop table if exists ESRD_canonical.med_clm_hdr;
CREATE TABLE ESRD_canonical.med_clm_hdr
(
    ClaimNumber	varchar(50)
	,Adjusted_Claim	varchar(50)
	,Claim_Status	varchar(1)
	,Claim_Type	varchar(1)
	,Check_Number	varchar(15)
	,Check_Date	date 
	,Processed_Date	date 
	,Received_Date	date 
	,Subscriber_ID	varchar(20)
	,CoveredIndividualID	varchar(20)
	,FirstDOS	date
	,LastDOS	date
	,NumServiceLines	integer
	,Client_ID	int
	,Group_ID	varchar(30)
	,Bill_Type	varchar(4)
	,Inv_No	varchar(20)
	,Claim_Submitted_Charge_Amt	numeric(10,2)
	,Claim_Allowed_Amt	numeric(10,2)
	,Claim_Amt_Pd	numeric(10,2)
	,DRG_Code	varchar(10)
	,DRG_Version	varchar(20)
	,Billing_Provider_ID	varchar(20)
	,Provider_Pt_Acct_No	varchar(30)
	,Rendering_Provider_Id	varchar(20)
)
diststyle key
distkey(CoveredIndividualID)
interleaved sortkey(ClaimNumber,FirstDOS,Rendering_Provider_Id)
;

insert into ESRD_canonical.med_clm_hdr
	(
	select distinct
		(a.ClaimNumber)::varchar(50) as ClaimNumber
		, (a.AdjustedClaim)::varchar(50) as Adjusted_Claim
		, (a.ClaimStatus)::varchar(15) as Claim_Status
		, (a.ClaimType)::varchar(1) as Claim_Type
		, (a.CheckNumber)::varchar(15) as Check_Number
		, (a.CheckDate)::date  as Check_Date
		, (a.ProcessedDate)::date  as Processed_Date
		, (a.ReceivedDate)::date  as Received_Date
		, (a.MemberID)::varchar(20) as Subscriber_ID
		, (a.CoveredIndividualID)::varchar(20) as CoveredIndividualID
		, (b.FirstDOS)::date as FirstDOS
		, (b.LastDOS)::date as LastDOS
		, (b.NumServiceLines)::integer as NumServiceLines
		, (null)::int as Client_ID
		, (a.Account_Plan_GroupID)::varchar(30) as Group_ID
		, (a.TypeOfBill)::varchar(4) as Bill_Type
		, (a.InvoiceNumber)::varchar(20) as Inv_No
		, (a.ClaimSubmittedChargeAmount)::numeric(10,2) as Claim_Submitted_Charge_Amt
		, (a.ClaimAllowedAmount)::numeric(10,2) as Claim_Allowed_Amt
		, (a.ClaimPaidAmount)::numeric(10,2) as Claim_Amt_Pd
		, (a.DRGCode)::varchar(10) as DRG_Code
		, (a.DRGVersion)::varchar(20) as DRG_Version
		, (a.BillingProviderIdentifier)::varchar(20) as Billing_Provider_ID
		, (a.ProviderPatientAccountNumber)::varchar(30) as Provider_Pt_Acct_No
		, (a.PerformingProviderIdentifier)::varchar(20) as Rendering_Provider_Id
	from ESRD_clean_raw.medical_claims a
	inner join
		(
		select
			ClaimNumber
			, CoveredIndividualID
			, max(to_number(LineNumber,'999999')::integer) as NumServiceLines
			, case	when claimtype = 'I' then	case	when min(admitdate) = (select min(admitdate) from ESRD_clean_raw.medical_claims)
														then min(dischargedate)
														else min(admitdate)
												end
					when claimtype = 'P' then	case	when min(firstdos) = (select min(firstdos) from ESRD_clean_raw.medical_claims)
														then min(lastdos)
														else min(firstdos)
												end
					else null
				end	as FirstDOS
			, case	when claimtype = 'I' then	case	when min(dischargedate) = (select min(dischargedate) from ESRD_clean_raw.medical_claims)
														then min(admitdate)
														else min(dischargedate)
												end
					when claimtype = 'P' then	case	when min(lastdos) = (select min(lastdos) from ESRD_clean_raw.medical_claims)
														then min(firstdos)
														else min(lastdos)
												end
					else null
				end as LastDOS
		from ESRD_clean_raw.medical_claims
		group by
			ClaimNumber
			, CoveredIndividualID
			, claimtype
		) b
	on a.ClaimNumber = b.ClaimNumber and a.CoveredIndividualID = b.CoveredIndividualID
	)					
;

drop table if exists ESRD_canonical.diagnosis_codes;
create table ESRD_canonical.diagnosis_codes
	(
	CoveredIndividualID	varchar(50)
	, ClaimNumber varchar(20)
	, ICD_10Indicator varchar(1)
	, dx	varchar(10)
	)
diststyle key
distkey(CoveredIndividualID)
interleaved sortkey(ClaimNumber)
;


insert into ESRD_canonical.diagnosis_codes
	(
	select distinct
		CoveredIndividualID
		, ClaimNumber
		, ICD_10Indicator
		, regexp_replace(upper(btrim(dx)),'\\.','') as dx
	from
		(
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, PrimaryDXCode as dx from ESRD_clean_raw.medical_claims where PrimaryDXCode is not null and btrim(PrimaryDXCode) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode2 as dx from ESRD_clean_raw.medical_claims where dxCode2 is not null and btrim(dxCode2) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode3 as dx from ESRD_clean_raw.medical_claims where dxCode3 is not null and btrim(dxCode3) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode4 as dx from ESRD_clean_raw.medical_claims where dxCode4 is not null and btrim(dxCode4) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode5 as dx from ESRD_clean_raw.medical_claims where dxCode5 is not null and btrim(dxCode5) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode6 as dx from ESRD_clean_raw.medical_claims where dxCode6 is not null and btrim(dxCode6) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode7 as dx from ESRD_clean_raw.medical_claims where dxCode7 is not null and btrim(dxCode7) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode8 as dx from ESRD_clean_raw.medical_claims where dxCode8 is not null and btrim(dxCode8) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode9 as dx from ESRD_clean_raw.medical_claims where dxCode9 is not null and btrim(dxCode9) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode10 as dx from ESRD_clean_raw.medical_claims where dxCode10 is not null and btrim(dxCode10) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode11 as dx from ESRD_clean_raw.medical_claims where dxCode11 is not null and btrim(dxCode11) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode12 as dx from ESRD_clean_raw.medical_claims where dxCode12 is not null and btrim(dxCode12) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode13 as dx from ESRD_clean_raw.medical_claims where dxCode13 is not null and btrim(dxCode13) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode14 as dx from ESRD_clean_raw.medical_claims where dxCode14 is not null and btrim(dxCode14) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode15 as dx from ESRD_clean_raw.medical_claims where dxCode15 is not null and btrim(dxCode15) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode16 as dx from ESRD_clean_raw.medical_claims where dxCode16 is not null and btrim(dxCode16) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode17 as dx from ESRD_clean_raw.medical_claims where dxCode17 is not null and btrim(dxCode17) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode18 as dx from ESRD_clean_raw.medical_claims where dxCode18 is not null and btrim(dxCode18) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode19 as dx from ESRD_clean_raw.medical_claims where dxCode19 is not null and btrim(dxCode19) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode20 as dx from ESRD_clean_raw.medical_claims where dxCode20 is not null and btrim(dxCode20) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode21 as dx from ESRD_clean_raw.medical_claims where dxCode21 is not null and btrim(dxCode21) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode22 as dx from ESRD_clean_raw.medical_claims where dxCode22 is not null and btrim(dxCode22) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode23 as dx from ESRD_clean_raw.medical_claims where dxCode23 is not null and btrim(dxCode23) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode24 as dx from ESRD_clean_raw.medical_claims where dxCode24 is not null and btrim(dxCode24) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode25 as dx from ESRD_clean_raw.medical_claims where dxCode25 is not null and btrim(dxCode25) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode26 as dx from ESRD_clean_raw.medical_claims where dxCode26 is not null and btrim(dxCode26) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode27 as dx from ESRD_clean_raw.medical_claims where dxCode27 is not null and btrim(dxCode27) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode28 as dx from ESRD_clean_raw.medical_claims where dxCode28 is not null and btrim(dxCode28) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode29 as dx from ESRD_clean_raw.medical_claims where dxCode29 is not null and btrim(dxCode29) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode30 as dx from ESRD_clean_raw.medical_claims where dxCode30 is not null and btrim(dxCode30) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode31 as dx from ESRD_clean_raw.medical_claims where dxCode31 is not null and btrim(dxCode31) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode32 as dx from ESRD_clean_raw.medical_claims where dxCode32 is not null and btrim(dxCode32) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode33 as dx from ESRD_clean_raw.medical_claims where dxCode33 is not null and btrim(dxCode33) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode34 as dx from ESRD_clean_raw.medical_claims where dxCode34 is not null and btrim(dxCode34) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode35 as dx from ESRD_clean_raw.medical_claims where dxCode35 is not null and btrim(dxCode35) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode36 as dx from ESRD_clean_raw.medical_claims where dxCode36 is not null and btrim(dxCode36) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode37 as dx from ESRD_clean_raw.medical_claims where dxCode37 is not null and btrim(dxCode37) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode38 as dx from ESRD_clean_raw.medical_claims where dxCode38 is not null and btrim(dxCode38) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode39 as dx from ESRD_clean_raw.medical_claims where dxCode39 is not null and btrim(dxCode39) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ICD_10Indicator, dxCode40 as dx from ESRD_clean_raw.medical_claims where dxCode40 is not null and btrim(dxCode40) != ''
		)
	)
;

