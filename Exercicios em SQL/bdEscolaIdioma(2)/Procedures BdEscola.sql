--use bdEscolaIdiomasNikolas

/*
1/6) Criar uma stored procedure “Busca_Aluno” que receba o código do aluno e retorne seu 
nome e data de nascimento.

CREATE PROCEDURE Busca_Aluno
	@codAluno int
AS
	begin 
		SELECT nomeAluno, dataNascAluno FROM tbAluno WHERE codAluno LIKE @codAluno
	end	 
*/ EXEC Busca_Aluno 8


/*
2)Criar uma stored procedure “Insere_Aluno” que insira um registro na tabela de Alunos.

CREATE PROCEDURE Insere_Aluno
	@nome varchar (100), @dataN smalldatetime, @rgAluno varchar (25), @naturalidade varchar (5), @cpf varchar (15)
AS
	begin
		IF EXISTS (SELECT codAluno FROM tbAluno WHERE cpfAluno LIKE @cpf)
			begin
				print ('Impossivel cadastrar. Aluno cpf '+@cpf+' já cadastrado')
			end
		else

		begin
			INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno, cpfAluno)
				VALUES (@nome, @dataN, @rgAluno, @naturalidade, @cpf)
			PRINT ('Aluno '+@nome+' cadastrado com sucesso')
		end
	end
*/ EXEC Insere_Aluno 'Nikolas Gomes', '07/03/2005', '1119929-0', 'SP', '092380328-0'

/*
3)Criar uma stored procedure “Aumenta_Preco” que, dados o nome do curso e um percentual, aumente o valor do 
curso com a porcentagem informadaCriar uma stored procedure “Aumenta_Preco” que, dados o nome do curso e um
percentual, aumente o valor do curso com a porcentagem informada.

alter PROCEDURE Aumento_Preco
	@nomeCurso varchar (40), @porcentagem int
AS 
	begin 
		declare @valorCurso int, @valorAltCurso int
		set @valorCurso = (SELECT valorCurso FROM tbCurso WHERE nomeCurso LIKE @nomeCurso)
		set @valorAltCurso = (SELECT valorCurso FROM tbCurso WHERE nomeCurso LIKE @nomeCurso)
		set @valorAltCurso = (@valorAltCurso+(@valorCurso*@porcentagem/100))
		PRINT ('O valor do curso com o percetual aumentado é de '+convert(varchar(40) ,@valorAltCurso))
	end	
*/exec Aumento_Preco 'Inglês', 10


/*
4)Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma exiba todas as informações dela.
CREATE PROCEDURE Exibe_Turma 
	@turma varchar (10)
AS
	begin 
		SELECT nomeTurma, codCurso, horarioTurma FROM tbTurma WHERE nomeTurma LIKE @turma
	end
*/exec Exibe_Turma '1C'


/*
5)Criar uma stored procedure “Exibe_AlunosdaTurma” que, dado o nome da turma exiba os seus alunos.

CREATE PROCEDURE Exibe_AlunosdaTurma
	@turma varchar (10)
AS
	begin 
		SELECT nomeAluno FROM tbAluno 
			INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
			INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
			INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso
		WHERE nomeTurma LIKE @turma
	end
*/exec Exibe_AlunosdaTurma '1C'exec Exibe_AlunosdaTurma '1C'


/*
7) Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido.
nota: não conseguir fazer esse prof

CREATE PROCEDURE Matricula_aluno
	@nomeAluno varchar (100),  @dataN smalldatetime, @rgAluno varchar (25),
	@naturalidade varchar (5), @cpf varchar (15), @nomeCurso varchar (10)
AS	
	begin 
		INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno, cpfAluno)
			VALUES (@nomeAluno, @dataN, @rgAluno, @naturalidade, @cpf)
