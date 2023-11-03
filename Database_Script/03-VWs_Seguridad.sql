USE [ConsultorioMedico]
GO

/****** Object:  View [Seguridad].[vw_Usuario]    Script Date: 3/11/2023 06:18:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Seguridad].[vw_Usuario]
AS
SELECT        U.IdUsuario, U.Usuario, U.Password, G.Grupo, NS.NivelSeguridad
FROM            Seguridad.Usuarios AS U INNER JOIN
                         Seguridad.Grupo AS G ON G.IdGrupo = U.IdGrupo INNER JOIN
                         Seguridad.NivelSeguridad AS NS ON NS.IdNivelSeguridad = G.IdNivelSeguridad
GO


