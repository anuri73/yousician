{{ config(error_if = '<1') }}

select *
from {{ ref('gender_ratio') }}