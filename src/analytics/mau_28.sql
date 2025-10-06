
-- Tabela de Monthly Active Users
-- Usuários ativos por mÊs considerando que todos os meses tenham 28 dias
-- Mas pq 28? Pra não ter problema com meses que tenham 28,30,31.. 
-- Dessa forma o mês contém 4 semanas, 4 domingos 4, sábados, 4 segunda...
-- Fica mais simples de trabalhar

WITH tb_daily as (

    SELECT 
        date(substr(DtCriacao,0, 11)) as DtDia,
        IdCliente
    FROM transacoes
    ORDER BY DtDia;

),

tb_distinct_day as (

    SELECT 
        DISTINCT DtDia as dtRef
    FROM tb_daily

)

SELECT t1.dtRef,
    count (DISTINCT IdCliente) as MAU,
    count (DISTINCT t2.dtDia) as qtdeDias

FROM tb_distinct_day as t1

LEFT JOIN tb_daily as t2
ON t2.DtDia <= t1.dtRef
AND julianday(t1.dtRef) - julianday(t2.DtDia) < 28

GROUP BY t1.dtRef

ORDER BY t1.dtRef ASC;