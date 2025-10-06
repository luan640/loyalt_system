
-- Tabela de Daily Active Users

SELECT 
    substr(DtCriacao,0, 11) as DtDia,
    count(DISTINCT IdCliente) AS DAU
FROM transacoes
GROUP BY 1
ORDER BY DtDia;



