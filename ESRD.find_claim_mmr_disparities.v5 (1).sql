

drop table if exists params;
create temp table params as
(
	select to_number('500.00','999D99')::numeric(10,2) as min_claim_value
);

drop table if exists rndadmin.esrd_cases;
create table rndadmin.esrd_cases 
(
	amy_opened	BOOLEAN	encode	raw
	, num_unflagged_months	BIGINT	encode	zstd
	, Num_Might_Be_Unflagged_Months BIGINT encode zstd
	, frommonth	VARCHAR(15)	encode	zstd
	, tomonth	VARCHAR(15)	encode	zstd
	, paymentdate	VARCHAR(7)	encode	zstd
	, non_hospice_esrd_not_in_mmr	BOOLEAN	encode	raw
	, non_hospice_esrd_might_be_in_mmr	boolean	encode	raw
	, esrd	VARCHAR(8)	encode	zstd
	, hospice	VARCHAR(8)	encode	zstd
	, adjustmentreasoncode	VARCHAR(64)	encode	zstd
	, monthlypaymt_adjustmt_amounta numeric(10,2) encode zstd
	, monthlypaymt_adjustmt_amountb numeric(10,2) encode zstd
	, msapaymt_adjustmt_start_date	varchar(10)	encode	zstd
	, msapaymt_adjustmt_end_date	varchar(10)	encode	zstd
	, is_lname_sex_dob_match	BOOLEAN	encode	raw
	, surname	VARCHAR(7)	encode	zstd
	, sex	VARCHAR(1)	encode	zstd
	, birthdate	DATE	encode	zstd
	, outsideeligibilityperiods	BOOLEAN	encode	raw
	, firstdos	DATE	encode	zstd
	, lastdos	DATE	encode	zstd
	, covg_eff_dt	DATE	encode	zstd
	, covg_term_dt	DATE	encode	zstd
	, has_5856	BOOLEAN	encode	raw
	, has_v420	BOOLEAN	encode	raw
	, has_v5631	BOOLEAN	encode	raw
	, has_n186	BOOLEAN	encode	raw
	, has_z940	BOOLEAN	encode	raw
	, has_z4931	BOOLEAN	encode	raw
	, units_G0257	integer	encode	zstd
	, units_G0491	integer	encode	zstd
	, units_G0492	integer	encode	zstd
	, units_90935	integer	encode	zstd
	, units_90937	integer	encode	zstd
	, units_90945	integer	encode	zstd
	, units_90947	integer	encode	zstd
	, units_90951	integer	encode	zstd
	, units_90952	integer	encode	zstd
	, units_90953	integer	encode	zstd
	, units_90954	integer	encode	zstd
	, units_90955	integer	encode	zstd
	, units_90956	integer	encode	zstd
	, units_90957	integer	encode	zstd
	, units_90958	integer	encode	zstd
	, units_90959	integer	encode	zstd
	, units_90960	integer	encode	zstd
	, units_90961	integer	encode	zstd
	, units_90962	integer	encode	zstd
	, units_90963	integer	encode	zstd
	, units_90964	integer	encode	zstd
	, units_90965	integer	encode	zstd
	, units_90966	integer	encode	zstd
	, units_90967	integer	encode	zstd
	, units_90968	integer	encode	zstd
	, units_90969	integer	encode	zstd
	, units_90970	integer	encode	zstd
	, units_90989	integer	encode	zstd
	, units_90993	integer	encode	zstd
	, units_90997	integer	encode	zstd
	, units_90999	integer	encode	zstd
	, clm_ttl_esrd_chargeamount	numeric(10,2) encode zstd
	, clm_ttl_esrd_allowedamount	numeric(10,2) encode zstd
	, hicn	VARCHAR(12)	encode	zstd
	, covered_individual_id	VARCHAR(20)	encode	zstd
	, claimnumber	VARCHAR(20)	encode	zstd
	, numservicelines	INTEGER	encode	zstd
	, claim_submitted_charge_amt	NUMERIC(10,2)	encode	zstd
	, subscriber_id	VARCHAR(20)	encode	zstd
	, adjusted_claim	VARCHAR(50)	encode	zstd
	, claim_status	VARCHAR(32)	encode	zstd
	, claim_allowed_amt	VARCHAR(128)	encode	zstd
	, claim_amt_pd	VARCHAR(128)	encode	zstd
	, claim_type	VARCHAR(1)	encode	zstd
	, check_number	VARCHAR(128)	encode	zstd
	, check_date	VARCHAR(128)	encode	zstd
	, processed_date	VARCHAR(128)	encode	zstd
	, received_date	VARCHAR(128)	encode	zstd
	, group_id	VARCHAR(30)	encode	zstd
	, bill_type	VARCHAR(4)	encode	zstd
	, inv_no	VARCHAR(20)	encode	lzo
	, drg_code	VARCHAR(10)	encode	zstd
	, drg_version	VARCHAR(20)	encode	lzo
	, billing_provider_id	VARCHAR(20)	encode	zstd
	, provider_pt_acct_no	VARCHAR(256)	encode	zstd
	, rendering_provider_id	VARCHAR(20)	encode	zstd
	, ageatservice	NUMERIC(5,1)	encode	zstd
	, family_id	VARCHAR(10)	encode	lzo
	, cov_indl_family_id_suffix	VARCHAR(10)	encode	lzo
	, cov_indl_ssn	VARCHAR(9)	encode	zstd
	, cov_indl_reln_to_subscr	VARCHAR(6)	encode	zstd
	, cov_indl_fname	VARCHAR(25)	encode	zstd
	, cov_indl_l_name	VARCHAR(25)	encode	zstd
	, cov_indl_street1	VARCHAR(100)	encode	zstd
	, cov_indl_street2	VARCHAR(100)	encode	zstd
	, cov_indl_city	VARCHAR(50)	encode	zstd
	, cov_indl_state	VARCHAR(2)	encode	zstd
	, cov_indl_zip	VARCHAR(10)	encode	zstd
	, cov_indl_phone1	VARCHAR(20)	encode	zstd
	, cov_indl_phone1_ext	INTEGER	encode	raw
	, cov_indl_phone2	VARCHAR(20)	encode	zstd
	, cov_indl_phone2_ext	INTEGER	encode	raw
	, cov_indl_email	VARCHAR(100)	encode	zstd
	, cov_indl_gender	VARCHAR(1)	encode	zstd
	, cov_indl_dob	DATE	encode	zstd
	, cov_indl_dod	DATE	encode	raw
	, cov_indl_hipaa_indicator	BOOLEAN	encode	raw
	, cov_indl_special_handling	BOOLEAN	encode	raw
	, covg_type	VARCHAR(1)	encode	lzo
	, covg_election	VARCHAR(1)	encode	lzo
	, empl_status	VARCHAR(1)	encode	lzo
	, pcp	VARCHAR(15)	encode	zstd
	, provider_id	varchar(15)	encode zstd
	, provider_npi	VARCHAR(10)	encode	zstd
	, provider_name	VARCHAR(100)	encode	zstd
	, provider_other_nm	VARCHAR(100)	encode	lzo
	, provider_org_name	VARCHAR(100)	encode	zstd
	, provider_tax_id	VARCHAR(10)	encode	zstd
	, provider_street1	VARCHAR(100)	encode	zstd
	, provider_street2	VARCHAR(100)	encode	lzo
	, provider_city	VARCHAR(50)	encode	zstd
	, provider_state	VARCHAR(2)	encode	zstd
	, provider_zip_code	VARCHAR(10)	encode	zstd
	, provider_phone1	VARCHAR(20)	encode	zstd
	, provider_ph1_ext	VARCHAR(10)	encode	lzo
	, provider_fax	VARCHAR(20)	encode	zstd
)
diststyle key 
distkey(covered_individual_id) 
interleaved sortkey(HICN,PaymentDate,Rendering_Provider_Id,Num_Unflagged_Months)
;
insert into rndadmin.esrd_cases
	(
			--
			--	The following CTEs are for tables that are joined multiple times, and
			--	then the results of those multiple joins coalesced, to give differential
			--	priority to the circumstances under which the join was successful.
	with
			--
			--	Coverage info is joined to claims twice, first to the effective date
			--	range within which the claim falls, if any; and then to the most recent
			--	coverage info record. The failure of the first join raises the flag
			--	that the claim is not associated with any coverage period.
			--
		coverage_info as
			(
			select distinct
				Subscriber_ID
				,Family_ID
				,Cov_Indl_Family_ID_Suffix
				,Cov_Indl_ID
				,Cov_Indl_SSN
				,Cov_Indl_HICN
				,Cov_Indl_MBI
				,Covg_Eff_Dt
				,Covg_Term_Dt
				,Covg_Most_Recent_Eff_Dt
				,Cov_Indl_Reln_To_Subscr
				,Cov_Indl_FName
				,Cov_Indl_L_Name
				,Cov_Indl_Street1
				,Cov_Indl_Street2
				,Cov_Indl_City
				,Cov_Indl_State
				,Cov_Indl_Zip
				,Cov_Indl_Phone1
				,Cov_Indl_Phone1_Ext
				,Cov_Indl_Phone2
				,Cov_Indl_Phone2_Ext
				,Cov_Indl_Email
				,Cov_Indl_Gender
				,Cov_Indl_DOB
				,Cov_Indl_DOD
				,Cov_Indl_HIPAA_Indicator
				,Cov_Indl_Special_Handling 
				,Covg_Type
				,Covg_Election
				,Empl_Status
				,PCP
			from ESRD_canonical.covered_individual_info
			)
			--
			--	The MMR is joined to the Coverage Info associated with each claim three times,
			--	once by HICN, once by MBI (should be mutually exclusive with HICN), and by 
			--	name-dob-gender, used when both HICN and MBI joins fail.
			--
		, mmr as
			(
			select distinct
							--
							--	The ESRD related claims are of interest in a given month when
							--	the ESRD flag is only 'N' on all records in the given month, and
							--	there is no retroactive adjustment for ESRD in the given month (code '08')
							--	and there is no indication that the patient is or might be on hospice.
							--
				(not has_ESRD and not (has_hospice or might_have_hospice)) as non_hospice_ESRD_not_in_mmr
							--
							--	The ESRD related claims might be of interest in a given month when
							--	the ESRD flag is buth 'Y' and 'N' across the records in the given month, and
							--	there is no retroactive adjustment for ESRD in the given month (code '08')
							--	and there is no indication that the patient is or might be on hospice.
							--
				, (might_have_ESRD and not (has_hospice or might_have_hospice)) as non_hospice_ESRD_might_not_be_in_mmr
				, PaymentDate
				, HICN
--				, CoveredIndividualId
				, Surname
				, Sex
				, BirthDate
				, Hospice
				, ESRD
				, AdjustmentReasonCode
				, monthlypaymt_adjustmt_amounta
				, monthlypaymt_adjustmt_amountb
				, msapaymt_adjustmt_start_date
				, msapaymt_adjustmt_end_date
			from ESRD_canonical.mmr
			)
			--
			--	Once the full claim-level detail information is joined up across
			--	claims, coverage info, MMR and rendering provider, summary information
			--	is computed and joined.
			--
		, opportunities as
			(
			select distinct
				ptclm.ClaimNumber
				, ptclm.has_5856
				, ptclm.has_V420
				, ptclm.has_V5631
				, ptclm.has_N186
				, ptclm.has_Z940
				, ptclm.has_Z4931
				, ptclm.units_G0257
				, ptclm.units_G0491
				, ptclm.units_G0492
				, ptclm.units_90935
				, ptclm.units_90937
				, ptclm.units_90945
				, ptclm.units_90947
				, ptclm.units_90951
				, ptclm.units_90952
				, ptclm.units_90953
				, ptclm.units_90954
				, ptclm.units_90955
				, ptclm.units_90956
				, ptclm.units_90957
				, ptclm.units_90958
				, ptclm.units_90959
				, ptclm.units_90960
				, ptclm.units_90961
				, ptclm.units_90962
				, ptclm.units_90963
				, ptclm.units_90964
				, ptclm.units_90965
				, ptclm.units_90966
				, ptclm.units_90967
				, ptclm.units_90968
				, ptclm.units_90969
				, ptclm.units_90970
				, ptclm.units_90989
				, ptclm.units_90993
				, ptclm.units_90997
				, ptclm.units_90999	
				, ptclm.clm_ttl_esrd_chargeamount
				, ptclm.clm_ttl_esrd_allowedamount
				, ptclm.covered_individual_id
				, ptclm.Claim_Submitted_Charge_Amt
				, ptclm.NumServiceLines
				, ptclm.FirstDOS
				, ptclm.LastDOS
				, ptclm.Subscriber_ID
				, ptclm.Adjusted_Claim
				, ptclm.Claim_Status
				, ptclm.Claim_Allowed_Amt
				, ptclm.Claim_Amt_Pd
				, ptclm.Claim_Type
				, ptclm.Check_Number
				, ptclm.Check_Date
				, ptclm.Processed_Date
				, ptclm.Received_Date
				, ptclm.Group_ID
				, ptclm.Bill_Type
				, ptclm.Inv_No
				, ptclm.DRG_Code
				, ptclm.DRG_Version
				, ptclm.Billing_Provider_ID
				, ptclm.Provider_Pt_Acct_No
				, ptclm.Rendering_Provider_Id
				, ptclm.Covg_Eff_Dt
				, ptclm.Covg_Term_Dt
				, ptclm.OutsideEligibilityPeriods
				, ptclm.AgeAtService
				, ptclm.Family_ID
				, ptclm.Cov_Indl_Family_ID_Suffix
				, ptclm.Cov_Indl_SSN
				, ptclm.Cov_Indl_MBI
				, ptclm.Cov_Indl_HICN
				, ptclm.Cov_Indl_Reln_To_Subscr
				, ptclm.Cov_Indl_FName
				, ptclm.Cov_Indl_L_Name
				, ptclm.Cov_Indl_Street1
				, ptclm.Cov_Indl_Street2
				, ptclm.Cov_Indl_City
				, ptclm.Cov_Indl_State
				, ptclm.Cov_Indl_Zip
				, ptclm.Cov_Indl_Phone1
				, ptclm.Cov_Indl_Phone1_Ext
				, ptclm.Cov_Indl_Phone2
				, ptclm.Cov_Indl_Phone2_Ext
				, ptclm.Cov_Indl_Email
				, ptclm.Cov_Indl_Gender
				, ptclm.Cov_Indl_DOB
				, ptclm.Cov_Indl_DOD
				, ptclm.Cov_Indl_HIPAA_Indicator
				, ptclm.Cov_Indl_Special_Handling
				, ptclm.Covg_Type
				, ptclm.Covg_Election
				, ptclm.Empl_Status
				, ptclm.PCP
				, (coalesce(mmr_1.non_hospice_ESRD_not_in_mmr,mmr_2.non_hospice_ESRD_not_in_mmr,mmr_3.non_hospice_ESRD_not_in_mmr))::boolean as non_hospice_ESRD_not_in_mmr
				, (coalesce(mmr_1.non_hospice_ESRD_might_not_be_in_mmr,mmr_2.non_hospice_ESRD_might_not_be_in_mmr,mmr_3.non_hospice_ESRD_might_not_be_in_mmr))::boolean as non_hospice_ESRD_might_not_be_in_mmr
				, to_char(coalesce(mmr_1.PaymentDate,mmr_2.PaymentDate,mmr_3.PaymentDate),'YYYY-MM')::varchar(7) as PaymentDate
				, coalesce(mmr_1.HICN,mmr_2.HICN,mmr_3.HICN) as HICN
				, coalesce(mmr_1.Surname,mmr_2.Surname,mmr_3.Surname) as Surname
				, coalesce(mmr_1.Sex,mmr_2.Sex,mmr_3.Sex) as Sex
				, coalesce(mmr_1.BirthDate,mmr_2.BirthDate,mmr_3.BirthDate) as BirthDate
				, coalesce(mmr_1.Hospice,mmr_2.Hospice,mmr_3.Hospice) as Hospice
				, coalesce(mmr_1.ESRD,mmr_2.ESRD,mmr_3.ESRD) as ESRD
				, coalesce(mmr_1.AdjustmentReasonCode,mmr_2.AdjustmentReasonCode,mmr_3.AdjustmentReasonCode) as AdjustmentReasonCode
				, coalesce(mmr_1.monthlypaymt_adjustmt_amounta,mmr_2.monthlypaymt_adjustmt_amounta,mmr_3.monthlypaymt_adjustmt_amounta) as monthlypaymt_adjustmt_amounta
				, coalesce(mmr_1.monthlypaymt_adjustmt_amountb,mmr_2.monthlypaymt_adjustmt_amountb,mmr_3.monthlypaymt_adjustmt_amountb) as monthlypaymt_adjustmt_amountb
				, coalesce(mmr_1.msapaymt_adjustmt_start_date,mmr_2.msapaymt_adjustmt_start_date,mmr_3.msapaymt_adjustmt_start_date) as msapaymt_adjustmt_start_date
				, coalesce(mmr_1.msapaymt_adjustmt_end_date,mmr_2.msapaymt_adjustmt_end_date,mmr_3.msapaymt_adjustmt_end_date) as msapaymt_adjustmt_end_date
				, (mmr_1.hicn is null and mmr_2.hicn is null and mmr_3.hicn is not null)::boolean as Is_LName_Sex_DOB_match
				, prov.provider_id
				, prov.provider_NPI
				, prov.provider_Name
				, prov.provider_Other_Nm
				, prov.provider_Org_Name
				, prov.provider_Tax_ID
				, prov.provider_Street1
				, prov.provider_Street2
				, prov.provider_City
				, prov.provider_State
				, prov.provider_Zip_Code
				, prov.provider_Phone1
				, prov.provider_Ph1_ext
				, prov.provider_Fax
				, (amy.clm_ci is not null)::boolean as amy_opened
			from
				(
				select distinct
					cb.ClaimNumber
					, cb.has_5856
					, cb.has_V420
					, cb.has_V5631
					, cb.has_N186
					, cb.has_Z940
					, cb.has_Z4931
					, procs.units_G0257
					, procs.units_G0491
					, procs.units_G0492
					, procs.units_90935
					, procs.units_90937
					, procs.units_90945
					, procs.units_90947
					, procs.units_90951
					, procs.units_90952
					, procs.units_90953
					, procs.units_90954
					, procs.units_90955
					, procs.units_90956
					, procs.units_90957
					, procs.units_90958
					, procs.units_90959
					, procs.units_90960
					, procs.units_90961
					, procs.units_90962
					, procs.units_90963
					, procs.units_90964
					, procs.units_90965
					, procs.units_90966
					, procs.units_90967
					, procs.units_90968
					, procs.units_90969
					, procs.units_90970
					, procs.units_90989
					, procs.units_90993
					, procs.units_90997
					, procs.units_90999
					, procs.clm_ttl_esrd_chargeamount
					, procs.clm_ttl_esrd_allowedamount
					, clm.covered_individual_id
					, clm.Claim_Submitted_Charge_Amt
					, clm.NumServiceLines
					, clm.FirstDOS
					, clm.LastDOS
					, clm.Subscriber_ID
					, clm.Adjusted_Claim
					, clm.Claim_Status
					, clm.Claim_Allowed_Amt
					, clm.Claim_Amt_Pd
					, clm.Claim_Type
					, clm.Check_Number
					, clm.Check_Date
					, clm.Processed_Date
					, clm.Received_Date
					, clm.Group_ID
					, clm.Bill_Type
					, clm.Inv_No
					, clm.DRG_Code
					, clm.DRG_Version
					, clm.Billing_Provider_ID
					, clm.Provider_Pt_Acct_No
					, clm.Rendering_Provider_Id
					, coalesce(cov_indv_1.Covg_Eff_Dt,null) as Covg_Eff_Dt
					, coalesce(cov_indv_1.Covg_Term_Dt,null) as Covg_Term_Dt
					, ((clm.FirstDOS not between coalesce(cov_indv_1.Covg_Eff_Dt,cov_indv_2.Covg_Eff_Dt) and coalesce(cov_indv_1.Covg_Term_Dt,cov_indv_2.Covg_Term_Dt)) 
							and (clm.LastDOS not between coalesce(cov_indv_1.Covg_Eff_Dt,cov_indv_2.Covg_Eff_Dt) and coalesce(cov_indv_1.Covg_Term_Dt,cov_indv_2.Covg_Term_Dt)))
						as OutsideEligibilityPeriods
					, (datediff(day,coalesce(cov_indv_1.Cov_Indl_DOB,cov_indv_2.Cov_Indl_DOB),clm.LastDOS)::float/(365)::float)::numeric(5,1) as AgeAtService
					, coalesce(cov_indv_1.Family_ID,cov_indv_2.Family_ID) as Family_ID
					, coalesce(cov_indv_1.Cov_Indl_Family_ID_Suffix,cov_indv_2.Cov_Indl_Family_ID_Suffix) as Cov_Indl_Family_ID_Suffix
					, coalesce(cov_indv_1.Cov_Indl_SSN,cov_indv_2.Cov_Indl_SSN) as Cov_Indl_SSN
					, coalesce(cov_indv_1.Cov_Indl_MBI,cov_indv_2.Cov_Indl_MBI) as Cov_Indl_MBI
					, coalesce(cov_indv_1.Cov_Indl_HICN,cov_indv_2.Cov_Indl_HICN) as Cov_Indl_HICN
					, coalesce(cov_indv_1.Cov_Indl_Reln_To_Subscr,cov_indv_2.Cov_Indl_Reln_To_Subscr) as Cov_Indl_Reln_To_Subscr
					, coalesce(cov_indv_1.Cov_Indl_FName,cov_indv_2.Cov_Indl_FName) as Cov_Indl_FName
					, coalesce(cov_indv_1.Cov_Indl_L_Name,cov_indv_2.Cov_Indl_L_Name) as Cov_Indl_L_Name
					, coalesce(cov_indv_1.Cov_Indl_Street1,cov_indv_2.Cov_Indl_Street1) as Cov_Indl_Street1
					, coalesce(cov_indv_1.Cov_Indl_Street2,cov_indv_2.Cov_Indl_Street2) as Cov_Indl_Street2
					, coalesce(cov_indv_1.Cov_Indl_City,cov_indv_2.Cov_Indl_City) as Cov_Indl_City
					, coalesce(cov_indv_1.Cov_Indl_State,cov_indv_2.Cov_Indl_State) as Cov_Indl_State
					, coalesce(cov_indv_1.Cov_Indl_Zip,cov_indv_2.Cov_Indl_Zip) as Cov_Indl_Zip
					, coalesce(cov_indv_1.Cov_Indl_Phone1,cov_indv_2.Cov_Indl_Phone1) as Cov_Indl_Phone1
					, coalesce(cov_indv_1.Cov_Indl_Phone1_Ext,cov_indv_2.Cov_Indl_Phone1_Ext) as Cov_Indl_Phone1_Ext
					, coalesce(cov_indv_1.Cov_Indl_Phone2,cov_indv_2.Cov_Indl_Phone2) as Cov_Indl_Phone2
					, coalesce(cov_indv_1.Cov_Indl_Phone2_Ext,cov_indv_2.Cov_Indl_Phone2_Ext) as Cov_Indl_Phone2_Ext
					, coalesce(cov_indv_1.Cov_Indl_Email,cov_indv_2.Cov_Indl_Email) as Cov_Indl_Email
					, coalesce(cov_indv_1.Cov_Indl_Gender,cov_indv_2.Cov_Indl_Gender) as Cov_Indl_Gender
					, coalesce(cov_indv_1.Cov_Indl_DOB,cov_indv_2.Cov_Indl_DOB) as Cov_Indl_DOB
					, coalesce(cov_indv_1.Cov_Indl_DOD,cov_indv_2.Cov_Indl_DOD) as Cov_Indl_DOD
					, coalesce(cov_indv_1.Cov_Indl_HIPAA_Indicator,cov_indv_2.Cov_Indl_HIPAA_Indicator) as Cov_Indl_HIPAA_Indicator
					, coalesce(cov_indv_1.Cov_Indl_Special_Handling ,cov_indv_2.Cov_Indl_Special_Handling) as Cov_Indl_Special_Handling
					, coalesce(cov_indv_1.Covg_Type,cov_indv_2.Covg_Type) as Covg_Type
					, coalesce(cov_indv_1.Covg_Election,cov_indv_2.Covg_Election) as Covg_Election
					, coalesce(cov_indv_1.Empl_Status,cov_indv_2.Empl_Status) as Empl_Status
					, coalesce(cov_indv_1.PCP,cov_indv_2.PCP) as PCP
				from
					(
							--
							--	The primary filter is whether or not a claims has an ESRD diagnosis
							--	on it. As such, the covered individual and claim ids of such claims
							--	comprise the left-most table for a series of left outer joins.
							--
							--	The the occurences of any of six strings comprising ESRD diagnoses
							--	(3 ICD-9, 3 ICD-10) are flattened to flags, indicating when one or
							--	more instances of the diagnosis have occurred on the claim.
							--
					select distinct
						ClaimNumber
						, CoveredIndividualID
						, bool_or(has_5856) as has_5856
						, bool_or(has_V420) as has_V420
						, bool_or(has_V5631) as has_V5631
						, bool_or(has_N186) as has_N186
						, bool_or(has_Z940) as has_Z940
						, bool_or(has_Z4931) as has_Z4931
					from
						(
						select
							CoveredIndividualID
							, ClaimNumber
							, case when dx = '5856' then 1 else 0 end as has_5856
							, case when dx = 'V420' then 1 else 0 end as has_V420
							, case when dx = 'V5631' then 1 else 0 end as has_V5631
							, case when left(dx,4) = 'N186' then 1 else 0 end as has_N186
							, case when left(dx,4) = 'Z940' then 1 else 0 end as has_Z940
							, case when left(dx,5) = 'Z4931' then 1 else 0 end as has_Z4931
						from
							(
							select
								CoveredIndividualID
								, ClaimNumber
								, dx
							from ESRD_canonical.diagnosis_codes
							where (dx in ('5856','V420','V5631'))
								or ((left(dx,4) in ('N186','Z940') or left(dx,5) = 'Z4931') )
							)
						)
					group by 
						ClaimNumber
						, CoveredIndividualID
					) cb
				left outer join
					(
							--
							--	Across the service lines associated with a claim, the units of
							--	each type of dialysis-related service are summed and flattened
							--	to the single claim line. N.b., it's important that this be a left
							--	outer join, to retain claims with ESRD diagnoses but not dialysis
							--	services. Such claims will have NULLs in all the service line info,
							--	indicating no dialysis services/charges for the claim.
							--
					select distinct
						ClaimNumber
						, CoveredIndividualID
						, sum(units_G0257) as units_G0257
						, sum(units_G0491) as units_G0491
						, sum(units_G0492) as units_G0492
						, sum(units_90935) as units_90935
						, sum(units_90937) as units_90937
						, sum(units_90945) as units_90945
						, sum(units_90947) as units_90947
						, sum(units_90951) as units_90951
						, sum(units_90952) as units_90952
						, sum(units_90953) as units_90953
						, sum(units_90954) as units_90954
						, sum(units_90955) as units_90955
						, sum(units_90956) as units_90956
						, sum(units_90957) as units_90957
						, sum(units_90958) as units_90958
						, sum(units_90959) as units_90959
						, sum(units_90960) as units_90960
						, sum(units_90961) as units_90961
						, sum(units_90962) as units_90962
						, sum(units_90963) as units_90963
						, sum(units_90964) as units_90964
						, sum(units_90965) as units_90965
						, sum(units_90966) as units_90966
						, sum(units_90967) as units_90967
						, sum(units_90968) as units_90968
						, sum(units_90969) as units_90969
						, sum(units_90970) as units_90970
						, sum(units_90989) as units_90989
						, sum(units_90993) as units_90993
						, sum(units_90997) as units_90997
						, sum(units_90999) as units_90999
						, sum(chargeamount) as clm_ttl_esrd_chargeamount
						, sum(allowedamount) as clm_ttl_esrd_allowedamount
					from
						(
						select distinct
							CoveredIndividualID
							, ClaimNumber
							, LineNumber
							, case when cpt_hcpcs = 'G0257' then units else 0 end as units_G0257
							, case when cpt_hcpcs = 'G0491' then units else 0 end as units_G0491
							, case when cpt_hcpcs = 'G0492' then units else 0 end as units_G0492
							, case when cpt_hcpcs = '90935' then units else 0 end as units_90935
							, case when cpt_hcpcs = '90937' then units else 0 end as units_90937
							, case when cpt_hcpcs = '90945' then units else 0 end as units_90945
							, case when cpt_hcpcs = '90947' then units else 0 end as units_90947
							, case when cpt_hcpcs = '90951' then units else 0 end as units_90951
							, case when cpt_hcpcs = '90952' then units else 0 end as units_90952
							, case when cpt_hcpcs = '90953' then units else 0 end as units_90953
							, case when cpt_hcpcs = '90954' then units else 0 end as units_90954
							, case when cpt_hcpcs = '90955' then units else 0 end as units_90955
							, case when cpt_hcpcs = '90956' then units else 0 end as units_90956
							, case when cpt_hcpcs = '90957' then units else 0 end as units_90957
							, case when cpt_hcpcs = '90958' then units else 0 end as units_90958
							, case when cpt_hcpcs = '90959' then units else 0 end as units_90959
							, case when cpt_hcpcs = '90960' then units else 0 end as units_90960
							, case when cpt_hcpcs = '90961' then units else 0 end as units_90961
							, case when cpt_hcpcs = '90962' then units else 0 end as units_90962
							, case when cpt_hcpcs = '90963' then units else 0 end as units_90963
							, case when cpt_hcpcs = '90964' then units else 0 end as units_90964
							, case when cpt_hcpcs = '90965' then units else 0 end as units_90965
							, case when cpt_hcpcs = '90966' then units else 0 end as units_90966
							, case when cpt_hcpcs = '90967' then units else 0 end as units_90967
							, case when cpt_hcpcs = '90968' then units else 0 end as units_90968
							, case when cpt_hcpcs = '90969' then units else 0 end as units_90969
							, case when cpt_hcpcs = '90970' then units else 0 end as units_90970
							, case when cpt_hcpcs = '90989' then units else 0 end as units_90989
							, case when cpt_hcpcs = '90993' then units else 0 end as units_90993
							, case when cpt_hcpcs = '90997' then units else 0 end as units_90997
							, case when cpt_hcpcs = '90999' then units else 0 end as units_90999
							, chargeamount
							, allowedamount
						from
							(
							select distinct
								CoveredIndividualID
								, ClaimNumber
								, LineNumber
								, cpt_hcpcs
								, case when units::integer = 0 then 1 else units::integer end as units
								, chargeamount
								, allowedamount
							from ESRD_canonical.procedure_codes
							where cpt_hcpcs in ( 'G0257'
												, 'G0491'
												, 'G0492'
												, '90935'
												, '90937'
												, '90945'
												, '90947'
												, '90951'
												, '90952'
												, '90953'
												, '90954'
												, '90955'
												, '90956'
												, '90957'
												, '90958'
												, '90959'
												, '90960'
												, '90961'
												, '90962'
												, '90963'
												, '90964'
												, '90965'
												, '90966'
												, '90967'
												, '90968'
												, '90969'
												, '90970'
												, '90989'
												, '90993'
												, '90997'
												, '90999' )
							)
						)
					group by 
						ClaimNumber
						, CoveredIndividualID
					) procs
				on cb.CoveredIndividualID = procs.CoveredIndividualID and cb.ClaimNumber = procs.ClaimNumber
				inner join 
					(
					select distinct
						ClaimNumber
						,Adjusted_Claim
						,Claim_Status
						,Claim_Type
						,Check_Number
						,Check_Date
						,Processed_Date
						,Received_Date
						,Subscriber_ID
						,CoveredIndividualID as covered_individual_id
						,FirstDOS
						,LastDOS
						,NumServiceLines
						,Client_ID
						,Group_ID
						,Bill_Type
						,Inv_No
						,Claim_Submitted_Charge_Amt
						,Claim_Allowed_Amt
						,Claim_Amt_Pd
						,DRG_Code
						,DRG_Version
						,Billing_Provider_ID
						,Provider_Pt_Acct_No
						,Rendering_Provider_Id
					from ESRD_canonical.med_clm_hdr
					where Claim_Submitted_Charge_Amt >= (select min_claim_value from params) 
					) clm
				on cb.CoveredIndividualID = clm.covered_individual_id and cb.ClaimNumber = clm.ClaimNumber
						--
						--	Join the coverage info for the effective period in which the claim occurred.
						--
				left outer join coverage_info cov_indv_1
				on clm.covered_individual_id = cov_indv_1.Cov_Indl_ID
					and ((clm.FirstDOS between cov_indv_1.Covg_Eff_Dt and cov_indv_1.Covg_Term_Dt) 
							or (clm.LastDOS between cov_indv_1.Covg_Eff_Dt and cov_indv_1.Covg_Term_Dt))
						--
						--	Join the coverage info so as to reflect that the claim occurred outside
						--	of all valid coverage periods.
						--
				left outer join coverage_info cov_indv_2
				on clm.covered_individual_id = cov_indv_2.Cov_Indl_ID
					and ( cov_indv_2.Covg_Most_Recent_Eff_Dt = cov_indv_2.Covg_Eff_Dt
							and ((clm.FirstDOS not between cov_indv_2.Covg_Eff_Dt and cov_indv_2.Covg_Term_Dt) 
								and (clm.LastDOS not between cov_indv_2.Covg_Eff_Dt and cov_indv_2.Covg_Term_Dt))
						)
				) ptclm
						--
						--	Join claims, based on the month(s) in which they occurred, to the MMR the MMR based on HICN
						--
			left outer join mmr mmr_1
			on ptclm.Cov_Indl_HICN = mmr_1.HICN 
				and ((ptclm.FirstDOS between mmr_1.PaymentDate and add_months(mmr_1.PaymentDate,1))
						or (ptclm.LastDOS between mmr_1.PaymentDate and add_months(mmr_1.PaymentDate,1)) )
			left outer join mmr mmr_2
						--
						--	Join claims, based on the month(s) in which they occurred, to the MMR based on MBI (should be mutually exclusive with HICN)
						--
			on ptclm.Cov_Indl_MBI = mmr_2.HICN 
				and ((ptclm.FirstDOS between mmr_2.PaymentDate and add_months(mmr_2.PaymentDate,1))
						or (ptclm.LastDOS between mmr_2.PaymentDate and add_months(mmr_2.PaymentDate,1)) )
						--
						--	Join claims, based on the month(s) in which they occurred, to the MMR based on name-dob-sex.
						--
			left outer join mmr mmr_3
			on left(ptclm.Cov_Indl_L_Name,7) = mmr_3.surname and ptclm.Cov_Indl_DOB = mmr_3.BirthDate and ptclm.Cov_Indl_Gender = mmr_3.sex
				and ((ptclm.FirstDOS between mmr_3.PaymentDate and add_months(mmr_3.PaymentDate,1))
						or (ptclm.LastDOS between mmr_3.PaymentDate and add_months(mmr_3.PaymentDate,1)) )
			left outer join 
				(
				select
					provider_id
					,provider_NPI
					,provider_Name
					,provider_Other_Nm
					,provider_Org_Name
					,provider_Tax_ID
					,provider_Street1
					,provider_Street2
					,provider_City
					,provider_State
					,provider_Zip_Code
					,provider_Phone1
					,provider_Ph1_ext
					,provider_Fax
				from ESRD_canonical.provider_info
				) prov
			on ptclm.Rendering_Provider_Id = prov.provider_id
			left outer join rndadmin.amy_opened amy
			on ptclm.covered_individual_id = amy.clm_ci
			)
	select distinct
		opps.amy_opened
		, coalesce(ptmos.Num_Unflagged_Months,0) as Num_Unflagged_Months
		, coalesce(ptmaybe.Num_Might_Be_Unflagged_Months,0) as Num_Might_Be_Unflagged_Months
		, ptmos.FromMonth
		, ptmos.ToMonth
		, opps.PaymentDate
		, opps.non_hospice_ESRD_not_in_mmr
		, opps.non_hospice_ESRD_might_not_be_in_mmr
		, opps.ESRD
		, opps.Hospice
		, opps.AdjustmentReasonCode
		, opps.monthlypaymt_adjustmt_amounta
		, opps.monthlypaymt_adjustmt_amountb
		, opps.msapaymt_adjustmt_start_date
		, opps.msapaymt_adjustmt_end_date
		, opps.Is_LName_Sex_DOB_match
		, opps.Surname
		, opps.Sex
		, opps.BirthDate
		, opps.OutsideEligibilityPeriods
		, opps.FirstDOS
		, opps.LastDOS
		, opps.Covg_Eff_Dt
		, opps.Covg_Term_Dt
		, opps.has_5856
		, opps.has_V420
		, opps.has_V5631
		, opps.has_N186
		, opps.has_Z940
		, opps.has_Z4931
		, opps.units_G0257
		, opps.units_G0491
		, opps.units_G0492
		, opps.units_90935
		, opps.units_90937
		, opps.units_90945
		, opps.units_90947
		, opps.units_90951
		, opps.units_90952
		, opps.units_90953
		, opps.units_90954
		, opps.units_90955
		, opps.units_90956
		, opps.units_90957
		, opps.units_90958
		, opps.units_90959
		, opps.units_90960
		, opps.units_90961
		, opps.units_90962
		, opps.units_90963
		, opps.units_90964
		, opps.units_90965
		, opps.units_90966
		, opps.units_90967
		, opps.units_90968
		, opps.units_90969
		, opps.units_90970
		, opps.units_90989
		, opps.units_90993
		, opps.units_90997
		, opps.units_90999
		, opps.clm_ttl_esrd_chargeamount
		, opps.clm_ttl_esrd_allowedamount
		, opps.HICN
		, opps.covered_individual_id
		, opps.ClaimNumber
		, opps.NumServiceLines
		, opps.Claim_Submitted_Charge_Amt
		, opps.Subscriber_ID
		, opps.Adjusted_Claim
		, opps.Claim_Status
		, opps.Claim_Allowed_Amt
		, opps.Claim_Amt_Pd
		, opps.Claim_Type
		, opps.Check_Number
		, opps.Check_Date
		, opps.Processed_Date
		, opps.Received_Date
		, opps.Group_ID
		, opps.Bill_Type
		, opps.Inv_No
		, opps.DRG_Code
		, opps.DRG_Version
		, opps.Billing_Provider_ID
		, opps.Provider_Pt_Acct_No
		, opps.Rendering_Provider_Id
		, opps.AgeAtService
		, opps.Family_ID
		, opps.Cov_Indl_Family_ID_Suffix
		, opps.Cov_Indl_SSN
		, opps.Cov_Indl_Reln_To_Subscr
		, opps.Cov_Indl_FName
		, opps.Cov_Indl_L_Name
		, opps.Cov_Indl_Street1
		, opps.Cov_Indl_Street2
		, opps.Cov_Indl_City
		, opps.Cov_Indl_State
		, opps.Cov_Indl_Zip
		, opps.Cov_Indl_Phone1
		, opps.Cov_Indl_Phone1_Ext
		, opps.Cov_Indl_Phone2
		, opps.Cov_Indl_Phone2_Ext
		, opps.Cov_Indl_Email
		, opps.Cov_Indl_Gender
		, opps.Cov_Indl_DOB
		, opps.Cov_Indl_DOD
		, opps.Cov_Indl_HIPAA_Indicator
		, opps.Cov_Indl_Special_Handling
		, opps.Covg_Type
		, opps.Covg_Election
		, opps.Empl_Status
		, opps.PCP
		, opps.provider_id
		, opps.provider_NPI
		, opps.provider_Name
		, opps.provider_Other_Nm
		, opps.provider_Org_Name
		, opps.provider_Tax_ID
		, opps.provider_Street1
		, opps.provider_Street2
		, opps.provider_City
		, opps.provider_State
		, opps.provider_Zip_Code
		, opps.provider_Phone1
		, opps.provider_Ph1_ext
		, opps.provider_Fax
	from opportunities opps
				--
				--	For each covered individual, add the number of months where the
				--	MMR is inconsistent with claims history, along with the start and
				--	end dates of MMR records for the individual.
				--
	left outer join
		(
		select
			covered_individual_id
			, hicn
			, to_char(min(to_date(PaymentDate,'YYYY-MM')),'YYYY-MM') as FromMonth
			, to_char(max(to_date(PaymentDate,'YYYY-MM')),'YYYY-MM') as ToMonth
			, count(*) as Num_Unflagged_Months
		from
			(
			select distinct covered_individual_id, hicn, PaymentDate from opportunities where non_hospice_esrd_not_in_mmr
			)
		group by covered_individual_id, hicn
		) ptmos
	on opps.hicn = ptmos.hicn
				--
				--	For each covered individual, add the number of months where the
				--	MMR might be inconsistent with claims history, along with the start and
				--	end dates of MMR records for the individual.
				--
	left outer join
		(
		select
			covered_individual_id
			, hicn
			, to_char(min(to_date(PaymentDate,'YYYY-MM')),'YYYY-MM') as FromMonth
			, to_char(max(to_date(PaymentDate,'YYYY-MM')),'YYYY-MM') as ToMonth
			, count(*) as Num_Might_Be_Unflagged_Months
		from
			(
			select distinct covered_individual_id, hicn, PaymentDate from opportunities where non_hospice_esrd_might_not_be_in_mmr
			)
		group by covered_individual_id, hicn
		) ptmaybe
	on opps.hicn = ptmaybe.hicn

)
;
vacuum reindex rndadmin.esrd_cases;
analyze rndadmin.esrd_cases;

				--
				--	Report four subsets of results.
				--		1.	Those where MMR and claims are definitely inconsistent, based on an ID match.
				--		2.	Those where MMR and claims might be inconsistent, based on an ID match.
				--		3.	Those where MMR and claims are definitely inconsistent, based on a name-dob-sex match.
				--		4.	Those where MMR and claims might be inconsistent, based on a name-dob-sex match.
				--
select * from rndadmin.esrd_cases where Num_Unflagged_Months > 0 and Num_Might_Be_Unflagged_Months = 0 and not is_lname_sex_dob_match
order by amy_opened
			, Num_Unflagged_Months desc
			, hicn
			, paymentdate
			, firstdos
;

select * from rndadmin.esrd_cases where Num_Unflagged_Months > 0 and Num_Might_Be_Unflagged_Months > 0 and not is_lname_sex_dob_match
order by amy_opened
			, Num_Unflagged_Months desc
			, hicn
			, paymentdate
			, firstdos
;

select * from rndadmin.esrd_cases where Num_Unflagged_Months > 0 and Num_Might_Be_Unflagged_Months = 0 and is_lname_sex_dob_match
order by amy_opened
			, Num_Unflagged_Months desc
			, hicn
			, paymentdate
			, firstdos
;


select * from rndadmin.esrd_cases where Num_Unflagged_Months > 0 and Num_Might_Be_Unflagged_Months > 0 and is_lname_sex_dob_match
order by amy_opened
			, Num_Unflagged_Months desc
			, hicn
			, paymentdate
			, firstdos
;


