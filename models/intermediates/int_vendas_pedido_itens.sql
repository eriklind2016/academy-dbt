with  
    pedidos as (
        select *
        from {{ ref('stg__salesorderheader')}}
    )

    , detalhes as (
        select *
        from {{ ref('stg__salesorderdetail')}}
    )

    , joined as (
        select
            pedidos.salesorder_id
            , detalhes.salesorderdetail_id
            , pedidos.creditcard_id
            , pedidos.ship_id
            , detalhes.orderqty
            , detalhes.unitprice
            , detalhes.unitpricediscount
            , detalhes.product_id
            , pedidos.totaldue
            , pedidos.orderdate
            , pedidos.status_venda
        from pedidos
        left join detalhes on pedidos.salesorder_id = detalhes.salesorder_id
    )

select *
from joined
