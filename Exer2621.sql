/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2621 - Quantidades Entre 10 e 20

Na hora de entregar o relatório de quantos produtos a empresa tem em estoque, uma parte 
do relatório ficou corrompida, por isso o responsável do estoque lhe pediu uma ajuda, 
ele quer que você exiba os seguintes dados para ele.

Exiba o nome dos produtos cujas quantidades estejam entre 10 e 20 e cujo nome do 
fornecedor inicie com a letra ‘P’.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2621

CREATE TABLE providers_3 (
  id numeric PRIMARY KEY,
  name varchar(255),
  street varchar(255),
  city varchar(255),
  state char(2)
);

CREATE TABLE products_5 (
  id numeric PRIMARY KEY,
  name varchar (255),
  amount numeric,
  price numeric,
  id_providers numeric REFERENCES providers_3 (id)
);


INSERT INTO providers_3 (id, name, street, city, state)
VALUES
  (1,	'Ajax SA',	'Rua Presidente Castelo Branco',	'Porto Alegre',	'RS'),
  (2,	'Sansul SA',	'Av Brasil',	'Rio de Janeiro',	'RJ'),
  (3,	'Pr Sheppard Chairs',	'Rua do Moinho',	'Santa Maria',	'RS'),
  (4,	'Elon Electro',	'Rua Apolo',	'São Paulo',	'SP'),
  (5,	'Mike Electro',	'Rua Pedro da Cunha',	'Curitiba',	'PR');
  
INSERT INTO products_5 (id, name, amount, price, id_providers)
VALUES
  (1,	'Blue Chair',	30,	300.00,	5),
  (2,	'Red Chair',	50,	2150.00,	2),
  (3,	'Disney Wardrobe',	400,	829.50,	4),
  (4,	'Executive Chair',	17,	9.90,	3),
  (5,	'Solar Panel',	30,	3000.25,	4);
  
/*  Execute this query to drop the tables */
-- DROP TABLE products, providers; -- 


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT T1.NAME
FROM PRODUCTS_5 AS T1
INNER JOIN PROVIDERS_3 AS T2 ON T1.ID_PROVIDERS = T2.ID
WHERE T1.AMOUNT BETWEEN 10 AND 20
	  AND LEFT(T2.NAME,1) = 'P';