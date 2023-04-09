WITH wwc_aggs as
         (
             SELECT wwc.nat                                 as country,
                    max(parseDateTime64BestEffort(wwc.dob)) as youngest_dob,
                    min(parseDateTime64BestEffort(wwc.dob)) as oldest_dob
             FROM {{ ref('stg_wwc') }} as wwc
             where length(country) > 0
             group by country
         )
SELECT wwc_aggs.country,
       wwc_aggs.youngest_dob,
       first_value(wwcy.first_name) as youngest_first_name,
       first_value(wwcy.last_name)  as youngest_last_name,
       first_value(wwcy.email)      as youngest_email,
       wwc_aggs.oldest_dob,
       first_value(wwco.first_name) as oldest_first_name,
       first_value(wwco.last_name)  as oldest_last_name,
       first_value(wwco.email)      as oldest_email
FROM wwc_aggs
left join {{ ref('stg_wwc') }} wwcy on parseDateTime64BestEffortUS(wwcy.dob) = wwc_aggs.youngest_dob
left join {{ ref('stg_wwc') }} wwco on parseDateTime64BestEffortUS(wwco.dob) = wwc_aggs.oldest_dob
group by country, youngest_dob, oldest_dob