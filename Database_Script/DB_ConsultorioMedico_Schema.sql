USE [master]
GO

/****** Object:  Database [ConsultorioMedico]    Script Date: 29/10/2023 17:05:49 ******/
CREATE DATABASE [ConsultorioMedico]
GO

USE [ConsultorioMedico]
GO
/****** Object:  Schema [Especialidad]    Script Date: 29/11/2023 09:46:33 ******/
CREATE SCHEMA [Especialidad]
GO
/****** Object:  Schema [Usuario]    Script Date: 29/11/2023 09:46:33 ******/
CREATE SCHEMA [Usuario]
GO
/****** Object:  Table [Especialidad].[Especialidad]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Especialidad].[Especialidad](
	[IdEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[Especialidad] [nvarchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Especialidad].[EspecialistaEspecialidad]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Especialidad].[EspecialistaEspecialidad](
	[IdEspecialistaEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdEspecialidad] [int] NOT NULL,
 CONSTRAINT [PK_EspecialistaEspecialidad] PRIMARY KEY CLUSTERED 
(
	[IdEspecialistaEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Especialidad].[EstadoTurno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Especialidad].[EstadoTurno](
	[IdEstadoTurno] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EstadoTurno] PRIMARY KEY CLUSTERED 
(
	[IdEstadoTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Especialidad].[Turno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Especialidad].[Turno](
	[IdTurno] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdEspecialista] [int] NOT NULL,
	[IdJornada] [int] NOT NULL,
	[IdEspecialidad] [int] NOT NULL,
	[FechaHoraTurno] [datetime] NOT NULL,
	[MotivoConsulta] [nvarchar](200) NULL,
	[Diagnostico] [text] NULL,
	[IdEstadoTurno] [int] NOT NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[IdTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Usuario].[Jornada]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuario].[Jornada](
	[IdJornada] [int] IDENTITY(1,1) NOT NULL,
	[IdEspecialidad] [int] NOT NULL,
	[IdEspecialista] [int] NOT NULL,
	[DiaSemana] [nvarchar](10) NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
 CONSTRAINT [PK_Jornada] PRIMARY KEY CLUSTERED 
(
	[IdJornada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Usuario].[Paciente]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuario].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Dni] [int] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Cobertura] [nvarchar](50) NULL,
	[NroCredencial] [int] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Usuario].[Perfil]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuario].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Perfil] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Usuario].[Usuario]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuario].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Dni] [int] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Usuario] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IdPerfil] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Especialidad].[EspecialistaEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_EspecialistaEspecialidad_Especialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [Especialidad].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [Especialidad].[EspecialistaEspecialidad] CHECK CONSTRAINT [FK_EspecialistaEspecialidad_Especialidad]
GO
ALTER TABLE [Especialidad].[EspecialistaEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_EspecialistaEspecialidad_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [Usuario].[Usuario] ([IdUsuario])
GO
ALTER TABLE [Especialidad].[EspecialistaEspecialidad] CHECK CONSTRAINT [FK_EspecialistaEspecialidad_Usuario]
GO
ALTER TABLE [Especialidad].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Especialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [Especialidad].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [Especialidad].[Turno] CHECK CONSTRAINT [FK_Turno_Especialidad]
GO
ALTER TABLE [Especialidad].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Especialista] FOREIGN KEY([IdEspecialista])
REFERENCES [Usuario].[Usuario] ([IdUsuario])
GO
ALTER TABLE [Especialidad].[Turno] CHECK CONSTRAINT [FK_Turno_Especialista]
GO
ALTER TABLE [Especialidad].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_EstadoTurno] FOREIGN KEY([IdEstadoTurno])
REFERENCES [Especialidad].[EstadoTurno] ([IdEstadoTurno])
GO
ALTER TABLE [Especialidad].[Turno] CHECK CONSTRAINT [FK_Turno_EstadoTurno]
GO
ALTER TABLE [Especialidad].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Jornada] FOREIGN KEY([IdJornada])
REFERENCES [Usuario].[Jornada] ([IdJornada])
GO
ALTER TABLE [Especialidad].[Turno] CHECK CONSTRAINT [FK_Turno_Jornada]
GO
ALTER TABLE [Especialidad].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [Usuario].[Paciente] ([IdPaciente])
GO
ALTER TABLE [Especialidad].[Turno] CHECK CONSTRAINT [FK_Turno_Paciente]
GO
ALTER TABLE [Usuario].[Jornada]  WITH CHECK ADD  CONSTRAINT [FK_Jornada_Especialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [Especialidad].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [Usuario].[Jornada] CHECK CONSTRAINT [FK_Jornada_Especialidad]
GO
ALTER TABLE [Usuario].[Jornada]  WITH CHECK ADD  CONSTRAINT [FK_Jornada_Especialista] FOREIGN KEY([IdEspecialista])
REFERENCES [Usuario].[Usuario] ([IdUsuario])
GO
ALTER TABLE [Usuario].[Jornada] CHECK CONSTRAINT [FK_Jornada_Especialista]
GO
ALTER TABLE [Usuario].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [Usuario].[Perfil] ([IdPerfil])
GO
ALTER TABLE [Usuario].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO
/****** Object:  StoredProcedure [Especialidad].[sp_CanTurno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_CanTurno]
@IdTurno INT
AS
UPDATE Especialidad.Turno
SET [IdEstadoTurno] = 3
WHERE [IdTurno] = @IdTurno


UPDATE Especialidad.EstadoTurno
SET [NombreEstado] = 'Cancelado'
WHERE IdEstadoTurno = 3
GO
/****** Object:  StoredProcedure [Especialidad].[sp_DelEspecialidad]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_DelEspecialidad]
    @IdEspecialidad INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Especialidad].[Especialidad]
        WHERE [IdEspecialidad] = @IdEspecialidad;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_DelEstadoTurno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_DelEstadoTurno]
    @IdEstadoTurno INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Especialidad].[EstadoTurno]
        WHERE [IdEstadoTurno] = @IdEstadoTurno;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_DelTurno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_DelTurno]
    @IdTurno INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Especialidad].[Turno]
        WHERE [IdTurno] = @IdTurno;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_GetEspecialidades]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_GetEspecialidades]
AS
BEGIN
    SET NOCOUNT ON;
	BEGIN TRY
		SELECT [IdEspecialidad], [Especialidad], [Estado]
		FROM [Especialidad].[Especialidad];
	END TRY
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_GetTurnos]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Especialidad].[sp_GetTurnos]
AS
BEGIN
    SET NOCOUNT ON;
	BEGIN TRY
		SELECT A.IdTurno, 
			A.FechaHoraTurno, 
			A.MotivoConsulta, 
			A.Diagnostico,
			B.IdPaciente AS IdPaciente,
			B.Dni AS DniPaciente, 
			B.Apellido AS ApellidoPaciente, 
			B.Nombre AS NombrePaciente ,
			B.Sexo AS SexoPaciente,
			B.FechaNacimiento AS FechaNacimientoPaciente,
			B.Mail As MailPaciente,
			B.Telefono AS TelefonoPaciente,
			B.Cobertura As CoberturaPaciente,
			B.NroCredencial As NroCredencialPaciente,
			C.IdUsuario AS IdEspecialista,
			C.Apellido AS ApellidoEspecialista, 
			C.Nombre AS NombreEspecialista,
			C.Dni AS DniEspecialista,
			C.Sexo AS SexoEspecialista,
			C.FechaNacimiento AS FechaNacimientoEspecialista,
			C.Mail AS MailEspecialista,
			C.Telefono AS TelefonoEspecialista,
			C.Usuario AS UsuarioEspecialista,
			C.Password AS PasswordEspecialista,
			C.IdPerfil AS IdPerfilEspecialista,
			C.Estado AS EstadoEspecialista,
			D.IdEspecialidad,
			D.Especialidad,
			D.Estado AS EstadoEspecialidad,
			E.IdEstadoTurno,
			E.NombreEstado 
		FROM Especialidad.Turno AS A 
		LEFT JOIN Usuario.Paciente AS B ON A.IdPaciente = B.IdPaciente 
		LEFT JOIN Usuario.Usuario AS C ON A.IdEspecialista = C.IdUsuario 
		LEFT JOIN Especialidad.Especialidad AS D ON A.IdEspecialidad = D.IdEspecialidad 
		LEFT JOIN Especialidad.EstadoTurno AS E ON A.IdEstadoTurno = E.IdEstadoTurno
	END TRY
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_GetTurnosByEspecialista]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Especialidad].[sp_GetTurnosByEspecialista]
    @IdEspecialista INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT A.IdTurno, 
            A.FechaHoraTurno, 
            A.MotivoConsulta, 
            A.Diagnostico,
            B.IdPaciente AS IdPaciente,
            B.Dni AS DniPaciente, 
            B.Apellido AS ApellidoPaciente, 
            B.Nombre AS NombrePaciente ,
            B.Sexo AS SexoPaciente,
            B.FechaNacimiento AS FechaNacimientoPaciente,
            B.Mail As MailPaciente,
            B.Telefono AS TelefonoPaciente,
            B.Cobertura As CoberturaPaciente,
            B.NroCredencial As NroCredencialPaciente,
            C.IdUsuario AS IdEspecialista,
            C.Apellido AS ApellidoEspecialista, 
            C.Nombre AS NombreEspecialista,
            C.Dni AS DniEspecialista,
            C.Sexo AS SexoEspecialista,
            C.FechaNacimiento AS FechaNacimientoEspecialista,
            C.Mail AS MailEspecialista,
            C.Telefono AS TelefonoEspecialista,
			C.Usuario AS UsuarioEspecialista,
            C.Password AS PasswordEspecialista,
            C.IdPerfil AS IdPerfilEspecialista,
            C.Estado AS EstadoEspecialista,
            D.IdEspecialidad,
            D.Especialidad,
            D.Estado AS EstadoEspecialidad,
            E.IdEstadoTurno,
            E.NombreEstado 
        FROM Especialidad.Turno AS A 
            LEFT JOIN Usuario.Paciente AS B ON A.IdPaciente = B.IdPaciente 
            LEFT JOIN Usuario.Usuario AS C ON A.IdEspecialista = C.IdUsuario 
            LEFT JOIN Especialidad.Especialidad AS D ON A.IdEspecialidad = D.IdEspecialidad 
            LEFT JOIN Especialidad.EstadoTurno AS E ON A.IdEstadoTurno = E.IdEstadoTurno
        WHERE C.IdUsuario = @IdEspecialista;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_InsEspecialidad]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_InsEspecialidad]
    @NombreEspecialidad NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Especialidad].[Especialidad] ([Especialidad], [Estado])
        VALUES (@NombreEspecialidad, 1);

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_InsEstadoTurno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_InsEstadoTurno]
    @NombreEstado NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Especialidad].[EstadoTurno] ([NombreEstado])
        VALUES (@NombreEstado);

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_InsTurno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_InsTurno]
    @IdPaciente INT,
    @IdEspecialista INT,
    @IdEspecialidad INT,
    @IdJornada INT,
    @FechaHoraTurno DATETIME,
    @MotivoConsulta NVARCHAR(50),
    @Diagnostico TEXT,
    @IdEstadoTurno INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Especialidad].[Turno] (
            [IdPaciente],
            [IdEspecialista],
            [IdEspecialidad],
            [IdJornada],
            [FechaHoraTurno],
            [MotivoConsulta],
            [Diagnostico],
            [IdEstadoTurno]
        )
        VALUES (
            @IdPaciente,
            @IdEspecialista,
            @IdEspecialidad,
            @IdJornada,
            @FechaHoraTurno,
            @MotivoConsulta,
            @Diagnostico,
            @IdEstadoTurno
        );

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_UpdEspecialidad]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_UpdEspecialidad]
    @IdEspecialidad INT,
    @NuevoNombreEspecialidad NVARCHAR(50),
    @NuevoEstado BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Especialidad].[Especialidad]
        SET [Especialidad] = @NuevoNombreEspecialidad,
            [Estado] = @NuevoEstado
        WHERE [IdEspecialidad] = @IdEspecialidad;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_UpdEstadoEspecialidad]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_UpdEstadoEspecialidad]
    @IdEspecialidad INT,
    @NuevoEstado BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Especialidad].[Especialidad]
        SET [Estado] = @NuevoEstado
        WHERE [IdEspecialidad] = @IdEspecialidad;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_UpdEstadoTurno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_UpdEstadoTurno]
    @IdEstadoTurno INT,
    @NuevoNombreEstado NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Especialidad].[EstadoTurno]
        SET [NombreEstado] = @NuevoNombreEstado
        WHERE [IdEstadoTurno] = @IdEstadoTurno;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_UpdTurno]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_UpdTurno]
    @IdTurno INT,
    @NuevoIdPaciente INT,
    @NuevoIdEspecialista INT,
    @NuevoIdEspecialidad INT,
    @NuevoIdJornada INT,
    @NuevaFechaHoraTurno DATETIME,
    @NuevoMotivoConsulta NVARCHAR(50),
    @NuevoDiagnostico TEXT,
    @NuevoIdEstadoTurno INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Especialidad].[Turno]
        SET
            [IdPaciente] = @NuevoIdPaciente,
            [IdEspecialista] = @NuevoIdEspecialista,
            [IdEspecialidad] = @NuevoIdEspecialidad,
            [IdJornada] = @NuevoIdJornada,
            [FechaHoraTurno] = @NuevaFechaHoraTurno,
            [MotivoConsulta] = @NuevoMotivoConsulta,
            [Diagnostico] = @NuevoDiagnostico,
            [IdEstadoTurno] = @NuevoIdEstadoTurno
        WHERE [IdTurno] = @IdTurno;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_DelJornada]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_DelJornada]
    @IdJornada INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Usuario].[Jornada]
        WHERE [IdJornada] = @IdJornada;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_DelPaciente]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_DelPaciente]
    @IdPaciente INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Usuario].[Paciente]
        WHERE [IdPaciente] = @IdPaciente;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_DelUsuario]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_DelUsuario]
    @IdUsuario INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Usuario].[Usuario]
        WHERE [IdUsuario] = @IdUsuario;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_GetEspecialistas]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_GetEspecialistas]
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT u.[IdUsuario], u.[Apellido], u.[Nombre], u.[Dni], u.[Sexo], u.[FechaNacimiento], u.[Mail], u.[Telefono], u.[Usuario], u.[Password], u.[IdPerfil], u.[Estado]
        FROM [Usuario].[Usuario] u
        WHERE u.[IdPerfil] = 3; -- Perfil 3 corresponde a Especialista
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_GetPacientes]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_GetPacientes]
AS
BEGIN
    SET NOCOUNT ON;
	BEGIN TRY
		SELECT [IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]
		FROM [Usuario].[Paciente];
	END TRY
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_GetUsuarioByUsuarioPassword]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Usuario].[sp_GetUsuarioByUsuarioPassword]
    @Usuario NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [Usuario].[Usuario]
    WHERE [Usuario] = @Usuario AND [Password] = @Password;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_GetUsuarios]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_GetUsuarios]
AS
BEGIN
    SET NOCOUNT ON;
	BEGIN TRY
		SELECT [IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]
		FROM [Usuario].[Usuario]
		WHERE [IdPerfil] IN (1, 2)
	END TRY
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_InsJornada]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_InsJornada]
    @IdEspecialidad INT,
    @IdEspecialista INT,
    @DiaSemana NVARCHAR(10),
    @HoraInicio TIME,
    @HoraFin TIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si ya existe un registro con los mismos parámetros
        IF EXISTS (
            SELECT 1
            FROM [Usuario].[Jornada]
            WHERE [IdEspecialidad] = @IdEspecialidad
              AND [IdEspecialista] = @IdEspecialista
              AND [DiaSemana] = @DiaSemana
        )
        BEGIN
            -- Si existe, realizar una actualización
            UPDATE [Usuario].[Jornada]
            SET [HoraInicio] = @HoraInicio,
                [HoraFin] = @HoraFin
            WHERE [IdEspecialidad] = @IdEspecialidad
              AND [IdEspecialista] = @IdEspecialista
              AND [DiaSemana] = @DiaSemana;
        END
        ELSE
        BEGIN
            -- Si no existe, realizar una inserción
            INSERT INTO [Usuario].[Jornada] ([IdEspecialidad], [IdEspecialista], [DiaSemana], [HoraInicio], [HoraFin])
            VALUES (@IdEspecialidad, @IdEspecialista, @DiaSemana, @HoraInicio, @HoraFin);
        END

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_InsPaciente]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_InsPaciente]
    @NuevoApellido NVARCHAR(50),
    @NuevoNombre NVARCHAR(50),
    @NuevoDni INT,
    @NuevoSexo CHAR(1),
    @NuevaFechaNacimiento DATETIME,
    @NuevoMail NVARCHAR(50),
    @NuevoTelefono NVARCHAR(50),
    @NuevaCobertura NVARCHAR(50),
    @NuevoNroCredencial INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Usuario].[Paciente] ([Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial])
        VALUES (@NuevoApellido, @NuevoNombre, @NuevoDni, @NuevoSexo, @NuevaFechaNacimiento, @NuevoMail, @NuevoTelefono, @NuevaCobertura, @NuevoNroCredencial);

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_InsUsuario]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_InsUsuario]
    @Apellido NVARCHAR(50),
    @Nombre NVARCHAR(50),
    @Dni INT,
    @Sexo CHAR(1),
    @FechaNacimiento DATETIME,
    @Mail NVARCHAR(50),
    @Telefono NVARCHAR(50),
    @NombreUsuario NVARCHAR(50),
    @Password NVARCHAR(50),
    @IdPerfil INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Usuario].[Usuario] ([Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado])
        VALUES (@Apellido, @Nombre, @Dni, @Sexo, @FechaNacimiento, @Mail, @Telefono, @NombreUsuario, @Password, @IdPerfil, 1);

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_UpdEstadoUsuario]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_UpdEstadoUsuario]
    @IdUsuario INT,
    @NuevoEstado BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Usuario].[Usuario]
        SET [Estado] = @NuevoEstado
        WHERE [IdUsuario] = @IdUsuario;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_UpdJornada]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_UpdJornada]
    @IdJornada INT,
    @IdEspecialidad INT,
    @IdEspecialista INT,
    @NuevoDiaSemana NVARCHAR(10),
    @NuevaHoraInicio TIME,
    @NuevaHoraFin TIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Usuario].[Jornada]
        SET [IdEspecialidad] = @IdEspecialidad,
            [IdEspecialista] = @IdEspecialista,
            [DiaSemana] = @NuevoDiaSemana,
            [HoraInicio] = @NuevaHoraInicio,
            [HoraFin] = @NuevaHoraFin
        WHERE [IdJornada] = @IdJornada;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_UpdPaciente]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_UpdPaciente]
    @IdPaciente INT,
    @NuevoApellido NVARCHAR(50),
    @NuevoNombre NVARCHAR(50),
    @NuevoDni INT,
    @NuevoSexo CHAR(1),
    @NuevaFechaNacimiento DATETIME,
    @NuevoMail NVARCHAR(50),
    @NuevoTelefono NVARCHAR(50),
    @NuevaCobertura NVARCHAR(50),
    @NuevoNroCredencial INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Usuario].[Paciente]
        SET [Apellido] = @NuevoApellido,
            [Nombre] = @NuevoNombre,
            [Dni] = @NuevoDni,
            [Sexo] = @NuevoSexo,
            [FechaNacimiento] = @NuevaFechaNacimiento,
            [Mail] = @NuevoMail,
            [Telefono] = @NuevoTelefono,
            [Cobertura] = @NuevaCobertura,
            [NroCredencial] = @NuevoNroCredencial
        WHERE [IdPaciente] = @IdPaciente;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_UpdUsuario]    Script Date: 29/11/2023 09:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_UpdUsuario]
    @IdUsuario INT,
    @NuevoApellido NVARCHAR(50),
    @NuevoNombre NVARCHAR(50),
    @NuevoDni INT,
    @NuevoSexo CHAR(1),
    @NuevaFechaNacimiento DATETIME,
    @NuevoMail NVARCHAR(50),
    @NuevoTelefono NVARCHAR(50),
    @NuevoNombreUsuario NVARCHAR(50),
    @NuevoPassword NVARCHAR(50),
    @NuevoIdPerfil INT,
    @NuevoEstado BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Usuario].[Usuario]
        SET [Apellido] = @NuevoApellido,
            [Nombre] = @NuevoNombre,
            [Dni] = @NuevoDni,
            [Sexo] = @NuevoSexo,
            [FechaNacimiento] = @NuevaFechaNacimiento,
            [Mail] = @NuevoMail,
            [Telefono] = @NuevoTelefono,
            [Usuario] = @NuevoNombreUsuario,
            [Password] = @NuevoPassword,
            [IdPerfil] = @NuevoIdPerfil,
            [Estado] = @NuevoEstado
        WHERE [IdUsuario] = @IdUsuario;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK;
        END

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
