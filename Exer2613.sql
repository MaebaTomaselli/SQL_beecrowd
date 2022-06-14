/*****************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2613 - Filmes em Promoção

Antigamente a locadora fez um evento em que vários filmes estavam em promoção, queremos 
saber que filmes eram esses.

Seu trabalho para nós ajudar é selecionar o ID e o nome dos filmes cujo preço for menor 
que 2.00.

*****************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2613

CREATE TABLE prices (
  id numeric PRIMARY KEY,
  categorie varchar(50),
  value numeric
);


CREATE TABLE movies_2 (
  id numeric PRIMARY KEY,
  name varchar(50),
  id_prices numeric REFERENCES prices (id)
);

INSERT INTO prices (id , categorie, value)
VALUES
  (1,	'Releases',	3.50),
  (2,	'Bronze Seal',	2.00),
  (3,	'Silver Seal',	2.50),
  (4,	'Gold Seal',	3.00),
  (5,	'Promotion',	1.50);
  
INSERT INTO movies_2 (id, name, id_prices)
VALUES
  (1,	'Batman',	3),
  (2,	'The Battle of the Dark River',	3),
  (3,	'White Duck',	5),
  (4,	'Breaking Barriers',	4),
  (5,	'The Two Hours',	2);
  
  /*  Execute this query to drop the tables */
  -- DROP TABLE movies, prices; --


/***** RESOLUÇÃO DO PROBLEMA *****/

SELECT 
	M.ID,
	M.NAME
FROM MOVIES_2 AS M
INNER JOIN PRICES AS P ON M.ID_PRICES = P.ID
WHERE P.VALUE < 2.00
