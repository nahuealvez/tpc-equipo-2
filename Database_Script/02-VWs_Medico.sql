USE [ConsultorioMedico]
GO

/****** Object:  View [Medico].[vw_MedicosDetalle]    Script Date: 3/11/2023 06:20:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Medico].[vw_MedicosDetalle] AS
SELECT 
	MM.IdMedico,
	MM.Nombre,
	ME.Especialidad,
	ME.Estado,
	MTT.DiaSemana,
	MTT.HoraInicio,
	mtt.HoraFin
FROM [Medico].[Medico] MM
	INNER JOIN [Medico].[Especialidad] ME ON ME.IdEspecialidad = MM.IdEspecialidad
	INNER JOIN [Medico].[TurnoTrabajo] MTT ON MTT.IdTurnoTrabajo = MM.IdTurnoTrabajo
	
GO


USE [ConsultorioMedico]
GO

/****** Object:  View [Medico].[vw_MedicosCorto]    Script Date: 3/11/2023 06:20:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Medico].[vw_MedicosCorto] AS
SELECT 
	MM.IdMedico,
	MM.Nombre,
	ME.Especialidad,
	ME.Estado,
	CONCAT(MTT.DiaSemana, ' ', CONVERT(VARCHAR(5), MTT.HoraInicio, 108), ' - ', CONVERT(VARCHAR(5), MTT.HoraFin, 108)) AS Turno
FROM [Medico].[Medico] MM
	INNER JOIN [Medico].[Especialidad] ME ON ME.IdEspecialidad = MM.IdEspecialidad
	INNER JOIN [Medico].[TurnoTrabajo] MTT ON MTT.IdTurnoTrabajo = MM.IdTurnoTrabajo
	
GO


USE [ConsultorioMedico]
GO

/****** Object:  View [Medico].[vw_Especialidad]    Script Date: 3/11/2023 06:21:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Medico].[vw_Especialidad]
AS
SELECT        IdEspecialidad, Especialidad, Estado
FROM            Medico.Especialidad
GO

