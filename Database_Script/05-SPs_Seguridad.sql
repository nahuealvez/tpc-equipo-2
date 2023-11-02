USE [ConsultorioMedico]
GO

/****** Object:  StoredProcedure [Seguridad].[sp_DelUsuario]    Script Date: 3/11/2023 06:16:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Declaración del Stored Procedure para eliminar un registro de usuario
CREATE PROCEDURE [Seguridad].[sp_DelUsuario]
    @IdUsuario INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM [Seguridad].[Usuarios]
        WHERE IdUsuario = @IdUsuario;

        IF @@ROWCOUNT > 0
        BEGIN
            PRINT 'Registro de usuario eliminado exitosamente.';
        END
        ELSE
        BEGIN
            PRINT 'No se encontró un registro de usuario para eliminar.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'No se pudo realizar la eliminación del registro de usuario.';
    END CATCH
END;
GO


USE [ConsultorioMedico]
GO

/****** Object:  StoredProcedure [Seguridad].[sp_InsUsuario]    Script Date: 3/11/2023 06:16:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Declaración del Stored Procedure para insertar un registro de usuario
CREATE PROCEDURE [Seguridad].[sp_InsUsuario]
    @Usuario NVARCHAR(50),
    @Password NVARCHAR(50),
    @IdGrupo INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO [Seguridad].[Usuarios] (Usuario, [Password], IdGrupo, Activo)
        VALUES (@Usuario, @Password, @IdGrupo, 1);

        PRINT 'Registro de usuario insertado exitosamente.';
    END TRY
    BEGIN CATCH
        PRINT 'No se pudo agregar el registro de usuario.';
    END CATCH
END;
GO


USE [ConsultorioMedico]
GO

/****** Object:  StoredProcedure [Seguridad].[sp_UpdUsuario]    Script Date: 3/11/2023 06:17:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Declaración del Stored Procedure para actualizar un registro de usuario
CREATE PROCEDURE [Seguridad].[sp_UpdUsuario]
    @IdUsuario INT,
    @Usuario NVARCHAR(50) = NULL,
    @Password NVARCHAR(50) = NULL,
    @IdGrupo INT = NULL,
    @Activo BIT = NULL
AS
BEGIN
    BEGIN TRY
        DECLARE @OldUsuario NVARCHAR(50);
        DECLARE @OldPassword NVARCHAR(50);
        DECLARE @OldIdGrupo INT;
        DECLARE @OldActivo BIT;

        -- Obtener los valores antiguos de la base de datos
        SELECT @OldUsuario = Usuario, @OldPassword = [Password], @OldIdGrupo = IdGrupo, @OldActivo = Activo
        FROM [Seguridad].[Usuarios]
        WHERE IdUsuario = @IdUsuario;

        -- Actualizar los campos solo si se proporciona un valor
        IF @Usuario IS NOT NULL
            SET @OldUsuario = @Usuario;
        IF @Password IS NOT NULL
            SET @OldPassword = @Password;
        IF @IdGrupo IS NOT NULL
            SET @OldIdGrupo = @IdGrupo;
        IF @Activo IS NOT NULL
            SET @OldActivo = @Activo;

        -- Realizar la actualización en la base de datos
        UPDATE [Seguridad].[Usuarios]
        SET
            Usuario = @OldUsuario,
            [Password] = @OldPassword,
            IdGrupo = @OldIdGrupo,
            Activo = @OldActivo
        WHERE
            IdUsuario = @IdUsuario;

        IF @@ROWCOUNT > 0
        BEGIN
            PRINT 'Registro de usuario actualizado exitosamente.';
        END
        ELSE
        BEGIN
            PRINT 'No se encontró un registro de usuario para actualizar.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'No se pudo realizar la actualización del registro de usuario.';
    END CATCH
END;
GO


