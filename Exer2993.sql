/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2993  - Mais Frequente

Dada uma single-column table de valores inteiros, qual é o valor atributo mais 
frequente, ou seja, a moda estatística desses valores?

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2993

CREATE TABLE value_table (
    amount integer
);

--GRANT SELECT ON value_table TO sql_user;

insert into
value_table (amount)
values
(4),(6),(7),(1),(1),(2),(3),(2),(3),(1),(5),(6),(1),(7),(8),(9),(10),(11),(12),(4),(5),
(5),(3),(6),(2),(2),(1);

SELECT * FROM value_table;

/*  Execute this query to drop the tables */
-- DROP TABLE value_table;


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT AMOUNT AS MOST_FREQUENT_VALUE
FROM
	(SELECT AMOUNT,
			COUNT(AMOUNT) AS MOST_FREQUENT_VALUE
		FROM VALUE_TABLE
		GROUP BY AMOUNT
		ORDER BY MOST_FREQUENT_VALUE DESC
		LIMIT 1)AS T1;

