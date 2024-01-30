with
    source_colaboradores as (
        select
            cast(cod_colaborador as int) as colaborador_id,
            cast(primeiro_nome || ' ' || ultimo_nome as string) as nome_colaborador,
        from {{ source('lgs_source', 'colaboradores') }}
    )
select *
from source_colaboradores