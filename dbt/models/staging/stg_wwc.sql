{{ config(
    schema='stg'
) }}

SELECT wwc.name as first_name,
       wwc.name as last_name,
       wwc.email,
       wwc.gender,
       wwc.dob,
       wwc.nat
FROM {{ source ('yousican_src', 'wwc') }} as wwc