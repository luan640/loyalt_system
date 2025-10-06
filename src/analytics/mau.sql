
-- Tabela de Monthly Active Users
-- Usuários ativos por mÊs

SELECT 
    substr(DtCriacao,0, 8) as DtMes,
    count(DISTINCT IdCliente) AS DAU
FROM transacoes
GROUP BY 1
ORDER BY DtMes;

