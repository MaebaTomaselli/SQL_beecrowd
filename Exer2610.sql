/*****************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2610 - Valor Médio dos Produtos

Na empresa que você trabalha está sendo feito um levantamento sobre os valores dos 
produtos que são comercializados.

Para ajudar o setor que está fazendo esse levantamento você deve calcular e exibir o 
valor médio do preço dos produtos.

OBS: Mostrar o valor com dois números após o ponto.

*****************************************************************************************/

--Tabela criada em exercício anterior (Exer2609.sql)


/***** RESOLUÇÃO DO PROBLEMA *****/

--Cálculo da média da coluna "price";
--Para o arredondamento é preciso converter a coluna price (tipo double precision) para numérico
SELECT ROUND(AVG(price)::numeric, 2) AS price FROM products;

--Outra forma de sintaxe da resolução acima
SELECT ROUND(CAST (AVG(price) AS numeric),2) AS price FROM products;

--Outra resolução com o truncamento ao invés do arredondamento
SELECT TRUNC(CAST (AVG(price) AS numeric),2) AS price FROM products;
