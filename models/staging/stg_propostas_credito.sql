with
    source_propostas_credito as (
        select
            cast(cod_proposta as int) as proposta_id
            , cast(cod_cliente as int) as cliente_id
            , cast(cod_colaborador as int) as colaborador_id
            , DATE(data_entrada_proposta) as data_proposta
            , cast(taxa_juros_mensal as numeric) as juros_mensal
            , cast(valor_proposta as numeric) as valor_proposta
            , cast(valor_financiamento as numeric) as valor_financiamento
            , cast(valor_entrada as numeric) as valor_entrada
            , cast(valor_prestacao as numeric) as valor_prestacao
            , cast(quantidade_parcelas as int) as qntd_parcelas
            , cast(carencia as int) as carencia
            , propostas_credito.status_proposta as status
        from {{ source('lgs_source', 'propostas_credito') }}
    )
select *
from source_propostas_credito