


drop table if exists ESRD_canonical.covered_individual_info;
CREATE TABLE ESRD_canonical.covered_individual_info
(  
	Subscriber_ID	varchar(20)	encode	zstd
	,Family_ID	varchar(10)	encode	lzo
	,Cov_Indl_Family_ID_Suffix	varchar(10)	encode	lzo
	,Cov_Indl_ID	varchar(50)	encode	zstd
	,Cov_Indl_SSN	varchar(9)	encode	zstd
	,Cov_Indl_HICN	varchar(15)	encode	zstd
	,Cov_Indl_MBI	varchar(15)	encode	lzo
	,Covg_Eff_Dt	date	encode	bytedict
	,Covg_Term_Dt	date	encode	bytedict
	,Covg_Most_Recent_Eff_Dt	date	encode	bytedict
	,Cov_Indl_Reln_To_Subscr	varchar(6)	encode	zstd
	,Cov_Indl_FName	varchar(25)	encode	zstd
	,Cov_Indl_L_Name	varchar(25)	encode	zstd
	,Cov_Indl_Street1	varchar(100)	encode	zstd
	,Cov_Indl_Street2	varchar(100)	encode	zstd
	,Cov_Indl_City	varchar(50)	encode	zstd
 	,Cov_Indl_State	varchar(2)	encode	zstd
	,Cov_Indl_Zip	varchar(10)	encode	bytedict
 	,Cov_Indl_Phone1	varchar(20)	encode	zstd
	,Cov_Indl_Phone1_Ext	int	encode	lzo
	,Cov_Indl_Phone2	varchar(20)	encode	zstd
	,Cov_Indl_Phone2_Ext	int	encode	lzo
	,Cov_Indl_Email	varchar(100)	encode	zstd
	,Cov_Indl_Gender	varchar (1)	encode	zstd
	,Cov_Indl_DOB	date	encode	delta32k
	,Cov_Indl_DOD	date	encode	lzo
	,Cov_Indl_HIPAA_Indicator	boolean	encode	zstd
	,Cov_Indl_Special_Handling 	boolean	encode	zstd
	,Covg_Type	varchar(1)	encode	lzo
	,Covg_Election	varchar(1)	encode	lzo
	,Empl_Status	varchar(1)	encode	lzo
	,PCP	varchar(15)	encode	zstd
)
diststyle key
distkey(Cov_Indl_ID)
interleaved sortkey(Cov_Indl_HICN,Covg_Eff_Dt,Covg_Term_Dt,Cov_Indl_L_Name,Cov_Indl_DOB,Cov_Indl_Gender)
; 

			--
			--	For HFNY, selected columns of Covered Individual Info (Eligibility Info)
			--	are culled from clean_raw (HISTORY) and copied without change into
			--	ESRD canonical form. There are two exceptions.
			--
			--	1. In HFNY data, effective date ranges overlap. Where that occurs, date ranges
			--	are segmented into disjoint, contiguous ranges.
			--	
			--	2. For individuals with more than one record (for example, because the disenrolled
			--	and then subsequently re-enrolled), the most recent Effective (Start) Date is
			--	carried around on all records, so that, when a claim has dates-of-service that
			--	fall outside of all effective ranges, the claim will join to only one record,'
			--	the one where the Effective Date matches the most recent effective date, and
			--	the claim is flagged as perhaps having been ineligible.
			--
insert into ESRD_canonical.covered_individual_info
	(
	select distinct
		  (MemberID)::varchar(20) as    Subscriber_ID
		, (FamilyID)::varchar(10) as Family_ID
		, (CoveredIndividualsFamilyIDSuffix)::varchar(10) as Cov_Indl_Family_ID_Suffix
		, (btrim(a.CoveredIndividualID))::varchar(50) as Cov_Indl_ID
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
-- analyze compression ESRD_canonical.covered_individual_info;
vacuum reindex ESRD_canonical.covered_individual_info;
analyze ESRD_canonical.covered_individual_info;

drop table if exists ESRD_canonical.mmr;
create table ESRD_canonical.mmr
(	
	PaymentDate	date	encode	bytedict
	, HICN	varchar(12)	encode	zstd
	, Surname	varchar(7)	encode	zstd
	, Sex	varchar(1)	encode	zstd
	, BirthDate	date	encode	zstd
	, Hospice	varchar(8)	encode	zstd
	, ESRD	varchar(8)	encode	zstd
	, AdjustmentReasonCode	varchar(64)	encode	zstd
	, has_ESRD boolean encode zstd
	, might_have_ESRD boolean encode zstd
	, has_Hospice boolean encode zstd
	, might_have_Hospice boolean encode zstd
	, monthlypaymt_adjustmt_amounta numeric(10,2) encode zstd
	, monthlypaymt_adjustmt_amountb numeric(10,2) encode zstd
	, msapaymt_adjustmt_start_date	varchar(10)	encode	zstd
	, msapaymt_adjustmt_end_date	varchar(10)	encode	zstd
)
diststyle even
--distkey(CoveredIndividualId)
interleaved sortkey(hicn,PaymentDate,esrd,AdjustmentReasonCode,BirthDate,Surname,Sex)
;


			--
			--	The MMR commonly has multiple rows in any given month, each row 
			--	containing some kind of update action that was taken by CMS during
			--	the given month. To facilitate analysis for ESRD, the rows in each
			--	given month need to be flattened to a single row, with no loss of
			--	information in all fields.
			--
insert into ESRD_canonical.mmr
	(
	select distinct
		PaymentDate::date
		, HICN::varchar(12)
		, Surname::varchar(7)
		, Sex::varchar(1)
		, BirthDate::date
		, Hospice::varchar(8)
		, ESRD::varchar(8)
		, AdjustmentReasonCode::varchar(64)
		, (ESRD = 'Y' or has_08 > 0)::boolean as has_ESRD
		, (ESRD not in ('Y','N') and has_08 = 0)::boolean as might_have_ESRD
		, (Hospice = 'Y' or has_07 > 0)::boolean as has_Hospice
		, (Hospice not in ('Y','N') and has_07 = 0)::boolean as might_have_Hospice
		, monthlypaymt_adjustmt_amounta::numeric(10,2)
		, monthlypaymt_adjustmt_amountb::numeric(10,2)
		, msapaymt_adjustmt_start_date::varchar(10)
		, msapaymt_adjustmt_end_date::varchar(10)
	from
		(
		select
			PaymentDate
			, HICN
			, Surname
			, Sex
			, BirthDate
			, Hospice
			, ESRD
			, AdjustmentReasonCode
			, has_07
			, has_08
			, sum(distinct monthlypaymt_adjustmt_amounta) as monthlypaymt_adjustmt_amounta
			, sum(distinct monthlypaymt_adjustmt_amountb) as monthlypaymt_adjustmt_amountb
			, msapaymt_adjustmt_start_date
			, msapaymt_adjustmt_end_date
		from
			(
			select 
				PaymentDate
				, HICN
				, Surname
				, Sex
				, BirthDate
				, listagg(distinct Hospice, ':::') within group (order by Hospice) over (partition by HICN, PaymentDate) as Hospice
				, listagg(distinct ESRD, ':::') within group (order by ESRD) over (partition by HICN, PaymentDate) as ESRD
				, listagg(distinct AdjustmentReasonCode, ':::') within group (order by AdjustmentReasonCode) over (partition by HICN, PaymentDate) as AdjustmentReasonCode
				, sum(has_07) over (partition by HICN, PaymentDate) as has_07
				, sum(has_08) over (partition by HICN, PaymentDate) as has_08
				, monthlypaymt_adjustmt_amounta::numeric(10,2) as monthlypaymt_adjustmt_amounta
				, monthlypaymt_adjustmt_amountb::numeric(10,2) as monthlypaymt_adjustmt_amountb
				, listagg(distinct msapaymt_adjustmt_start_date, ':::') within group (order by msapaymt_adjustmt_start_date) over (partition by HICN, PaymentDate) as msapaymt_adjustmt_start_date
				, listagg(distinct msapaymt_adjustmt_end_date, ':::') within group (order by msapaymt_adjustmt_end_date) over (partition by HICN, PaymentDate) as msapaymt_adjustmt_end_date
			from
				( 
				select distinct
					mmr.payment_date as PaymentDate,
					mmr.hicn as HICN,
					mmr.surname as Surname,
					mmr.sex as Sex,
					mmr.birth_date as BirthDate,
					coalesce(mmr.hospice,'N') as Hospice,
					coalesce(mmr.esrd,'N') as ESRD,
					mmr.adjustmt_reason_code as AdjustmentReasonCode,
					case when mmr.adjustmt_reason_code = '07' then 1 else 0 end as has_07,			
					case when mmr.adjustmt_reason_code = '08' then 1 else 0 end as has_08,
					monthlypaymt_adjustmt_amounta,
					monthlypaymt_adjustmt_amountb,
					to_char(msapaymt_adjustmt_start_date,'YYYY-MM-DD') as msapaymt_adjustmt_start_date,
					to_char(msapaymt_adjustmt_end_date,'YYYY-MM-DD') as msapaymt_adjustmt_end_date
				from ESRD_clean_raw.mmr mmr
				)
			)
		group by
			PaymentDate
			, HICN
			, Surname
			, Sex
			, BirthDate
			, Hospice
			, ESRD
			, AdjustmentReasonCode
			, has_07
			, has_08
			, msapaymt_adjustmt_start_date
			, msapaymt_adjustmt_end_date
		)
	)
;
--analyze compression ESRD_canonical.mmr;
vacuum reindex ESRD_canonical.mmr;
analyze ESRD_canonical.mmr;


			--
			--	For HFNY, select columns of provider information are culled from clean_raw (HISTORY)
			--	and copied unchanged into the canonical provider info.
			--
drop table if exists ESRD_canonical.provider_info;
CREATE TABLE ESRD_canonical.provider_info
(
	provider_id	varchar(20) 	encode	zstd
	,provider_NPI	varchar(10)	encode	zstd
	,provider_Name	varchar(100)	encode	zstd
	,provider_Other_Nm	varchar(100)	encode	lzo
	,provider_Org_Name	varchar(100) 	encode	zstd
	,provider_Tax_ID	varchar(10)	encode	zstd
	,provider_Street1	varchar(100)	encode	zstd
	,provider_Street2	varchar(100)	encode	lzo
	,provider_City	varchar(50)	encode	zstd
	,provider_State	varchar(2)	encode	zstd
	,provider_Zip_Code	varchar(10)	encode	zstd
	,provider_Phone1	varchar(20)	encode	zstd
	,provider_Ph1_ext	varchar(10)	encode	lzo
	,provider_Fax	varchar(20)	encode	zstd
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
--analyze compression ESRD_canonical.provider_info;
vacuum reindex ESRD_canonical.provider_info;
analyze ESRD_canonical.provider_info;





drop table if exists ESRD_canonical.med_clm_hdr;
CREATE TABLE ESRD_canonical.med_clm_hdr
(
	ClaimNumber	varchar(50)	encode	zstd
	,Adjusted_Claim	varchar(50)	encode	zstd
	,Claim_Status	varchar(32)	encode	zstd
	,Claim_Type	varchar(1)	encode	zstd
	,Check_Number	varchar(128)	encode	zstd
	,Check_Date	varchar(128) 	encode	zstd
	,Processed_Date	varchar(128) 	encode	zstd
	,Received_Date	varchar(128) 	encode	zstd
	,Subscriber_ID	varchar(20)	encode	zstd
	,CoveredIndividualID	varchar(20)	encode	zstd
	,FirstDOS	date	encode	zstd
	,LastDOS	date	encode	zstd
	,NumServiceLines	integer	encode	zstd
	,Client_ID	int	encode	lzo
	,Group_ID	varchar(30)	encode	bytedict
	,Bill_Type	varchar(4)	encode	zstd
	,Inv_No	varchar(20)	encode	lzo
	,Claim_Submitted_Charge_Amt	numeric(10,2)	encode	zstd
	,Claim_Allowed_Amt	varchar(128)	encode	zstd
	,Claim_Amt_Pd	varchar(128)	encode	zstd
	,DRG_Code	varchar(10)	encode	zstd
	,DRG_Version	varchar(20)	encode	lzo
	,Billing_Provider_ID	varchar(20)	encode	zstd
	,Provider_Pt_Acct_No	varchar(256)	encode	zstd
	,Rendering_Provider_Id	varchar(20)	encode	zstd
)
diststyle key
distkey(CoveredIndividualID)
interleaved sortkey(ClaimNumber,FirstDOS,Rendering_Provider_Id)
;

			--
			--	For HFNY, selected columns of the Claim Header
			--	are culled from clean_raw (HISTORY) and copied without change into
			--	ESRD canonical form. There are two exceptions.
			--
			--	1. Multiple header rows for a given claim number reflect updates made to the
			--	claim over time. These need to be flattened to a single row, with no loss of
			--	information.
			--	
			--	2. The date range traversed by the service lines on a claim needs to be 
			--	normalized to appear in one pair of start-end columns (FirstDOS, LastDOS)
			--	whether institutional (Admit date, Discharge date) or professional (FirstDOS,
			--	LastDOS); and when only one of the start-end pair is populated, to put the
			--	date that appears in one also in the other, to reflect all services rendered
			--	on a single DOS.
			--
insert into ESRD_canonical.med_clm_hdr
	(
	select
		ClaimNumber
		,Adjusted_Claim
		,(listagg(distinct Claim_Status,':::') within group (order by Processed_Date))::varchar(32) as Claim_Status
		,Claim_Type
		,(listagg(distinct Check_Number,':::') within group (order by Processed_Date))::varchar(128) as Check_Number
		,(listagg(distinct to_char(Check_Date,'YYYY-MM-DD'),':::') within group (order by Processed_Date))::varchar(128) as Check_Date
		,(listagg(distinct to_char(Processed_Date,'YYYY-MM-DD'),':::') within group (order by Processed_Date))::varchar(128) as Processed_Date
		,(listagg(distinct to_char(Received_Date,'YYYY-MM-DD'),':::') within group (order by Processed_Date))::varchar(128) as Received_Date
		,Subscriber_ID
		,CoveredIndividualID
		,FirstDOS
		,LastDOS
		,NumServiceLines
		,Client_ID
		,Group_ID
		,Bill_Type
		,Inv_No
		,Claim_Submitted_Charge_Amt
		,(listagg(distinct Claim_Allowed_Amt::varchar(10),':::') within group (order by Processed_Date))::varchar(128) as Claim_Allowed_Amt
		,(listagg(distinct Claim_Amt_Pd::varchar(10),':::') within group (order by Processed_Date))::varchar(128) as varchar
		,DRG_Code
		,DRG_Version
		,Billing_Provider_ID
		,(listagg(distinct Provider_Pt_Acct_No,':::') within group (order by Processed_Date))::varchar(256) as Provider_Pt_Acct_No
		,Rendering_Provider_Id
	from
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
			, (btrim(a.CoveredIndividualID))::varchar(50) as CoveredIndividualID
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
	group by
		CoveredIndividualID
		,ClaimNumber
		,Adjusted_Claim
		,Claim_Type
		,Subscriber_ID
		,FirstDOS
		,LastDOS
		,NumServiceLines
		,Client_ID
		,Group_ID
		,Bill_Type
		,Inv_No
		,Claim_Submitted_Charge_Amt
		,DRG_Code
		,DRG_Version
		,Billing_Provider_ID
		,Rendering_Provider_Id
	)
	
;
--analyze compression ESRD_canonical.med_clm_hdr;
vacuum reindex ESRD_canonical.med_clm_hdr;
analyze ESRD_canonical.med_clm_hdr;



drop table if exists ESRD_canonical.diagnosis_codes;
create table ESRD_canonical.diagnosis_codes
	(
	CoveredIndividualID	varchar(50)	encode	zstd
	, ClaimNumber varchar(50)		encode	zstd
	, ICD_10Indicator varchar(1)		encode	zstd
	, dx	varchar(10)	encode	zstd
	)
diststyle key
distkey(CoveredIndividualID)
interleaved sortkey(ClaimNumber,dx)
;

			--
			--	The sparse array in the claim header that contains from 1 - 40 diagnosis codes
			--	is condensed to rows containing one non-null diagnosis per covered individual 
			--	per claim. Duplication of any given diagnosis on a claim is meaningless, and
			--	so such duplication is silently eliminated.
			--
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
--analyze compression ESRD_canonical.diagnosis_codes;
vacuum reindex ESRD_canonical.diagnosis_codes;
analyze ESRD_canonical.diagnosis_codes;


			--
			--	Select columns from each service line are copied from clean_raw
			--	(HISTORY) to canonical.
			--
drop table if exists ESRD_canonical.procedure_codes;
create table ESRD_canonical.procedure_codes
	(
	CoveredIndividualID	varchar(50)	encode	zstd
	, ClaimNumber	varchar(50)	encode	zstd
	, LineNumber	varchar(15)	encode	zstd
	, cpt_hcpcs	varchar(10)	encode	zstd
	, chargeamount	numeric(10,2)	encode	zstd
	, allowedamount	numeric(10,2)	encode	zstd
	, units	float	encode	zstd
	)
diststyle key
distkey(CoveredIndividualID)
interleaved sortkey(ClaimNumber,cpt_hcpcs)
;

insert into ESRD_canonical.procedure_codes
	(
	select distinct
		CoveredIndividualID::varchar(50)
		, ClaimNumber::varchar(50)
		, LineNumber::varchar(15)
		, ProcedureCode::varchar(10) as cpt_hcpcs
		, chargeamount::numeric(10,2)
		, allowedamount::numeric(10,2)
		, units::float
	from ESRD_clean_raw.medical_claims
	where ProcedureCode is not null and btrim(ProcedureCode) != ''
	)
;

--analyze compression ESRD_canonical.diagnosis_codes;
vacuum reindex ESRD_canonical.procedure_codes;
analyze ESRD_canonical.procedure_codes;
