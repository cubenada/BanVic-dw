with
    source_colaborador_agencia as (
        select
            cast(cod_colaborador as int) as colaborador_id,
            cast(cod_agencia as int) as agencia_id
        from {{ source('lgs_source', 'colaborador_agencia') }}
    )
select *
from source_colaborador_agencia