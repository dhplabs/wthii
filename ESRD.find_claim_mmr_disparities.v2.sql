
/*

		--
		--	This is the skeleton of fields and joins required to identify
		--	claims with ESRD for which the covered individual's MMR records
		--	do not indicate that our payer-client received ESRD-augmented
		--	premiums for the months in which the ESRD services were rendered.
		--
		--	This skeleton documents the business logic. The full code, with
		--	all the additional fields that need to be included in the output,
		--	follows this skeleton.
		--
with
	mmr as
		(
		select
			PaymentDate
			, HICN
			, CoveredIndividualId
			, ESRD
			, AdjustmentReasonCode
		from ESRD_canonical.mmr
		where ESRD != 'Y' and AdjustmentReasonCode != '07'
		)
select

from
	(
	select
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
			where (ICD_10Indicator = 0 and dx in ('5856','V420','V5631'))
				or (ICD_10Indicator = 1 and
					(left(dx,4) in ('N186','Z940') or left(dx,5) = 'Z4931') )
			)
		)
	group by 
		ClaimNumber
		, CoveredIndividualID
	) cb
inner join 
	(
	select
		ClaimNumber
		, Rendering_Provider_Id
		, CoveredIndividualID
		, FirstDOS
	from ESRD_canonical.med_clm_hdr
	where Claim_Allowed_Amt >= (select min_claim_value from params) 
			or Claim_Amt_Pd >= (select min_claim_value from params) 
	) clm
on cb.CoveredIndividualID = clm.CoveredIndividualID and cb.ClaimNumber = clm.ClaimNumber
left outer join
	(
	select
		Cov_Indl_ID
		, Cov_Indl_HICN
		, Cov_Indl_MBI
		, Covg_Eff_Dt
		, Covg_Term_Dt
	from ESRD_canonical.covered_individual_info
	) cov_indv
on cb.CoveredIndividualID = cov_indv.Cov_Indl_ID
	and (clm.FirstDOS between cov_indv.Covg_Eff_Dt and cov_indv.Covg_Term_Dt)
left outer join mmr mmr_1
on cb.CoveredIndividualID = mmr_1.CoveredIndividualId
	and cov_indv.Cov_Indl_HICN = mmr_1.HICN
	and clm.FirstDOS between mmr_1.PaymentDate and dateadd(mon,1,mmr_1.PaymentDate)
left outer join mmr mmr_2
on cb.CoveredIndividualID = mmr_2.CoveredIndividualId
	and cov_indv.Cov_Indl_MBI = mmr_2.HICN
	and clm.FirstDOS between mmr_2.PaymentDate and dateadd(mon,1,mmr_2.PaymentDate)
left outer join 
	(
	select
		provider_id
	from ESRD_canonical.provider_info
	) prov
on clm.Rendering_Provider_Id = prov.provider_id
order by 
	cb.CoveredIndividualID
	, clm.FirstDOS

*/

create temp table params as
(
	select to_number('500.00','999D99')::numeric(10,2) as min_claim_value
);


drop table if exists rndadmin.opportunities;
create table rndadmin.opportunities 
	diststyle key 
	distkey(covered_individual_id) 
	interleaved sortkey( HICN, PaymentDate, Rendering_Provider_Id )
as
(
with
	mmr as
		(
		select
			PaymentDate
			, HICN
			, CoveredIndividualId
			, Surname
			, Sex
			, BirthDate
			, Hospice
			, ESRD
			, AdjustmentReasonCode
		from ESRD_canonical.mmr
		where (ESRD = 'N' and AdjustmentReasonCode != '07')
		)
	, coverage_info as
		(
		select
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
select
	cb.CoveredIndividualID as covered_individual_id
	, cb.ClaimNumber
	, cb.has_5856
	, cb.has_V420
	, cb.has_V5631
	, cb.has_N186
	, cb.has_Z940
	, cb.has_Z4931
	, clm.NumServiceLines
	, clm.Claim_Allowed_Amt
	, clm.Claim_Amt_Pd
	, coalesce(mmr_1.PaymentDate,mmr_2.PaymentDate) as PaymentDate
	, coalesce(mmr_1.HICN,mmr_2.HICN) as HICN
	, coalesce(mmr_1.CoveredIndividualId,mmr_2.CoveredIndividualId) as CoveredIndividualId
	, coalesce(mmr_1.Surname,mmr_2.Surname) as Surname
	, coalesce(mmr_1.Sex,mmr_2.Sex) as Sex
	, coalesce(mmr_1.BirthDate,mmr_2.BirthDate) as BirthDate
	, coalesce(mmr_1.Hospice,mmr_2.Hospice) as Hospice
	, coalesce(mmr_1.ESRD,mmr_2.ESRD) as ESRD
	, coalesce(mmr_1.AdjustmentReasonCode,mmr_2.AdjustmentReasonCode) as AdjustmentReasonCode
	, clm.FirstDOS
	, clm.LastDOS
	, coalesce(cov_indv_1.Covg_Eff_Dt,null) as Covg_Eff_Dt
	, coalesce(cov_indv_1.Covg_Term_Dt,null) as Covg_Term_Dt
	, ((clm.FirstDOS not between coalesce(cov_indv_1.Covg_Eff_Dt,cov_indv_2.Covg_Eff_Dt) and coalesce(cov_indv_1.Covg_Term_Dt,cov_indv_2.Covg_Term_Dt)) 
			and (clm.LastDOS not between coalesce(cov_indv_1.Covg_Eff_Dt,cov_indv_2.Covg_Eff_Dt) and coalesce(cov_indv_1.Covg_Term_Dt,cov_indv_2.Covg_Term_Dt)))
		as OutsideEligibilityPeriods
	, (datediff(day,coalesce(cov_indv_1.Cov_Indl_DOB,cov_indv_2.Cov_Indl_DOB),clm.LastDOS)::float/(365)::float)::numeric(5,1) as AgeAtService
	, clm.Adjusted_Claim
	, clm.Claim_Status
	, clm.Claim_Type
	, clm.Check_Number
	, clm.Check_Date
	, clm.Processed_Date
	, clm.Received_Date
	, clm.Group_ID
	, clm.Bill_Type
	, clm.Inv_No
	, clm.Claim_Submitted_Charge_Amt
	, clm.DRG_Code
	, clm.DRG_Version
	, clm.Billing_Provider_ID
	, clm.Provider_Pt_Acct_No
	, clm.Rendering_Provider_Id
	, coalesce(cov_indv_1.Family_ID,cov_indv_2.Family_ID) as Family_ID
	, coalesce(cov_indv_1.Cov_Indl_Family_ID_Suffix,cov_indv_2.Cov_Indl_Family_ID_Suffix) as Cov_Indl_Family_ID_Suffix
	, coalesce(cov_indv_1.Cov_Indl_SSN,cov_indv_2.Cov_Indl_SSN) as Cov_Indl_SSN
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
from
	(
	select
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
			where (ICD_10Indicator = 'N' and dx in ('5856','V420','V5631'))
				or (ICD_10Indicator = 'Y' and
					(left(dx,4) in ('N186','Z940') or left(dx,5) = 'Z4931') )
			)
		)
	group by 
		ClaimNumber
		, CoveredIndividualID
	) cb
inner join 
	(
	select
		ClaimNumber
		,Adjusted_Claim
		,Claim_Status
		,Claim_Type
		,Check_Number
		,Check_Date
		,Processed_Date
		,Received_Date
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
		,Claim_Allowed_Amt
		,Claim_Amt_Pd
		,DRG_Code
		,DRG_Version
		,Billing_Provider_ID
		,Provider_Pt_Acct_No
		,Rendering_Provider_Id
	from ESRD_canonical.med_clm_hdr
	where Claim_Allowed_Amt >= (select min_claim_value from params) 
			or Claim_Amt_Pd >= (select min_claim_value from params) 
	) clm
on cb.CoveredIndividualID = clm.CoveredIndividualID and cb.ClaimNumber = clm.ClaimNumber
left outer join coverage_info cov_indv_1
on cb.CoveredIndividualID = cov_indv_1.Cov_Indl_ID
	and ((clm.FirstDOS between cov_indv_1.Covg_Eff_Dt and cov_indv_1.Covg_Term_Dt) 
			or (clm.LastDOS between cov_indv_1.Covg_Eff_Dt and cov_indv_1.Covg_Term_Dt))
left outer join coverage_info cov_indv_2
on cb.CoveredIndividualID = cov_indv_2.Cov_Indl_ID
	and ( cov_indv_2.Covg_Most_Recent_Eff_Dt = cov_indv_2.Covg_Eff_Dt
			and ((clm.FirstDOS not between cov_indv_2.Covg_Eff_Dt and cov_indv_2.Covg_Term_Dt) 
				and (clm.LastDOS not between cov_indv_2.Covg_Eff_Dt and cov_indv_2.Covg_Term_Dt))
		)
left outer join mmr mmr_1
on coalesce(cov_indv_1.Cov_Indl_HICN,cov_indv_2.Cov_Indl_HICN) = mmr_1.HICN and cb.CoveredIndividualID = mmr_1.CoveredIndividualId
	and ((clm.FirstDOS between mmr_1.PaymentDate and add_months(mmr_1.PaymentDate,1))
			or (clm.LastDOS between mmr_1.PaymentDate and add_months(mmr_1.PaymentDate,1)) )
left outer join mmr mmr_2
on coalesce(cov_indv_1.Cov_Indl_MBI,cov_indv_2.Cov_Indl_MBI) = mmr_2.HICN and cb.CoveredIndividualID = mmr_2.CoveredIndividualId
	and ((clm.FirstDOS between mmr_2.PaymentDate and add_months(mmr_2.PaymentDate,1))
			or (clm.LastDOS between mmr_2.PaymentDate and add_months(mmr_2.PaymentDate,1)) )
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
on clm.Rendering_Provider_Id = prov.provider_id
where 	coalesce(cov_indv_1.Cov_Indl_ID,cov_indv_2.Cov_Indl_ID) is null
		or (coalesce(cov_indv_1.Cov_Indl_ID,cov_indv_2.Cov_Indl_ID) is not null 
			and coalesce(cov_indv_1.Cov_Indl_HICN,cov_indv_2.Cov_Indl_HICN) is null 
			and (datediff(day,coalesce(cov_indv_1.Cov_Indl_DOB,cov_indv_2.Cov_Indl_DOB),clm.LastDOS)::float/(365)::float)::numeric(5,1) >= 65.0
			) 
		or (coalesce(cov_indv_1.Cov_Indl_ID,cov_indv_2.Cov_Indl_ID) is not null 
			and coalesce(cov_indv_1.Cov_Indl_HICN,cov_indv_2.Cov_Indl_HICN) is not null 
			and (mmr_1.paymentdate is not null or mmr_2.paymentdate is not null)
			)
)
;




select * from rndadmin.opportunities
order by 
	covered_individual_id
	, PaymentDate
	, FirstDos;




drop table if exists ESRD_outputs.opportunities;
create table ESRD_outputs.opportunities
	diststyle key 
	distkey(CoveredIndividualID) 
	interleaved sortkey(PaymentDate,Rendering_Provider_Id)
as
	(
	select
		*
	from opportunities curr
	left outer join ESRD_peristent.patient_by_provider_by_month_already_seen prev
	on curr.CoveredIndividualID = prev.CoveredIndividualID
		and curr.PaymentDate = prev.PaymentDate
		and curr.Rendering_Provider_Id = prev.Rendering_Provider_Id
	where prev.CoveredIndividualID is null and prev.PaymentDate is null and prev.Rendering_Provider_Id is null
	)
;


create temp table already_seen
	diststyle key 
	distkey(CoveredIndividualID) 
	interleaved sortkey(PaymentDate,Rendering_Provider_Id)
as
	(
	select * from ESRD_persistent.patient_by_provider_by_month_already_seen
	)
;

insert into ESRD_peristent.patient_by_provider_by_month_already_seen
	(
	select
		current_date as recorded_date
		, CoveredIndividualID
		, PaymentDate
		, Rendering_Provider_Id
	from
		(
		select distinct
			CoveredIndividualID
			, PaymentDate
			, Rendering_Provider_Id
		from ESRD_outputs.opportunities
		) curr
	left outer join already_seen prev
	on curr.CoveredIndividualID = prev.CoveredIndividualID
		and curr.PaymentDate = prev.PaymentDate
		and curr.Rendering_Provider_Id = prev.Rendering_Provider_Id
	where prev.CoveredIndividualID is null and prev.PaymentDate is null and prev.Rendering_Provider_Id is null
	)
;
