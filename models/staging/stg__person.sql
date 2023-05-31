with
    source_person as (
        select
            cast(businessentityid as int) as businessentity_id						
            , persontype						
            , namestyle						
            , title						
            , firstname						
            , middlename						
            , lastname						
            , suffix						
            , emailpromotion						
            , additionalcontactinfo						
            , demographics						
            , rowguid						
            , modifieddate	
        from {{ source('erp', 'person') }}
    )
select *
from source_person


