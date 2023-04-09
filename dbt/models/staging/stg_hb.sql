{{ config(
    schema='stg'
) }}

SELECT src.first_name,
       src.last_name,
       src.email,
       src.gender,
       src.dob,
       null
FROM {{ source('yousican_src', 'hb') }} as src