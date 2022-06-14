/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2619 - Super Luxo

A nossa empresa está querendo fazer um novo contrato para o fornecimento de novos produtos 
superluxuosos, e para isso precisamos de alguns dados dos nossos produtos.

Seu trabalho é exibir o nome dos produtos, nome dos fornecedores e o preço, para os produtos 
cujo preço seja maior que 1000 e sua categoria seja ‘Super Luxury.

**************************************************************************************/

--Tabelas criadas em exercício anterior (Exer2618.sql)


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT 
	PROD.NAME,
	PROV.NAME,
	PROD.PRICE
FROM PRODUCTS_4 AS PROD
INNER JOIN PROVIDERS_2 AS PROV ON PROV.ID = PROD.ID_PROVIDERS
INNER JOIN CATEGORIES_3 AS CAT ON CAT.ID = PROD.ID_CATEGORIES
WHERE PROD.PRICE > 1000
	  AND CAT.NAME = 'Super Luxury'