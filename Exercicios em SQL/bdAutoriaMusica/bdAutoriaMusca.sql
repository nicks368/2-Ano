CREATE DATABASE bdAutoriaMusica

USE bdAutoriaMusica

CREATE TABLE tbMusica (
	codMusica INT IDENTITY (1,1) PRIMARY KEY
	,nomeMusica VARCHAR (80) NOT NULL
	,duracaoMusica VARCHAR (30) NOT NULL
	,dataComposicao SMALLDATETIME NOT NULL
	,valorDireitoAutoral VARCHAR (80)
)

CREATE TABLE tbAutor (
	codAutor INT IDENTITY (1,1) PRIMARY KEY
	,nomeAutor VARCHAR (100) NOT NULL
)

CREATE TABLE tbAutoria (
	codAutoria INT IDENTITY (1,1) PRIMARY KEY
	,codAutor INT FOREIGN KEY REFERENCES tbAutor(codAutor)
	,codMusica INT FOREIGN KEY REFERENCES tbMusica(codMusica)
)

INSERT INTO tbMusica 
VALUES ('Trem das onze', '4:18', '10/12/1964', 'R$190,00')
	  ,('Iracema', '3:42', '04/09/1980', 'R$190,00')
	  ,('Meu amor', '3:14', '13/09/2021', 'R$200,00')
	  ,('Volta e meia', '3:16', '15/04/2019', 'R$270,00')

INSERT INTO tbAutor
VALUES ('Adoniram Barbosa')
	  ,('O Grilo')
	  ,('O Terno')

INSERT INTO tbAutoria
VALUES (1, 1)
	  ,(1, 2)
	  ,(2, 3)
	  ,(3, 4)