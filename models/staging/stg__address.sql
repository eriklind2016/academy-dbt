with
    source_address as (
        select
            cast(addressid as int) as address_id						
            , addressline1						
            , addressline2						
            , city as nome_cidade					
            , stateprovinceid as stateprovince_id						
            , postalcode						
            , spatiallocation						
            , rowguid						
            , modifieddate

        from {{ source('erp', 'address') }}
    )
select *
from source_address