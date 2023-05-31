with 
    endereco as (
        select *
        from {{ ref('stg__address') }}
    )

    , estado as (
        select *
        from {{ ref('stg__stateprovince') }}
    )
--
    , pais as (
        select *
        from {{ ref('stg__countryregion') }}   
    )
   --   
    , uniao_tabelas as (
        select 
           cast(endereco.address_id as int) as address_id
            , endereco.stateprovince_id
            , endereco.nome_cidade
            , estado.countryregioncode						
            , estado.nome_estado					
            , pais.nome_pais
        from endereco
        left join estado on endereco.stateprovince_id = estado.stateprovince_id
        left join pais on estado.countryregioncode = pais.countryregioncode  
    ) 
      
    , transformacoes as (
          select
              row_number() over (order by stateprovince_id) as sk_stateprovince_id
              , *     
          from uniao_tabelas
    )
      
    select *
    from transformacoes