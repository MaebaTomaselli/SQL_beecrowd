/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2603 - Endereço dos Clientes

A empresa fará um evento comemorando os 20 anos de mercado, e para isso faremos uma 
grande comemoração na cidade de Porto Alegre. Queremos também convidar todos os nossos 
clientes que estão cadastrados nessa cidade.

O seu trabalho é nos passar os nomes e os endereços dos clientes que moram em 'Porto 
Alegre', para entregar os convites pessoalmente.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2603

CREATE TABLE customers (
  id NUMERIC PRIMARY KEY,
  name CHARACTER VARYING (255),
  street CHARACTER VARYING (255),
  city CHARACTER VARYING (255),
  state CHAR (2),
  credit_limit NUMERIC
);

INSERT INTO customers (id, name, street, city, state, credit_limit)
VALUES
  (1,	'Pedro Augusto da Rocha',	'Rua Pedro Carlos Hoffman',	'Porto Alegre',	'RS',	700.00),
  (2,	'Antonio Carlos Mamel',	'Av. Pinheiros',	'Belo Horizonte',	'MG',	3500.50),	
  (3,	'Luiza Augusta Mhor,',	'Rua Salto Grande',	'Niteroi',	'RJ',	4000.00),
  (4,	'Jane Ester',	'Av 7 de setembro',	'Erechim',	'RS',	800.00),
  (5,	'Marcos Antônio dos Santos',	'Av Farrapos',	'Porto Alegre',	'RS',	4250.25);
  
  /*  Execute this query to drop the tables */
  -- DROP TABLE customers; --


/***** RESOLUÇÃO DO PROBLEMA *****/

SELECT name, street FROM customers WHERE city = 'Porto Alegre';