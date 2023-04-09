{{ config(
    schema='stg'
) }}

SELECT name.first as first_name,
       name.last  as last_name,
       email,
       gender,
       dob,
       nat
FROM {{ source ('yousican_src', 'wwc') }}