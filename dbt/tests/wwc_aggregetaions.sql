{{ config(error_if = '<10') }}

select *
from {{ ref('wwc_aggregations') }}