/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 3001 - Update sem Where

Seu amigo Zé Maria se encontra em uma emboscada porque fez um update sem where e 
acabou zerando todos os valores da coluna price. Para sua sorte, o preço pode ser 
calculado novamente sabendo o tipo do produto.

Se o tipo do produto é igual A, o preço será 20.0
Se o tipo do produto é igual B, o preço será 70.0
Se o tipo do produto é igual C, o preço será 530.5
O seu trabalho é mostrar o nome e o preço de todos os produtos. Você também deve 
mostrar os produtos em conjuntos com a seguinte ordem: primeiro todos os produtos 
do tipo A, segundo o tipo B, e por último o tipo C. Além disso, os produtos de cada
um dos conjuntos (A,B,C), devem está ordenados pelo seu ID de forma decrescente.

**************************************************************************************/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2994

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 3001

CREATE TABLE products_8 (
id numeric PRIMARY KEY,
name varchar(50),
type char,
price numeric
);

--GRANT SELECT ON products TO sql_user;

INSERT INTO products_8 (id , name, type, price)
VALUES
(1, 'Monitor',  'B', 0),
(2, 'Headset',  'A', 0),
(3, 'PC Case',  'A', 0),
(4, 'Computer Desk', 'C', 0),
(5, 'Gaming Chair', 'C', 0),
(6, 'Mouse',  'A', 0);

/*  Execute this query to drop the tables */
-- DROP TABLE products;


/***** RESOLUÇÃO DO PROBLEMA *****/

SELECT name, 
	CASE type
		WHEN 'A' THEN 20.0
		WHEN 'B' THEN 70.0
		WHEN 'C' THEN 530.5
	END price
FROM products_8
ORDER BY type, id DESC