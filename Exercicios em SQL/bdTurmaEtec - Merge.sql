CREATE DATABASE bdTurmaEtec

USE bdTurmaEtec

CREATE TABLE tbTurmaA (
	RM INT PRIMARY KEY
	,nomeAluno VARCHAR (100)
	,statusAluno VARCHAR (20)
)

INSERT INTO tbTurmaA
VALUES ('15421', 'Kevin Sampaio', 'APROVADO(A)')
	,('48751','Davi Rodrigues','AROVADO(A)')
	,('17870','Raquel Oliveira','APROVADO(A)')
	,('12117','Inácio Oliveira','APROVADO(A)')
	,('16945','Gabriel Carvalho','APROVADO(A)')
	,('18147','Raphaelly Oliveira','APROVADO(A)')
	,('17424','Wellington Silva','APROVADO(A)')
	,('49692','Gabriele Correia','APROVADO(A)')
	,('40084','Stephany Justino','REPROVADO(A)')
	,('18364','Yan Carlos','REPROVADO(A)')
	,('26095','Victor Santiago','REPROVADO(A)')
	,('45995','Lucas Chagas','REPROVADO(A)')

SELECT * FROM tbTurmaA

CREATE TABLE tbTurmaB (
	RM INT PRIMARY KEY
	,nomeAluno VARCHAR (100)
	,statusAluno VARCHAR (20)
)

INSERT INTO tbTurmaB 
VALUES (28124, 'João Gabriel', 'REPROVADO(A)')
	  ,(12661, 'Jhonatan Ferreira', 'APROVADO(A)')
	  ,(39951, 'Kelvin Mendonça', 'REPROVADO(A)')
	  ,(45788, 'David Moraes', 'APROVADO(A)')
	  ,(17133, 'Hugo Sampaio', 'APROVADO(A)')
	  ,(21287, 'José Henrique', 'APROVADO(A)')
	  ,(34106, 'Isabella Pelegrin', 'REPROVADO(A)')
	  ,(25188, 'Fernanda Risos', 'REPROVADO(A)')
	  ,(14128, 'Joana De Deus', 'APROVADO(A)')
	  ,(28446, 'Pedro Carvalho', 'APROVADO(A)')
	  ,(16817, 'Raimundo Silva', 'APROVADO(A)')
	  ,(16190, 'Cleiton Leitte', 'APROVADO(A)')

	  SELECT * FROM tbTurmaB		

	  
CREATE TABLE tbTurmaC (
	RM INT PRIMARY KEY
	,nomeAluno VARCHAR (100)
	,statusAluno VARCHAR (20)
)

MERGE tbTurmaC dest
	USING tbTurmaA ori
	ON ori.RM = dest.RM
	WHEN NOT MATCHED AND ori.statusAluno LIKE 'APROVADO(A)' THEN
	INSERT VALUES (ori.RM, ori.nomeAluno, ori.statusAluno);

MERGE tbTurmaC dest
	USING tbTurmaB ori
	ON ori.RM = dest.RM
	WHEN NOT MATCHED AND ori.statusAluno LIKE 'APROVADO(A)' THEN
	INSERT VALUES (ori.RM, ori.nomeAluno, ori.statusAluno);

SELECT * FROM tbTurmaC