USE [master]
GO
/****** Object:  Database [ConsultorioMedico]    Script Date: 29/10/2023 17:42:49 ******/
CREATE DATABASE [ConsultorioMedico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConsultorioMedico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ConsultorioMedico_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConsultorioMedico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ConsultorioMedico_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ConsultorioMedico] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsultorioMedico].[dbo].[sp_fulltext_database] @action = 'enable'
end
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
/****** Object:  Schema [Consultorio]    Script Date: 29/10/2023 17:42:50 ******/
CREATE SCHEMA [Consultorio]
GO
/****** Object:  Schema [Medico]    Script Date: 29/10/2023 17:42:50 ******/
CREATE SCHEMA [Medico]
GO
/****** Object:  Schema [Paciente]    Script Date: 29/10/2023 17:42:50 ******/
CREATE SCHEMA [Paciente]
GO
/****** Object:  Table [Medico].[Especialidad]    Script Date: 29/10/2023 17:42:50 ******/
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
/****** Object:  Table [Medico].[Medico]    Script Date: 29/10/2023 17:42:50 ******/
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
/****** Object:  Table [Medico].[TurnoTrabajo]    Script Date: 29/10/2023 17:42:50 ******/
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
/****** Object:  View [Medico].[vw_MedicosCorto]    Script Date: 29/10/2023 17:42:50 ******/
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
/****** Object:  View [Medico].[vw_MedicosDetalle]    Script Date: 29/10/2023 17:42:50 ******/
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
/****** Object:  StoredProcedure [Medico].[sp_DelEspecialidad]    Script Date: 29/10/2023 17:42:50 ******/
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
/****** Object:  StoredProcedure [Medico].[sp_InsEspecialidad]    Script Date: 29/10/2023 17:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Medico].[sp_InsEspecialidad]
    @Especialidad NVARCHAR(50),
    @Descripcion NVARCHAR(150)
AS
BEGIN
    BEGIN TRY
        IF (@Descripcion IS NULL OR LTRIM(RTRIM(@Descripcion)) = '')
        BEGIN
            SET @Descripcion = NULL;
        END

        INSERT INTO [Medico].[Especialidad] (Especialidad, Descripcion)
        VALUES (@Especialidad, @Descripcion);

        PRINT 'Registro insertado exitosamente.';
    END TRY
    BEGIN CATCH
        PRINT 'No se pudo agregar el registro.';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Medico].[sp_InsMedico]    Script Date: 29/10/2023 17:42:50 ******/
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
/****** Object:  StoredProcedure [Medico].[sp_UpdEspecialidad]    Script Date: 29/10/2023 17:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Declaración del Stored Procedure para actualizar una especialidad
CREATE PROCEDURE [Medico].[sp_UpdEspecialidad]
    @IdEspecialidad INT,
    @NuevoEspecialidad NVARCHAR(50),
    @NuevaDescripcion NVARCHAR(150)
AS
BEGIN
    BEGIN TRY
        UPDATE [Medico].[Especialidad]
        SET
            Especialidad = @NuevoEspecialidad,
            Descripcion = @NuevaDescripcion
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
USE [master]
GO
ALTER DATABASE [ConsultorioMedico] SET  READ_WRITE 
GO
