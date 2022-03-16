CREATE DATABASE bdTransito

USE bdTransito

CREATE TABLE tbMotorista (
	codMotorista INT PRIMARY KEY IDENTITY (1,1)
	,nomeMotorista VARCHAR (70) NOT NULL
	,dataNascimentoMotorista DATE NOT NULL
	,cpfMotorista VARCHAR (14) NOT NULL
	,cnhMotorista VARCHAR (11) NOT NULL
	,pontuacaoAcumulada INT 
)

CREATE TABLE tbVeiculo (
	codVeiculo INT PRIMARY KEY IDENTITY (1,1)
	,modeloVeiculo VARCHAR (40) NOT NULL
	,placa VARCHAR (8) NOT NULL
	,renavam VARCHAR (11) NOT NULL
	,anoVeiculo INT NOT NULL
	,codMotorista INT FOREIGN KEY REFERENCES tbMotorista(codMotorista)
)

CREATE TABLE tbMultas (
	codMulta INT PRIMARY KEY IDENTITY (1,1)
	,dataMulta DATE NOT NULL
	,horaMulta VARCHAR (20) NOT NULL
	,pontosMultas INT NOT NULL
	,codVeiculo INT FOREIGN KEY REFERENCES tbVeiculo(codVeiculo)
)


