/******************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2614 - Locações de Setembro

A vídeo locadora está fazendo seu relatório semestral e precisa da sua ajuda. Basta você 
selecionar o nome dos clientes e a data de locação, das locações realizadas no mês de 
setembro de 2016.

******************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

CREATE TABLE customers(
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR(100),
	street VARCHAR(100),
	city VARCHAR(100)
)

CREATE TABLE rentals(
	id INT NOT NULL PRIMARY KEY,
	rentals_date DATE,
	id_customers INT REFERENCES customers(id) 
)

INSERT INTO customers (id, name, street, city) VALUES
	(1, 'Giovanna Goncalves Oliveira', 'Rua Mato Grosso', 'Canoas'),
	(2, 'Kauã Azevedo Ribeiro', 'Travessa Ibiá', 'Uberlândia'),
	(3, 'Rebeca Barbosa Santos', 'Rua Observatório Meteorológico', 'Salvador'),
	(4, 'Sarah Carvalho Correia', 'Rua Antônio Carlos da Silva', 'Apucarana'),
	(5, 'João Almeida Lima', 'Rua Rio Taiuva', 'Ponta Grossa'),
	(6, 'Diogo Melo Dias', '	Rua Duzentos e Cinquenta', 'Várzea Grande');
	
INSERT INTO rentals(id, rentals_date, id_customers) VALUES
	(1, '2016-09-10', 3),
	(2, '2016-02-09', 1),
	(3, '2016-02-08', 4),
	(4, '2016-02-09', 2),
	(5, '2016-02-03', 6),
	(6, '2016-04-04', 4);
	
SELECT * FROM rentals;

SELECT * FROM customers;


/***** RESOLUÇÃO DO PROBLEMA *****/

SELECT 
	C.NAME,
	R.RENTALS_DATE
FROM CUSTOMERS AS C
INNER JOIN RENTALS AS R ON C.ID = R.ID_CUSTOMERS
WHERE R.RENTALS_DATE BETWEEN '2016-09-01' AND '2016-09-30';

--Outra maneira, selecionando o mês e o ano
SELECT 
	C.NAME,
	R.RENTALS_DATE
FROM CUSTOMERS AS C
INNER JOIN RENTALS AS R ON C.ID = R.ID_CUSTOMERS
WHERE EXTRACT(MONTH FROM R.RENTALS_DATE) = 09
	  AND EXTRACT(YEAR FROM R.RENTALS_DATE) = 2016;

--Resolução em aula: professor Matheus Araujo - Let's Code
SELECT 
	CUSTOMERS.NAME,
	TO_CHAR(RENTALS.RENTALS_DATE, 'YYYY-DD-MM') AS RENTALS_DATE
FROM CUSTOMERS
INNER JOIN RENTALS ON CUSTOMERS."id" = RENTALS.ID_CUSTOMERS
WHERE DATE_PART('year', RENTALS.RENTALS_DATE) = '2016'
	  AND DATE_PART('MONTH', RENTALS.RENTALS_DATE) = '09';
