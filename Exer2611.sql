/*****************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2611 - Filmes de Ação

Uma Vídeo locadora contratou seus serviços para catalogar os filmes dela. Eles precisam 
que você selecione o código e o nome dos filmes cuja descrição do gênero seja 'Action'.

*****************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2611

CREATE TABLE genres (
  id numeric PRIMARY KEY,
  description varchar(50)
);

CREATE TABLE movies (
  id numeric PRIMARY KEY,
  name varchar(50),
  id_genres numeric REFERENCES genres (id)
);

INSERT INTO genres (id, description)
VALUES
  (1,	'Animation'),
  (2,	'Horror'),
  (3,	'Action'),
  (4,	'Drama'),
  (5,	'Comedy');
  
INSERT INTO movies (id, name, id_genres)
VALUES
  (1,	'Batman',	3),
  (2,	'The Battle of the Dark River',	3),
  (3,	'White Duck',	1),
  (4,	'Breaking Barriers',	4),
  (5,	'The Two Hours',	2);

/*  Execute this query to drop the tables */
-- DROP TABLE movies, genres; --


/***** RESOLUÇÃO DO PROBLEMA *****/

SELECT 
	M.ID,
	M.NAME
FROM MOVIES AS M
INNER JOIN GENRES AS G ON M.ID_GENRES = G.ID
WHERE LOWER (G.DESCRIPTION) = 'action';
