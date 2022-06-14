/***************************************************************************************

https://www.beecrowd.com.br/judge/pt/problems/index/9

Resolução - Maeba Tomaselli

Exercício - 2990 - CPF Dos Empregados

Mostrar o CPF, nome dos empregados e o nome do departamento dos empregados que não 
trabalham em nenhum projeto. O resultado deve estar ordenado por cpf

**************************************************************************************/

/***** CRIAÇÃO DAS TABELAS *****/

--Tabelas criadas com scipt do site:

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2990

CREATE TABLE empregados (
  cpf VARCHAR(15) PRIMARY KEY,
  enome CHARACTER VARYING (255),
  salary FLOAT,
  cpf_supervisor VARCHAR(15),
  dnumero NUMERIC
);

CREATE TABLE departamentos (
  dnumero NUMERIC PRIMARY KEY,
  dnome CHARACTER VARYING (60),
  cpf_gerente VARCHAR(15) REFERENCES empregados (cpf)
);

CREATE TABLE trabalha (
  cpf_emp VARCHAR(15) REFERENCES empregados(cpf),
  pnumero numeric
);

CREATE TABLE projetos (
  pnumero NUMERIC PRIMARY KEY,
  pnome VARCHAR(45),
  dnumero NUMERIC REFERENCES departamentos (dnumero)
);

INSERT INTO empregados(cpf, enome, salary, cpf_supervisor, dnumero)
VALUES 
      ('049382234322', 'João Silva', 2350, '2434332222', 1010),
      ('586733922290', 'Mario Silveira', 3500, '2434332222', 1010),
      ('2434332222', 'Aline Barros', 2350, (null), 1010),
      ('1733332162', 'Tulio Vidal', 8350, (null), 1020),
      ('4244435272', 'Juliana Rodrigues', 3310, (null), 1020),
      ('1014332672', 'Natalia Marques', 2900, (null), 1010);

INSERT INTO departamentos(dnumero, dnome, cpf_gerente)
VALUES
      (1010, 'Pesquisa', '049382234322'),
      (1020, 'Ensino', '2434332222');

INSERT INTO trabalha (cpf_emp, pnumero)
VALUES 
  ('049382234322', 2010),
  ('586733922290', 2020),
  ('049382234322', 2020);

INSERT INTO projetos (pnumero, pnome, dnumero)
VALUES 
  (2010, 'Alpha', 1010),
  (2020, 'Beta', 1020);
  
  
/***** RESOLUÇÃO DO PROBLEMA *****/

--Resolução com o filtro da ausência de projeto no WHERE
SELECT 
	T1.CPF,
	T1.ENOME,
	T2.DNOME
FROM EMPREGADOS AS T1
INNER JOIN DEPARTAMENTOS AS T2 ON T1.DNUMERO = T2.DNUMERO
WHERE NOT EXISTS
		(SELECT NULL
			FROM EMPREGADOS
			JOIN TRABALHA AS T3 ON T1.CPF = T3.CPF_EMP)
ORDER BY T1.CPF;

--Outra resolução fazendo join nas tabelas e filtrando quando o dado for nulo no campo de projeto
SELECT T1.CPF,
	T1.ENOME,
	T3.DNOME
FROM EMPREGADOS AS T1
LEFT JOIN TRABALHA AS T2 ON T1.CPF = T2.CPF_EMP
INNER JOIN DEPARTAMENTOS AS T3 ON T1.DNUMERO = T3.DNUMERO
WHERE T2.PNUMERO IS NULL
ORDER BY T1.CPF;