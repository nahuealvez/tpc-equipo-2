USE [master]
GO
/****** Object:  Database [ConsultorioMedico]    Script Date: 29/10/2023 17:05:49 ******/
CREATE DATABASE [ConsultorioMedico]
GO
ALTER DATABASE [ConsultorioMedico] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [ConsultorioMedico] SET ANSI_NULLS ON 
GO
ALTER DATABASE [ConsultorioMedico] SET ANSI_PADDING ON 
GO
ALTER DATABASE [ConsultorioMedico] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [ConsultorioMedico] SET ARITHABORT ON 
GO
ALTER DATABASE [ConsultorioMedico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConsultorioMedico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [ConsultorioMedico] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [ConsultorioMedico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [ConsultorioMedico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConsultorioMedico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConsultorioMedico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET RECOVERY FULL 
GO
ALTER DATABASE [ConsultorioMedico] SET  MULTI_USER 
GO
ALTER DATABASE [ConsultorioMedico] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [ConsultorioMedico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConsultorioMedico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConsultorioMedico] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ConsultorioMedico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ConsultorioMedico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConsultorioMedico', N'ON'
GO
ALTER DATABASE [ConsultorioMedico] SET QUERY_STORE = OFF
GO
USE [ConsultorioMedico]
GO
/****** Object:  Schema [Consultorio]    Script Date: 29/10/2023 17:05:49 ******/
CREATE SCHEMA [Consultorio]
GO
/****** Object:  Schema [Medico]    Script Date: 29/10/2023 17:05:49 ******/
CREATE SCHEMA [Medico]
GO
/****** Object:  Schema [Paciente]    Script Date: 29/10/2023 17:05:49 ******/
CREATE SCHEMA [Paciente]
GO
/****** Object:  Table [Medico].[Especialidad]    Script Date: 29/10/2023 17:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Medico].[Especialidad](
	[IdEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[Especialidad] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](150) NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Medico].[Medico]    Script Date: 29/10/2023 17:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Medico].[Medico](
	[IdMedico] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[IdEspecialidad] [int] NULL,
	[IdTurnoTrabajo] [int] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Medico].[TurnoTrabajo]    Script Date: 29/10/2023 17:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Medico].[TurnoTrabajo](
	[IdTurnoTrabajo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NULL,
	[DiaSemana] [nvarchar](10) NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFin] [time](7) NULL,
 CONSTRAINT [PK_TurnoTrabajo] PRIMARY KEY CLUSTERED 
(
	[IdTurnoTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Medico].[vw_MedicosCorto]    Script Date: 29/10/2023 17:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Medico].[vw_MedicosCorto] AS
SELECT 
	MM.IdMedico,
	MM.Nombre,
	ME.Especialidad,
	CONCAT(MTT.DiaSemana, ' ', CONVERT(VARCHAR(5), MTT.HoraInicio, 108), ' - ', CONVERT(VARCHAR(5), MTT.HoraFin, 108)) AS Turno
FROM [Medico].[Medico] MM
	INNER JOIN [Medico].[Especialidad] ME ON ME.IdEspecialidad = MM.IdEspecialidad
	INNER JOIN [Medico].[TurnoTrabajo] MTT ON MTT.IdTurnoTrabajo = MM.IdTurnoTrabajo
	
GO
/****** Object:  View [Medico].[vw_MedicosDetalle]    Script Date: 29/10/2023 17:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Medico].[vw_MedicosDetalle] AS
SELECT 
	MM.IdMedico,
	MM.Nombre,
	ME.Especialidad,
	ME.Descripcion,
	MTT.DiaSemana,
	MTT.HoraInicio,
	mtt.HoraFin
FROM [Medico].[Medico] MM
	INNER JOIN [Medico].[Especialidad] ME ON ME.IdEspecialidad = MM.IdEspecialidad
	INNER JOIN [Medico].[TurnoTrabajo] MTT ON MTT.IdTurnoTrabajo = MM.IdTurnoTrabajo
	
GO
SET IDENTITY_INSERT [Medico].[Especialidad] ON 

INSERT [Medico].[Especialidad] ([IdEspecialidad], [Especialidad], [Descripcion]) VALUES (1, N'Clinico', N'Clinico generalista')
INSERT [Medico].[Especialidad] ([IdEspecialidad], [Especialidad], [Descripcion]) VALUES (2, N'Pediatria', NULL)
INSERT [Medico].[Especialidad] ([IdEspecialidad], [Especialidad], [Descripcion]) VALUES (3, N'Odontología', NULL)
SET IDENTITY_INSERT [Medico].[Especialidad] OFF
GO
SET IDENTITY_INSERT [Medico].[Medico] ON 

INSERT [Medico].[Medico] ([IdMedico], [Nombre], [IdEspecialidad], [IdTurnoTrabajo]) VALUES (1, N'Mario Bros', 1, 1)
INSERT [Medico].[Medico] ([IdMedico], [Nombre], [IdEspecialidad], [IdTurnoTrabajo]) VALUES (2, N'Luigi Bros', 2, 1)
INSERT [Medico].[Medico] ([IdMedico], [Nombre], [IdEspecialidad], [IdTurnoTrabajo]) VALUES (3, N'Peach Prince', 3, 1)
INSERT [Medico].[Medico] ([IdMedico], [Nombre], [IdEspecialidad], [IdTurnoTrabajo]) VALUES (6, N'Toad Mashroom', 1, 1)
SET IDENTITY_INSERT [Medico].[Medico] OFF
GO
SET IDENTITY_INSERT [Medico].[TurnoTrabajo] ON 

INSERT [Medico].[TurnoTrabajo] ([IdTurnoTrabajo], [Codigo], [DiaSemana], [HoraInicio], [HoraFin]) VALUES (1, N'LUN-MAN-9-12', N'LUNES', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
SET IDENTITY_INSERT [Medico].[TurnoTrabajo] OFF
GO
ALTER TABLE [Medico].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [Medico].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [Medico].[Medico] CHECK CONSTRAINT [FK_Medico_Especialidad]
GO
ALTER TABLE [Medico].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_TurnoTrabajo] FOREIGN KEY([IdTurnoTrabajo])
REFERENCES [Medico].[TurnoTrabajo] ([IdTurnoTrabajo])
GO
ALTER TABLE [Medico].[Medico] CHECK CONSTRAINT [FK_Medico_TurnoTrabajo]
GO
/****** Object:  StoredProcedure [Medico].[sp_InsMedico]    Script Date: 29/10/2023 17:05:49 ******/
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
USE [master]
GO
ALTER DATABASE [ConsultorioMedico] SET  READ_WRITE 
GO
