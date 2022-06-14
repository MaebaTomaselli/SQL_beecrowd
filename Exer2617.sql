/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2617 - Fornecedor Ajax SA

O setor financeiro encontrou alguns problemas na entrega de um dos nossos fornecedores, 
a entrega dos produtos não condiz com a nota fiscal.

Seu trabalho é exibir o nome dos produtos e o nome do fornecedor, para os produtos 
fornecidos pelo fornecedor ‘Ajax SA’.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:
CREATE TABLE providers_2 AS SELECT * FROM providers;

CREATE TABLE providers_2(
	id NUMERIC PRIMARY KEY,
	name VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (255),
	state CHAR (2)
);
--DROP TABLE providers_2;
--SELECT * FROM providers_2;
--TRUNCATE TABLE providers_2;

INSERT INTO providers_2(id, name, street, city, state)
	VALUES(1, 'Ajax SA', 'Presidente Castelo Branco', 'Porto Alegre', 'RS');
INSERT INTO providers_2(id, name, street, city, state)
	VALUES(2, 'Sansul SA', 'Av Brasil', 'Rio de Janeiro', 'RJ');
INSERT INTO providers_2(id, name, street, city, state)
	VALUES(3, 'South Chairs', '	Av Moinho', 'Santa Maria', 'RS');
INSERT INTO providers_2(id, name, street, city, state)
	VALUES(4, 'Elon Electro', 'Apolo', 'São Paulo', 'SP');
INSERT INTO providers_2(id, name, street, city, state)
	VALUES(5, 'Mike Electro', 'Pedro da Cunha', '	Curitiba', 'PR');
	

CREATE TABLE products_3(
	id NUMERIC PRIMARY KEY,
	name VARCHAR(255),
	amount NUMERIC,
	price NUMERIC,
	id_providers INT REFERENCES providers_2(id)
);

INSERT INTO products_3 (id, name, amount, price, id_providers)
	VALUES (1, 'Blue Chair', 30, 300.00, 5);
INSERT INTO products_3 (id, name, amount, price, id_providers)
	VALUES (2, 'Red Chair', 50, 2150.00, 1);
INSERT INTO products_3 (id, name, amount, price, id_providers)
	VALUES (3, 'Disney Wardrobe', 400, 829.50, 4);
INSERT INTO products_3 (id, name, amount, price, id_providers)
	VALUES (4, 'Blue Toaster', 20, 9.90, 3);
INSERT INTO products_3 (id, name, amount, price, id_providers)
	VALUES (5, 'Solar Panel', 30, 3000.25, 4);
	
	
/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	PROD.NAME,
	PROV.NAME
FROM PRODUCTS_3 AS PROD
INNER JOIN PROVIDERS_2 AS PROV ON PROV.ID = PROD.ID_PROVIDERS
WHERE PROV.NAME = 'Ajax SA'