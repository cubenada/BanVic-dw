with
    source_clientes as (
        select
            cast(cod_cliente as int) as cliente_id,
            cast(primeiro_nome || ' ' || ultimo_nome as string) as nome_cliente,
            clientes.tipo_cliente as tipo_cliente,
            DATE(data_inclusao) as data_inclusao
        from {{ source('lgs_source', 'clientes') }}
    )
select *
from source_clientes