with
    source_productproductphoto as (
        select
            cast(productid as int) as product_id						
            , cast(productphotoid	as int) productphoto_id					
            , `primary`	as primeiro					
            , modifieddate          
        from {{ source('erp', 'productproductphoto') }}
    )
select *
from source_productproductphoto