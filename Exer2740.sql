/***************************************************************************************

2740

A Liga Internacional de Escavação Subterrânea já é um sucesso entre os esportes 
alternativos, porém todos que trabalham na organização do evento trabalham com escavação 
e não computação. Então você foi contratado para solucionar o problema da Liga.

Selecione os três primeiros colocados da lista com a frase inicial Podium: e também, 
os dois últimos times que serão rebaixados para série B com a frase inicial Demoted:

**************************************************************************************/

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2740

CREATE TABLE league(
  position INTEGER,
  team CHARACTER VARYING (255)
);


INSERT INTO league(position, team)
VALUES (1, 'The Quack Bats'),
       (2, 'The Responsible Hornets'),
       (3, 'The Bawdy Dolphins'),
       (4, 'The Abstracted Sharks'),
       (5, 'The Nervous Zebras'),
       (6, 'The Oafish Owls'),
       (7, 'The Unequaled Bison'),
       (8, 'The Keen Kangaroos'),
       (9, 'The Left Nightingales'),
       (10, 'The Terrific Elks'),
       (11, 'The Lumpy Frogs'),
       (12, 'The Swift Buffalo'),
       (13, 'The Big Chargers'),
       (14, 'The Rough Robins'),
       (15, 'The Silver Crocs');

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE league; --


SELECT 'Podium: '||team AS name
	FROM(SELECT * FROM league LIMIT 3) AS t1
UNION ALL
SELECT * FROM(
	SELECT 'Demoted: '||team AS name
		FROM(SELECT * FROM league ORDER BY position DESC LIMIT 2) AS t2
	ORDER BY position ASC
)AS a1;