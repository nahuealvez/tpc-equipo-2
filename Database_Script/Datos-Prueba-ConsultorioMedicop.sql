-- AGREGADO DE EJEMPLOS DE ESPECIALIDADES

-- Eliminar especialidades m�dicas existentes (cuidado al ejecutar en un entorno de producci�n)
DELETE FROM [Especialidad].[Especialidad];

-- Insertar nuevas especialidades m�dicas
INSERT INTO [Especialidad].[Especialidad] ([Especialidad], [Estado])
VALUES
    ('Cardiolog�a', 1),
    ('Dermatolog�a', 1),
    ('Endocrinolog�a', 1),
    ('Gastroenterolog�a', 1),
    ('Hematolog�a', 1),
    ('Infectolog�a', 1),
    ('Nefrolog�a', 1),
    ('Neurolog�a', 1),
    ('Oftalmolog�a', 1),
    ('Oncolog�a', 1),
    ('Otorrinolaringolog�a', 1),
    ('Pediatr�a', 1),
    ('Psiquiatr�a', 1),
    ('Reumatolog�a', 1),
    ('Traumatolog�a', 1),
    ('Urolog�a', 1),
    ('Ginecolog�a', 1),
    ('Neumonolog�a', 1),
    ('Radiolog�a', 1),
    ('Oncolog�a Pedi�trica', 1);

-- Verificar que las especialidades se han insertado correctamente
SELECT * FROM [Especialidad].[Especialidad];

-- AGREGADO DE EJEMPLOS DE PACIENTES

-- Insertar datos ficticios en la tabla de pacientes
INSERT INTO [Usuario].[Paciente] ([Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial])
VALUES
    ('G�mez', 'Juan', 12345678, 'M', '1990-05-15', 'juan.gomez@email.com', '+54 9 11 1234-5678', 'Swiss Medical', 98765432),
    ('Mart�nez', 'Ana', 23456789, 'F', '1985-08-20', 'ana.martinez@email.com', '+54 9 11 2345-6789', 'OSDE', 87654321),
    ('Rodr�guez', 'Pedro', 34567890, 'M', '1978-03-10', 'pedro.rodriguez@email.com', '+54 9 11 3456-7890', 'Swiss Medical', 76543210),
    ('Fern�ndez', 'Laura', 45678901, 'F', '1995-11-25', 'laura.fernandez@email.com', '+54 9 11 4567-8901', 'OSDE', 65432109),
    ('L�pez', 'Carlos', 56789012, 'M', '1980-07-18', 'carlos.lopez@email.com', '+54 9 11 5678-9012', 'Swiss Medical', 54321098),
    ('Garc�a', 'Sof�a', 67890123, 'F', '1989-02-28', 'sofia.garcia@email.com', '+54 9 11 6789-0123', 'OSDE', 43210987),
    ('D�az', 'Ricardo', 78901234, 'M', '1972-09-05', 'ricardo.diaz@email.com', '+54 9 11 7890-1234', 'Swiss Medical', 32109876),
    ('P�rez', 'Mar�a', 89012345, 'F', '1987-06-12', 'maria.perez@email.com', '+54 9 11 8901-2345', 'OSDE', 21098765),
    ('Mendoza', 'Hern�n', 90123456, 'M', '1992-12-03', 'hernan.mendoza@email.com', '+54 9 11 9012-3456', 'Swiss Medical', 10987654),
    ('Su�rez', 'Luc�a', 98765432, 'X', '1983-04-30', 'lucia.suarez@email.com', '+54 9 11 9876-5432', 'OSDE', 98765432);

-- Verificar que los datos se han insertado correctamente
SELECT * FROM [Usuario].[Paciente];

INSERT INTO [Usuario].[Perfil] ([Perfil])
VALUES
    ('Administrador'),
    ('Recepcionista'),
    ('Especialista');

-- 2. Insertar usuarios en la tabla de Usuario
--    Aseg�rate de ajustar las contrase�as antes de ejecutar este script

-- Insertar administradores
INSERT INTO [Usuario].[Usuario] ([Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Password], [IdPerfil], [Estado])
VALUES
    ('Gomez', 'Ana', 30123456, 'F', '1990-01-01', 'ana@email.com', '1122334455', 'Gomez1234', 1, 1),
    ('Rodriguez', 'Carlos', 40123456, 'M', '1985-02-02', 'carlos@email.com', '9988776655', 'Rodriguez1234', 1, 1);

-- Insertar recepcionistas
INSERT INTO [Usuario].[Usuario] ([Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Password], [IdPerfil], [Estado])
VALUES
    ('Lopez', 'Laura', 50123456, 'F', '1988-03-03', 'laura@email.com', '5544332211', 'Lopez1234', 2, 1),
    ('Perez', 'Juan', 60123456, 'M', '1987-04-04', 'juan@email.com', '1122334455', 'Perez1234', 2, 1),
    ('Fernandez', 'Maria', 70123456, 'F', '1986-05-05', 'maria@email.com', '9988776655', 'Fernandez1234', 2, 1);

-- Insertar especialistas
INSERT INTO [Usuario].[Usuario] ([Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Password], [IdPerfil], [Estado])
VALUES
    ('Gonzalez', 'Martin', 80123456, 'M', '1985-06-06', 'martin@email.com', '5544332211', 'Gonzalez1234', 3, 1),
    ('Diaz', 'Luisa', 90123456, 'F', '1984-07-07', 'luisa@email.com', '1122334455', 'Diaz1234', 3, 1),
    ('Alvarez', 'Javier', 10012345, 'M', '1983-08-08', 'javier@email.com', '9988776655', 'Alvarez1234', 3, 1),
    ('Torres', 'Silvia', 11012345, 'F', '1982-09-09', 'silvia@email.com', '5544332211', 'Torres1234', 3, 1),
    ('Rios', 'Eduardo', 12012345, 'M', '1981-10-10', 'eduardo@email.com', '1122334455', 'Rios1234', 3, 1),
    ('Mendoza', 'Camila', 13012345, 'F', '1980-11-11', 'camila@email.com', '9988776655', 'Mendoza1234', 3, 1),
    ('Castro', 'Roberto', 14012345, 'M', '1979-12-12', 'roberto@email.com', '5544332211', 'Castro1234', 3, 1),
    ('Romero', 'Alicia', 15012345, 'F', '1978-01-01', 'alicia@email.com', '1122334455', 'Romero1234', 3, 1),
    ('Ortega', 'Carlos', 16012345, 'M', '1977-02-02', 'carlos@email.com', '9988776655', 'Ortega1234', 3, 1),
    ('Suarez', 'Marcela', 17012345, 'F', '1976-03-03', 'marcela@email.com', '5544332211','Suarez1234', 3, 1);

-- Verificar que los datos se han insertado correctamente
SELECT * FROM [Usuario].[Usuario];

-- Insertar Estados de Turno
INSERT INTO [Especialidad].[EstadoTurno]
VALUES
	('Pendiente'),
	('Atendido'),
	('Cancelado')

-- Insertar un nuevo turno
INSERT INTO [Especialidad].[Turno] ([IdPaciente], [IdEspecialista], [IdEspecialidad], [FechaHoraTurno], [MotivoConsulta], [Diagnostico], [IdEstadoTurno])
VALUES
    (1, 1, 2, '2023-01-01 08:00:00', 'Consulta de rutina', 'Sin diagn�stico', 1);