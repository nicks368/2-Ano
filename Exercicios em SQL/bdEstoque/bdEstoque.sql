CREATE DATABASE bdEstoque

USE bdEstoque

CREATE TABLE tbFabricante(
	codFabricante INT PRIMARY KEY IDENTITY(1, 1)
	,nomeFabricante VARCHAR(40) NOT NULL
)

CREATE TABLE tbFornecedor(
	codFornecedor INT PRIMARY KEY IDENTITY(1, 1)
	,nomeFornecedor VARCHAR(40) NOT NULL
	,contatoFornecedor VARCHAR(25)
)

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY(1, 1)
	,nomeCliente VARCHAR(40) NOT NULL
	,cpfCliente CHAR(11)
	,emailCliente VARCHAR(50)
	,sexoCliente CHAR(1)
	,dataNascimentoCliente DATETIME
)

CREATE TABLE tbVenda(
	codVenda INT PRIMARY KEY IDENTITY(1, 1)
	,dataVenda SMALLDATETIME
	,valorTotalVenda MONEY NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)
CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1, 1)
	,descricaoProduto VARCHAR(60)
	,valorProduto MONEY NOT NULL
	,quantidadeProduto INT NOT NULL
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
)

CREATE TABLE tbItensVenda(
	codItensVenda INT PRIMARY KEY IDENTITY(1, 1)
	,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,quantidadeItensVenda INT
	,subTotalItensVenda MONEY
)

INSERT INTO tbCliente(nomeCLiente, cpfCliente, emailCliente, sexoCliente, dataNascimentoCliente) VALUES
	('Armando Jos� Santana', '12345678900', 'amandojsantana@outlook.com', 'm', '21-02-1961'),
	('Sheila Carvalho Leal', '45678909823', 'scarvalho@ig.com.br', 'f', '13-09-1978'),
	('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com.br', 'm', '08-09-1981'),
	('Maria Aparecida Souza', '87365309899', 'mapdasouza@outlook.com', 'f', '07-07-1962'),
	('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'f', '04-09-1977'),
	('Paulo Henrique Silva', '87390123111', 'phsilva80@hotmail.com', 'm', '02-02-1987')

INSERT INTO tbFabricante(nomeFabricante) VALUES
	('Unilever')
	,('P&G')
	,('Bunge')

INSERT INTO tbFornecedor(nomeFornecedor, contatoFornecedor) VALUES 
	('Atacad�o', 'Carlos Santos'),
	('Assa�', 'Maria Stella'),
	('Rold�o', 'Paulo C�sar')

INSERT INTO tbProduto(descricaoProduto, valorProduto, quantidadeProduto, codFabricante, codFornecedor) VALUES
	('Amaciante Downy', 5.76, 1500, 2, 1),
	('Amaciante Comfort', 5.45, 2300, 1, 1),
	('Sab�o em p� OMO', 5.99, 1280, 1, 2),
	('Margarina Qualy', 4.76, 2500, 3, 1),
	('Salsicha Hot Dog Sadia', 6.78, 2900, 3, 2),
	('Mortadela Perdig�o', 2.50, 1200, 3, 3),
	('Hamburguer Sadia', 9.89, 1600, 3, 1),
	('Fralda Pampers', 36.00, 340, 2, 3),
	('Xampu Seda', 5.89, 800, 1, 2),
	('Condicionador Seda', 6.50, 700, 1, 3)

INSERT INTO tbVenda(dataVenda, valorTotalVenda, codCliente) VALUES
	('01-02-2014', 4500.00, 1),
	('03-02-2014', 3400.00, 1),
	('10-02-2014', 2100.00, 2),
	('15-02-2014', 2700.00, 3),
	('17-03-2014', 560.00, 3),
	('09-04-2014', 1200.00, 4),
	('07-05-2014', 3500.00, 5),
	('07-05-2014', 3400.00, 1),
	('05-05-2014', 4000.00, 2),
	('07-06-2014', 3500.00, 4)

INSERT INTO tbItensVenda(codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda) VALUES
	(1, 1, 200, 1500.00),
	(1, 2, 300, 3000.00),
	(2, 4, 120, 1400.00),
	(2, 2, 200, 1000.00),
	(2, 3, 130, 1000.00),
	(3, 5, 200, 2100.00),
	(4, 4, 120, 1000.00),
	(4, 5, 450, 700.00),
	(5, 5, 200, 560.00),
	(6, 7, 200, 600.00),
	(6, 6, 300, 600.00),
	(8, 1, 300, 2500.00),
	(8, 2, 200, 1000.00),
	(9, 6, 250, 1700.00),
	(9, 5, 200, 1700.00),
	(10, 4, 1000, 4000.00)