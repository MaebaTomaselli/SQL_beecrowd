/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2604 - Menores que 10 ou Maiores que 100

O setor financeiro da empresa precisa de um relatório que mostre o código e o nome dos 
produtos cujo preço são menores que 10 ou maiores que 100.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2604

CREATE TABLE products (
  id NUMERIC PRIMARY KEY,
  name CHARACTER VARYING (255),
  amount NUMERIC,
  price NUMERIC
);

INSERT INTO products (id, name, amount, price)
VALUES 
  (1,	'Two-door wardrobe',	100,	80),
  (2,	'Dining table',	1000,	560),
  (3,	'Towel holder',	10000,	5.50),
  (4,	'Computer desk',	350,	100),
  (5,	'Chair',	3000,	210.64),
  (6,	'Single bed',	750,	99);
  
  /*  Execute this query to drop the tables */
  -- DROP TABLE products; --


/***** RESOLUÇÃO DO PROBLEMA *****/

--Utilização do OU porque não existe uma faixa (entre um número e outro) e sim dois intervalos distintos
SELECT id, name FROM products WHERE price < 10 OR price > 100;