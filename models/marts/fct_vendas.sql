with
    clientes as (
        select *
        from {{ ref('dim_clientes')}}
    )

    , localizacao as (
        select *
        from {{ ref('dim_localizacao')}}
    )

    , motivo_venda as (
        select *
        from {{ ref('dim_motivo_de_venda')}}
    )

    , produto as (
        select *
        from {{ ref('dim_produtos')}}
    )

    , venda_pedido as (
        select *  
        from {{ ref('int_vendas_pedido_itens')}}
    )

    , datas as (
        select *
        from {{ ref('dim_datas') }}
    )

    , joined as (
        select 
            venda_pedido.salesorder_id
            , clientes.sk_businessentity_id as fk_clientes
            , localizacao.sk_stateprovince_id as fk_localizacao  
            , produto.sk_produto as fk_produto 
            , motivo_venda.sk_salesreason_id as fk_motivo_de_venda
            , venda_pedido.totaldue
            , venda_pedido.orderqty as quantidade
            , venda_pedido.unitprice as preco_un
            , venda_pedido.unitpricediscount as desconto_un
            , produto.nome_produto
            , clientes.cardtype
            , motivo_venda.nome_motivo
            , venda_pedido.orderdate
            , clientes.firstname as nome
            , clientes.middlename
            , clientes.lastname as sobrenome
            , venda_pedido.status_venda
            , localizacao.nome_pais
            , localizacao.nome_estado
            , localizacao.nome_cidade
            , datas.full_date
            , datas.day
            , datas.month
            , datas.year


        from venda_pedido
        left join clientes on venda_pedido.creditcard_id = clientes.creditcard_id
        left join localizacao on venda_pedido.ship_id = localizacao.address_id
        left join motivo_venda on venda_pedido.salesorder_id = motivo_venda.salesorder_id
        left join produto on venda_pedido.product_id = produto.product_id
        left join datas on venda_pedido.orderdate = datas.full_date
        

    )

    , transformacoes as (
        select
            salesorder_id || '-' || fk_produto as sk_venda
            , *
            , CONCAT(nome, ' ', sobrenome) as fullname
            , quantidade * preco_un as total_bruto
            , (preco_un - desconto_un) * quantidade as total_liquido
            , preco_un - (preco_un*desconto_un) as unidade_com_desconto
            
 
        from joined
    )

select * 
from transformacoes
