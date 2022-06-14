/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2995 - A Mensagem do Sensor	

Um sensor captura a temperatura do ambiente a cada minuto. Os registros também possuem
um marcador, em que todas as vezes que a temperatura muda em relação a última captura 
esse marcador é incrementado. Quando o sensor armazena 15 registros ele prepara uma 
mensagem para enviá-la o computador central. Para reduzir o tamanho da mensagem o 
sensor compacta os registros próximos com a mesma temperatura e adiciona o número de 
registros que foram compactados. Construa uma consulta para resolver esse problema, 
mostrando a temperatura e o número de registros correspondente.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2995

CREATE TABLE records (
	id integer PRIMARY KEY,
	temperature integer,
	mark integer
);

insert into records (id,temperature,mark) values
(1,30,1),
(2,30,1),
(3,30,1),
(4,32,2),
(5,32,2),
(6,32,2),
(7,32,2),
(8,30,3),
(9,30,3),
(10,30,3),
(11,31,4),
(12,31,4),
(13,33,5),
(14,33,5),
(15,33,5);

/*  Execute this query to drop the tables */
-- DROP TABLE records;


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	TEMPERATURE,
	COUNT(TEMPERATURE) AS NUMBER_OF_RECORDS
FROM RECORDS
GROUP BY MARK,
	     TEMPERATURE
ORDER BY MARK;
