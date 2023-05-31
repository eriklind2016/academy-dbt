with
    source_salesdetail as (
        select
            cast(salesorderid	as int) as salesorder_id					
            , cast(salesorderdetailid as int) as salesorderdetail_id
            , cast(productid as int) as product_id					
            , carriertrackingnumber						
            , orderqty											
            , specialofferid						
            , unitprice					
            , unitpricediscount					
            , rowguid						
            , modifieddate			
        from {{ source('erp', 'salesorderdetail') }}
    )
select *
from source_salesdetail
