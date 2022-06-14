/***************************************************************************************

2742

O Multiverso de Richard

Richard é um cientista muito famoso por suas teorias do multiverso, onde ele descreve 
que todo o conjunto hipotético de universos paralelos podem ser representados por meio 
de tabelas em um banco de dados. E graças a essa teoria você tem um emprego.

A sua primeira tarefa é selecionar todos os possíveis Richards das dimensões C875 e C774, 
junto a sua probabilidade de existência (o fator N) com a precisão de 3 casas decimais.

Lembre-se que (o fator N) é calculado multiplicando o valor omega por 1,618. Os dados 
devem ser ordenados pelo menor valor do campo omega.

**************************************************************************************/

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2742

CREATE TABLE dimensions(
	id INTEGER PRIMARY KEY,
	name varchar(255)
);

CREATE TABLE life_registry(
	id INTEGER PRIMARY KEY,
	name VARCHAR(255),
	omega NUMERIC,
	dimensions_id INTEGER REFERENCES dimensions (id)
);


INSERT INTO dimensions(id, name)
VALUES 
      (1, 'C774'),
      (2, 'C784'),
      (3, 'C794'),
      (4, 'C824'),
      (5, 'C875');
      
INSERT INTO life_registry(id, name, omega, dimensions_id)
VALUES
	  (1, 'Richard Postman', 5.6, 2),	
	  (2, 'Simple Jelly', 1.4, 1),	
	  (3, 'Richard Gran Master', 2.5, 1),	
	  (4, 'Richard Turing', 6.4, 4),	
	  (5, 'Richard Strall',	1.0, 3);

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE life_registry, dimensions; --
   
SELECT t1.name, ROUND((t1.omega*1.618),3) AS "Fator N"
FROM life_registry AS t1
INNER JOIN dimensions AS t2
ON t1.dimensions_id = t2.id
WHERE LEFT(t1.name,7) = 'Richard'
      AND (t2.name = 'C875'
	  OR t2.name = 'C774');