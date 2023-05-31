with
    source_countryregion as (
        select
            countryregioncode	
            , `name` as nome_pais
            , modifieddate        
        from {{ source('erp', 'countryregion') }}
    )
select *
from source_countryregion