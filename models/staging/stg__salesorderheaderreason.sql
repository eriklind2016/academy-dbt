with
    source_salesheaderreason as (
        select
            cast(salesorderid	as int) as salesorder_id					
            , cast(salesreasonid as int) as salesreason_id				
            , modifieddate			
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )
select *
from source_salesheaderreason
