with
    source_specialofferproduct as (
        select
            cast(specialofferid	as int) as specialoffer_id		
            , cast(productid as int) as product_id			
            , rowguid			
            , modifieddate
        from {{ source('erp', 'specialofferproduct') }}
    )
select *
from source_specialofferproduct