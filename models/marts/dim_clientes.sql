with 
    pessoa as (
        select *
        from {{ ref('stg__person') }}
    )

    , pessoacartao as (
        select *
        from {{ ref('stg__personcreditcard') }}
    )
--
    , cartao as (
        select *
        from {{ ref('stg__creditcard') }}   
    )
   --   
    , uniao_tabelas as (
        select 
           pessoa.businessentity_id
            , pessoa.firstname	
            , pessoa.middlename
            , pessoa.lastname						
            , pessoacartao.creditcard_id					
            , cartao.cardtype
        from pessoa
        left join pessoacartao on pessoa.businessentity_id = pessoacartao.businessentity_id
        left join cartao on pessoacartao.creditcard_id = cartao.creditcard_id
    ) 
      
    , transformacoes as (
          select
              row_number() over (order by businessentity_id) as sk_businessentity_id
              , *     
          from uniao_tabelas
    )
      
    select *
    from transformacoes