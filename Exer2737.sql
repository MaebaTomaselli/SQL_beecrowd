/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2737 - Advogados

O diretor da Mangojata Advogados ordenou que lhe fosse entregue um relatório sobre seus 
advogados atuais.

O diretor quer que você mostre para ele o nome do advogado que têm mais clientes, o nome 
do advogado que tem menos clientes e a média de clientes entre todos os advogados.

OBS: Antes de apresentar a média mostre um campo chamado Average a fim de deixar o 
relatório mais apresentável. A média deverá ser apresentada em inteiros.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2737

CREATE TABLE lawyers(
  register INTEGER PRIMARY KEY,
  name VARCHAR(255),
  customers_number INTEGER
 );
  
  
 INSERT INTO lawyers(register, name, customers_number)
 VALUES (1648, 'Marty M. Harrison', 5),
	(2427, 'Jonathan J. Blevins', 15),
	(3365, 'Chelsey D. Sanders', 20),
	(4153, 'Dorothy W. Ford', 16),
	(5525, 'Penny J. Cormier', 6);

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE lawyers; --
  
/***** RESOLUÇÃO DO PROBLEMA *****/

--Faz um SELECT externo com os campos desejados e uma subquery para adicionar a coluna de filtragem,
--as condições e fazer a união com a linha de média criada. A coluna de filtragem ajuda na ordenação.
SELECT 
	NAME,
	CUSTOMERS_NUMBER
FROM
	(SELECT 
	 		NAME,
			CUSTOMERS_NUMBER,
			1 AS FILTER
		FROM LAWYERS
		WHERE CUSTOMERS_NUMBER =
				(SELECT MAX(CUSTOMERS_NUMBER)
					FROM LAWYERS)
			OR CUSTOMERS_NUMBER =
				(SELECT MIN(CUSTOMERS_NUMBER)
					FROM LAWYERS)
		UNION ALL SELECT 'Average',
			ROUND(CAST(AVG(CUSTOMERS_NUMBER) AS NUMERIC)),
			2 AS FILTER
		FROM LAWYERS) AS TABLE1
ORDER BY FILTER, CUSTOMERS_NUMBER DESC;


--Resolução com SELECTs separados
SELECT * FROM
	(SELECT NAME, MAX(CUSTOMERS_NUMBER)
	FROM lawyers
	GROUP BY NAME
	ORDER BY MAX(CUSTOMERS_NUMBER) DESC
	LIMIT 1) AS A
UNION ALL SELECT * FROM
	(SELECT NAME, MIN(CUSTOMERS_NUMBER)
	FROM lawyers
	GROUP BY NAME
	ORDER BY MIN(CUSTOMERS_NUMBER) ASC
	LIMIT 1) AS B
UNION ALL SELECT 'Average', ROUND(CAST(AVG(CUSTOMERS_NUMBER) AS NUMERIC))
	FROM LAWYERS