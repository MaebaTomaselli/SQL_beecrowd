/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2997 - Pagamento dos Empregados

Para cada empregado, listar nome do departamento, nome do empregado, salário bruto, 
total de descontos e salário líquido. A saída deve estar agrupada por departamento e 
divisão. Dentro de cada divisão, a lista de empregados deve estar de forma decrescente 
por salário líquido.

Dica: Você pode utilizar a função COALESCE(check_expression , 0) para substituir 
algum valor null por zero; Além disso, você também pode utilizar a função 
ROUND(value, 2) para exibir os valores com 2 casas decimais.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas no exerciocio 2989 (Exer2989.sql)
/***** RESOLUÇÃO DO PROBLEMA *****/

--Baseado na lógica utilizada por Fernando K - https://www.beecrowd.com.br/judge/pt/questions/view/2999/9758

WITH SALARIO_BASE AS(
	SELECT 
		T1.MATR,
		SUM(T3.VALOR) AS SALARIO_SDESCONTO
	FROM EMPREGADO AS T1
	LEFT JOIN EMP_VENC AS T2 ON T1.MATR = T2.MATR
	LEFT JOIN VENCIMENTO AS T3 ON T2.COD_VENC = T3.COD_VENC
	GROUP BY (T1.MATR)
), DESCONTO AS(
	SELECT
		T1.MATR,
		SUM(T5.VALOR) AS DESC_SALARIO
	FROM EMPREGADO AS T1
	LEFT JOIN EMP_DESC AS T4 ON T1.MATR = T4.MATR
	LEFT JOIN DESCONTO AS T5 ON T4.COD_DESC = T5.COD_DESC
	GROUP BY(T1.MATR)
), SALARIO_EMP AS(
	SELECT 
		T1.MATR,
		T1.LOTACAO_DIV,
		COALESCE (SALARIO_BASE.SALARIO_SDESCONTO,0) 
		- COALESCE (DESCONTO.DESC_SALARIO,0) AS SALARIO_CDESCONTO
	FROM EMPREGADO AS T1
	LEFT JOIN SALARIO_BASE ON T1.MATR = SALARIO_BASE.MATR
	LEFT JOIN DESCONTO ON T1.MATR = DESCONTO.MATR
)
SELECT 
 	T7.NOME AS DEPARTAMENTO,
	T1.NOME AS NOME,
	COALESCE(SB.SALARIO_SDESCONTO,0) AS "SALARIO BRUTO",
	COALESCE(DE.DESC_SALARIO,0) AS "TOTAL DESCONTO",
	COALESCE(SE.SALARIO_CDESCONTO,0) AS "SALARIO LIQUIDO"
FROM EMPREGADO AS T1
INNER JOIN DIVISAO AS T6 ON T1.LOTACAO_DIV = T6.COD_DIVISAO
INNER JOIN DEPARTAMENTO AS T7 ON T6.COD_DEP = T7.COD_DEP
INNER JOIN SALARIO_BASE AS SB ON T1.MATR = SB.MATR
INNER JOIN DESCONTO AS DE ON T1.MATR = DE.MATR
INNER JOIN SALARIO_EMP AS SE ON T1.MATR = SE.MATR
--GROUP BY(T7.COD_DEP, T6.COD_DIVISAO, T1.NOME, SB.SALARIO_SDESCONTO, DE.DESC_SALARIO, SE.SALARIO_CDESCONTO)

