WITH hb_aggs as
         (
             SELECT hb.country,
                    max(parseDateTime64BestEffortUS(hb.dob)) as youngest_dob,
                    min(parseDateTime64BestEffortUS(hb.dob)) as oldest_dob
             FROM {{ ref('stg_hb') }} as hb
             where length(hb.country) > 0
             group by hb.country
         )
SELECT hb_aggs.country,
       hb_aggs.youngest_dob,
       hby.first_name as youngest_first_name,
       hby.last_name  as youngest_last_name,
       hby.email      as youngest_email,
       hb_aggs.oldest_dob,
       hbo.first_name as oldest_first_name,
       hbo.last_name  as oldest_last_name,
       hbo.email      as oldest_email
FROM hb_aggs
         left join {{ ref('stg_hb') }} hby on parseDateTime64BestEffortUS(hby.dob) = hb_aggs.youngest_dob
         left join {{ ref('stg_hb') }} hbo on parseDateTime64BestEffortUS(hbo.dob) = hb_aggs.oldest_dob
