with
    source_personcreditcard as (
        select
            cast(businessentityid	as int) as businessentity_id			
            , cast(creditcardid	as int) as creditcard_id			
            , modifieddate		
        from {{ source('erp', 'personcreditcard') }}
    )
select *
from source_personcreditcard

