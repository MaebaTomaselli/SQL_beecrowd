/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2998 - The Payback	

Uma empresa de investimentos deseja calcular o payback de seus clientes ao descobrir 
qual será o mês em que o acumulado das operações do empreendimento equivalem ou são 
superiores ao investimento inicial. Por exemplo, o cliente Lucas investiu 1000$ e 
apenas no terceiro mês obteve o seu payback, já que a soma de todas as suas operações 
foi superior ao seu investimento. Por outro lado, o cliente Daniel não conseguiu 
atingir seu payback já que seu investimento foi de 500$ e a soma de todas as suas 
operações foi 230$. Você precisa mostrar o nome do cliente, o investimento inicial, 
qual o mês do payback e o valor do retorno (valor acumulado - valor investimento 
inicial). Além disso, você deve mostrar o resultado ordenado do maior para o menor 
retorno.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2998

CREATE TABLE clients (
    id integer PRIMARY KEY,
    name varchar(50),
    investment numeric
);

--GRANT SELECT ON clients TO sql_user;

CREATE TABLE operations (
    id integer PRIMARY KEY,
    client_id integer,
    month integer,
    profit numeric,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

--GRANT SELECT ON operations TO sql_user;
INSERT INTO clients (id,name,investment) VALUES
(1,'Daniel',500),
(2,'Oliveira',2000),
(3,'Lucas',1000);


INSERT INTO operations (id, client_id, month, profit) VALUES
(1,1,1,230),
(2,2,1,1000),
(3,2,2,1000),
(4,3,1,100),
(5,3,2,300),
(6,3,3,900),
(7,3,4,400);

/*  Execute this query to drop the tables */
-- DROP TABLE operations;
-- DROP TABLE clients;



/***** RESOLUÇÃO DO PROBLEMA *****/

--Subquery utilizada para que fosse possível fazer a soma acumulada do retorno utilizando o 
--partition by, pois este não é usado em conjunto com o WHERE (por causa da cláusula OVER)

--DISTINCT ON usado junto com o ORDER BY para mostrar apenas o primeiro valor por grupo (nome)

SELECT 
	DISTINCT ON (A.NAME) A.NAME,
	A.NAME,
	A.INVESTMENT,
	A.MONTH_OF_PAYBACK,
	A.CUM_SUM - A.INVESTMENT AS RETURN
FROM
	(SELECT T2.NAME,
			T2.INVESTMENT,
			T1.MONTH AS "month_of_payback",
			SUM(T1.PROFIT) OVER (PARTITION BY T1.CLIENT_ID
								 ORDER BY T1.MONTH) AS CUM_SUM
		FROM OPERATIONS AS T1
		LEFT JOIN CLIENTS AS T2 ON T1.CLIENT_ID = T2.ID) AS A
WHERE (A.CUM_SUM - A.INVESTMENT) >= 0
ORDER BY A.NAME;