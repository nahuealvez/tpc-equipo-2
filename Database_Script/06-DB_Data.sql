USE ConsultorioMedico
GO

-- Agregamos especialidades de ejemplo
INSERT INTO Medico.Especialidad
(Especialidad, Estado)
VALUES
('Alergolog�a', 1),
('Anestesiolog�a', 1),
('Angiolog�a', 1),
('Cardiolog�a', 1),
('Dermatolog�a', 1),
('Diabetolog�a', 1),
('Endocrinolog�a', 1),
('Gastroenterolog�a', 1),
('Hematolog�a', 1),
('Infectolog�a', 1),
('Neurolog�a', 1),
('Neumonolog�a', 1),
('Obstetricia y Ginecolog�a', 1),
('Oftalmolog�a', 1),
('Oncolog�a', 1),
('Otorrinolaringolog�a', 1),
('Pediatr�a', 1),
('Psicolog�a', 1),
('Psiquiatr�a', 1),
('Reumatolog�a', 1),
('Traumatolog�a', 1),
('Urolog�a', 1)
GO

-- Insertamos datos de turnos de trabajo
SET IDENTITY_INSERT [Medico].[TurnoTrabajo] ON 
INSERT [Medico].[TurnoTrabajo] ([IdTurnoTrabajo], [Codigo], [DiaSemana], [HoraInicio], [HoraFin]) VALUES (1, N'LUN-MAN-9-12', N'LUNES', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
SET IDENTITY_INSERT [Medico].[TurnoTrabajo] OFF
GO

-- Insertamos datos de m�dicos
INSERT INTO Medico.Medico (Nombre, IdEspecialidad, IdTurnoTrabajo)
VALUES ('Mario Bros', 4, 1),
('Luigi Bros', 15, 1),
('Peach Prince', 17, 1),
('Toad Mashroom', 18, 1)
GO