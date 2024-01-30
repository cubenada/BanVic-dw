with
    colaboradores as (
        select *
        from {{ ref('stg_colaboradores') }}
    )
    , agencias as (
        select *
        from {{ ref('stg_agencias') }}
    )
    , agenciascolaboradores as (
        select *
        from {{ ref('stg_colaborador_agencia') }}
    )
    , dim_colaboradores as (
        select
            colaboradores.colaborador_id
            , agencias.agencia_id
            , colaboradores.nome_colaborador
            , agencias.nome_agencia
            , agencias.cidade as cidade_agencia
            , agencias.estado as estado_agencia
            , agencias.tipo as tipo_agencia           
        from colaboradores
        left join agenciascolaboradores on colaboradores.colaborador_id = agenciascolaboradores.colaborador_id
        left join agencias on agenciascolaboradores.agencia_id = agencias.agencia_id
    )
select *
from dim_colaboradores