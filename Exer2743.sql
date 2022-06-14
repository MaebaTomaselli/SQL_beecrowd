/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2743 - Quantidade de Caracteres

A Organização Mundial de Caracteres em Nomes de Pessoas (OMCNP) está fazendo um censo 
para saber qual é a quantidade de caracteres que as pessoas têm em seus nomes.

Para ajudar a OMCNP, você deve mostrar a quantidade de caracteres de cada nome em 
ordem decrescente pela quantidade de caracteres.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2743

CREATE TABLE people(
	id INTEGER PRIMARY KEY,
	name varchar(255)
);


INSERT INTO people(id, name)
VALUES 
      (1, 'Karen'),
      (2, 'Manuel'),
      (3, 'Ygor'),
      (4, 'Valentine'),
      (5, 'Jo');

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE people; --


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	NAME,
	LENGTH(NAME)
FROM PEOPLE
ORDER BY LENGTH(NAME) DESC;