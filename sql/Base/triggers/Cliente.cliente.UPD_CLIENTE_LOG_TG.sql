USE [Cliente]
GO

-- =============================================
-- Author: Jos� Etmanuel
-- Create date: 12/02/2019
-- Description: el objetivo es: Guardar el registro antes de ser Actualizado de la tabla Cliente
-- ============== Versionamiento ================

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [cliente].[UPD_CLIENTE_LOG_TG]
   ON  [cliente].[Cliente]
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [ClienteLog].[cliente].[Cliente]
		SELECT TOP 1  [idCliente]
				,[nombre]
				,[activo]
				,[rfcEmpresa]
				,[idUsuario]
				,3
				,getdate()
			FROM INSERTED;
END