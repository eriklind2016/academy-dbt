with 
    produto as (
        select *
        from {{ ref('stg__products') }}
    )

    , produtophoto as (
        select *
        from {{ ref('stg__productproductphoto') }}
    )

    , oferta as (
        select *
        from {{ ref('stg__specialofferproduct') }}   
    )
      
    , uniao_tabelas as (
        select 
            produto.product_id
            , produto.productsubcategory_id
            , produto.name as nome_produto
            , produto.productmodelid						
            , produto.sellstartdate						
            , produto.sellenddate	
            , produtophoto.productphoto_id
            , produtophoto.primeiro
            , oferta.specialoffer_id
        from produto 
        left join produtophoto on produto.product_id = produtophoto.product_id
        left join oferta on produtophoto.product_id = oferta.product_id   
    ) 
      
    , transformacoes as (
          select
              row_number() over (order by product_id) as sk_produto
              , *     
          from uniao_tabelas
    )
      
    select *
    from transformacoes