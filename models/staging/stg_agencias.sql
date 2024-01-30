with
    source_agencias as (
        select
            cast(cod_agencia as int) as agencia_id,            
            agencias.nome as nome_agencia,
            agencias.cidade as cidade,
            agencias.uf as estado,
            agencias.data_abertura as abertura,
            agencias.tipo_agencia as tipo
        from {{ source('lgs_source', 'agencias') }}
    )
select *
from source_agencias
