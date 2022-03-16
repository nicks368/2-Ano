create database bdEscolaIdiomasNikolas

use bdEscolaIdiomasNikolas

CREATE TABLE tbAluno (
	codAluno INT IDENTITY (1,1) PRIMARY KEY
	, nomeAluno VARCHAR (60) NOT NULL
	, dataNascAluno SMALLDATETIME NOT NULL
	, rgAluno VARCHAR (20) NOT NULL
	, naturalidadeAluno VARCHAR (50) NOT NULL
	, cpfAluno VARCHAR (15) NOT NULL
)

CREATE TABLE tbCurso (
	codCurso INT IDENTITY (1,1) PRIMARY KEY
	, nomeCurso VARCHAR (50) NOT NULL
	, cargaHorariaCurso VARCHAR (15) NOT NULL
	, valorCurso INT NOT NULL
)

CREATE TABLE tbTurma (
	codTurma INT IDENTITY (1,1) PRIMARY KEY
	, nomeTurma VARCHAR (30) NOT NULL
	, horarioTurma DATETIME NOT NULL
	, codCurso INT FOREIGN KEY REFERENCES tbCurso (codCurso)
)

CREATE TABLE tbMatricula (
	codMatricula INT IDENTITY (1,1) PRIMARY KEY 
	, dataMatricula DATE NOT NULL
	, codAluno INT FOREIGN KEY REFERENCES tbAluno (codAluno)
	, codTurma INT FOREIGN KEY REFERENCES tbTurma (codTurma)
)

INSERT INTO tbAluno (nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno, cpfAluno)
	VALUES ('Paulo Santos', '2000-03-10', '82.282.122-0', 'SP', '013.888.240-19') 
	, ('Maria da Gloria', '1999-10-03', '45.233.123-0', 'SP', '855.723.180-60')
	, ('Pedro Nogueira da Silva', '1998-04-04', '23.533.211-9', 'SP', '111.374.200-30')
	, ('Gilson Barros Silva', '1995-09-09', '34.221.111-x', 'PE', '905.773.890-25')
	, ('Mariana Barbosa Santos', '2001-10-10', '54.222.122-9', 'RJ', '619.552.930-31')
	, ('Alessandro Pereira', '2003-10-11', '24.402.459-9', 'ES', '110.301.040-93')
	, ('Aline Melo', '2001-10-08', '88.365.012-3', 'RJ', '237.724.800-47')

INSERT INTO tbCurso (nomeCurso, cargaHorariaCurso, valorCurso)
	VALUES ('Inglês', '2000', 356)
	, ('Alemão', '3000', 478)
	, ('Espanhol', '4000', 500)

INSERT INTO tbMatricula (dataMatricula, codAluno, codTurma)
	VALUES ('2015-10-3', 1, 1)
	, ('2014-05-04', 2, 1)
	, ('2014-05-04', 2,4)
	, ('2012-05-03', 3, 2)
	, ('2016-03-03', 1, 3)
	, ('2015-05-07', 4, 2)
	, ('2015-07-05', 4, 3)

INSERT INTO tbTurma (nomeTurma, codCurso, horarioTurma)
	VALUES ('1A', 1, '1900-01-01 12:00:00')
	,('1C', 3, '1900-01-01 18:00:00')
	,('1B', 1, '1900-01-01 18:00:00')
	,('1AA', 2, '1900-01-01 19:00:00')


-- 1) Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem

SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso

	-- 2) Apresentar a quantidade de alunos matriculados por nome do curso

-- (Inglês)
SELECT COUNT(nomeAluno) as 'Alunos que fazem ingles' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso
		WHERE tbCurso.nomeCurso LIKE 'Inglês'

-- (Alemão)
SELECT COUNT(nomeAluno) as 'Alunos que fazem Alemão' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso
		WHERE tbCurso.nomeCurso LIKE 'Alemão'

-- (Espanhol)
SELECT COUNT(nomeAluno) AS 'Alunos que fazem Espanhol' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
		WHERE tbCurso.nomeCurso LIKE 'Espanhol'

	-- 3) Apresentar a quantidade de alunos matriculados por nome da turma

-- (Turma 1A)
SELECT COUNT(nomeAluno) AS 'Quantidade de alunos da turma 1A' FROM tbAluno 
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso	
		WHERE tbTurma.nomeTurma LIKE '1A'

-- (Turma 1B)
SELECT COUNT(nomeAluno) AS 'Quantidade de alunos da turma 1B' FROM tbAluno 
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso	
		WHERE tbTurma.nomeTurma LIKE '1B'

-- (Turma 1C)
SELECT COUNT(nomeAluno) AS 'Quantidade de alunos da turma 1C' FROM tbAluno 
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso	
		WHERE tbTurma.nomeTurma LIKE '1C'

-- (Turma 1AA)
SELECT COUNT(nomeAluno) AS 'Quantidade de alunos da turma 1AA' FROM tbAluno 
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso	
		WHERE tbTurma.nomeTurma LIKE '1AA'

-- 4) Apresentar a quantidade de alunos que fizeram matricula em maio de 2016

SELECT COUNT(nomeAluno) AS 'Quantidade de alunos matriculados no mês de Maio em 2016' FROM tbAluno
    INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
        WHERE MONTH(dataMatricula) = 5

-- 5) Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em
--    que estão matriculados
		
SELECT nomeAluno, nomeTurma, nomeCurso FROM tbAluno
    INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
    INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
    INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
		ORDER BY nomeAluno

-- 6) Apresentar o nome dos cursos e os horários em que eles são oferecidos

SELECT nomeCurso, horarioTurma FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso

-- 7) Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles

SELECT COUNT(naturalidadeAluno) AS 'Alunos matriculados em Inglês no estado de São Paulo' FROM tbAluno
    INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
    INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
    INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
        WHERE tbAluno.naturalidadeAluno LIKE 'SP'

SELECT COUNT(naturalidadeAluno) AS 'Alunos matriculados em Inglês no estado de Espirito Santo' FROM tbAluno
    INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
    INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
    INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
        WHERE tbAluno.naturalidadeAluno LIKE 'ES'

SELECT COUNT(naturalidadeAluno) AS 'Alunos matriculados em Inglês no estado de Rio de Janeiro' FROM tbAluno
    INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
    INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
    INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
        WHERE tbAluno.naturalidadeAluno LIKE 'RJ'

SELECT COUNT(naturalidadeAluno) AS 'Alunos matriculados em Inglês no estado de Pernambuco' FROM tbAluno
    INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
    INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
    INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
        WHERE tbAluno.naturalidadeAluno LIKE 'PE'

-- 8) Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa

SELECT nomeAluno, CONVERT (VARCHAR(30), dataMatricula, 103) dataMatricula FROM tbAluno 
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno

-- 9) Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês

SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
    INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
    INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
		WHERE nomeAluno LIKE 'A%' AND nomeCurso LIKE 'Inglês'

-- 10) Apresentar a quantidade de matriculas feitas no ano de 2016

SELECT COUNT(dataMatricula) AS 'Quantidade de matriculas no ano de 2016' FROM tbMatricula
	WHERE YEAR(dataMatricula) = 2016

-- 11) Apresentar a quantidade de matriculas por nome do curso

SELECT nomeCurso, COUNT(dataMatricula) AS 'Quantidade de alunos matriculados' FROM tbMatricula
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	GROUP BY nomeCurso 

-- 12) Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$ 300,00

SELECT COUNT(nomeAluno) AS 'Quantidade de alunos que os cursos custam mais de R$ 300,00' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
    INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
    INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
		WHERE valorCurso > 300

-- 13) Apresentar os nomes dos alunos que fazem o curso de alemao 

SELECT nomeAluno FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
    INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
    INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
		WHERE nomeCurso LIKE 'Alemão'
	
