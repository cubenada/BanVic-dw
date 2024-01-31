with
    transacoes as (
        select *
        from {{ ref('stg_transacoes') }}
    )
    , clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )
    , fct_transacoes as (
        select
            transacoes.transacao_id
            , transacoes.cliente_id
            , clientes.agencia_id
            , transacoes.nome_transacao
            , transacoes.valor_transacao
            , transacoes.data_transacao
        from transacoes
        left join clientes on transacoes.cliente_id = clientes.cliente_id
    )
select *
from fct_transacoes