/*****************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2609 - Produtos por Categorias

Como de costume o setor de vendas está fazendo uma análise de quantos produtos temos em 
estoque, e você poderá ajudar eles.

Então seu trabalho será exibir o nome e a quantidade de produtos de cada uma categoria.

******************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Criação das tabelas com o sufixo 2 para manter as outras tabelas já criadas
CREATE TABLE categories_2(
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE products_2(
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR(100),
	amount INT,
	price FLOAT,
	id_categories INT REFERENCES categories_2(id)
);

INSERT INTO categories_2 (id, name) VALUES 
	(1, 'wood'),
	(2, 'luxury'),
	(3, 'vintage'),
	(4, 'modern'),
	(5, 'super luxury');
	
INSERT INTO products_2(id, name, amount, price, id_categories) VALUES
	(1, 'Two-doors wardrobe', 100, 800, 1),
	(2, 'Dining table', 1000, 560, 3),
	(3, 'Towel holder', 10000, 25.50, 4),
	(4, 'Computer desk', 350, 320.50, 2,
	(5, 'Chair', 3000, 210.64, 4),
	(6, 'Single bed', 750, 460, 1);
	
SELECT * FROM products_2;

SELECT * FROM categories_2;


/***** RESOLUÇÃO DO PROBLEMA *****/

--Somando as quantidades SUM(p.amount) de cada categoria agrupada pelo id da categoria
SELECT 
	 C.NAME,
	 SUM(P.AMOUNT)
FROM PRODUCTS_2 AS P
INNER JOIN CATEGORIES_2 AS C ON C.ID = P.ID_CATEGORIES
GROUP BY C.NAME;