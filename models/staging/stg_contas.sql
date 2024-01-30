with
    source_contas as (
        select
            cast(num_conta as int) as num_conta,
            cast(cod_cliente as int) as cliente_id,
            cast(cod_agencia as int) as agencia_id,
            cast(cod_colaborador as int) as colaborador_id,
            contas.tipo_conta as tipo_conta,
            DATE(data_abertura) as data_abertura,
            cast(saldo_total as numeric) as salto_total,
            cast(saldo_disponivel as numeric) as saldo_disponivel,
            DATE(data_ultimo_lancamento) as ultimo_lancamento
        from {{ source('lgs_source', 'contas') }}
    )
select *
from source_contas