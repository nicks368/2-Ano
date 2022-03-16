USE bdTransito

--1) Quantos motoristas existem no banco de dados
SELECT COUNT (codMotorista) AS 'Quantidade de motoristas' FROM tbMotorista

--2) Quantos motoristas possuem Silva no sobrenome
SELECT COUNT (nomeMotorista) AS 'Quantidade de motoristas que possuem silva no nome' FROM tbMotorista 
	WHERE nomeMotorista LIKE 'silva'

--3) Quantos motoristas nasceram no ano 2000
SELECT COUNT (nomeMotorista) AS 'Quantidade de motoristas que nasceram em 2000' FROM tbMotorista 
	WHERE YEAR (dataNascimentoMotorista) = 2000

--4) A somat�ria da pontua��o de todos os motoristas
SELECT SUM (pontuacaoAcumulada) AS 'Somat�ria dos pontos de todos motoristas' FROM tbMotorista

--5) A m�dia de pontua��o de todos os motoristas
SELECT AVG (pontuacaoAcumulada) AS 'M�dia dos pontos de todos motoristas' FROM tbMotorista

--6) Quantos ve�culos o motorista de c�digo 1 possui
SELECT COUNT (modeloVeiculo) AS 'Quantos ve�culos o motorista de c�digo 1 possui' FROM tbVeiculo
	WHERE codMotorista = 1

--7) Quantos ve�culos a placa come�a com A
SELECT COUNT (modeloVeiculo) AS 'Quantos ve�culos que a placa come�e com A' FROM tbVeiculo
	WHERE placa LIKE 'A%'

--8) Quantos ve�culos foram fabricados antes de 2021
SELECT COUNT (modeloVeiculo) AS 'Quantos ve�culos foram fabricados antes 2021' FROM tbVeiculo
	WHERE anoVeiculo < 2021

--9) As placas dos ve�culos cujo ano de fabrica��o seja abaixo da m�dia
SELECT placa AS 'Placas dos ve�culos cujo ano de fabrica��o seja abaixo da m�dia' FROM tbVeiculo
	WHERE anoVeiculo < (SELECT AVG(anoVeiculo) FROM tbVeiculo)

--10) A somat�ria dos pontosMulta do ve�culo de placa final 02
SELECT SUM(pontosMultas) AS 'Somat�ria dos pontosMulta do ve�culo de placa final 02' FROM tbMultas
	INNER JOIN tbVeiculo ON tbMultas.codVeiculo = tbVeiculo.codVeiculo
		WHERE placa LIKE '%02'

--11) A m�dia de pontosMulta entre todas as multas aplicadas
SELECT AVG(pontosMultas) AS 'M�dia de pontos de todas multas' FROM tbMultas

--12) A quantidade de multas aplicadas no m�s de abril de 2018
SELECT COUNT (codMulta) AS 'Quantidade de multas aplicadas em abril de 2018' FROM tbMultas
	WHERE YEAR (dataMulta) = 2018 AND  MONTH (dataMulta) = 04

--13) A quantidade de ve�culos cuja placa termine com o n�mero 1 ou 2
SELECT COUNT (codVeiculo) AS 'Quantidade de ve�culos cuja placa termine em 1 ou 2' FROM tbVeiculo
	WHERE placa LIKE '%1' OR placa LIKE '%2'

--14) A quantidade de ve�culos cuja placa termine com 9 ou 0
SELECT COUNT (codVeiculo) AS 'Quantidade de ve�culos cuja placa termine em 0 ou 9' FROM tbVeiculo
	WHERE placa LIKE '%0' OR placa LIKE '%9'

--15) A quantidade de ve�culos por ano de fabrica��o
SELECT anoVeiculo, COUNT (codVeiculo) AS 'Quantidade de ve�culos por ano de fabrica��o' FROM tbVeiculo
	GROUP BY anoVeiculo

--16) A quantidade de motoristas por pontua��o acumulada
SELECT pontuacaoAcumulada, COUNT (codVeiculo) AS 'Quantidade de ve�culos por pontua��o acumulada' FROM tbVeiculo
	INNER JOIN tbMotorista ON tbVeiculo.codMotorista = tbMotorista.codMotorista
		GROUP BY pontuacaoAcumulada

--17) A quantidade de motoristas que ultrapassaram os 20 pontos
SELECT COUNT (codMotorista) AS 'Quantidade de motoristas que ultrapassaram 20 pontos' FROM tbMotorista
	WHERE pontuacaoAcumulada > 20

--18) A pontua��o m�dia dos motoristas nascidos no ano de 2000
SELECT AVG (pontuacaoAcumulada) AS 'Pontua��o m�dia dos motoristas nascidos em 2000' FROM tbMotorista
	WHERE YEAR (dataNascimentoMotorista) = 2000

--19) A m�dia dos pontos  das multas aplicadas em julho de 2017
SELECT AVG (pontosMultas) AS 'M�dia de pontos de multas aplicadas em julho de 2017' FROM tbMultas
	WHERE YEAR (dataMulta) = 2017 AND MONTH (dataMulta) = 07

--20) Quantos ve�culos n�o podem circular na segunda-feira (placa final 1 ou 2)
SELECT COUNT (codVeiculo) AS 'Quantidade de ve�culos que n�o podem circular na segunda-feira' FROM tbVeiculo
	WHERE placa LIKE '%1' OR placa LIKE '%2'

--21) O nome do motorista ao lado das datas das multas que ele tomou
SELECT nomeMotorista, dataMulta FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	INNER JOIN tbMultas ON tbVeiculo.codVeiculo = tbMultas.codVeiculo

--22) O nome do motorista ao lado das placas dos ve�culos
SELECT nomeMotorista, placa FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	
--23) O nome do motorista que tomou mais multas
SELECT nomeMotorista FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	INNER JOIN tbMultas ON tbVeiculo.codVeiculo = tbMultas.codVeiculo
		WHERE (SELECT COUNT(codMulta) FROM tbMultas) = (SELECT MAX(COUNT(codMulta)) FROM tbMultas)

--24) O nome dos motoristas que n�o possuem multas
SELECT nomeMotorista FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	INNER JOIN tbMultas ON tbVeiculo.codVeiculo = tbMultas.codVeiculo
		WHERE (SELECT COUNT(codMulta) FROM tbMultas) = (SELECT MIN(COUNT(codMulta)) FROM tbMultas)
			
--25) O nome dos motoristas ao lado da placa dos ve�culos, inclusive daqueles motoristas que n�o possuem ve�culos cadastrados ainda
SELECT nomeMotorista, placa FROM tbMotorista
	FULL JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista

--26) A placa do ve�culo e o nome do motorista que possue a maior pontua��o acumulada
SELECT nomeMotorista, placa FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
		WHERE pontuacaoAcumulada = (SELECT MAX(pontuacaoAcumulada)FROM tbMotorista)

--27) A quantidade de ve�culos por nome do motorista
SELECT nomeMotorista, COUNT(codVeiculo) AS 'Quantidade de ve�culos' FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
		GROUP BY nomeMotorista

--28) A quantidade de ve�culos por placa do ve�culo
SELECT placa, COUNT(codVeiculo) AS 'Quantidade de ve�culos' FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
		GROUP BY placa

--29) As datas das multas ao lado do renavam do ve�culo
SELECT dataMulta, renavam FROM tbMultas
	INNER JOIN tbVeiculo ON tbMultas.codVeiculo = tbVeiculo.codVeiculo

--30) O nome do motorista e a data da multa, somente daquele que tomou a multa mais recente 
SELECT nomeMotorista, dataMulta FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	INNER JOIN tbMultas ON tbVeiculo.codVeiculo = tbMultas.codVeiculo
		ORDER BY dataMulta DESC
		
