USE bdAutoriaMusica 

-- 1)
CREATE VIEW vwMusicaAutor AS
	SELECT nomeAutor, nomeMusica FROM tbAutor
		INNER JOIN tbAutoria ON tbAutor.codAutor = tbAutoria.codAutor
		INNER JOIN tbMusica ON tbAutoria.codMusica = tbMusica.codMusica

-- 2)
SELECT * FROM vwMusicaAutor
	WHERE nomeAutor LIKE 'Adoniram Barbosa'

-- 3)
ALTER VIEW vwQtdMusica AS
	SELECT nomeAutor, COUNT (nomeMusica) AS 'Quantidade' FROM tbAutor
		INNER JOIN tbAutoria ON tbAutor.codAutor = tbAutoria.codAutor
		INNER JOIN tbMusica ON tbAutoria.codMusica = tbMusica.codMusica
			GROUP BY nomeAutor

--4)
alter VIEW vwMaiorQtdMusica AS
	SELECT nomeAutor, COUNT (nomeMusica) AS 'Quantidade' FROM tbAutor
		INNER JOIN tbAutoria ON tbAutor.codAutor = tbAutoria.codAutor
		INNER JOIN tbMusica ON tbAutoria.codMusica = tbMusica.codMusica
			WHERE nomeMusica = (SELECT MAX (nomeMusica) FROM tbMusica)
			GROUP BY nomeAutor

--5) 
ALTER VIEW vwMusica2021 AS
	SELECT nomeMusica FROM tbMusica
		WHERE dataComposicao >= '01/01/2021' 

