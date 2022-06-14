/**************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2615 - Expandindo o Negocio

A locadora tem objetivos de criar várias franquias espalhadas pelo Brasil. Para isso 
queremos saber em quais cidades nossos clientes moram.

Para você nos ajudar selecione o nome de todas as cidades onde a locadora tem clientes. 
Mas por favor, não repita o nome da cidade.

**************************************************************************************/

--Tabelas criadas no exercício anteior (Exer2614.sql)


/***** RESOLUÇÃO DO PROBLEMA *****/

SELECT DISTINCT city FROM customers;