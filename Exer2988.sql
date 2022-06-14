/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2988 - Campeonato Cearense

O Campeonato Cearense de Futebol atrai milhares de torcedores todos os anos, você 
trabalha em um jornal e está encarregado de calcular a tabela de pontuação dos times. 
Mostre uma tabela com as seguintes colunas: o nome do time, número de partidas, vitórias, 
derrotas, empates e pontuação. Sabendo que a pontuação é calculada com cada vitória 
valendo 3 pontos, empate vale 1 e derrota rende 0. No final mostre sua tabela com a 
pontuação ordenada do maior para o menor.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2988

CREATE TABLE teams (
    id integer PRIMARY KEY,
    name varchar(50)
);

--GRANT SELECT ON teams TO sql_user;

CREATE TABLE matches  (
    id integer PRIMARY KEY,
    team_1 integer,
    team_2 integer,
    team_1_goals integer,
    team_2_goals integer,
    FOREIGN KEY (team_1) REFERENCES teams(id),
    FOREIGN KEY (team_2) REFERENCES teams(id)
);

--GRANT SELECT ON matches TO sql_user;
insert into teams (id, name)
values
    (1,'CEARA'),
    (2,'FORTALEZA'),
    (3,'GUARANY DE SOBRAL'),
    (4,'FLORESTA');

insert into matches
    (id, team_1, team_2, team_1_goals, team_2_goals)
values
    (1,4,1,0,4),
    (2,3,2,0,1),
	(3,1,3,3,0),
	(4,3,4,0,1),
	(5,1,2,0,0),
	(6,2,4,2,1);
	
SELECT * FROM matches;

/* Execute this query to drop the table */
--DROP TABLE matches;


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT t1.name, 
		COUNT(t2.team_1) AS matches,
		COUNT(
			CASE
				WHEN (t2.team_1_goals > t2.team_2_goals AND t1.id = t2.team_1) 
					 OR (t2.team_2_goals > t2.team_1_goals AND t1.id = t2.team_2) 
					 THEN 1
				END
		)AS victories,
		COUNT(
			CASE
				WHEN (t2.team_1_goals < t2.team_2_goals AND t1.id = t2.team_1) 
					 OR (t2.team_2_goals < t2.team_1_goals AND t1.id = t2.team_2) 
					 THEN 1
				END
		)AS defeats,
		COUNT(
			CASE
				WHEN (t2.team_1_goals = t2.team_2_goals AND t1.id = t2.team_1) 
					 OR (t2.team_2_goals = t2.team_1_goals AND t1.id = t2.team_2) 
					 THEN 1
				END
		)AS draws,
		COUNT(
			CASE
				WHEN (t2.team_1_goals > t2.team_2_goals AND t1.id = t2.team_1) 
					 OR (t2.team_2_goals > t2.team_1_goals AND t1.id = t2.team_2) 
					 THEN 1
				END
		)*3+
		COUNT(
			CASE
				WHEN (t2.team_1_goals < t2.team_2_goals AND t1.id = t2.team_1) 
					 OR (t2.team_2_goals < t2.team_1_goals AND t1.id = t2.team_2) 
					 THEN 1
				END
		)*0+
		COUNT(
			CASE
				WHEN (t2.team_1_goals = t2.team_2_goals AND t1.id = t2.team_1) 
					 OR (t2.team_2_goals = t2.team_1_goals AND t1.id = t2.team_2) 
					 THEN 1
				END
		)AS score
	FROM teams AS t1
	INNER JOIN matches AS t2
	ON t1.id = t2.team_1 OR t1.id = t2.team_2
	GROUP BY t1.name
	ORDER BY score DESC;
