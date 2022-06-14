/***************************************************************************************

2625

Máscara de CPF

Os diretores do setor de comunicação da sua empresa querem um relatório sobre os dados dos 
clientes físicos que estão cadastrados no banco de dados. Porem o antigo relatório teve um 
problema. Os dados do CPF dos clientes vieram sem a máscara.

Por isso seu trabalho agora é selecionar todos os CPFs de todos os clientes, e aplicar uma 
máscara sobre o retorno dos dados.

A máscara do CPF é parecida com: '000.000.000-00'.

**************************************************************************************/

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2625

CREATE TABLE customers_4 (
  id numeric PRIMARY KEY,
  name varchar(255),
  street varchar(255),
  city varchar(255),
  state char(2),
  credit_limit numeric
);

CREATE TABLE natural_person (
  id_customers numeric REFERENCES customers_4 (id),
  cpf char (14)
);


INSERT INTO customers_4 (id, name, street, city, state, credit_limit)
VALUES
  (1,	'Nicolas Diogo Cardoso',	'Acesso Um',	'Porto Alegre',	'RS',	475),
  (2,	'Cecília Olivia Rodrigues',	'Rua Sizuka Usuy',	'Cianorte',	'PR',	3170),
  (3,	'Augusto Fernando Carlos Eduardo Cardoso',	'Rua Baldomiro Koerich',	'Palhoça',	'SC',	
   1067),
  (4,	'Nicolas Diogo Cardoso',	'Acesso Um',	'Porto Alegre',	'RS',	475),
  (5,	'Sabrina Heloisa Gabriela Barros',	'Rua Engenheiro Tito Marques Fernandes', 'Porto Alegre',	
   'RS',	4312),
  (6,	'Joaquim Diego Lorenzo Araújo',	'Rua Vitorino',	'Novo Hamburgo',	'RS',	2314);
  
INSERT INTO natural_person (id_customers, cpf)
VALUES
  (1,	'26774287840'),
  (2,	'97918477200');
  
  
  /*  Execute this query to drop the tables */
  -- DROP TABLE natural_person, customers; -- 
  
--Pega uma parte do char (substr indo do caractere 1 ao 3 na primeira linha e concatena (||) com o 
--ponto, faz isso para todas as partes)
SELECT substr(cpf, 1, 3) || '.' ||
       substr(cpf, 4, 3) || '.' ||
       substr(cpf, 7, 3) || '-' ||
       substr(cpf, 10) as CPF
FROM natural_person;
        --FROM (select cast('93746041597' as varchar) as cpf)a
 
--Outras formas de fazer
--Seleciona os bloquinhos dos dígitos e coloca o ponto ou o hífen em cada bloquinho
/**
http://jquerydicas.blogspot.com/2015/04/postgresql-formatar-cpf-com.html
Utilizamos parenteses "( )" para separar cada parte da string, neste caso o CPF;
Utilizamos colchetes   "[ ]" para indicar quais os caracteres que iremos utilizar em cada parte, 
neste caso utilizamos caracteres numéricos de "0" até "9", representados pela expressão 0-9;
Indicamos dentro das chaves "{}" a quantidade de dígitos que vamos utilizar; 
Utilizamos contra-barra "\" antes de cada parte criada;
**/
SELECT 
REGEXP_REPLACE (CPF, '([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})', '\1.\2.\3-\4') AS CPF
FROM natural_person;

--Substituindo a expressão acima de [0-9] por \d
SELECT 
REGEXP_REPLACE (CPF, '(\d{3})(\d{3})(\d{3})(\d{2})', '\1.\2.\3-\4') AS CPF
FROM natural_person;