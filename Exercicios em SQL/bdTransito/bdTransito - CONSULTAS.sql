USE bdTransito

--1) Quantos motoristas existem no banco de dados
SELECT COUNT (codMotorista) AS 'Quantidade de motoristas' FROM tbMotorista

--2) Quantos motoristas possuem Silva no sobrenome
SELECT COUNT (nomeMotorista) AS 'Quantidade de motoristas que possuem silva no nome' FROM tbMotorista 
	WHERE nomeMotorista LIKE 'silva'

--3) Quantos motoristas nasceram no ano 2000
SELECT COUNT (nomeMotorista) AS 'Quantidade de motoristas que nasceram em 2000' FROM tbMotorista 
	WHERE YEAR (dataNascimentoMotorista) = 2000

--4) A somatória da pontuação de todos os motoristas
SELECT SUM (pontuacaoAcumulada) AS 'Somatória dos pontos de todos motoristas' FROM tbMotorista

--5) A média de pontuação de todos os motoristas
SELECT AVG (pontuacaoAcumulada) AS 'Média dos pontos de todos motoristas' FROM tbMotorista

--6) Quantos veículos o motorista de código 1 possui
SELECT COUNT (modeloVeiculo) AS 'Quantos veículos o motorista de código 1 possui' FROM tbVeiculo
	WHERE codMotorista = 1

--7) Quantos veículos a placa começa com A
SELECT COUNT (modeloVeiculo) AS 'Quantos veículos que a placa começe com A' FROM tbVeiculo
	WHERE placa LIKE 'A%'

--8) Quantos veículos foram fabricados antes de 2021
SELECT COUNT (modeloVeiculo) AS 'Quantos veículos foram fabricados antes 2021' FROM tbVeiculo
	WHERE anoVeiculo < 2021

--9) As placas dos veículos cujo ano de fabricação seja abaixo da média
SELECT placa AS 'Placas dos veículos cujo ano de fabricação seja abaixo da média' FROM tbVeiculo
	WHERE anoVeiculo < (SELECT AVG(anoVeiculo) FROM tbVeiculo)

--10) A somatória dos pontosMulta do veículo de placa final 02
SELECT SUM(pontosMultas) AS 'Somatória dos pontosMulta do veículo de placa final 02' FROM tbMultas
	INNER JOIN tbVeiculo ON tbMultas.codVeiculo = tbVeiculo.codVeiculo
		WHERE placa LIKE '%02'

--11) A média de pontosMulta entre todas as multas aplicadas
SELECT AVG(pontosMultas) AS 'Média de pontos de todas multas' FROM tbMultas

--12) A quantidade de multas aplicadas no mês de abril de 2018
SELECT COUNT (codMulta) AS 'Quantidade de multas aplicadas em abril de 2018' FROM tbMultas
	WHERE YEAR (dataMulta) = 2018 AND  MONTH (dataMulta) = 04

--13) A quantidade de veículos cuja placa termine com o número 1 ou 2
SELECT COUNT (codVeiculo) AS 'Quantidade de veículos cuja placa termine em 1 ou 2' FROM tbVeiculo
	WHERE placa LIKE '%1' OR placa LIKE '%2'

--14) A quantidade de veículos cuja placa termine com 9 ou 0
SELECT COUNT (codVeiculo) AS 'Quantidade de veículos cuja placa termine em 0 ou 9' FROM tbVeiculo
	WHERE placa LIKE '%0' OR placa LIKE '%9'

--15) A quantidade de veículos por ano de fabricação
SELECT anoVeiculo, COUNT (codVeiculo) AS 'Quantidade de veículos por ano de fabricação' FROM tbVeiculo
	GROUP BY anoVeiculo

--16) A quantidade de motoristas por pontuação acumulada
SELECT pontuacaoAcumulada, COUNT (codVeiculo) AS 'Quantidade de veículos por pontuação acumulada' FROM tbVeiculo
	INNER JOIN tbMotorista ON tbVeiculo.codMotorista = tbMotorista.codMotorista
		GROUP BY pontuacaoAcumulada

--17) A quantidade de motoristas que ultrapassaram os 20 pontos
SELECT COUNT (codMotorista) AS 'Quantidade de motoristas que ultrapassaram 20 pontos' FROM tbMotorista
	WHERE pontuacaoAcumulada > 20

--18) A pontuação média dos motoristas nascidos no ano de 2000
SELECT AVG (pontuacaoAcumulada) AS 'Pontuação média dos motoristas nascidos em 2000' FROM tbMotorista
	WHERE YEAR (dataNascimentoMotorista) = 2000

--19) A média dos pontos  das multas aplicadas em julho de 2017
SELECT AVG (pontosMultas) AS 'Média de pontos de multas aplicadas em julho de 2017' FROM tbMultas
	WHERE YEAR (dataMulta) = 2017 AND MONTH (dataMulta) = 07

--20) Quantos veículos não podem circular na segunda-feira (placa final 1 ou 2)
SELECT COUNT (codVeiculo) AS 'Quantidade de veículos que não podem circular na segunda-feira' FROM tbVeiculo
	WHERE placa LIKE '%1' OR placa LIKE '%2'

--21) O nome do motorista ao lado das datas das multas que ele tomou
SELECT nomeMotorista, dataMulta FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	INNER JOIN tbMultas ON tbVeiculo.codVeiculo = tbMultas.codVeiculo

--22) O nome do motorista ao lado das placas dos veículos
SELECT nomeMotorista, placa FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	
--23) O nome do motorista que tomou mais multas
SELECT nomeMotorista FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	INNER JOIN tbMultas ON tbVeiculo.codVeiculo = tbMultas.codVeiculo
		WHERE (SELECT COUNT(codMulta) FROM tbMultas) = (SELECT MAX(COUNT(codMulta)) FROM tbMultas)

--24) O nome dos motoristas que não possuem multas
SELECT nomeMotorista FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	INNER JOIN tbMultas ON tbVeiculo.codVeiculo = tbMultas.codVeiculo
		WHERE (SELECT COUNT(codMulta) FROM tbMultas) = (SELECT MIN(COUNT(codMulta)) FROM tbMultas)
			
--25) O nome dos motoristas ao lado da placa dos veículos, inclusive daqueles motoristas que não possuem veículos cadastrados ainda
SELECT nomeMotorista, placa FROM tbMotorista
	FULL JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista

--26) A placa do veículo e o nome do motorista que possue a maior pontuação acumulada
SELECT nomeMotorista, placa FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
		WHERE pontuacaoAcumulada = (SELECT MAX(pontuacaoAcumulada)FROM tbMotorista)

--27) A quantidade de veículos por nome do motorista
SELECT nomeMotorista, COUNT(codVeiculo) AS 'Quantidade de veículos' FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
		GROUP BY nomeMotorista

--28) A quantidade de veículos por placa do veículo
SELECT placa, COUNT(codVeiculo) AS 'Quantidade de veículos' FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
		GROUP BY placa

--29) As datas das multas ao lado do renavam do veículo
SELECT dataMulta, renavam FROM tbMultas
	INNER JOIN tbVeiculo ON tbMultas.codVeiculo = tbVeiculo.codVeiculo

--30) O nome do motorista e a data da multa, somente daquele que tomou a multa mais recente 
SELECT nomeMotorista, dataMulta FROM tbMotorista
	INNER JOIN tbVeiculo ON tbMotorista.codMotorista = tbVeiculo.codMotorista
	INNER JOIN tbMultas ON tbVeiculo.codVeiculo = tbMultas.codVeiculo
		ORDER BY dataMulta DESC
		
