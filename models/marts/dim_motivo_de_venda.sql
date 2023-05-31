with 
    motivo as (
        select *
        from {{ ref('stg__salesreason') }}
    )

    , motivo_header as (
        select *
        from {{ ref('stg__salesorderheaderreason')}}
    )
    , uniao_tabelas as (
        select 
           motivo.salesreason_id 
            , motivo_header.salesorder_id
            , motivo.nome_motivo
        from motivo
        left join motivo_header on motivo.salesreason_id = motivo_header.salesreason_id
    ) 
   
    , transformacoes as (
          select
              row_number() over (order by salesreason_id) as sk_salesreason_id
              , *     
          from uniao_tabelas
    )
--      
    select *
    from transformacoes

    