CREATE FUNCTION fcDiaSemana (@data DATE)
	RETURNS VARCHAR (40) AS

BEGIN 

	DECLARE @diaSemana VARCHAR (40)
	DECLARE @dia INT

	SET @dia = DATEPART (DW, @data)

		IF @dia = 1
			BEGIN
		SET @diaSemana = 'DOMINGO'
	END

		IF @dia = 2
			BEGIN
		SET @diaSemana = 'SEGUNDA-FEIRA'
	END

	IF @dia = 3
			BEGIN
		SET @diaSemana = 'TERÇA-FEIRA'
	END

	IF @dia = 4
			BEGIN
		SET @diaSemana = 'QUARTA-FEIRA'
	END

	IF @dia = 5
			BEGIN
		SET @diaSemana = 'QUINTA-FEIRA'
	END

	IF @dia = 6
			BEGIN
		SET @diaSemana = 'SEXTA-FEIRA'
	END

	IF @dia = 7
			BEGIN
		SET @diaSemana = 'SABADO'
	END

	RETURN @diaSemana

END

SELECT codAluno, CONVERT(VARCHAR(12), dataMatricula, 103) 'DataMatricula',
DiaDaSemana=dbo.fcDiaSemana(dataMatricula) FROM tbMatricula

CREATE FUNCTION fcDuracaoCurso (@cargaHoraria INT)
	RETURNS VARCHAR (40) AS

BEGIN 
	DECLARE @duracaoCurso VARCHAR (30)
	
	IF @cargaHoraria >= 1000
		BEGIN
			SET @duracaoCurso = 'EXTENSO'
	END

	ELSE
		BEGIN
			SET @duracaoCurso = 'RAPIDO'
	END

	RETURN @duracaoCurso

END

SELECT codCurso, nomeCurso 'Curso', cargaHorariaCurso 'CargaHoraria',
Duração=dbo.fcDuracaoCurso(cargaHorariaCurso) FROM tbCurso

CREATE FUNCTION fcCustoCurso (@valorCurso SMALLMONEY)
	RETURNS VARCHAR (10) AS

BEGIN 
	DECLARE @custoCurso VARCHAR (10)
	
	IF @valorCurso >= 400
		BEGIN
			SET @custoCurso= 'CARO'
	END

	ELSE
		BEGIN
			SET @custoCurso = 'BARATO'
	END

	RETURN @custoCurso

END

SELECT codCurso, nomeCurso 'Curso', valorCurso 'Valor',
Custo=dbo.fcCustoCurso(valorCurso) FROM tbCurso

CREATE FUNCTION fcConverteData (@data DATE)
	RETURNS VARCHAR (20) AS

BEGIN
	DECLARE @dataConvertida VARCHAR (20)

	SET @dataConvertida = FORMAT(@data, 'dd/MM/yyyy')

	RETURN @dataConvertida

END

SELECT codAluno, dataMatricula 'DataMatricula',
DataConvertida=dbo.fcConverteData(dataMatricula) FROM tbMatricula

CREATE FUNCTION fcVerificacaoMatricula (@rg VARCHAR(25))
	RETURNS VARCHAR (25) AS

BEGIN
	DECLARE @respMatricula VARCHAR(10)

	IF EXISTS (SELECT rgAluno FROM tbAluno WHERE rgAluno = @rg) 
		BEGIN	
			SET @respMatricula = 'SIM'
	END

	ELSE
		BEGIN
			SET @respMatricula = 'NÃO'
	END

	RETURN @respMatricula
END

SELECT codAluno, rgAluno 'RG',
'Possui Matricula?'=dbo.fcVerificacaoMatricula(rgAluno) FROM tbAluno