/******************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2607 - Cidades em Ordem Alfabética

Todos os meses a empresa pede um relatório das cidades que os fornecedores estão 
cadastrados. 
Dessa vez não vai ser diferente, faça uma consulta no Banco de Dados que retorne todas as 
cidades dos fornecedores, mas em ordem alfabética.

OBS: Você não deve mostrar cidades repetidas.

******************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

CREATE TABLE providers(
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR (100),
	street VARCHAR (100),
	city VARCHAR (100),
	state CHAR (2)
)

INSERT INTO providers (id, name, street, city, state) VALUES
	(1, 'Henrique', 'Av Brasil', 'Rio de Janeiro', 'RJ'),
	(2, 'Marcelo Augusto', 'Rua Imigrantes', 'Belo Horizonte', 'MG'),
	(3, 'Caroline Silva', 'Av São Paulo', 'Salvador', 'BA'),
	(4, 'Guilerme Staff', 'Rua Central', 'Porto Alegre', 'RS'),
	(5, 'Isabela Moraes', 'Av Juiz Grande', 'Curitiba', 'PR'),
	(6, 'Francisco Accerr', 'Av Paulista', 'São Paulo', 'SP');
	
SELECT * FROM providers;

/***** RESOLUÇÃO DO PROBLEMA *****/

--Uso do distinct para não que as cidades sejam mostradas uma única vez
SELECT DISTINCT city FROM providers ORDER BY city;