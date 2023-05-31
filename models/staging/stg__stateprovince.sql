with
    source_stateprovince as (
        select
            cast(stateprovinceid as int) as stateprovince_id						
            , stateprovincecode						
            , countryregioncode  						
            , isonlystateprovinceflag						
            , `name` as nome_estado					
            , territoryid						
            , rowguid						
            , modifieddate
        from {{ source('erp', 'stateprovince') }}
    )
select *
from source_stateprovince