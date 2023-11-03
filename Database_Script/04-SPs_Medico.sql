USE [ConsultorioMedico]
GO

/****** Object:  StoredProcedure [Medico].[sp_DelEspecialidad]    Script Date: 3/11/2023 06:12:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Declaración del Stored Procedure para eliminar una especialidad
CREATE PROCEDURE [Medico].[sp_DelEspecialidad]
    @IdEspecialidad INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM [Medico].[Especialidad]
        WHERE
            IdEspecialidad = @IdEspecialidad;

        IF @@ROWCOUNT > 0
        BEGIN
            PRINT 'Registro eliminado exitosamente.';
        END
        ELSE
        BEGIN
            PRINT 'No se encontró un registro para eliminar.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'No se pudo realizar la eliminación.';
    END CATCH
END;
GO


USE [ConsultorioMedico]
GO

/****** Object:  StoredProcedure [Medico].[sp_GetEspecialidad]    Script Date: 3/11/2023 06:13:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Medico].[sp_GetEspecialidad]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		[IdEspecialidad], 
		[Especialidad], 
		[Estado]
	FROM
		[Medico].[Especialidad]
END
GO


USE [ConsultorioMedico]
GO

/****** Object:  StoredProcedure [Medico].[sp_InsEspecialidad]    Script Date: 3/11/2023 06:13:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Medico].[sp_InsEspecialidad]
    @Especialidad NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        INSERT INTO [Medico].[Especialidad] (Especialidad, Estado)
        VALUES (@Especialidad, 1);

        PRINT 'Registro insertado exitosamente.';
    END TRY
    BEGIN CATCH
        PRINT 'No se pudo agregar el registro.';
    END CATCH
END;
GO


USE [ConsultorioMedico]
GO

/****** Object:  StoredProcedure [Medico].[sp_InsMedico]    Script Date: 3/11/2023 06:14:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Medico].[sp_InsMedico]
    @Nombre NVARCHAR(50),
    @IdEspecialidad INT,
    @IdTurnoTrabajo INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO [Medico].[Medico] (Nombre, IdEspecialidad, IdTurnoTrabajo)
        VALUES (@Nombre, @IdEspecialidad, @IdTurnoTrabajo);
        PRINT 'Registro insertado exitosamente.';
    END TRY
    BEGIN CATCH
        PRINT 'No se pudo agregar el registro.';
    END CATCH
END;
GO


USE [ConsultorioMedico]
GO

/****** Object:  StoredProcedure [Medico].[sp_UpdEspecialidad]    Script Date: 3/11/2023 06:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Declaración del Stored Procedure para actualizar una especialidad
CREATE PROCEDURE [Medico].[sp_UpdEspecialidad]
    @IdEspecialidad INT,
    @NuevoEspecialidad NVARCHAR(50),
    @NuevoEstado BIT
AS
BEGIN
    BEGIN TRY
        UPDATE [Medico].[Especialidad]
        SET
            Especialidad = @NuevoEspecialidad,
            Estado = @NuevoEstado
        WHERE
            IdEspecialidad = @IdEspecialidad;

        IF @@ROWCOUNT > 0
        BEGIN
            PRINT 'Registro actualizado exitosamente.';
        END
        ELSE
        BEGIN
            PRINT 'No se encontró un registro para actualizar.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'No se pudo realizar la actualización.';
    END CATCH
END;
GO

