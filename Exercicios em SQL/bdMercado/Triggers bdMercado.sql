USE bdMercado
-- 1
CREATE TRIGGER tgAtualizaVenda
ON tbItensVenda AFTER INSERT
AS

	DECLARE @idProduto INT, @quantidadeProduto SMALLINT, @quantidadeVendida SMALLINT
	SET @idProduto = (SELECT idProduto FROM inserted)
	SET @quantidadeVendida = (SELECT quantidadeItensVenda FROM inserted)

UPDATE tbProduto 
	SET quantidadeProduto = quantidadeProduto - @quantidadeVendida
	WHERE idProduto = @idProduto
	PRINT ('Quantidade atualizada com sucesso!')

-- 2
CREATE TRIGGER tgAtualizaProduto
ON tbEntradaProduto AFTER INSERT
AS
	DECLARE @idProduto INT, @quantidadeEntradaProduto SMALLINT
	SET @idProduto = (SELECT idProduto FROM inserted)
	SET @quantidadeEntradaProduto = (SELECT quantidadeEntradaProduto FROM inserted)

UPDATE tbProduto 
	SET quantidadeProduto = quantidadeProduto + @quantidadeEntradaProduto
	WHERE idProduto = @idProduto
	PRINT ('Quantidade atualizada com sucesso!')

-- 3
ALTER TRIGGER tgInsertSaida
ON tbItensVenda AFTER INSERT
AS
	DECLARE @idProduto INT, @quantidadeItensVenda SMALLINT
	SET @idProduto = (SELECT idProduto FROM inserted)
	SET @quantidadeItensVenda = (SELECT quantidadeItensVenda FROM inserted)

INSERT INTO tbSaidaProduto (dataSaidaProduto, idProduto, quantidadeSaidaProduto)
	VALUES (GETDATE(), @idProduto, @quantidadeItensVenda)
	
	PRINT ('Insert realizado com sucesso!')


	

	


	