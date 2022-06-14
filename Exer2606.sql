/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2606 - Categorias

Quando os dados foram migrados de Banco de Dados, houve um pequeno mal-entendido por 
parte do antigo DBA.

Seu chefe precisa que você exiba o código e o nome dos produtos, cuja categoria 
inicie com 'super'.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

CREATE TABLE categories(
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR (100)
);

CREATE TABLE products (
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR (100),
	amount INT,
	price FLOAT,
	id_categories INT REFERENCES categories(id)
);

INSERT INTO categories (id, name) VALUES 
	(1, 'old stock'),
	(2, 'new stock'),
	(3, 'modern'),
	(4, 'commercial'),
	(5, 'recyclable'),
	(6, 'executive'),
	(7, 'superior'),
	(8, 'wood'),
	(9, 'super luxury'),
	(10, 'vintage');

SELECT * FROM categories;

INSERT INTO products (id, name, amount, price, id_categories) VALUES
	(1, 'Lampshade', 100, 800, 4),
	(2, 'Table for painting', 1000, 560, 9),
	(3, 'Notebook desk', 10000, 25.50, 9),
	(4, 'Computer desk', 350, 320.50, 6),
	(5, 'Chair', 3000, 210.64, 9),
	(6, 'Home alarm', 750, 460, 4);
	
SELECT * FROM products;


/***** RESOLUÇÃO DO PROBLEMA *****/

SELECT 
	PRODUCTS.ID,
	PRODUCTS.NAME
FROM PRODUCTS
INNER JOIN CATEGORIES ON PRODUCTS.ID_CATEGORIES = CATEGORIES.ID
WHERE LOWER(CATEGORIES.NAME) LIKE 'super%';

--Resolução alternativa
SELECT 
	PRODUCTS.ID,
	PRODUCTS.NAME
FROM PRODUCTS
INNER JOIN CATEGORIES ON PRODUCTS.ID_CATEGORIES = CATEGORIES.ID
WHERE LEFT(CATEGORIES.NAME, 5) = 'super';