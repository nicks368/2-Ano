create database BdLivrariaBrasileira 

use BdLivrariaBrasileira

create table tbAutor (
	codAutor int identity (1,1) primary key  
	,nomeAutor varchar (80) 
)

create table tbGenero (
	codGenero int identity (1,1) primary key
	,nomeGenero varchar (40)
)

create table tbEditora (
	codEditora int identity (1,1) primary key
	,nomeEditora varchar (50)
)

create table tbLivro (
	codLivro int identity (1,1) primary key
	,nomeLivro varchar (50)
	,numPaginas int 
	,codGenero int foreign key references tbGenero (codGenero)
	,codAutor int foreign key references tbAutor (codAutor)
	,codEditora int foreign key references tbEditora (codEditora)
)

insert into tbAutor (nomeAutor) 
	values ('Machado de Assis')
	,('Cora Coralina')
	,('Graciliano Ramos')
	,('Clarice Lispector')
	,('Erico Verissimo')

select * from tbAutor


insert into tbEditora(nomeEditora)
	values ('Cia das Letras')
	,('Atica')
	,('Saraiva')

select * from tbEditora


insert into tbGenero (nomeGenero)
	values ('Romance')
	,('Poesia')
	,('Literatura brasileira')

select * from tbGenero


insert into tbLivro (nomeLivro, numPaginas, codAutor, codEditora, codGenero)
	values ('Memorias postumas de bras cubas', 368, 1, 2, 3)
	,('Dom casmurro', 210, 1, 2, 3)
	,('Quincas borbas', 338, 1, 1, 1)

	,('Meu livro de cordel', 187, 2, 2, 2)
	,('Estórias da casa velha da ponte', 209, 2, 1, 2)
	,('Os meninos verdes', 24, 2, 1, 3)

	,('Vidas secas', 176, 3, 2, 1)
	,('S. Bernardo', 288, 3, 2, 1)
	,('Memórias de cárcere', 343, 3, 1, 3)

	,('A hora da estrela', 86, 4, 1, 1)
	,('Perto do coração selvagem', 202, 4, 3, 1)
	,('Todos os contos', 656, 4, 3, 2)

	,('O continente', 656, 5, 3, 3)
	,('Clarissa', 197, 5, 3, 2)
	,('O arquipelago', 702, 5, 3, 2)

	select * from tbLivro

select nomeLivro as 'Livros que começam com a letra P' from tbLivro /* Nome dos livros que começam com P */
	where nomeLivro like 'p%'

select max (numPaginas) as 'Livro com maior numero de paginas' from tbLivro 
	
select min (numPaginas) as 'Livro com menor numero de paginas' from tbLivro 

select avg (numPaginas) as 'Media do numero de paginas' from tbLivro 

select sum (numPaginas) as 'Soma das paginas dos livros da editora 01' from tbLivro 
	where codEditora = 1

select sum (numPaginas) as 'Soma das paginas dos livros que começam com a letra A' from tbLivro 
	where nomeLivro like 'A%'

select avg (numPaginas) as 'Media das paginas dos livros da editora 03' from tbLivro
	where codEditora = 3

select count (nomeLivro) as 'Quantidade de livros da editora 04' from tbLivro
	where codEditora = 4

select nomeLivro as 'Media de livros que tem "estrela" no nome' from tbLivro
	where nomeLivro like '%estrela%'

select count (nomeLivro) as 'Quantidade de livros que tem "poema" no nome' from tbLivro
	where nomeLivro like '%poema%'

select nomeLivro as 'Quantidade de livros agrupado pelo nome do gênero' from tbLivro
 where nomeLivro like '% poema romance literatura classica%'
