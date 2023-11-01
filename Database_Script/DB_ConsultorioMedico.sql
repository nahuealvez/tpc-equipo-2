USE [ConsultorioMedico]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'VIEW',@level1name=N'vw_Usuario'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'VIEW',@level1name=N'vw_Usuario'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'Medico', @level1type=N'VIEW',@level1name=N'vw_Especialidad'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'Medico', @level1type=N'VIEW',@level1name=N'vw_Especialidad'
GO
/****** Object:  StoredProcedure [Seguridad].[sp_UpdUsuario]    Script Date: 1/11/2023 08:22:28 ******/
DROP PROCEDURE [Seguridad].[sp_UpdUsuario]
GO
/****** Object:  StoredProcedure [Seguridad].[sp_InsUsuario]    Script Date: 1/11/2023 08:22:28 ******/
DROP PROCEDURE [Seguridad].[sp_InsUsuario]
GO
/****** Object:  StoredProcedure [Seguridad].[sp_DelUsuario]    Script Date: 1/11/2023 08:22:28 ******/
DROP PROCEDURE [Seguridad].[sp_DelUsuario]
GO
/****** Object:  StoredProcedure [Medico].[sp_UpdEspecialidad]    Script Date: 1/11/2023 08:22:28 ******/
DROP PROCEDURE [Medico].[sp_UpdEspecialidad]
GO
/****** Object:  StoredProcedure [Medico].[sp_InsMedico]    Script Date: 1/11/2023 08:22:28 ******/
DROP PROCEDURE [Medico].[sp_InsMedico]
GO
/****** Object:  StoredProcedure [Medico].[sp_InsEspecialidad]    Script Date: 1/11/2023 08:22:28 ******/
DROP PROCEDURE [Medico].[sp_InsEspecialidad]
GO
/****** Object:  StoredProcedure [Medico].[sp_GetEspecialidad]    Script Date: 1/11/2023 08:22:28 ******/
DROP PROCEDURE [Medico].[sp_GetEspecialidad]
GO
/****** Object:  StoredProcedure [Medico].[sp_DelEspecialidad]    Script Date: 1/11/2023 08:22:28 ******/
DROP PROCEDURE [Medico].[sp_DelEspecialidad]
GO
ALTER TABLE [Seguridad].[Usuarios] DROP CONSTRAINT [FK_Usuarios_Grupo]
GO
ALTER TABLE [Seguridad].[Grupo] DROP CONSTRAINT [FK_Grupo_NivelSeguridad]
GO
ALTER TABLE [Medico].[Medico] DROP CONSTRAINT [FK_Medico_TurnoTrabajo]
GO
ALTER TABLE [Medico].[Medico] DROP CONSTRAINT [FK_Medico_Especialidad]
GO
/****** Object:  View [Medico].[vw_Especialidad]    Script Date: 1/11/2023 08:22:28 ******/
DROP VIEW [Medico].[vw_Especialidad]
GO
/****** Object:  View [Seguridad].[vw_Usuario]    Script Date: 1/11/2023 08:22:28 ******/
DROP VIEW [Seguridad].[vw_Usuario]
GO
/****** Object:  Table [Seguridad].[Usuarios]    Script Date: 1/11/2023 08:22:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[Usuarios]') AND type in (N'U'))
DROP TABLE [Seguridad].[Usuarios]
GO
/****** Object:  Table [Seguridad].[Grupo]    Script Date: 1/11/2023 08:22:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[Grupo]') AND type in (N'U'))
DROP TABLE [Seguridad].[Grupo]
GO
/****** Object:  Table [Seguridad].[NivelSeguridad]    Script Date: 1/11/2023 08:22:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[NivelSeguridad]') AND type in (N'U'))
DROP TABLE [Seguridad].[NivelSeguridad]
GO
/****** Object:  View [Medico].[vw_MedicosDetalle]    Script Date: 1/11/2023 08:22:28 ******/
DROP VIEW [Medico].[vw_MedicosDetalle]
GO
/****** Object:  View [Medico].[vw_MedicosCorto]    Script Date: 1/11/2023 08:22:28 ******/
DROP VIEW [Medico].[vw_MedicosCorto]
GO
/****** Object:  Table [Medico].[TurnoTrabajo]    Script Date: 1/11/2023 08:22:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Medico].[TurnoTrabajo]') AND type in (N'U'))
DROP TABLE [Medico].[TurnoTrabajo]
GO
/****** Object:  Table [Medico].[Medico]    Script Date: 1/11/2023 08:22:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Medico].[Medico]') AND type in (N'U'))
DROP TABLE [Medico].[Medico]
GO
/****** Object:  Table [Medico].[Especialidad]    Script Date: 1/11/2023 08:22:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Medico].[Especialidad]') AND type in (N'U'))
DROP TABLE [Medico].[Especialidad]
GO
/****** Object:  Schema [Seguridad]    Script Date: 1/11/2023 08:22:28 ******/
DROP SCHEMA [Seguridad]
GO
/****** Object:  Schema [Paciente]    Script Date: 1/11/2023 08:22:28 ******/
DROP SCHEMA [Paciente]
GO
/****** Object:  Schema [Medico]    Script Date: 1/11/2023 08:22:28 ******/
DROP SCHEMA [Medico]
GO
/****** Object:  Schema [Consultorio]    Script Date: 1/11/2023 08:22:28 ******/
DROP SCHEMA [Consultorio]
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
/****** Object:  Table [Medico].[Especialidad]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  Table [Medico].[Medico]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  Table [Medico].[TurnoTrabajo]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  View [Medico].[vw_MedicosCorto]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  View [Medico].[vw_MedicosDetalle]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  View [Seguridad].[vw_Usuario]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  View [Medico].[vw_Especialidad]    Script Date: 1/11/2023 08:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Medico].[vw_Especialidad]
AS
SELECT        IdEspecialidad, Especialidad, COALESCE (Descripcion, '** Sin descripcion **') AS Descripcion
FROM            Medico.Especialidad
GO
SET IDENTITY_INSERT [Medico].[Especialidad] ON 

INSERT [Medico].[Especialidad] ([IdEspecialidad], [Especialidad], [Descripcion]) VALUES (1, N'Clinica', N'Medico generalista')
INSERT [Medico].[Especialidad] ([IdEspecialidad], [Especialidad], [Descripcion]) VALUES (2, N'Pediatria', NULL)
INSERT [Medico].[Especialidad] ([IdEspecialidad], [Especialidad], [Descripcion]) VALUES (3, N'Odontologia', NULL)
SET IDENTITY_INSERT [Medico].[Especialidad] OFF
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
/****** Object:  StoredProcedure [Medico].[sp_DelEspecialidad]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  StoredProcedure [Medico].[sp_GetEspecialidad]    Script Date: 1/11/2023 08:22:28 ******/
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
		COALESCE (Descripcion, '** Sin descripcion **') AS [Descripcion]
	FROM
		[Medico].[Especialidad]
END
GO
/****** Object:  StoredProcedure [Medico].[sp_InsEspecialidad]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  StoredProcedure [Medico].[sp_InsMedico]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  StoredProcedure [Medico].[sp_UpdEspecialidad]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  StoredProcedure [Seguridad].[sp_DelUsuario]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  StoredProcedure [Seguridad].[sp_InsUsuario]    Script Date: 1/11/2023 08:22:28 ******/
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
/****** Object:  StoredProcedure [Seguridad].[sp_UpdUsuario]    Script Date: 1/11/2023 08:22:28 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Especialidad (Medico)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Medico', @level1type=N'VIEW',@level1name=N'vw_Especialidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Medico', @level1type=N'VIEW',@level1name=N'vw_Especialidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "U"
            Begin Extent = 
               Top = 14
               Left = 26
               Bottom = 144
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "G"
            Begin Extent = 
               Top = 6
               Left = 234
               Bottom = 119
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NS"
            Begin Extent = 
               Top = 6
               Left = 451
               Bottom = 119
               Right = 630
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'VIEW',@level1name=N'vw_Usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'VIEW',@level1name=N'vw_Usuario'
GO
