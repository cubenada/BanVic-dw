with
    source_transacoes as (
        select
            cast(cod_transacao as int) as transacao_id
            , cast(num_conta as int) as cliente_id
            , date(data_transacao) as data_transacao
            , transacoes.nome_transacao as nome_transacao
            , cast(valor_transacao as numeric) as valor_transacao
        from {{ source('lgs_source', 'transacoes') }}
    )
select *
from source_transacoes