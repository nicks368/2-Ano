CREATE DATABASE bdEscolaIdioma

USE bdEscolaIdioma

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR (80) NOT NULL
	,rgAluno VARCHAR (9) NOT NULL
	,cpfAluno VARCHAR (11) NOT NULL 
	,logradouro VARCHAR (80) NOT NULL 
	,numero VARCHAR (5) NOT NULL
	,complemento VARCHAR (5)
	,cep VARCHAR (15) NOT NULL
	,bairro VARCHAR (80) NOT NULL
	,cidade VARCHAR (80) NOT NULL
	,dataNascimento DATE NOT NULL
)
	
CREATE TABLE tbTelefoneAluno (
	codTelAluno INT PRIMARY KEY IDENTITY (1,1)
	,numTelAluno VARCHAR (20) NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
)

CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula DATE NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)

CREATE TABLE tbNivel (
	codNivel INT PRIMARY KEY IDENTITY (1,1)
	,descricaoNivel VARCHAR (70) NOT NULL
)

CREATE TABLE tbPeriodo (
	codPeriodo INT PRIMARY KEY IDENTITY (1,1)
	,descricaoPeriodo VARCHAR (70) NOT NULL
)

CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY (1,1)
	,nomeCurso VARCHAR (40) NOT NULL
	,valorCurso MONEY NOT NULL
)

CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY (1,1)
	,descricaoTurma VARCHAR (70) NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
	,codNivel INT FOREIGN KEY REFERENCES tbNivel(codNivel)
	,codPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(codPeriodo)
	,horario VARCHAR (25) NOT NULL
	,diaDaSemana VARCHAR (20) NOT NULL
	)