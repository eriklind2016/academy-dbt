with
    source_salesreason as (
        select
            cast(salesreasonid	as int) as salesreason_id					
			, `name` as nome_motivo
            , reasontype
            , modifieddate			
        from {{ source('erp', 'salesreason') }}
    )
select *
from source_salesreason