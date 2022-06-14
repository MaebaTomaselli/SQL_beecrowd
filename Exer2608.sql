/******************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2608 - Maior e Menor Preço

O setor financeiro da nossa empresa, está querendo saber os menores e maiores valores dos 
produtos, que vendemos.
Para isso exiba somente o maior e o menor preço da tabela produtos.

******************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

CREATE TABLE products_min_max(
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR (100),
	amount INT,
	price FLOAT
)

INSERT INTO products_min_max(id, name, amount, price) VALUES
	(1, 'Two-doors wardrobe', 100, 800),
	(2, 'Dining table', 1000, 560),
	(3, 'Towel holder', 10000, 25.50),
	(4, 'Computer desk', 350, 320.50),
	(5, 'Chair', 3000, 210.64),
	(6, 'Single bed', 750, 460);
	
	
/***** RESOLUÇÃO DO PROBLEMA *****/
	
SELECT MAX(price), MIN(price) FROM products_min_max;