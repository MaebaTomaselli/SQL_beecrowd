/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2624 - Quantidades de Cidades por Clientes

A diretoria da empresa pediu para você um relatório simples de quantas cidades a 
empresa já alcançou.

Para fazer isso você deve exibir a quantidade de cidades distintas da tabela clientes.

**************************************************************************************/

--Tabelas criadas em exercício anterior (Exer2622.sql)


/***** RESOLUÇÃO DO PROBLEMA *****/


SELECT COUNT(DISTINCT city) FROM customers_4;