CREATE DATABASE bdMercado	

USE bdMercado

CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (80) NOT NULL
	,cpfCliente CHAR (11) NOT NULL
	,emailCliente VARCHAR (80) NOT NULL
	,sexoCliente VARCHAR (1) NOT NULL
	,dataNascCliente SMALLDATETIME NOT NULL
)

CREATE TABLE tbFabricante(
	idFabricante INT PRIMARY KEY IDENTITY (1,1)
	,nomeFabricante VARCHAR (80) NOT NULL
)

CREATE TABLE tbFornecedor(
	idFornecedor INT PRIMARY KEY IDENTITY (1,1)
	,nomeFornecedor VARCHAR (80) NOT NULL
	,contatoFornecedor VARCHAR (80)
)

CREATE TABLE tbProduto(
	idProduto INT PRIMARY KEY IDENTITY (1,1)
	,descricaoProduto VARCHAR (80) NOT NULL
	,valorProduto SMALLMONEY
	,quantidadeProduto SMALLINT NOT NULL DEFAULT 0
	,idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
	,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
)

CREATE TABLE tbSaidaProduto(
	idSaidaProduto INT PRIMARY KEY IDENTITY (1,1)
	,dataSaidaProduto SMALLDATETIME NOT NULL
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	,quantidadeSaidaProduto INT NOT NULL
)

CREATE TABLE tbEntradaProduto(
	idEntradaProduto INT PRIMARY KEY IDENTITY (1,1)
	,dataEntradaProduto SMALLDATETIME NOT NULL
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	,quantidadeEntradaProduto INT NOT NULL
)

CREATE TABLE tbVenda(
	idVenda INT PRIMARY KEY IDENTITY (1,1)
	,dataVenda SMALLDATETIME
	,valorTotalVenda MONEY NOT NULL
	,idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
)


CREATE TABLE tbItensVenda(
	idItensVenda INT PRIMARY KEY IDENTITY (1,1)
	,idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda)
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	,quantidadeItensVenda INT NOT NULL
	,subTotalItensVenda SMALLMONEY NOT NULL
)


