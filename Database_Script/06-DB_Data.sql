USE ConsultorioMedico
GO

-- Agregamos especialidades de ejemplo
INSERT INTO Medico.Especialidad
(Especialidad, Estado)
VALUES
('Alergología', 1),
('Anestesiología', 1),
('Angiología', 1),
('Cardiología', 1),
('Dermatología', 1),
('Diabetología', 1),
('Endocrinología', 1),
('Gastroenterología', 1),
('Hematología', 1),
('Infectología', 1),
('Neurología', 1),
('Neumonología', 1),
('Obstetricia y Ginecología', 1),
('Oftalmología', 1),
('Oncología', 1),
('Otorrinolaringología', 1),
('Pediatría', 1),
('Psicología', 1),
('Psiquiatría', 1),
('Reumatología', 1),
('Traumatología', 1),
('Urología', 1)
GO

-- Insertamos datos de turnos de trabajo
SET IDENTITY_INSERT [Medico].[TurnoTrabajo] ON 
INSERT [Medico].[TurnoTrabajo] ([IdTurnoTrabajo], [Codigo], [DiaSemana], [HoraInicio], [HoraFin]) VALUES (1, N'LUN-MAN-9-12', N'LUNES', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
SET IDENTITY_INSERT [Medico].[TurnoTrabajo] OFF
GO

-- Insertamos datos de médicos
INSERT INTO Medico.Medico (Nombre, IdEspecialidad, IdTurnoTrabajo)
VALUES ('Mario Bros', 4, 1),
('Luigi Bros', 15, 1),
('Peach Prince', 17, 1),
('Toad Mashroom', 18, 1)
GO