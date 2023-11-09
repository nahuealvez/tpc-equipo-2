USE [master]
GO

/****** Object:  Database [ConsultorioMedico]    Script Date: 29/10/2023 17:05:49 ******/
CREATE DATABASE [ConsultorioMedico]
GO

USE [ConsultorioMedico]
GO
/****** Object:  Schema [Especialidad]    Script Date: 8/11/2023 22:54:22 ******/
CREATE SCHEMA [Especialidad]
GO
/****** Object:  Schema [Usuario]    Script Date: 8/11/2023 22:54:22 ******/
CREATE SCHEMA [Usuario]
GO
/****** Object:  Table [Especialidad].[Especialidad]    Script Date: 8/11/2023 22:54:22 ******/
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
/****** Object:  Table [Especialidad].[EspecialistaEspecialidad]    Script Date: 8/11/2023 22:54:22 ******/
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
/****** Object:  Table [Usuario].[Paciente]    Script Date: 8/11/2023 22:54:22 ******/
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
/****** Object:  Table [Usuario].[Perfil]    Script Date: 8/11/2023 22:54:22 ******/
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
/****** Object:  Table [Usuario].[Usuario]    Script Date: 8/11/2023 22:54:22 ******/
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
SET IDENTITY_INSERT [Especialidad].[Especialidad] ON 

INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (1, N'Cardiología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (2, N'Dermatología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (3, N'Pediatría', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (4, N'Oftalmología', 1)
SET IDENTITY_INSERT [Especialidad].[Especialidad] OFF
GO
SET IDENTITY_INSERT [Especialidad].[EspecialistaEspecialidad] ON 

INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (1, 2, 1)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (2, 2, 2)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [Especialidad].[EspecialistaEspecialidad] OFF
GO
SET IDENTITY_INSERT [Usuario].[Paciente] ON 

INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (1, N'López', N'Juan', 56789012, N'M', CAST(N'1988-11-30T00:00:00.000' AS DateTime), N'juan.lopez@mail.com', N'555-4321', N'Obra Social XYZ', 12345)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (2, N'Fernández', N'María', 67890123, N'F', CAST(N'1992-07-18T00:00:00.000' AS DateTime), N'maria.fernandez@mail.com', N'555-9876', N'Prepaga ABC', 67890)
SET IDENTITY_INSERT [Usuario].[Paciente] OFF
GO
SET IDENTITY_INSERT [Usuario].[Perfil] ON 

INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (1, N'Administrador')
INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (2, N'Médico')
INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (3, N'Paciente')
SET IDENTITY_INSERT [Usuario].[Perfil] OFF
GO
SET IDENTITY_INSERT [Usuario].[Usuario] ON 

INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (1, N'Gómez', N'Ana', 12345678, N'F', CAST(N'1980-05-15T00:00:00.000' AS DateTime), N'ana.gomez@mail.com', N'555-1234', N'ana_gomez', N'clave123', 1, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (2, N'Martínez', N'Carlos', 98765432, N'M', CAST(N'1975-08-22T00:00:00.000' AS DateTime), N'carlos.martinez@mail.com', N'555-5678', N'carlos_martinez', N'clave456', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (3, N'Rodríguez', N'Laura', 34567890, N'F', CAST(N'1995-02-10T00:00:00.000' AS DateTime), N'laura.rodriguez@mail.com', N'555-8765', N'laura_rodriguez', N'clave789', 3, 1)
SET IDENTITY_INSERT [Usuario].[Usuario] OFF
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
ALTER TABLE [Usuario].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [Usuario].[Perfil] ([IdPerfil])
GO
ALTER TABLE [Usuario].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO
/****** Object:  StoredProcedure [Especialidad].[sp_DelEspecialidad]    Script Date: 8/11/2023 22:54:22 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_GetEspecialidades]    Script Date: 8/11/2023 22:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Especialidad].[sp_GetEspecialidades]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [IdEspecialidad], [Especialidad], [Estado]
    FROM [Especialidad].[Especialidad];
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_InsEspecialidad]    Script Date: 8/11/2023 22:54:22 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_UpdEspecialidad]    Script Date: 8/11/2023 22:54:22 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Especialidad].[sp_UpdEstadoEspecialidad]    Script Date: 8/11/2023 22:54:22 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_DelUsuario]    Script Date: 8/11/2023 22:54:22 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_GetUsuarios]    Script Date: 8/11/2023 22:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_GetUsuarios]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]
    FROM [Usuario].[Usuario];
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_InsUsuario]    Script Date: 8/11/2023 22:54:22 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_UpdEstadoUsuario]    Script Date: 8/11/2023 22:54:22 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_UpdUsuario]    Script Date: 8/11/2023 22:54:22 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
