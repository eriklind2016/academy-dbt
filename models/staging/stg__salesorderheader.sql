with
    source_salesheader as (
        select
            cast(salesorderid	as int) as salesorder_id	
            , cast(creditcardid as int) as creditcard_id
            , cast(shiptoaddressid as int) as ship_id
            , revisionnumber		
            , PARSE_DATE('%Y-%m-%d', FORMAT_TIMESTAMP('%Y-%m-%d', TIMESTAMP(orderdate))) as orderdate
            , duedate
            , shipdate 
            , `status` as status_venda	
            , onlineorderflag	
            , purchaseordernumber
            , accountnumber
            , customerid		
            , salespersonid		
            , territoryid		
            , billtoaddressid				
            , shipmethodid				
            , creditcardapprovalcode
            , currencyrateid		
            , subtotal
            , taxamt
            , freight
            , totaldue
            , comment		
            , rowguid
            , modifieddate
        from {{ source('erp', 'salesorderheader') }}
    )
select *
from source_salesheader


