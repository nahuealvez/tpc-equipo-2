USE ConsultorioMedico
GO
-- Sacamos columna descripción
ALTER TABLE Medico.Especialidad
DROP COLUMN Descripcion
GO
-- Creamos columna de flag activo
ALTER TABLE Medico.Especialidad
ADD Estado BIT NOT NULL
GO
-- Eliminamos los datos de medico
DELETE FROM Medico.Medico
GO
-- Eliminamos los datos de especialidad
DELETE FROM Medico.Especialidad
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
-- Insertamos datos de médicos
INSERT INTO Medico.Medico (Nombre, IdEspecialidad, IdTurnoTrabajo)
VALUES ('Mario Bros', 4, 1),
('Luigi Bros', 15, 1),
('Peach Prince', 17, 1),
('Toad Mashroom', 18, 1)
GO