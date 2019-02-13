

/*	This code seeks to implement in HFNY the algorithm developed by Austin Privett in the file 2-facility.sql	*/
/*
-- get likely faulty facility claims
-- no more than 2 per given day (employed prof + fac)
SELECT
    member_id,
    first_date_of_service,
    --prof_indicator,
    SUM(units) as summedunits,
    MIN(mincode) as mmincode,
    MAX(maxcode) as mmaxcode,
    CASE WHEN mmincode=mmaxcode THEN FALSE ELSE TRUE END as codechange
FROM allemlines
GROUP BY
    member_id,
    first_date_of_service,
    prof_indicator
HAVING
    prof_indicator=False AND summedunits > 2 -- "sure" amount
    -- Can also look for professional claims for "maybes"
ORDER BY
    member_id,
    first_date_of_service
-- LIMIT 1000
;
*/

/*	Here's my implementation, but I have questions.
	Do we want to query on code_change?  That seems to find instances
	in which on a single day a single member has one or more claims
	with more than one procedure code.  Does this answer a question in
	simple-rules?
*/
SELECT
		member_ID
    ,	first_DOS
	,	prof_indicator
	,	SUM( total_units )			AS	summed_units
	,	MAX( max_proc_code )		AS	m_min_code
	,	MIN( min_proc_code )		AS	m_max_code
	,	( m_min_code = m_max_code )	AS	code_change
INTO
	whaight.HFNY_EM_facility2
FROM
	whaight.HFNY_All_EM_Lines
GROUP BY
		member_ID
    ,	first_DOS
	,	prof_indicator
HAVING
		(	NOT	prof_indicator		)
	AND	(	summed_units	>	2	)
ORDER BY
		member_ID
    ,	first_DOS
;


SELECT	COUNT( * )
FROM	whaight.HFNY_EM_facility2;
/*	35,702	*/



SELECT	COUNT( * )
FROM	whaight.HFNY_EM_facility2
WHERE	code_change;
/*	16,651	*/



SELECT	COUNT( * )
FROM	whaight.HFNY_EM_facility2
WHERE	NOT code_change;
/*	19,051	*/



