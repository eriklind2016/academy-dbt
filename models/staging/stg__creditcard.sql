with
    source_creditcard as (
        select
            cast(creditcardid as int) as creditcard_id				
            , cardtype				
            , cardnumber				
            , expmonth				
            , expyear				
            , modifieddate			
        from {{ source('erp', 'creditcard') }}
    )
select *
from source_creditcard