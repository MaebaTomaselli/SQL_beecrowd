/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2616 - Nenhuma Locação

A locadora pretende fazer uma promoção para os clientes que ainda não fizeram nenhuma 
locação.

Seu trabalho é nos entregar o ID e o nome dos clientes que não realizaram nenhuma locação. 
Ordene a saída por ID.

**************************************************************************************/

--Criação das tabelas
CREATE TABLE customers_2(
	id NUMERIC NOT NULL PRIMARY KEY,
	name VARCHAR,
	street VARCHAR,
	city VARCHAR
);

CREATE TABLE locations(
	id NUMERIC NOT NULL PRIMARY KEY,
	locations_date DATE,
	id_customers NUMERIC REFERENCES customers_2(id)
);

INSERT INTO customers_2 (id, name, street, city) VALUES
	(1, 'Giovanna Goncalves Oliveira', 'Rua Mato Grosso', 'Canoas'),
	(2, 'Kauã Azevedo Ribeiro', 'Travessa Ibiá', 'Uberlândia'),
	(3, 'Rebeca Barbosa Santos', 'Rua Observatório Meteorológico', 'Salvador'),
	(4, 'Sarah Carvalho Correia', 'Rua Antônio Carlos da Silva', 'Apucarana'),
	(5, 'João Almeida Lima', 'Rua Rio Taiuva', 'Ponta Grossa'),
	(6, 'Diogo Melo Dias', 'Rua Duzentos e Cinqüenta', 'Várzea Grande');
	
	
INSERT INTO locations (id, locations_date, id_customers)
	(1, '2016-10-09', 3),
	(2, '2016-09-02', 1),
	(3, '2016-08-02', 4),
	(4, '2016-09-02', 2),
	(5, '2016-03-02', 6),
	(6, '2016-04-04', 4);


SELECT * FROM customers_2;
SELECT * FROM locations;


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	C.ID,
	C.NAME
FROM LOCATIONS AS L
FULL JOIN CUSTOMERS_2 AS C ON L.ID_CUSTOMERS = C.ID
WHERE ID_CUSTOMERS IS NULL
ORDER BY C.ID;

--Resolução em aula: professor Matheus Araujo - Let's Code
--Solução sem o uso do JOIN, mais direta
SELECT 
	ID,
	NAME
FROM CUSTOMERS
WHERE ID NOT IN
		(SELECT ID_CUSTOMERS
			FROM LOCATIONS);