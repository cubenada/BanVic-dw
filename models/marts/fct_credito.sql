with
    propostas as (
        select *
        from {{ ref('stg_propostas_credito') }}
    )
    , fct_credito as (
        select
            propostas.proposta_id
            , propostas.cliente_id
            , propostas.colaborador_id
            , propostas.data_proposta
            , propostas.juros_mensal
            , propostas.valor_proposta
            , propostas.valor_financiamento
            , propostas.valor_entrada
            , propostas.valor_prestacao
            , propostas.qntd_parcelas
            , propostas.carencia
            , propostas.status
            , (propostas.valor_prestacao * propostas.qntd_parcelas) as total_pago
            , ((valor_prestacao * qntd_parcelas) - valor_proposta) as lucro
        from propostas
    )
select *
from fct_credito