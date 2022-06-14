/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2623 - Categorias com Vários Produtos

O setor de vendas precisa de um relatório para saber quais produtos estão sobrando em 
estoque.

Para você ajudar o setor de vendas, exiba o nome do produto e o nome da categoria, 
para os produtos cuja quantidade seja maior que 100 e o código da categoria seja 
1,2,3,6 ou 9. Mostre essas informações em ordem crescente pelo código da categoria.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2623

CREATE TABLE categories_4 (
  id numeric PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE products_6 (
  id numeric PRIMARY KEY,
  name varchar (255),
  amount numeric,
  price numeric,
  id_categories numeric REFERENCES categories_4 (id)
);


INSERT INTO categories_4 (id, name)
VALUES
  (1,	'Superior'),
  (2,	'Super Luxury'),
  (3,	'Modern'),
  (4,	'Nerd'),
  (5,	'Infantile'),
  (6,	'Robust'),
  (9,	'Wood');

INSERT INTO products_6 (id, name, amount, price, id_categories)
VALUES
  (1,	'Blue Chair',	30, 300.00,	9),
  (2,	'Red Chair',	200,	2150.00, 2),
  (3,	'Disney Wardrobe',	400,	829.50,	4),
  (4,	'Blue Toaster',	20,	9.90,	3),
  (5,	'Solar Panel',	30,	3000.25,	4);


/*  Execute this query to drop the tables */
-- DROP TABLE products, categories; --


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	T1.NAME,
	T2.NAME
FROM PRODUCTS_6 AS T1
INNER JOIN CATEGORIES_4 AS T2 ON T1.ID_CATEGORIES = T2.ID
WHERE (T1.AMOUNT > 100)
	  AND (T1.ID_CATEGORIES = 1
		   OR T1.ID_CATEGORIES = 2
		   OR T1.ID_CATEGORIES = 3
		   OR T1.ID_CATEGORIES = 6
		   OR T1.ID_CATEGORIES = 9)
ORDER BY T1.ID_CATEGORIES ASC;