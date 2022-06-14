/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2999 - Maior Sálario da Divisão	

Listar nome e sálario líquido dos empregados que ganham mais que a media salarial de 
sua divisão. O resultado deve estar em ordem decrescente por sálario.

Dica: Você pode utilizar a função COALESCE(check_expression , 0) para substituir 
algum valor null por zero; Além disso, você também pode utilizar a função 
ROUND(value, 2) para exibir os valores com 2 casas decimais.

**************************************************************************************/

--Tabelas criadas em exercício anterior (Exer2989.sql)


/***** RESOLUÇÃO DO PROBLEMA *****/

--Solução baseada na resolução de Thiago Martins - 
--https://www.beecrowd.com.br/judge/pt/questions/view/2999/12095
--Solução de Thiago apresentada mais abaixo neste arquivo

SELECT 
	T1.NOME,
	ROUND(SUM(DISTINCT COALESCE(T3.VALOR, 0)) - SUM(DISTINCT COALESCE(T5.valor, 0)),2) AS SALARIO
FROM EMPREGADO AS T1
LEFT JOIN EMP_VENC AS T2 ON T1.MATR = T2.MATR
LEFT JOIN VENCIMENTO AS T3 ON T2.COD_VENC = T3.COD_VENC
LEFT JOIN EMP_DESC AS T4 ON T1.MATR = T4.MATR
LEFT JOIN DESCONTO AS T5 ON T4.COD_DESC = T5.COD_DESC
INNER JOIN (
	SELECT 
    	T6.COD_DIVISAO, 
    	ROUND(AVG(SALARIOS.SALARIO),2) AS MEDIA_SAL_DIV	
  	FROM(
		SELECT 
			EMP.MATR,
			EMP.NOME,
			EMP.LOTACAO_DIV,
			ROUND(SUM(DISTINCT COALESCE(VENC.VALOR,0)) - 
				  SUM(DISTINCT COALESCE(DES.VALOR,0)),2) AS SALARIO
		FROM EMPREGADO AS EMP
		LEFT JOIN EMP_VENC AS EMPV ON EMP.MATR = EMPV.MATR
		LEFT JOIN VENCIMENTO AS VENC ON EMPV.COD_VENC = VENC.COD_VENC
		LEFT JOIN EMP_DESC AS EMPD ON EMP.MATR = EMPD.MATR
		LEFT JOIN DESCONTO AS DES ON EMPD.COD_DESC = DES.COD_DESC
		GROUP BY(EMP.MATR)
	) AS SALARIOS
	INNER JOIN DIVISAO AS T6 ON T6.COD_DIVISAO = SALARIOS.LOTACAO_DIV
	GROUP BY T6.COD_DIVISAO
)SALARIO_MEDIA_DIVISAO ON SALARIO_MEDIA_DIVISAO.COD_DIVISAO = T1.LOTACAO_DIV
GROUP BY(T1.MATR,SALARIO_MEDIA_DIVISAO.MEDIA_SAL_DIV)
HAVING ((ROUND(SUM(DISTINCT COALESCE(T3.VALOR, 0)) - SUM(DISTINCT COALESCE(T5.valor, 0)),2)) 
		> SALARIO_MEDIA_DIVISAO.MEDIA_SAL_DIV)
--HAVING ((ROUND(SUM(DISTINCT COALESCE(T3.VALOR, 0)) - SUM(DISTINCT COALESCE(T5.valor, 0)),2)) > 8000)
--ORDER BY T1.LOTACAO_DIV ASC;
ORDER BY SALARIO DESC
LIMIT 4;



--Resolução alternativa utilizando criação de tabelas auxiliares
CREATE TABLE emp_salario AS(
	SELECT 
		T1.MATR,
		T1.NOME,
		T1.LOTACAO_DIV,
		ROUND(SUM(DISTINCT COALESCE(T3.VALOR,0)) - SUM(DISTINCT COALESCE(T5.VALOR,0)),2) AS SALARIO
	FROM EMPREGADO AS T1
	LEFT JOIN EMP_VENC AS T2 ON T1.MATR = T2.MATR
	LEFT JOIN VENCIMENTO AS T3 ON T2.COD_VENC = T3.COD_VENC
	LEFT JOIN EMP_DESC AS T4 ON T1.MATR = T4.MATR
	LEFT JOIN DESCONTO AS T5 ON T4.COD_DESC = T5.COD_DESC
	GROUP BY(T1.MATR)
);

SELECT*FROM EMP_SALARIO;

CREATE TABLE salario_div AS
	SELECT LOTACAO_DIV, AVG(SALARIO) AS SALARIO_DIV
	FROM EMP_SALARIO
	GROUP BY(LOTACAO_DIV);

SELECT*FROM SALARIO_DIV;

SELECT 
	T1.NOME, 
	T1.SALARIO
FROM emp_salario AS T1
LEFT JOIN SALARIO_DIV AS T2 ON T1.LOTACAO_DIV = T2.LOTACAO_DIV
WHERE T1.SALARIO > T2.SALARIO_DIV
ORDER BY T1.SALARIO DESC;
	
	
--Resolução Thiago Martins - https://www.beecrowd.com.br/judge/pt/questions/view/2999/12095
SELECT
  empregado.nome,
  ROUND(SUM(DISTINCT COALESCE(vencimento.valor, 0)) - SUM(DISTINCT COALESCE(desconto.valor, 0)), 2) AS salario
FROM empregado
left JOIN emp_desc ON emp_desc.matr = empregado.matr
left JOIN desconto ON desconto.cod_desc = emp_desc.cod_desc
JOIN emp_venc ON emp_venc.matr = empregado.matr
JOIN vencimento ON vencimento.cod_venc = emp_venc.cod_venc
INNER JOIN (
  SELECT 
    divisao.cod_divisao, 
    AVG(salarios.salario) AS media
  FROM (
      SELECT
        e.matr,
        e.lotacao_div,
        SUM(DISTINCT COALESCE(v.valor, 0)) AS salario
      FROM empregado e
      left join emp_venc ev ON ev.matr = e.matr
      left join vencimento v ON v.cod_venc = ev.cod_venc
      GROUP BY e.matr, e.lotacao_div
  ) salarios
  inner JOIN divisao ON divisao.cod_divisao = salarios.lotacao_div
  GROUP BY divisao.cod_divisao
) media_divisao ON media_divisao.cod_divisao = empregado.lotacao_div
GROUP BY empregado.nome, media_divisao.media
HAVING SUM(DISTINCT COALESCE(vencimento.valor, 0)) > media_divisao.media
ORDER BY salario DESC


--Resolução Fernando K - https://www.beecrowd.com.br/judge/pt/questions/view/2999/9758
with base as (
   select empregado.matr, sum(vencimento.valor) as valor
   from empregado
   join emp_venc ON emp_venc.matr = empregado.matr
   join vencimento ON vencimento.cod_venc = emp_venc.cod_venc
   group by empregado.matr
 ), desconto as (
   select empregado.matr, sum(desconto.valor) as valor
   from empregado
   join emp_desc ON emp_desc.matr = empregado.matr
   join desconto ON desconto.cod_desc = emp_desc.cod_desc
   group by empregado.matr
 ), salario as (
   select empregado.matr, coalesce(base.valor, 0) - coalesce(desconto.valor, 0) as valor
   from empregado
   left join base on base.matr = empregado.matr
   left join desconto on desconto.matr = empregado.matr
 ), medias as (
   select divisao.cod_divisao, round(avg(salario.valor), 2) as valor from salario
   join empregado on empregado.matr = salario.matr
   join divisao ON divisao.cod_divisao = empregado.lotacao_div
   group by divisao.cod_divisao
 )
 select
   empregado.nome,
   salario.valor,
   medias.valor as media_divisao,
   departamento.nome as nome_departamento,
   divisao.nome as nome_divisao
 from salario
 join empregado on empregado.matr = salario.matr
 join medias on medias.cod_divisao = empregado.lotacao_div
 join divisao on divisao.cod_divisao = empregado.lotacao_div
 join departamento on departamento.cod_dep = empregado.lotacao
 where salario.valor > medias.valor;