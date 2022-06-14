/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2996 - Entrega de Pacotes	

Você trabalha em uma transportadora e precisa mostrar com urgência o ano e o nome de 
todos os clientes que enviaram e receberam pacotes azuis ou do ano de 2015 e também 
que o endereço do seu remetente ou destinatário não seja de Taiwan. Além disso, você
deve ordenar o resultado pelo ano de maneira decrescente.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2996

CREATE TABLE users (
	id integer PRIMARY KEY,
	name varchar(50),
	address varchar(50)
);

--GRANT SELECT ON users TO sql_user;

CREATE TABLE packages (
	id_package integer PRIMARY KEY,
	id_user_sender integer,
	id_user_receiver integer,
	color varchar(50),
	year integer,
	FOREIGN KEY (id_user_sender) REFERENCES users(id),
	FOREIGN KEY (id_user_receiver) REFERENCES users(id)
);

--GRANT SELECT ON packages TO sql_user;

insert into users (id,name,address) values
	(1,'Edgar Codd','England'),
	(2,'Peter Chen','Taiwan'),
	(3,'Jim Gray','United States'),
	(4,'Elizabeth ONeil','United States');

insert into packages (id_package,id_user_sender,id_user_receiver,color,year) values
	(1,1,2,'blue',2015),
	(2,1,3,'blue',2019),
	(3,2,4,'red',2019),
	(4,2,1,'green',2018),
	(5,3,4,'red',2015),
	(6,4,3,'blue',2019);

/*  Execute this query to drop the tables */
-- DROP TABLE packages;
-- DROP TABLE users;


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	T1.YEAR,
	T2.NAME AS SENDER,
	T3.NAME AS RECEIVER
FROM PACKAGES AS T1 
--Utilizando dois join na mesma tabela para apresentar o mesmo campo (name) da users utilizado em
--dois campos da tabela packages (id_user_sender e id_user_receiver)
LEFT JOIN USERS AS T2 ON T1.ID_USER_SENDER = T2.ID
LEFT JOIN USERS AS T3 ON T1.ID_USER_RECEIVER = T3.ID
WHERE (T1.COLOR = 'blue' OR T1.YEAR = 2015)
	AND UPPER (T2.ADDRESS) <> 'TAIWAN'
	AND UPPER (T3.ADDRESS) <> 'TAIWAN'
ORDER BY T1.YEAR DESC;

