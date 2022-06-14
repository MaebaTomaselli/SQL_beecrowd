/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2605 - Representantes Executivos

O setor financeiro precisa de um relatório sobre os fornecedores dos produtos que 
vendemos. Os relatórios contemplam todas as categorias, mas por algum motivo, os 
fornecedores dos produtos cuja categoria é a executiva, não estão no relatório.

Seu trabalho é retornar os nomes dos produtos e dos fornecedores cujo código da 
categoria é 6.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2605

CREATE TABLE categories (
  id numeric PRIMARY KEY,
  name varchar
);

CREATE TABLE providers (
  id numeric PRIMARY KEY,
  name varchar(50),
  street varchar(50),
  city varchar(50),
  state varchar(2)
);

CREATE TABLE products_7 (
  id numeric PRIMARY KEY,
  name varchar(50),
  amount numeric,
  price numeric(7,2),
  id_providers INT REFERENCES providers (id),
  id_categories INT REFERENCES categories (id)
);

INSERT INTO categories (id , name)
VALUES 
  (1,	'old stock'),
  (2,	'new stock'),
  (3,	'modern'),
  (4,	'commercial'),
  (5,	'recyclable'),
  (6,	'executive'),
  (7,	'superior'),
  (8,	'wood'),
  (9,	'super luxury'),
  (10,	'vintage');
  
INSERT INTO providers (id, name, street, city, state)
VALUES 
  (1,	'Henrique'	,'Av Brasil',	'Rio de Janeiro',	'RJ'),
  (2,	'Marcelo Augusto',	'Rua Imigrantes',	'Belo Horizonte',	'MG'),
  (3,	'Caroline Silva', 'Av São Paulo',	'Salvador',	'BA'),
  (4,	'Guilerme Staff',	'Rua Central',	'Porto Alegre',	'RS'),
  (5,	'Isabela Moraes',	'Av Juiz Grande',	'Curitiba',	'PR'),
  (6,	'Francisco Accerr',	'Av Paulista',	'São Paulo',	'SP');
  
INSERT INTO products_7 (id, name, amount, price, id_providers, id_categories)
VALUES
  (1,	'Two-door wardrobe',	100,	800,	6,	8),
  (2,	'Dining table',	1000,	560,	1,	9),	
  (3,	'Towel holder',	10000,	25.50,	5,	1),
  (4,	'Computer desk',	350,	320.50,	4,	6),
  (5,	'Chair',	3000,	210.64,	3,	6),
  (6,	'Single bed',	750,	460,	1,	2);
  
  /*  Execute this query to drop the tables */
  -- DROP TABLE products, providers, categories; --



/***** RESOLUÇÃO DO PROBLEMA *****/

SELECT 
	T1.NAME,
	T2.NAME
FROM PRODUCTS_7 AS T1
JOIN PROVIDERS AS T2 ON T1.ID_CATEGORIES = 6
AND T1.ID_PROVIDERS = T2.ID;


--Resolução em aula: professor Matheus Araujo - Let's Code

SELECT 
	T1.NAME,
	T2.NAME
FROM PRODUCTS_7 AS T1
JOIN PROVIDERS AS T2 ON T1.ID_PROVIDERS = T2.ID
WHERE T1.ID_CATEGORIES = 6;