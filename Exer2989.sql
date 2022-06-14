/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2989 - Departamentos e Divisões

Para cada departamento, mostrar o nome do departamento, o nome de suas divisões, com a 
respectiva média salarial e maior salário de cada divisão. O resultado deve estar em 
ordem decrescente usando a média salarial.

Dica: Você pode utilizar a função COALESCE(check_expression , 0) para substituir 
algum valor null por zero; Além disso, você também pode utilizar a função 
ROUND(value, 2) para exibir os valores com 2 casas decimais.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2989

CREATE TABLE departamento(
    cod_dep INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(50)
);
 
CREATE TABLE divisao(
    cod_divisao INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(50),
    cod_dep INTEGER REFERENCES departamento (cod_dep)
);
 
CREATE TABLE empregado(
    matr INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(50),
    data_lotacao TIMESTAMP,
    lotacao INTEGER,
    gerencia_cod_dep INTEGER REFERENCES departamento (cod_dep),
    lotacao_div INTEGER REFERENCES divisao (cod_divisao),
    gerencia_div INTEGER REFERENCES divisao (cod_divisao)
);
 
CREATE TABLE dependente(
    matr INTEGER REFERENCES empregado (matr),
    nome VARCHAR(50),
    endereco VARCHAR(50)
);
 
CREATE TABLE desconto(
    cod_desc INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    tipo VARCHAR(10),
    valor NUMERIC
);
 
CREATE TABLE vencimento(
    cod_venc INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    tipo VARCHAR(10),
    valor NUMERIC
);
 
CREATE TABLE emp_desc(
    cod_desc INTEGER REFERENCES desconto (cod_desc),
    matr INTEGER REFERENCES empregado (matr)
);
 
CREATE TABLE emp_venc(
    cod_venc INTEGER REFERENCES vencimento (cod_venc),
    matr INTEGER REFERENCES empregado (matr)
);
 
 
INSERT INTO departamento VALUES 
    (1, 'Contabilidade', 'R. X'),
    (2, 'TI', 'R. Y'),
    (3, 'Engenharia', 'R. Y');
 
INSERT INTO divisao VALUES
    (11, 'Ativo', 'R. X', 1),
    (12, 'Passivo', 'R. X', 1),
    (21, 'Desenvolvimento de Projetos', 'R. Y', 2),
    (22, 'Analise de Sistemas', 'R. Y', 2),
    (23, 'Programacao', 'R. W', 2),
    (31, 'Concreto', 'R. Y', 3),
    (32, 'Calculo Estrutural', 'R. Y', 3);
 
INSERT INTO empregado VALUES
    (9999, 'Jose Sampaio', 'R. Z', '2006-06-06T00:00:00Z', 1, 1, 12, NULL),
    (33, 'Jose Maria', 'R. 21', '2006-03-01T00:00:00Z', 1, NULL, 11, 11),
    (1, 'Maria Jose', 'R. 52', '2003-03-01T00:00:00Z', 1, NULL, 11, NULL),
    (7, 'Yasmim', 'R. 13', '2010-07-02T00:00:00Z', 1, NULL, 11, NULL),
    (5, 'Rebeca', 'R. 1', '2011-04-01T00:00:00Z', 1, NULL, 12, 12),
    (13, 'Sofia', 'R. 28', '2010-09-09T00:00:00Z', 1, NULL, 12, NULL),
    (27, 'Andre', 'R. Z', '2005-05-01T00:00:00Z', 2, 2, 22, NULL),
    (88, 'Yami', 'R. T', '2014-02-01T00:00:00Z', 2, NULL, 21, 21),
    (431, 'Joao da Silva', 'R. Y', '2011-07-03T00:00:00Z', 2, NULL, 21, NULL),
    (135, 'Ricardo Reis', 'R. 33', '2009-08-01T00:00:00Z', 2, NULL, 21, NULL),
    (254, 'Barbara', 'R. Z', '2008-01-03T00:00:00Z', 2, NULL, 22, 22),
    (371, 'Ines', 'R. Y', '2005-01-01T00:00:00Z', 2, NULL, 22, NULL),
    (476, 'Flor', 'R. Z', '2015-10-28T00:00:00Z', 2, NULL, 23, 23),
    (25, 'Lina', 'R. 67', '2014-09-01T00:00:00Z', 2, NULL, 23, NULL),
    (3, 'Jose da Silva', 'R. 8', '2011-01-02T00:00:00Z', 3, 3, 31, NULL),
    (71, 'Silverio dos Reis', 'R. C', '2009-01-05T00:00:00Z', 3, NULL, 31, 31),
    (91, 'Reis da Silva', 'R. Z', '2011-11-05T00:00:00Z', 3, NULL, 31, NULL),
    (55, 'Lucas', 'R. 31', '2013-07-01T00:00:00Z', 3, NULL, 32, 32),
    (222, 'Marina', 'R. 31', '2015-01-07T00:00:00Z', 3, NULL, 32, NULL),
    (725, 'Angelo', 'R. X', '2001-03-01T00:00:00Z', 2, NULL, 21, NULL);
 
INSERT INTO dependente VALUES
    (9999, 'Francisco Jose', 'R. Z'),
    (88, 'Maria da Silva', 'R. T'),
    (55, 'Virgulino da Silva', 'R. 31');
 
INSERT INTO desconto VALUES
    (91, 'IR', 'V', 400),
    (92, 'Plano de saude', 'V', 300),
    (93, NULL, NULL, NULL);
 
INSERT INTO vencimento VALUES
    (1, 'Salario base Analista de Sistemas', 'V', 5000),
    (2, 'Salario base Contador', 'V', 3000),
    (3, 'Salario Base Engenheiro', 'V', 4500),
    (4, 'Salario Base Projetista Software', 'V', 5000),
    (5, 'Salario Base Programador de Sistemas', 'V', 3000),
    (6, 'Gratificacao Chefia Departamento', 'V', 3750),
    (7, 'Gratificacao Chefia Divisao', 'V', 2200),
    (8, 'Salario Trabalhador Costrucao Civil', 'V', 800),
    (9, 'Auxilio Salario Familia', 'V', 300),
    (10, 'Gratificacao Tempo de servico', 'V', 350),
    (11, 'Insalubridade', 'V', 800),
    (12, 'Gratificacao por titulacao - Doutorado', 'V', 2000),
    (13, 'Gratificacao por Titularidade - Mestrado', 'v', 800);
 
INSERT INTO emp_desc VALUES
    (91, 3),
    (91, 27),
    (91, 9999),
    (92, 27),
    (92, 71),
    (92, 88),
    (92, 9999);
 
INSERT INTO emp_venc VALUES
    (1, 27),
    (1, 88),
    (1, 135),
    (1, 254),
    (1, 431),
    (2, 1),
    (2, 5),
    (2, 7),
    (2, 13),
    (2, 33),
    (2, 9999),
    (3, 3),
    (3, 55),
    (3, 71),
    (3, 222),
    (4, 25),
    (4, 476),
    (5, 371),
    (6, 3),
    (6, 27),
    (6, 9999),
    (7, 5),
    (7, 33),
    (7, 55),
    (7, 71),
    (7, 88),
    (7, 254),
    (7, 476),
    (8, 25),
    (8, 91),
    (9, 1),
    (9, 27),
    (9, 91),
    (9, 135),
    (9, 371),
    (9, 9999),
    (10, 371),
    (10, 9999),
    (11, 91),
    (12, 3),
    (12, 27),
    (12, 254),
    (12, 9999),
    (13, 3),
    (13, 5),
    (13, 7),
    (13, 25),
    (13, 33),
    (13, 88),
    (13, 135);


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
), MEDIA_SAL_DIV AS(
	SELECT 
		T6.COD_DIVISAO,
		T6.COD_DEP,
		ROUND(AVG(SALARIO_EMP.SALARIO_CDESCONTO),2) AS MEDIA_SAL_DIV
	FROM SALARIO_EMP
	JOIN EMPREGADO AS T1 ON SALARIO_EMP.MATR = T1.MATR
	JOIN DIVISAO AS T6 ON T1.LOTACAO_DIV = T6.COD_DIVISAO
	--FROM DIVISAO AS T6
	--LEFT JOIN SALARIO_EMP ON T6.COD_DIVISAO = SALARIO_EMP.LOTACAO_DIV
	GROUP BY (T6.COD_DIVISAO)
)
 select


/*
SELECT 
	--T7.NOME AS DEPARTAMENTO, 
	T6.NOME AS DIVISAO,
	SALARIO_DEP.MEDIA_SAL_DEP AS MEDIA	
	--ROUND(SUM(DISTINCT COALESCE(T3.VALOR, 0)) - SUM(DISTINCT COALESCE(T5.valor, 0)),2) AS SALARIO
FROM EMPREGADO AS T1
LEFT JOIN EMP_VENC AS T2 ON T1.MATR = T2.MATR
LEFT JOIN VENCIMENTO AS T3 ON T2.COD_VENC = T3.COD_VENC
LEFT JOIN EMP_DESC AS T4 ON T1.MATR = T4.MATR
LEFT JOIN DESCONTO AS T5 ON T4.COD_DESC = T5.COD_DESC
LEFT JOIN DIVISAO AS T6 ON T1.LOTACAO = T6.COD_DEP
LEFT JOIN DEPARTAMENTO AS T7 ON T6.COD_DEP = T7.COD_DEP
INNER JOIN(
	SELECT 
	SALARIO_EMP.LOTACAO_DIV,	
	ROUND(AVG(SALARIO_EMP.SALARIO),2) AS MEDIA_SAL_DEP	
	FROM(
		SELECT
			T1.MATR,
			T1.NOME,
			T1.LOTACAO_DIV,
			ROUND(SUM(DISTINCT COALESCE(T3.VALOR, 0)) - SUM(DISTINCT COALESCE(T5.valor, 0)),2) AS SALARIO
		FROM EMPREGADO AS T1
		LEFT JOIN EMP_VENC AS T2 ON T1.MATR = T2.MATR
		LEFT JOIN VENCIMENTO AS T3 ON T2.COD_VENC = T3.COD_VENC
		LEFT JOIN EMP_DESC AS T4 ON T1.MATR = T4.MATR
		LEFT JOIN DESCONTO AS T5 ON T4.COD_DESC = T5.COD_DESC
		GROUP BY (T1.MATR)
	)AS SALARIO_EMP 
	GROUP BY(SALARIO_EMP.LOTACAO_DIV)
	--INNER JOIN EMPREGADO AS T1 ON 
	--GROUP BY T6.COD_DIVISAO
	--ON SALARIO_EMP.MATR = T1.MATR
) AS SALARIO_DEP ON SALARIO_DEP.LOTACAO_DIV = T1.LOTACAO_DIV
GROUP BY T6.NOME--, SALARIO_DEP.MEDIA_SAL_DEP--, t4.nome 
*/


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
 where salario.valor > medias.valor
 order by salario.valor desc