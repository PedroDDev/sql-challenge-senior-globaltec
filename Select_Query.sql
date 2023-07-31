USE challenge;

SELECT 
    pgr.CONTAS_PAGAR_ID AS NUMERO_PROCESSO,
    p.NOME AS NOME_FORNECEDOR,
    pgr.DATA_VENCIMENTO, NULL AS DATA_PAGAMENTO,
    pgr.VALOR AS VALOR_LIQUIDO,
    'CONTA A PAGAR' AS TIPO
FROM 
    C_CONTAS_PAGAR pgr 
INNER JOIN 
    C_PESSOAS p ON p.PESSOA_ID = pgr.ID_FORNECEDOR
UNION
SELECT 
    pg.CONTAS_PAGAS_ID AS NUMERO_PROCESSO, 
    p.NOME AS NOME_FORNECEDOR, 
    pg.DATA_VENCIMENTO, 
    pg.DATA_PAGAMENTO, 
    pg.VALOR AS VALOR_LIQUIDO, 
    'CONTA PAGA' AS TIPO 
FROM 
    C_CONTAS_PAGAS pg 
INNER JOIN 
    C_PESSOAS p ON p.PESSOA_ID = pg.ID_FORNECEDOR