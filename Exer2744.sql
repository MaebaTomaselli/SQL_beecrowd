/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2744 - Senhas

Você foi contratado para dar consultoria a uma empresa. Analisando o banco de dados 
você notou que as senhas gravadas dos usuários estão em formato de texto, sendo que 
isso pode gerar uma falha de segurança, uma vez que elas não estão criptografadas.

Por tanto você deve selecionar o id, a senha atual e a senha transformada em MD5 de 
cada usuário na tabela account.

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2744

CREATE TABLE account(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  login VARCHAR(255),
  password VARCHAR(255)
  );
  
  
INSERT INTO account(id, name, login, password)
VALUES (1, 'Joyce P. Parry', 'Promeraw', 'noh1Oozei'),
       (2, 'Michael T. Gonzalez', 'Phers1942', 'Iath3see9bi'),
       (3, 'Heather W. Lawless', 'Hankicht', 'diShono4'),
       (4, 'Otis C. Hitt', 'Conalothe', 'zooFohH7w'),
       (5, 'Roger N. Brownfield', 'Worseente', 'fah7ohNg');

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE account; --
  

/***** RESOLUÇÃO DO PROBLEMA *****/

--Função MD5 faz a transformação dos dados do campo de senha para o valor criptografado
SELECT ID, PASSWORD, MD5(PASSWORD) FROM ACCOUNT;