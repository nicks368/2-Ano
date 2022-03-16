CREATE DATABASE BdLivrariaBrasileiraNikolas

USE BdLivrariaBrasileiraNikolas

CREATE TABLE tbAutor (
	codAutor INT IDENTITY (1,1) PRIMARY KEY 
	,nomeAutor VARCHAR (80) NOT NULL
)

CREATE TABLE tbGenero (
	codGenero INT IDENTITY (1,1) PRIMARY KEY
	,nomeGenero VARCHAR (60) NOT NULL
)

CREATE TABLE tbEditora (
	codEditora INT IDENTITY (1,1) PRIMARY KEY
	,nomeEditora VARCHAR (60) NOT NULL
)

CREATE TABLE tbLivro (
	codLivro INT IDENTITY (1,1) NOT NULL
	,nomeLivro VARCHAR (60) NOT NULL
	,numPaginas INT NOT NULL 
	,codGenero INT FOREIGN KEY REFERENCES tbGenero (codGenero)
	,codAutor INT FOREIGN KEY REFERENCES tbAutor (codAutor)
	,codEditora INT FOREIGN KEY REFERENCES tbEditora (codEditora)
)

INSERT INTO tbGenero (nomeGenero)
	VALUES ('Ficcção')
	,('Romance')
	,('Tragédia')

INSERT INTO tbEditora (nomeEditora)
	VALUES ('Melhoramentos')
	,('Globo')
	,('Ática')
	,('Companhia das letras')
	,('Abril')

INSERT INTO tbAutor (nomeAutor)
	VALUES ('Chico Buarque')
	,('Jorge Amado')
	,('J.K. Rolling')
	,('William Shakespeare')
	,('Monteiro Lobato')
	,('Cora Coralina')
	,('Clarisse Lispector')

INSERT INTO tbLivro (nomeLivro, numPaginas, codGenero, codEditora, codAutor)
	VALUES ('Budapeste', 176, 2, 4, 1)
	,('O Bicho-da-Seda', 454, 2, 5, 3)
	,('Gabriela, Cravo e Canela', 214, 1, 2, 2)
	,('Reinações de Narizinho', 143, 2, 2, 5)
	,('Romeu e Julieta', 421, 1, 3, 4)
	,('O Irmão Alemão', 478, 1, 4, 1)
	,('Terras do Sem-Fim', 125, 1, 3, 2)
	,('Animais Fantásticos e Onde Habitam', 267, 2, 4, 3)


-- A) Quantidade de livros agrupado pelo nome do genero

SELECT nomeGenero, COUNT (nomeLivro) AS 'Quantidade de livros' FROM tbLivro
	INNER JOIN tbGenero ON tbLivro.codGenero = tbGenero.codGenero
	GROUP BY nomeGenero

-- B) Soma das paginas agrupadas pelo nome do autor 

SELECT nomeAutor, SUM (numPaginas) AS 'Soma das paginas' FROM tbLivro
	INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
	GROUP BY nomeAutor

-- C) Média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z)

SELECT nomeAutor, AVG (numPaginas) AS 'Média das paginas' FROM tbLivro
	INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
	GROUP BY nomeAutor

-- D) Quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A)

SELECT nomeEditora, COUNT (nomeLivro) AS 'Quantidade de livros' FROM tbLivro
	INNER JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
	GROUP BY nomeEditora
	ORDER BY nomeEditora DESC

-- E) Soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C”

SELECT nomeAutor, SUM (numPaginas) AS 'Soma das paginas' FROM tbLivro
	FULL JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor LIKE 'C%'
	GROUP BY nomeAutor

-- F) Quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis”
--	  ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector”

SELECT nomeAutor, COUNT (nomeLivro) AS 'Quantidade de Livros' FROM tbLivro
	FULL JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor LIKE 'Machado de Assis' OR nomeAutor LIKE 'Cora Coralina' OR nomeAutor LIKE 'Graciliano Ramos'
	OR nomeAutor LIKE 'Clarisse Lispector'
	GROUP BY nomeAutor

-- G) Soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200
--    e 500 (inclusive)

SELECT nomeEditora, SUM (numPaginas) AS 'Soma das paginas' FROM tbLivro
	INNER JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
	WHERE numPaginas BETWEEN 200 AND 500
	GROUP BY nomeEditora

-- H) Nome dos livros ao lado do nome das editoras e do nome dos autores

SELECT nomeLivro, nomeEditora, nomeAutor FROM tbLivro
	INNER JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
	INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
	
-- I) Nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras”

SELECT nomeLivro, nomeAutor FROM tbLivro
	INNER JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
	INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeEditora LIKE 'Cia das Letras'

-- J) Nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo”

SELECT nomeLivro, nomeAutor FROM tbLivro
	INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor NOT LIKE 'Érico Veríssimo'

-- K) Nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem livros cadastrados

SELECT nomeAutor, nomeLivro FROM tbAutor
	LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor

-- L) Nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem autores cadastrados

SELECT nomeAutor, nomeLivro FROM tbAutor
	RIGHT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor

-- M) Nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro publicado, e 
--    indiferente do livro pertencer a algum autor

SELECT nomeAutor, nomeLivro FROM tbAutor
	FULL JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor

-- N) A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de 
--    todos os livros ao lado do nome da editora Ática.

SELECT nomeLivro, nomeEditora FROM tbLivro
	CROSS JOIN tbEditora 
	WHERE nomeEditora LIKE 'Ática' 

-- O) Somente os nomes dos autores que não tem livros cadastrados

SELECT nomeAutor, nomeLivro FROM tbAutor
	FULL JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
	WHERE nomeLivro is null
	
-- P) Os nomes dos gêneros que não possuem nenhum livro cadastrado
	
SELECT nomeGenero, nomeLivro FROM tbGenero
	FULL JOIN tbLivro ON tbGenero.codGenero = tbLivro.codGenero
	WHERE nomeLivro is null
	
	
