


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
	,cov_indl_name_sex_dob	varchar(32)	encode	zstd
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
compound sortkey(Cov_Indl_ID,Cov_Indl_HICN,Cov_Indl_L_Name,Cov_Indl_DOB,Cov_Indl_Gender,Covg_Eff_Dt,Covg_Term_Dt)
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
		, case when CoveredIndividualDateOfBirth is null or CoveredIndividualDateOfBirth = to_date('19010101','YYYYMMDD') then null
			else left(btrim(upper(CoveredIndividualLastName)),7) || ':::' || upper(CoveredIndividualGender) || ':::' || to_char(CoveredIndividualDateOfBirth,'YYYY-MM-DD')::varchar(32) 
			end as cov_indl_name_sex_dob
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
analyze ESRD_canonical.covered_individual_info;
vacuum sort only ESRD_canonical.covered_individual_info;
analyze ESRD_canonical.covered_individual_info;


drop table if exists ESRD_canonical.mmr;
create table ESRD_canonical.mmr
(	
	PaymentDate	date	encode	bytedict
	, run_file_date	date	encode	bytedict
	, HICN	varchar(12)	encode	zstd
	, Surname	varchar(7)	encode	zstd
	, Sex	varchar(1)	encode	zstd
	, name_sex_dob	varchar(32)	encode	zstd
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
	, paymt_adjustmt_month_total_parta	varchar(32) encode zstd
	, paymt_adjustmt_month_total_partb	varchar(32) encode zstd
	, esrd_msp_flag	varchar(16) encode zstd
	, parta_ma_paymt_total	numeric(10,2) encode zstd
	, partb_ma_paymt_total	numeric(10,2) encode zstd
	, ma_paymt_total	numeric(10,2) encode zstd

)
diststyle even
--distkey(CoveredIndividualId)
compound sortkey(hicn,PaymentDate,Surname,BirthDate,Sex)
;


			--
			--	The MMR commonly has multiple rows in any given month, each row 
			--	containing some kind of update action that was taken by CMS during
			--	the given month. 
			--
insert into ESRD_canonical.mmr
	(
	select distinct
		PaymentDate::date
		, run_file_date::date
		, HICN::varchar(12)
		, Surname::varchar(7)
		, Sex::varchar(1)
		, upper(left(btrim(surname),7) || ':::' || sex  || ':::' || to_char(birthdate,'YYYY-MM-DD'))::varchar(32) as name_sex_dob
		, BirthDate::date
		, Hospice::varchar(8)
		, ESRD::varchar(8)
		, AdjustmentReasonCode::varchar(64)
		, (ESRD_month = 'Y' or month_has_08 > 0)::boolean as has_ESRD
		, (ESRD_month not in ('Y','N') and month_has_08 = 0)::boolean as might_have_ESRD
		, (Hospice_month = 'Y' or month_has_07 > 0)::boolean as has_Hospice
		, (Hospice_month not in ('Y','N') and month_has_07 = 0)::boolean as might_have_Hospice
		, monthlypaymt_adjustmt_amounta::numeric(10,2)
		, monthlypaymt_adjustmt_amountb::numeric(10,2)
		, msapaymt_adjustmt_start_date::varchar(10)
		, msapaymt_adjustmt_end_date::varchar(10)
		, paymt_adjustmt_month_total_parta::varchar(2)
		, paymt_adjustmt_month_total_partb::varchar(2)
		, esrd_msp_flag::varchar(1)
		, parta_ma_paymt_total::numeric(10,2)
		, partb_ma_paymt_total::numeric(10,2)
		, ma_paymt_total::numeric(10,2)
	from
		(
		select distinct
			mmr.payment_date as PaymentDate,
			mmr.run_file_date,
			mmr.hicn as HICN,
			upper(mmr.surname) as Surname,
			upper(mmr.sex) as Sex,
			mmr.birth_date as BirthDate,
			coalesce(mmr.hospice,'N') as Hospice,
			coalesce(mmr.esrd,'N') as ESRD,
			mmr.adjustmt_reason_code as AdjustmentReasonCode,
			sum(case when mmr.adjustmt_reason_code = '07' then 1 else 0 end) over (partition by PaymentDate,HICN) as month_has_07,
			sum(case when mmr.adjustmt_reason_code = '08' then 1 else 0 end) over (partition by PaymentDate,HICN) as month_has_08,
			listagg(distinct coalesce(mmr.hospice,'N'), ':::') within group (order by Hospice) over (partition by HICN, PaymentDate) as Hospice_month,
			listagg(distinct coalesce(mmr.esrd,'N'), ':::') within group (order by ESRD) over (partition by HICN, PaymentDate) as ESRD_month,
			monthlypaymt_adjustmt_amounta,
			monthlypaymt_adjustmt_amountb,
			to_char(msapaymt_adjustmt_start_date,'MM/DD/YYYY') as msapaymt_adjustmt_start_date,
			to_char(msapaymt_adjustmt_end_date,'MM/DD/YYYY') as msapaymt_adjustmt_end_date,
			paymt_adjustmt_month_total_parta,
			paymt_adjustmt_month_total_partb,
			esrd_msp_flag,
			parta_ma_paymt_total,
			partb_ma_paymt_total,
			ma_paymt_total
		from ESRD_clean_raw.mmr mmr
		)
	)
;
--analyze compression ESRD_canonical.mmr;
analyze ESRD_canonical.mmr;
vacuum sort only ESRD_canonical.mmr;
analyze ESRD_canonical.mmr;



			--
			--	Crosswalk Member Info to the MMR, because the member info, being
			--	a heap of historical records, is not a good basis for a clean join
			--	for crosswalking.
			--
drop table if exists ESRD_canonical.id_to_hicn_and_name_map;
create table ESRD_canonical.id_to_hicn_and_name_map
	(
	  Cov_Indl_ID	varchar(50)	encode	zstd
	, Cov_Indl_HICN_01	varchar(15)	encode	zstd
	, Cov_Indl_HICN_02	varchar(15)	encode	zstd
	, Cov_Indl_HICN_03	varchar(15)	encode	zstd
	, Cov_Indl_HICN_04	varchar(15)	encode	zstd
	, Cov_Indl_MBI_01	varchar(15)	encode	lzo
	, Cov_Indl_MBI_02	varchar(15)	encode	lzo
	, Cov_Indl_MBI_03	varchar(15)	encode	lzo
	, Cov_Indl_MBI_04	varchar(15)	encode	lzo
	, cov_indl_name_sex_dob_01	varchar(32)	encode	zstd
	, cov_indl_name_sex_dob_02	varchar(32)	encode	zstd
	, cov_indl_name_sex_dob_03	varchar(32)	encode	zstd
	, cov_indl_name_sex_dob_04	varchar(32)	encode	zstd
	, cov_indl_name_sex_dob_05	varchar(32)	encode	zstd
	, cov_indl_name_sex_dob_06	varchar(32)	encode	zstd
	, no_id_to_hicn_mmr_match	boolean	encode	raw
	, no_id_to_mbi_mmr_match	boolean	encode	raw
	, no_id_to_id_mmr_match	boolean	encode	raw
	)
diststyle key
distkey(Cov_Indl_ID)
compound sortkey(Cov_Indl_ID)
;
insert into ESRD_canonical.id_to_hicn_and_name_map
	(
	with
		valid_hicns_mbis as
			(
					--
					--	The MMR is the source of truth for the set of the client's
					--	members' HICNs/MBIs.
					--
			select distinct
				hicn
			from ESRD_canonical.mmr
			)
		, distinct_hicns as
			(
					--
					--	Get the HICNs for each covered individual in the member info.
					--
			select
				row_number() over (partition by Cov_Indl_ID) as hicn_num
				, Cov_Indl_ID
				, Cov_Indl_HICN
			from
				(
				select distinct
					Cov_Indl_ID
					, Cov_Indl_HICN
				from ESRD_canonical.covered_individual_info
				where Cov_Indl_HICN is not null and btrim(Cov_Indl_HICN) != ''
				)
			)
		, flattened_hicns as
			(
					--
					--	Get upto four HICNs. Should typically be at most two, one of which
					--	is actually an mbi, when the client--like CMS--uses one column to
					--	contain either kind of identifier, only one of which can be applicable
					--	in any given month More than four indicates an error in the member info.
					--
			select distinct
				a.Cov_Indl_ID
				, a.hicn as hicn_01
				, b.hicn as hicn_02
				, c.hicn as hicn_03
				, d.hicn as hicn_04
			from 
				(
				select distinct
					Cov_Indl_ID
					, m.hicn as hicn
				from distinct_hicns h
				left outer join valid_hicns_mbis m
				on h.Cov_Indl_HICN = m.hicn
				where hicn_num = 1
				) a
			left outer join 
				(
				select distinct
					Cov_Indl_ID
					, m.hicn as hicn
				from distinct_hicns h
				left outer join valid_hicns_mbis m
				on h.Cov_Indl_HICN = m.hicn
				where hicn_num = 2
				) b
			on a.Cov_Indl_ID = b.Cov_Indl_ID
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, m.hicn as hicn
				from distinct_hicns h
				left outer join valid_hicns_mbis m
				on h.Cov_Indl_HICN = m.hicn
				where hicn_num = 3
				) c
			on a.Cov_Indl_ID = c.Cov_Indl_ID
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, m.hicn as hicn
				from distinct_hicns h
				left outer join valid_hicns_mbis m
				on h.Cov_Indl_HICN = m.hicn
				where hicn_num = 4
				) d
			on a.Cov_Indl_ID = d.Cov_Indl_ID
			)
		, distinct_mbis as
			(
					--
					--	Get the MBIs for each covered individual in the member info.
					--	N.b., not applicable to HFNY, which comingles HICNs and MBIs in 
					--	a single medicare identifier column; but coded this way in
					--	anticipation of a client that sends each in a separate column.
					--
			select
				row_number() over (partition by Cov_Indl_ID) as mbi_num
				, Cov_Indl_ID
				, Cov_Indl_mbi
			from
				(
				select distinct
					Cov_Indl_ID
					, Cov_Indl_mbi
				from ESRD_canonical.covered_individual_info
				where Cov_Indl_mbi is not null and btrim(Cov_Indl_mbi) != ''
				)
			)
		, flattened_mbis as
			(
					--
					--	Get upto four MBIs. Should typically be only one, maybe two.
					--	More than four indicates an error in the member info.
					--
			select distinct
				a.Cov_Indl_ID
				, a.mbi as mbi_01
				, b.mbi as mbi_02
				, c.mbi as mbi_03
				, d.mbi as mbi_04
			from 
				(
				select distinct
					Cov_Indl_ID
					, m.hicn as mbi
				from distinct_mbis h
				left outer join valid_hicns_mbis m
				on h.Cov_Indl_mbi = m.hicn
				where mbi_num = 1
				) a
			left outer join 
				(
				select distinct
					Cov_Indl_ID
					, m.hicn as mbi
				from distinct_mbis h
				left outer join valid_hicns_mbis m
				on h.Cov_Indl_mbi = m.hicn
				where mbi_num = 2
				) b
			on a.Cov_Indl_ID = b.Cov_Indl_ID
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, m.hicn as mbi
				from distinct_mbis h
				left outer join valid_hicns_mbis m
				on h.Cov_Indl_mbi = m.hicn
				where mbi_num = 3
				) c
			on a.Cov_Indl_ID = c.Cov_Indl_ID
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, m.hicn as mbi
				from distinct_mbis h
				left outer join valid_hicns_mbis m
				on h.Cov_Indl_mbi = m.hicn
				where mbi_num = 4
				) d
			on a.Cov_Indl_ID = d.Cov_Indl_ID
			)
		, distinct_name_sex_dobs as
			(
			select
					--
					--	Get the name-sex-dob strings, for variations like
					--	De Lionel, DeLionel and D'Lionel.
					--
				row_number() over (partition by Cov_Indl_ID) as name_sex_dob_num
				, Cov_Indl_ID
				, cov_indl_name_sex_dob
			from
				(
				select distinct
					Cov_Indl_ID
					, cov_indl_name_sex_dob
				from ESRD_canonical.covered_individual_info
				where cov_indl_name_sex_dob is not null and btrim(cov_indl_name_sex_dob) != ''
				)
			)
		, flattened_name_sex_dobs as
			(
					--
					--	Get upto six name-sex-dob strings. Should typically be one or
					--	two, but since these fields are commonly entered by hand, typos
					--	are common.
					--
			select distinct
				a.Cov_Indl_ID
				, a.name_sex_dob as name_sex_dob_01
				, b.name_sex_dob as name_sex_dob_02
				, c.name_sex_dob as name_sex_dob_03
				, d.name_sex_dob as name_sex_dob_04
				, e.name_sex_dob as name_sex_dob_05
				, f.name_sex_dob as name_sex_dob_06
			from 
				(
				select distinct
					Cov_Indl_ID
					, cov_indl_name_sex_dob as name_sex_dob
				from distinct_name_sex_dobs
				where name_sex_dob_num = 1
				) a
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, cov_indl_name_sex_dob as name_sex_dob
				from distinct_name_sex_dobs
				where name_sex_dob_num = 2
				) b
			on a.Cov_Indl_ID = b.Cov_Indl_ID
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, cov_indl_name_sex_dob as name_sex_dob
				from distinct_name_sex_dobs
				where name_sex_dob_num = 3
				) c
			on a.Cov_Indl_ID = c.Cov_Indl_ID
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, cov_indl_name_sex_dob as name_sex_dob
				from distinct_name_sex_dobs
				where name_sex_dob_num = 4
				) d
			on a.Cov_Indl_ID = d.Cov_Indl_ID
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, cov_indl_name_sex_dob as name_sex_dob
				from distinct_name_sex_dobs
				where name_sex_dob_num = 5
				) e
			on a.Cov_Indl_ID = e.Cov_Indl_ID
			left outer join
				(
				select distinct
					Cov_Indl_ID
					, cov_indl_name_sex_dob as name_sex_dob
				from distinct_name_sex_dobs
				where name_sex_dob_num = 6
				) f
			on a.Cov_Indl_ID = f.Cov_Indl_ID
			)
	select
				--
				--	Gather idenifiers found into a crosswalk keyed by covered
				--	individual id, along with flags indicating what was encountered,
				--	to govern how the crosswalk is used for joining claims to mmr.
				--
		id.Cov_Indl_ID
		, hicns.hicn_01
		, hicns.hicn_02
		, hicns.hicn_03
		, hicns.hicn_04
		, mbis.mbi_01
		, mbis.mbi_02
		, mbis.mbi_03
		, mbis.mbi_04
		, nsd.name_sex_dob_01
		, nsd.name_sex_dob_02
		, nsd.name_sex_dob_03
		, nsd.name_sex_dob_04
		, nsd.name_sex_dob_05
		, nsd.name_sex_dob_06
		, hicns.hicn_01 is null and hicns.hicn_02 is null and hicns.hicn_03 is null and hicns.hicn_04 is null
			as no_id_to_hicn_mmr_match
		, mbis.mbi_01 is null and mbis.mbi_02 is null and mbis.mbi_03 is null and mbis.mbi_04 is null
			as no_id_to_mbi_mmr_match
		, hicns.hicn_01 is null and hicns.hicn_02 is null and hicns.hicn_03 is null and hicns.hicn_04 is null
			and mbis.mbi_01 is null and mbis.mbi_02 is null and mbis.mbi_03 is null and mbis.mbi_04 is null
				as no_id_to_id_mmr_match
	from
		(
		select distinct
			Cov_Indl_ID
		from
			(
			select distinct Cov_Indl_ID from flattened_hicns
			union all
			select distinct Cov_Indl_ID from flattened_mbis
			union all
			select distinct Cov_Indl_ID from flattened_name_sex_dobs
			)
		) id
	left outer join flattened_hicns hicns
	on id.Cov_Indl_ID = hicns.Cov_Indl_ID
	left outer join flattened_mbis mbis
	on id.Cov_Indl_ID = mbis.Cov_Indl_ID
	left outer join flattened_name_sex_dobs nsd
	on id.Cov_Indl_ID = nsd.Cov_Indl_ID
	)
;
analyze ESRD_canonical.id_to_hicn_and_name_map;
vacuum sort only ESRD_canonical.id_to_hicn_and_name_map;
analyze ESRD_canonical.id_to_hicn_and_name_map;

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
	,provider_taxo_code	varchar(100)	encode	zstd
	,provider_primary_specialty	varchar(10)	encode	zstd
	,provider_secondary_specialty	varchar(10)	encode	zstd
)
diststyle even
compound sortkey(provider_id)
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
		, HealthcareProviderTaxonomyCode::varchar(100) as provider_taxo_code
		, PrimarySpecialty::varchar(10) as provider_primary_specialty
		, SecondarySpecialty::varchar(10) as provider_secondary_specialty
	from ESRD_clean_raw.provider_info
	)
;
--analyze compression ESRD_canonical.provider_info;
analyze ESRD_canonical.provider_info;
vacuum sort only ESRD_canonical.provider_info;
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
	,PlanType	varchar(20)	encode	zstd
)
diststyle key
distkey(CoveredIndividualID)
compound sortkey(CoveredIndividualID,ClaimNumber,FirstDOS)
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
		,PlanType
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
			, (upper(a.a_funding_cd))::varchar(50) as PlanType
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
		,PlanType
	)
	
;
--analyze compression ESRD_canonical.med_clm_hdr;
analyze ESRD_canonical.med_clm_hdr;
vacuum sort only ESRD_canonical.med_clm_hdr;
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
compound sortkey(CoveredIndividualID,ClaimNumber,dx)
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
analyze ESRD_canonical.diagnosis_codes;
vacuum sort only ESRD_canonical.diagnosis_codes;
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
	, proc_mod_1	varchar(2)	encode	zstd
	, proc_mod_2	varchar(2)	encode	zstd
	, proc_mod_3	varchar(2)	encode	zstd
	, proc_mod_4	varchar(2)	encode	zstd
	, chargeamount	numeric(10,2)	encode	zstd
	, allowedamount	numeric(10,2)	encode	zstd
	, units	float	encode	zstd
	, revenue_code	varchar(10)	encode	zstd
	)
diststyle key
distkey(CoveredIndividualID)
compound sortkey(CoveredIndividualID,ClaimNumber,cpt_hcpcs)
;

insert into ESRD_canonical.procedure_codes
	(
	select distinct
		CoveredIndividualID::varchar(50)
		, ClaimNumber::varchar(50)
		, LineNumber::varchar(15)
		, ProcedureCode::varchar(10) as cpt_hcpcs
		, ProcedureCodeModifier1::varchar(2) as proc_mod_1
		, ProcedureCodeModifier2::varchar(2) as proc_mod_2
		, ProcedureCodeModifier3::varchar(2) as proc_mod_3
		, ProcedureCodeModifier4::varchar(2) as proc_mod_4
		, chargeamount::numeric(10,2)
		, allowedamount::numeric(10,2)
		, units::float
		, revenuecode::varchar(10) as revenue_code
	from ESRD_clean_raw.medical_claims
	where ProcedureCode is not null and btrim(ProcedureCode) != ''
	)
;

analyze ESRD_canonical.procedure_codes;
vacuum sort only ESRD_canonical.procedure_codes;
analyze ESRD_canonical.procedure_codes;


			--
			--	Capture all occurrence codes on each claim, one code per row.
			--
drop table if exists ESRD_canonical.occurrence_codes;
create table ESRD_canonical.occurrence_codes
	(
	CoveredIndividualID	varchar(50)	encode	zstd
	, ClaimNumber varchar(50)		encode	zstd
	, occurrence_code	varchar(2)	encode	zstd
	)
diststyle key
distkey(CoveredIndividualID)
compound sortkey(CoveredIndividualID,ClaimNumber,occurrence_code)
;

insert into ESRD_canonical.occurrence_codes
	(
	select distinct
		CoveredIndividualID
		, ClaimNumber
		, occurrence_code
	from
		(
		select CoveredIndividualID, ClaimNumber, OccurrenceCode1 as occurrence_code from ESRD_clean_raw.medical_claims where OccurrenceCode1 is not null and btrim(OccurrenceCode1) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, OccurrenceCode2 as occurrence_code from ESRD_clean_raw.medical_claims where OccurrenceCode2 is not null and btrim(OccurrenceCode2) != ''
		union all
		select CoveredIndividualID, ClaimNumber, OccurrenceCode3 as occurrence_code from ESRD_clean_raw.medical_claims where OccurrenceCode3 is not null and btrim(OccurrenceCode3) != ''
		union all
		select CoveredIndividualID, ClaimNumber, OccurrenceCode4 as occurrence_code from ESRD_clean_raw.medical_claims where OccurrenceCode4 is not null and btrim(OccurrenceCode4) != ''
		)
	)
;
analyze ESRD_canonical.occurrence_codes;
vacuum sort only ESRD_canonical.occurrence_codes;
analyze ESRD_canonical.occurrence_codes;


			--
			--	Capture all condition codes on each claim, one code per row.
			--
drop table if exists ESRD_canonical.condition_codes;
create table ESRD_canonical.condition_codes
	(
	CoveredIndividualID	varchar(50)	encode	zstd
	, ClaimNumber varchar(50)		encode	zstd
	, condition_code	varchar(2)	encode	zstd
	)
diststyle key
distkey(CoveredIndividualID)
compound sortkey(CoveredIndividualID,ClaimNumber,condition_code)
;

insert into ESRD_canonical.condition_codes
	(
	select distinct
		CoveredIndividualID
		, ClaimNumber
		, condition_code
	from
		(
		select CoveredIndividualID, ClaimNumber, ConditionCode1 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode1 is not null and btrim(ConditionCode1) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ConditionCode2 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode2 is not null and btrim(ConditionCode2) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ConditionCode3 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode3 is not null and btrim(ConditionCode3) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ConditionCode4 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode4 is not null and btrim(ConditionCode4) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ConditionCode5 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode5 is not null and btrim(ConditionCode5) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ConditionCode6 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode6 is not null and btrim(ConditionCode6) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ConditionCode7 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode7 is not null and btrim(ConditionCode7) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ConditionCode8 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode8 is not null and btrim(ConditionCode8) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ConditionCode9 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode9 is not null and btrim(ConditionCode9) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ConditionCode10 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode10 is not null and btrim(ConditionCode10) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ConditionCode11 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode11 is not null and btrim(ConditionCode11) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ConditionCode12 as condition_code from ESRD_clean_raw.medical_claims where ConditionCode12 is not null and btrim(ConditionCode12) != ''
		)
	)
;
analyze ESRD_canonical.condition_codes;
vacuum sort only ESRD_canonical.condition_codes;
analyze ESRD_canonical.condition_codes;


			--
			--	Capture all value codes on each claim, one code per row.
			--
drop table if exists ESRD_canonical.value_codes;
create table ESRD_canonical.value_codes
	(
	CoveredIndividualID	varchar(50)	encode	zstd
	, ClaimNumber varchar(50)		encode	zstd
	, value_code	varchar(2)	encode	zstd
	)
diststyle key
distkey(CoveredIndividualID)
compound sortkey(CoveredIndividualID,ClaimNumber,value_code)
;

insert into ESRD_canonical.value_codes
	(
	select distinct
		CoveredIndividualID
		, ClaimNumber
		, value_code
	from
		(
		select CoveredIndividualID, ClaimNumber, ValueCode1 as value_code from ESRD_clean_raw.medical_claims where ValueCode1 is not null and btrim(ValueCode1) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ValueCode2 as value_code from ESRD_clean_raw.medical_claims where ValueCode2 is not null and btrim(ValueCode2) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ValueCode3 as value_code from ESRD_clean_raw.medical_claims where ValueCode3 is not null and btrim(ValueCode3) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ValueCode4 as value_code from ESRD_clean_raw.medical_claims where ValueCode4 is not null and btrim(ValueCode4) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ValueCode5 as value_code from ESRD_clean_raw.medical_claims where ValueCode5 is not null and btrim(ValueCode5) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ValueCode6 as value_code from ESRD_clean_raw.medical_claims where ValueCode6 is not null and btrim(ValueCode6) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ValueCode7 as value_code from ESRD_clean_raw.medical_claims where ValueCode7 is not null and btrim(ValueCode7) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ValueCode8 as value_code from ESRD_clean_raw.medical_claims where ValueCode8 is not null and btrim(ValueCode8) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ValueCode9 as value_code from ESRD_clean_raw.medical_claims where ValueCode9 is not null and btrim(ValueCode9) != ''
	 	union all
		select CoveredIndividualID, ClaimNumber, ValueCode10 as value_code from ESRD_clean_raw.medical_claims where ValueCode10 is not null and btrim(ValueCode10) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ValueCode11 as value_code from ESRD_clean_raw.medical_claims where ValueCode11 is not null and btrim(ValueCode11) != ''
		union all
		select CoveredIndividualID, ClaimNumber, ValueCode12 as value_code from ESRD_clean_raw.medical_claims where ValueCode12 is not null and btrim(ValueCode12) != ''
		)
	)
;
analyze ESRD_canonical.value_codes;
vacuum sort only ESRD_canonical.value_codes;
analyze ESRD_canonical.value_codes;
