USE bdEscolaIdiomas

INSERT INTO tbAluno(nomeAluno,dataNascAluno,rgAluno,naturalidadeAluno)
	VALUES ('Paulo Santos', '10-03-2000', '82.282.122-0', 'SP')
		 ,('Maria da Gloria', '03-10-1999', '45.233.123-0', 'SP')
		 ,('Pedro Nogueira da Silva', '04-04-1998', '23.533.211-9', 'SP')
		 ,('Gilson Barros Silva', '09-09-1995', '34.221.111-x', 'PE')
		 ,('Mariana Barbosa Santos', '10-10-2001', '54.222.122-9', 'RJ')
		 ,('Alessandro Pereira', '11-10-2003', '24.402.454-9', 'ES')
		 ,('Aline Melo', '08-10-2001', '88.365.012-3', 'RJ')

INSERT INTO tbCurso(nomeCurso, cargaHorariaCurso, valorCurso)
	VALUES ('Inglês', 2000, 356.00)
		  ,('Alemão', 3000, 478.00)
		  ,('Epanhol', 4000, 500.00)

INSERT INTO tbTurma(nomeTurma,codCurso,horarioTurma)
	VALUES ('1IA', 1, '12:00:00')
		 ,('1IC', 3, '18:00:00')
		 ,('1IB', 1, ' 18:00:00')
		 ,('1AA', 2, '19:00:00')

INSERT INTO tbMatricula(dataMatricula,codAluno,codTurma)
	VALUES ('2015-10-03', 1,1)
		,('2014-05-04', 2,1)
		,('2014-05-04', 2,4)
		,('2012-05-03', 3,2)
		,('2016-03-03', 1,3)
		,('2015-05-07', 4,2)
		,('2015-07-05', 4,3)


