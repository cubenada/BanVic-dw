with
    clientes as (
        select *
        from {{ ref('stg_clientes') }}
    )
    , contas as (
        select *
        from {{ ref('stg_contas') }}
    )
    , dim_clientes as (
        select
            clientes.cliente_id
            , contas.agencia_id
            , clientes.nome_cliente
            , clientes.data_inclusao as data_cadastro
            , contas.tipo_conta
            , contas.saldo_total
            , contas.saldo_disponivel
            , contas.ultimo_lancamento
        from clientes
        left join contas on clientes.cliente_id = contas.cliente_id
    )
select *
from dim_clientes