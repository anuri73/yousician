{{ config(error_if = '<50') }}

select *
from {{ ref('hb_aggregations') }}