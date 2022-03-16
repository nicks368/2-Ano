USE bdEscolaIdiomas

--A) Criar uma consulta que retorne o nome e o preço dos que custem abaixo do valor médio
SELECT nomeCurso, valorCurso FROM tbCurso
	WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)

--B) Criar uma consulta que retorne o nome e o rg do aluno mais novo
SELECT nomeAluno, rgAluno FROM tbAluno
	WHERE dataNascimento = (SELECT MAX(dataNascimento) FROM tbAluno)

--C) Criar uma consulta que retorne o nome do aluno mais velho 
SELECT nomeAluno FROM tbAluno
	WHERE dataNascimento = (SELECT MIN(dataNascimento) FROM tbAluno)

--D) Criar uma consulta que retorne o nome e o valor do curso mais caro
SELECT nomeCurso, valorCurso FROM tbCurso
	WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)

--E) Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a última matrícula
SELECT nomeAluno, nomeCurso from tbAluno
	INNER JOIN tbMatricula ON (tbAluno.codAluno = tbMatricula.codAluno)
	INNER JOIN tbTurma ON (tbMatricula.codTurma = tbTurma.codTurma)
	INNER JOIN tbCurso ON (tbTurma.codCurso = tbCurso.codCurso)
		WHERE nomeAluno IN (SELECT nomeAluno FROM tbAluno
			WHERE dataMatricula IN (SELECT MAX(dataMatricula) from tbMatricula))

--F) Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas
SELECT nomeAluno, nomeCurso from tbAluno
	INNER JOIN tbMatricula ON (tbAluno.codAluno = tbMatricula.codAluno)
	INNER JOIN tbTurma ON (tbMatricula.codTurma = tbTurma.codTurma)
	INNER JOIN tbCurso ON (tbTurma.codCurso = tbCurso.codCurso)
		WHERE nomeAluno IN (SELECT nomeAluno FROM tbAluno
			WHERE dataMatricula IN (SELECT MIN(dataMatricula) from tbMatricula))

--G) Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no 
--   curso de inglês
SELECT nomeAluno, rgAluno, dataNascimento FROM tbAluno
	INNER JOIN tbMatricula ON (tbAluno.codAluno = tbMatricula.codAluno)
	INNER JOIN tbTurma ON (tbMatricula.codTurma = tbTurma.codTurma)
	INNER JOIN tbCurso ON (tbTurma.codCurso = tbCurso.codCurso)
		WHERE nomeAluno IN (SELECT nomeAluno FROM tbAluno
			WHERE nomeCurso IN (SELECT nomeCurso from tbCurso WHERE nomeCurso LIKE 'Inglês'))