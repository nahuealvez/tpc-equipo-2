USE [master]
GO

/****** Object:  Database [ConsultorioMedico]    Script Date: 29/10/2023 17:05:49 ******/
CREATE DATABASE [ConsultorioMedico]
GO
USE [ConsultorioMedico]
GO


/****** Object:  Schema [Consultorio]    Script Date: 1/11/2023 08:22:28 ******/
CREATE SCHEMA [Consultorio]
GO
/****** Object:  Schema [Medico]    Script Date: 1/11/2023 08:22:28 ******/
CREATE SCHEMA [Medico]
GO
/****** Object:  Schema [Paciente]    Script Date: 1/11/2023 08:22:28 ******/
CREATE SCHEMA [Paciente]
GO
/****** Object:  Schema [Seguridad]    Script Date: 1/11/2023 08:22:28 ******/
CREATE SCHEMA [Seguridad]
GO

--           ******* [ESPECIALIDAD] *******


/****** Object:  Table [Medico].[Especialidad]    Script Date: 29/10/2023 17:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE [ConsultorioMedico]
GO

/****** Object:  Table [Medico].[Especialidad]    Script Date: 3/11/2023 06:45:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Medico].[Especialidad](
	[IdEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[Especialidad] [nvarchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
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


/****** Object:  SetRelasionship [Medico] Scheme    Script Date: 29/10/2023 17:05:49 ******/

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





--           ******* [SEGURIDAD] *******


USE [ConsultorioMedico]
GO

/****** Object:  Table [Seguridad].[NivelSeguridad]    Script Date: 1/11/2023 08:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[NivelSeguridad](
	[IdNivelSeguridad] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NULL,
	[NivelSeguridad] [int] NULL,
 CONSTRAINT [PK_NivelSeguridad] PRIMARY KEY CLUSTERED 
(
	[IdNivelSeguridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Grupo]    Script Date: 1/11/2023 08:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Grupo](
	[IdGrupo] [int] IDENTITY(1,1) NOT NULL,
	[Grupo] [varchar](50) NULL,
	[IdNivelSeguridad] [int] NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Usuarios]    Script Date: 1/11/2023 08:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IdGrupo] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  SetRelasionship [Seguridad] Scheme    Script Date: 29/10/2023 17:05:49 ******/


ALTER TABLE [Seguridad].[Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Grupo_NivelSeguridad] FOREIGN KEY([IdNivelSeguridad])
REFERENCES [Seguridad].[NivelSeguridad] ([IdNivelSeguridad])
ON UPDATE CASCADE
GO
ALTER TABLE [Seguridad].[Grupo] CHECK CONSTRAINT [FK_Grupo_NivelSeguridad]
GO
ALTER TABLE [Seguridad].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Grupo] FOREIGN KEY([IdGrupo])
REFERENCES [Seguridad].[Grupo] ([IdGrupo])
ON UPDATE CASCADE
GO
ALTER TABLE [Seguridad].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Grupo]
GO



