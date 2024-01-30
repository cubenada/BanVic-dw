with
    fct_transacoes as (
        select *
        from {{ ref('stg_transacoes') }}
    )
select *
from fct_transacoes