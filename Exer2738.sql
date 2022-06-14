/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2738 - Concurso

A Universidade Tecnológica de Marte está com seu concurso aberto para Pesquisadores. 
Porém o computador que processava os dados dos candidatos estragou. Você deve mostrar 
a lista dos candidatos, contendo o nome do candidato e a sua pontuação final (com duas 
casas decimais após a vírgula). Lembre-se de mostrar a lista ordenada pela pontuação 
do candidato (maior pontuação no topo da lista).

A pontuação do candidato é o resultado da média ponderada:
avg = (math*2 + specif* + project_plan*5)/10

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2738

create table candidate(
  id INTEGER PRIMARY KEY,
  name VARCHAR (255)
);

create table score(
  candidate_id INTEGER REFERENCES candidate (id),
  math NUMERIC,
  specific NUMERIC,
  project_plan NUMERIC
);


INSERT INTO candidate(id, name)
VALUES 
	   (1, 'Michael P Cannon'),
       (2, 'Barbra J Cable'),
       (3, 'Ronald D Jones'),
       (4, 'Timothy K Fitzsimmons'),
       (5, 'Ivory B Morrison'),
       (6, 'Sheila R Denis'),
       (7, 'Edward C Durgan'),
       (8, 'William K Spencer'),
       (9, 'Donna D Pursley'),
       (10, 'Ann C Davis');

INSERT INTO score(candidate_id, math, specific, project_plan)
VALUES 
	   (1, 76, 58, 21),
       (2, 4, 5, 22),
       (3, 15, 59, 12),
       (4, 41, 42, 99),
       (5, 22, 90, 9),
       (6, 82, 77, 15),
       (7, 82, 99, 56),
       (8, 11, 4, 22),
       (9, 16, 29, 94),
       (10, 1, 7, 59);

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE score, candidate; --


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT T1.NAME,
	   ROUND((((T2.MATH * 2) + (T2.SPECIFIC * 3) + (T2.PROJECT_PLAN * 5)) / 10),2) AS AVG
FROM CANDIDATE AS T1
INNER JOIN SCORE AS T2 ON T1.ID = T2.CANDIDATE_ID
ORDER BY AVG DESC;