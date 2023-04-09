{{ config(
    schema='stg'
) }}

SELECT src.first_name,
       src.last_name,
       src.email,
       src.gender,
       src.dob,
       ip.country
FROM {{ source ('yousican_src', 'hb') }} as src
LEFT JOIN {{ ref('ip_country') }} ip
ON ip.ip_address = src.ip_address