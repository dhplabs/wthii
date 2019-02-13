

/*	This code seeks to implement in HFNY the algorithm developed by Austin Privett in the file 3-professional.sql	*/
/*
-- no more than 1 / spec / day
SELECT
    member_id,
    first_date_of_service,
    rendering_provider_specialty_code,
    units,
    mincode,
    maxcode,
    CASE WHEN mincode=maxcode THEN FALSE ELSE TRUE END as codechange
FROM allemlines
WHERE
    prof_indicator=True
    AND
    units > 2 -- "sure" amount, allowing for "unknowns"
    -- units > 1 -- "maybe" amount
ORDER BY
    member_id,
    first_date_of_service,
    rendering_provider_specialty_code
-- LIMIT 1000
*/

/*	3-professional.sql in HFNY;		60,956	*/
SELECT
		member_ID
    ,	first_DOS
	,	prov_primary_specialty
	,	prof_indicator
	,	total_units
	,	max_proc_code
	,	min_proc_code
	,	( min_proc_code != max_proc_code )	AS	code_change
INTO
	whaight.HFNY_EM_professional3
FROM
	whaight.HFNY_All_EM_Lines
WHERE
		(	prof_indicator		)
	AND	(	total_units	>	2	)
ORDER BY
		member_ID
    ,	first_DOS
	,	prov_primary_specialty
;



SELECT	*
FROM	whaight.HFNY_EM_professional3
LIMIT	1000;



SELECT	COUNT( * )
FROM	whaight.HFNY_EM_professional3
;
/*	60,956	*/



SELECT	COUNT( * )
FROM	whaight.HFNY_EM_professional3
WHERE	code_change	=	'1'
;
/*	9,073	*/




