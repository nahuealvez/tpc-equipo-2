CREATE TABLE [Medico].[TurnoTrabajo](
	[IdTurnoTrabajo] [int] NOT NULL IDENTITY,
	[Nombre] [nvarchar](50) NULL,
	[DiaSemana] [date] NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFin] [time](7) NULL, 
    CONSTRAINT [PK_TurnoTrabajo] PRIMARY KEY ([IdTurnoTrabajo])
) ON [PRIMARY]