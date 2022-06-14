/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2618 - Produtos Importados

O setor de importação da nossa empresa precisa de um relatório sobre a importação de 
produtos do nosso fornecedor Sansul.

Sua tarefa é exibir o nome dos produtos, o nome do fornecedor e o nome da categoria, para 
os produtos fornecidos pelo fornecedor ‘Sansul SA’ e cujo nome da categoria seja 'Imported'.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2618

CREATE TABLE providers_2 (
  id numeric PRIMARY KEY,
  name varchar(255),
  street varchar(255),
  city varchar(255),
  state char(2)
);

CREATE TABLE categories_3 (
  id numeric PRIMARY KEY,
  name varchar(255)
);


CREATE TABLE products_4 (
  id numeric PRIMARY KEY,
  name varchar (255),
  amount numeric,
  price numeric,
  id_providers numeric REFERENCES providers_2 (id),
  id_categories numeric REFERENCES categories_3 (id)
);


INSERT INTO providers_2 (id, name, street, city, state)
VALUES
  (1,	'Ajax SA',	'Rua Presidente Castelo Branco',	'Porto Alegre',	'RS'),
  (2,	'Sansul SA',	'Av Brasil',	'Rio de Janeiro',	'RJ'),
  (3,	'South Chairs',	'Rua do Moinho',	'Santa Maria',	'RS'),
  (4,	'Elon Electro',	'Rua Apolo',	'São Paulo',	'SP'),
  (5,	'Mike Electro',	'Rua Pedro da Cunha',	'Curitiba',	'PR');

INSERT INTO categories_3 (id, name)
VALUES
  (1,	'Super Luxury'),
  (2,	'Imported'),
  (3,	'Tech'),
  (4,	'Vintage'),
  (5,	'Supreme');
  
INSERT INTO products_4 (id, name, amount, price, id_providers, id_categories)
VALUES
  (1,	'Blue Chair',	30,	300.00,	5,	5),
  (2,	'Red Chair',	50,	2150.00,	2,	1),
  (3,	'Disney Wardrobe',	400,	829.50,	4,	1),
  (4,	'Blue Toaster',	20,	9.90,	3,	1),
  (5,	'TV',	30,	3000.25,	2,	2);
  
  
/*  Execute this query to drop the tables */
-- DROP TABLE products, categories, providers; --


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	PROD.NAME,
	PROV.NAME,
	CAT.NAME
FROM PRODUCTS_4 AS PROD
INNER JOIN PROVIDERS_2 AS PROV ON PROV.ID = PROD.ID_PROVIDERS
INNER JOIN CATEGORIES_3 AS CAT ON CAT.ID = PROD.ID_CATEGORIES
WHERE PROV.NAME = 'Sansul SA'
	  AND CAT.NAME = 'Imported';
