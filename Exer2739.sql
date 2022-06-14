/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2739 - Dia de Pagamento

O Banco Central de Financiamentos perdeu vários registros após uma falha no servidor 
que ocorreu no mês de Outubro. As datas de cobrança das parcelas foram perdidas. 
Porém uma cópia de segurança foi encontrada contendo as informações sobre as datas 
de pagamento das parcelas dos clientes.

Por tanto, o Banco pede a sua ajuda para selecionar os nomes e o dia do mês que cada 
cliente deve pagar sua parcela.

OBS: Obrigatoriamente o dia do mês precisa ser um inteiro.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2739

CREATE TABLE loan(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  value NUMERIC,
  payday TIMESTAMP
 );

INSERT INTO loan(id, name, value, payday)
VALUES (1, 'Cristian Ghyprievy', 3000.50, '2017-10-19'),
       (2, 'John Serial', 10000, '2017-10-10'),
       (3, 'Michael Seven', 5000.40, '2017-10-17'),
       (4, 'Joana Cabel', 2000, '2017-10-05'),
       (5, 'Miguel Santos', 4050, '2017-10-20');

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE loan; --


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT NAME,
	   CAST(EXTRACT (DAY FROM PAYDAY) AS INTEGER) AS DAY
FROM LOAN;