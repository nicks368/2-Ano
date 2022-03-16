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

INSERT INTO tbMotorista (nomeMotorista, dataNascimentoMotorista, cpfMotorista, cnhMotorista, pontuacaoAcumulada) VALUES
	('Maria Clara Rodrigues', '09-11-1981', '123.779.340-80', '37148037901', 10)
	,('Carlos Pereira', '30-07-1985', '347.568.440-30', '04113899938', 18)
	,('Fernando Santos', '19-02-1990', '890.386.990-77', '77436027062', 22)
	,('Lara Ferreira', '22-05-1979', '159.399.120-79', '95376146997', 0)

INSERT INTO	tbVeiculo (modeloVeiculo, placa, renavam, anoVeiculo, codMotorista) VALUES
	('Civic', 'JKM-1667', '90218831078', 1992, 1)
	,('Versa', 'NEP-3853', '34943705643', 2016, 2)
	,('Astra', 'HIG-8760', '92299765000', 2007, 2)
	,('Lancer', 'HZX-8431', '03777806058', 2016, 3)
	,('ASX', 'HZD-8282', '56474295287', 2011, 1)
	,('HB20', 'MZP-2707', '69111951787', 2013, 2)
	,('Megane', 'HXS-1727', '02140618267', 1997, 3)
	,('Corolla', 'KHT-4660', '21041345935', 2007, 3)
	,('Hilux', 'NAC-9855', '31293531420', 2012, 1)

INSERT INTO tbMultas (dataMulta, horaMulta, pontosMultas, codVeiculo) VALUES
	('11-12-2011', '12:02', 3, 1 )
	,('11-09-2011', '16:29', 7, 3)
	,('29-05-2002', '19:22', 5, 2)
	,('12-06-2010', '11:14', 3, 2)
	,('21-10-2017', '20:12', 3, 4)
	,('16-04-2009', '07:45', 3, 6)
	,('10-06-2008', '00:52', 3, 4)
	,('29-11-2009', '02:21', 5, 7)
	,('17-12-2018', '22:54', 4, 5)
	,('06-06-2016', '08:47', 3, 8)
	,('10-08-2008', '18:33', 4, 9)
	,('24-05-2006', '04:31', 7, 5)
	,('30-01-2011', '03:59', 7, 9)
	,('05-09-2004', '09:21', 4, 1)
	,('22-05-2019', '23:11', 3, 8)
	,('29-10-2021', '10:03', 5, 6)
	,('12-10-2013', '14:09', 3, 3)
	,('09-12-2016', '16:54', 6, 7)
	
