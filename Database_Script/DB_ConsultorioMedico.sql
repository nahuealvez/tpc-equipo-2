USE [master]
GO

/****** Object:  Database [ConsultorioMedico]    Script Date: 29/10/2023 17:05:49 ******/
CREATE DATABASE [ConsultorioMedico]
GO
USE [ConsultorioMedico]
GO
/****** Object:  Schema [Especialidad]    Script Date: 10/11/2023 14:54:42 ******/
CREATE SCHEMA [Especialidad]
GO
/****** Object:  Schema [Usuario]    Script Date: 10/11/2023 14:54:42 ******/
CREATE SCHEMA [Usuario]
GO
/****** Object:  Table [Especialidad].[Especialidad]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  Table [Especialidad].[EspecialistaEspecialidad]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  Table [Usuario].[Paciente]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  Table [Usuario].[Perfil]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  Table [Usuario].[Usuario]    Script Date: 10/11/2023 14:54:42 ******/
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
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (4, N'Gastroenterología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (5, N'Neurología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (6, N'Oftalmología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (7, N'Oncología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (8, N'Traumatología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (9, N'Psiquiatría', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (10, N'Endocrinología', 1)
SET IDENTITY_INSERT [Especialidad].[Especialidad] OFF
GO
SET IDENTITY_INSERT [Especialidad].[EspecialistaEspecialidad] ON 

INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (1, 1, 1)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (2, 3, 2)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (3, 5, 3)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (4, 8, 4)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (5, 10, 5)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (6, 1, 6)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (7, 3, 7)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (8, 5, 8)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (9, 8, 9)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (10, 10, 10)
SET IDENTITY_INSERT [Especialidad].[EspecialistaEspecialidad] OFF
GO
SET IDENTITY_INSERT [Usuario].[Paciente] ON 

INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (1, N'González', N'Elena', 112233445, N'F', CAST(N'1993-02-14T00:00:00.000' AS DateTime), N'elena@mail.com', N'555-1122', N'Obra Social ABC', 12345)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (2, N'Hernández', N'Ricardo', 223344556, N'M', CAST(N'1984-11-27T00:00:00.000' AS DateTime), N'ricardo@mail.com', N'555-3344', N'Prepaga XYZ', 67890)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (3, N'Fernández', N'Camila', 334455667, N'F', CAST(N'1998-07-08T00:00:00.000' AS DateTime), N'camila@mail.com', N'555-5566', N'Particular', 67896)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (4, N'Martínez', N'Gustavo', 445566778, N'M', CAST(N'1979-04-30T00:00:00.000' AS DateTime), N'gustavo@mail.com', N'555-7788', N'Obra Social DEF', 54321)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (5, N'López', N'Ana María', 556677889, N'F', CAST(N'1982-09-17T00:00:00.000' AS DateTime), N'ana_maria@mail.com', N'555-9900', N'Prepaga UVW', 98765)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (6, N'Pérez', N'Jorge', 667788990, N'M', CAST(N'1996-12-03T00:00:00.000' AS DateTime), N'jorge@mail.com', N'555-1122', N'Particular', 67823)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (7, N'Díaz', N'Valentina', 778899001, N'F', CAST(N'1981-05-26T00:00:00.000' AS DateTime), N'valentina@mail.com', N'555-3344', N'Obra Social GHI', 23456)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (8, N'Sánchez', N'Raúl', 889900112, N'M', CAST(N'1997-02-19T00:00:00.000' AS DateTime), N'raul@mail.com', N'555-5566', N'Prepaga JKL', 78901)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (9, N'Gómez', N'Luisa', 990011223, N'F', CAST(N'1989-11-10T00:00:00.000' AS DateTime), N'luisa@mail.com', N'555-7788', N'Particular', 67891)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (10, N'Torres', N'Juan Manuel', 100112233, N'M', CAST(N'1994-06-01T00:00:00.000' AS DateTime), N'juan_manuel@mail.com', N'555-9900', N'Obra Social MNO', 34567)
SET IDENTITY_INSERT [Usuario].[Paciente] OFF
GO
SET IDENTITY_INSERT [Usuario].[Perfil] ON 

INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (1, N'Administrador')
INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (2, N'Recepcionista')
INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (3, N'Especialista')
SET IDENTITY_INSERT [Usuario].[Perfil] OFF
GO
SET IDENTITY_INSERT [Usuario].[Usuario] ON 

INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (1, N'Gómez', N'Laura', 123456789, N'F', CAST(N'1985-07-10T00:00:00.000' AS DateTime), N'laura@mail.com', N'555-1234', N'laura_gomez', N'clave123', 3, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (2, N'Pérez', N'Juan', 987654321, N'M', CAST(N'1990-05-15T00:00:00.000' AS DateTime), N'juan@mail.com', N'555-5678', N'juan_perez', N'clave456', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (3, N'Rodríguez', N'Ana', 456789012, N'F', CAST(N'1980-12-20T00:00:00.000' AS DateTime), N'ana@mail.com', N'555-9012', N'ana_rodriguez', N'clave789', 3, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (4, N'Martínez', N'Carlos', 567890123, N'M', CAST(N'1995-03-25T00:00:00.000' AS DateTime), N'carlos@mail.com', N'555-3456', N'carlos_martinez', N'clave012', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (5, N'Sánchez', N'María', 234567890, N'F', CAST(N'1988-08-30T00:00:00.000' AS DateTime), N'maria@mail.com', N'555-6789', N'maria_sanchez', N'clave345', 3, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (6, N'López', N'Pedro', 345678901, N'M', CAST(N'1983-04-05T00:00:00.000' AS DateTime), N'pedro@mail.com', N'555-7890', N'pedro_lopez', N'clave678', 1, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (7, N'Fernández', N'Sofía', 678901234, N'F', CAST(N'1992-10-12T00:00:00.000' AS DateTime), N'sofia@mail.com', N'555-2345', N'sofia_fernandez', N'clave901', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (8, N'Ramírez', N'Miguel', 789012345, N'M', CAST(N'1987-01-18T00:00:00.000' AS DateTime), N'miguel@mail.com', N'555-4567', N'miguel_ramirez', N'clave234', 3, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (9, N'Gutiérrez', N'Isabel', 890123456, N'F', CAST(N'1991-06-23T00:00:00.000' AS DateTime), N'isabel@mail.com', N'555-5678', N'isabel_gutierrez', N'clave567', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (10, N'Chávez', N'Alejandro', 901234567, N'M', CAST(N'1986-09-06T00:00:00.000' AS DateTime), N'alejandro@mail.com', N'555-6789', N'alejandro_chavez', N'clave890', 1, 1)
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
/****** Object:  StoredProcedure [Especialidad].[sp_DelEspecialidad]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  StoredProcedure [Especialidad].[sp_GetEspecialidades]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  StoredProcedure [Especialidad].[sp_InsEspecialidad]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  StoredProcedure [Especialidad].[sp_UpdEspecialidad]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  StoredProcedure [Especialidad].[sp_UpdEstadoEspecialidad]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  StoredProcedure [Usuario].[sp_DelPaciente]    Script Date: 10/11/2023 14:54:42 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_DelUsuario]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  StoredProcedure [Usuario].[sp_GetEspecialistas]    Script Date: 10/11/2023 14:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_GetEspecialistas]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT u.[IdUsuario], u.[Apellido], u.[Nombre], u.[Dni], u.[Sexo], u.[FechaNacimiento], u.[Mail], u.[Telefono], u.[Usuario], u.[Password], u.[IdPerfil], u.[Estado]
    FROM [Usuario].[Usuario] u
    WHERE u.[IdPerfil] = 3; -- Perfil 3 corresponde a Especialista
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_GetPacientes]    Script Date: 10/11/2023 14:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_GetPacientes]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]
    FROM [Usuario].[Paciente];
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_GetUsuarios]    Script Date: 10/11/2023 14:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuario].[sp_GetUsuarios]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]
    FROM [Usuario].[Usuario]
	WHERE [IdPerfil] IN (1, 2)
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_InsPaciente]    Script Date: 10/11/2023 14:54:42 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_InsUsuario]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  StoredProcedure [Usuario].[sp_UpdEstadoUsuario]    Script Date: 10/11/2023 14:54:42 ******/
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
/****** Object:  StoredProcedure [Usuario].[sp_UpdPaciente]    Script Date: 10/11/2023 14:54:42 ******/
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
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Usuario].[sp_UpdUsuario]    Script Date: 10/11/2023 14:54:42 ******/
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
