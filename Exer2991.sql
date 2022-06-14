/***************************************************************************************

2991

Estatísticas dos Departamentos

Para cada departamento da empresa, mostrar o nome dele, a quantidade de empregados 
lotados, a média salarial, o maior salário e o menor salário. O resultado deve estar 
em ordem decrescente por média salarial.

Dica: Você pode utilizar a função COALESCE(check_expression , 0) para substituir algum 
valor null por zero; Além disso, você também pode utilizar a função ROUND(value, 2) 
para exibir os valores com 2 casas decimais.

**************************************************************************************/

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2990


/*  Execute this query to drop the tables */
--DROP TABLE empregados, trabalha, departamentos, projetos CASCADE;

SELECT t2.nome AS "Nome Departamento", 
       COUNT(t1.lotacao) AS "Numero de Empregados"--,
	   
FROM empregado AS t1
INNER JOIN departamento AS t2 ON t1.lotacao = t2.cod_dep
GROUP BY t2.cod_dep


--Calculando os salários
--SELECT t1.nome, (SUM(t3.valor) - SUM(t5.valor)) AS salario
SELECT t1.nome, SUM(t3.valor)
FROM empregado AS t1
INNER JOIN emp_venc AS t2 ON t1.matr = t2.matr
INNER JOIN vencimento AS t3 ON t2.cod_venc = t3.cod_venc
--LEFT JOIN emp_desc AS t4 ON t1.matr = t4.matr
--LEFT JOIN desconto AS t5 ON t4.cod_desc = t5.cod_desc
GROUP BY t1.nome;