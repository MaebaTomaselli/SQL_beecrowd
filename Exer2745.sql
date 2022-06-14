/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2745 - Taxas

Você está indo para uma reunião no plano Internacional de Taxas Pessoais, sua proposta 
é: toda pessoa com renda acima de 3000 deve pagar uma taxa para o governo, essa taxa 
é 10% do que ela ganha.

Portanto, mostre o nome da pessoa e o valor que ela deve pagar para o governo com a 
precisão de duas casas decimais.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2745

CREATE TABLE people_2 (
  id INTEGER PRIMARY KEY,
  name CHARACTER VARYING (255),
  salary NUMERIC
);


INSERT INTO people_2(id, name, salary)
VALUES 
      (1, 'James M. Tabarez', 883),
      (2, 'Rafael T. Hendon', 4281),
      (3, 'Linda J. Gardner', 4437),
      (4, 'Nicholas J. Conn', 8011),
      (5, 'Karol A. Morales', 2508),
      (6, 'Lolita S. Graves', 8709);

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE people; --
  

/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	NAME, 
	ROUND((SALARY * 0.1),2)
FROM PEOPLE_2
WHERE SALARY > 3000;