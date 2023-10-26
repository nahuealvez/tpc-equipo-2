CREATE TABLE [Medico].[Medico](
	[IdMedico] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[IdEspecialidad] [int] NULL,
	[IdTurnoTrabajo] [int] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY], 
    CONSTRAINT [FK_Medico_Especialidad] FOREIGN KEY ([IdEspecialidad]) REFERENCES [Medico].[Especialidad]([IdEspecialidad]), 
    CONSTRAINT [FK_Medico_TurnoTrabajo] FOREIGN KEY ([IdTurnoTrabajo]) REFERENCES [Medico].[TurnoTrabajo]([IdTurnoTrabajo])
) ON [PRIMARY]