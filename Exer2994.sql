/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2994 - Quanto Ganha um Médico?

Você trabalha no setor de TI de um Hospital e precisa calcular a receita de pagamento 
de cada um dos médicos. Cada médico ganha 150$ por hora mais uma porcentagem dependendo 
do turno de trabalho, por exemplo, o médico Wellington trabalhou 1 hora no turno do dia, 
e 2 horas no turno da noite, logo seu salário semanal será: 
( ( 1 * 150 ) + 1% ) + ( ( 2 * 150 ) + 15% ) = 496.5. Além disso, você pode usar a 
função round(value,1) para exibir os salários com 1 casa decimal e ordene o resultado 
do maior para o menor salário.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2994

CREATE TABLE doctors (
id integer PRIMARY KEY,
name varchar(50)
);

--GRANT SELECT ON doctors TO sql_user;

CREATE TABLE work_shifts (
id integer PRIMARY KEY,
name varchar(50),
bonus numeric
);

--GRANT SELECT ON work_shifts TO sql_user;

CREATE TABLE attendances (
id integer PRIMARY KEY,
id_doctor integer,
hours integer,
id_work_shift integer,
FOREIGN KEY (id_doctor) REFERENCES  doctors(id),
FOREIGN KEY (id_work_shift) REFERENCES  work_shifts(id)
);

--GRANT SELECT ON attendances TO sql_user;

insert into doctors (id,name) values
(1,'Arlino'),
(2,'Tiago'),
(3,'Amanda'),
(4,'Wellington');

insert into work_shifts (id,name,bonus) values
(1,'nocturnal',15),
(2,'afternoon',2),
(3,'day',1);

insert into  attendances (id, id_doctor, hours, id_work_shift) values
(1,1,5,1),
(2,3,2,1),
(3,3,3,2),
(4,2,2,3),
(5,1,5,3),
(6,4,1,3),
(7,4,2,1),
(8,3,2,2),
(9,2,4,2);

/*  Execute this query to drop the tables */
-- DROP TABLE attendances;
-- DROP TABLE work_shifts;
-- DROP TABLE doctors;

/***** RESOLUÇÃO DO PROBLEMA *****/

--O cáculo do salário é feito dentro da função SUM que, em conjunto com GROUP BY, consegue realizar
--as operações necessárias em cada linha e agragá-las (somando) para cada nome
SELECT t2.name, SUM(ROUND(((150*t1.hours)*(1+(t3.bonus/100))),1)) AS salary
FROM attendances as t1
INNER JOIN doctors AS t2 ON t2.id = t1.id_doctor 
INNER JOIN work_shifts AS t3 ON t3.id = t1.id_work_shift
GROUP BY t2.name
ORDER BY salary DESC;
