USE [ConsultorioMedico]
GO
SET IDENTITY_INSERT [Especialidad].[Especialidad] ON 

INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (1, N'Cardiología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (2, N'Dermatología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (3, N'Pediatría', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (4, N'Gastroenterología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (5, N'Neurología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (6, N'Oftalmología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (7, N'Oncología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (8, N'Traumatología', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (9, N'Psiquiatría', 1)
INSERT [Especialidad].[Especialidad] ([IdEspecialidad], [Especialidad], [Estado]) VALUES (10, N'Endocrinología', 1)
SET IDENTITY_INSERT [Especialidad].[Especialidad] OFF
GO
SET IDENTITY_INSERT [Usuario].[Perfil] ON 

INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (1, N'Administrador')
INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (2, N'Recepcionista')
INSERT [Usuario].[Perfil] ([IdPerfil], [Perfil]) VALUES (3, N'Especialista')
SET IDENTITY_INSERT [Usuario].[Perfil] OFF
GO
SET IDENTITY_INSERT [Usuario].[Usuario] ON 

INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (1, N'Gómez', N'Laura', 123456789, N'F', CAST(N'1985-07-10T00:00:00.000' AS DateTime), N'laura@mail.com', N'555-1234', N'laura_gomez', N'clave123', 3, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (2, N'Pérez', N'Juan', 987654321, N'M', CAST(N'1990-05-15T00:00:00.000' AS DateTime), N'juan@mail.com', N'555-5678', N'juan_perez', N'clave456', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (3, N'Rodríguez', N'Ana', 456789012, N'F', CAST(N'1980-12-20T00:00:00.000' AS DateTime), N'ana@mail.com', N'555-9012', N'ana_rodriguez', N'clave789', 3, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (4, N'Martínez', N'Carlos', 567890123, N'M', CAST(N'1995-03-25T00:00:00.000' AS DateTime), N'carlos@mail.com', N'555-3456', N'carlos_martinez', N'clave012', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (5, N'Sánchez', N'María', 234567890, N'F', CAST(N'1988-08-30T00:00:00.000' AS DateTime), N'maria@mail.com', N'555-6789', N'maria_sanchez', N'clave345', 3, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (6, N'López', N'Pedro', 345678901, N'M', CAST(N'1983-04-05T00:00:00.000' AS DateTime), N'pedro@mail.com', N'555-7890', N'pedro_lopez', N'clave678', 1, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (7, N'Fernández', N'Sofía', 678901234, N'F', CAST(N'1992-10-12T00:00:00.000' AS DateTime), N'sofia@mail.com', N'555-2345', N'sofia_fernandez', N'clave901', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (8, N'Ramírez', N'Miguel', 789012345, N'M', CAST(N'1987-01-18T00:00:00.000' AS DateTime), N'miguel@mail.com', N'555-4567', N'miguel_ramirez', N'clave234', 3, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (9, N'Gutiérrez', N'Isabel', 890123456, N'F', CAST(N'1991-06-23T00:00:00.000' AS DateTime), N'isabel@mail.com', N'555-5678', N'isabel_gutierrez', N'clave567', 2, 1)
INSERT [Usuario].[Usuario] ([IdUsuario], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Usuario], [Password], [IdPerfil], [Estado]) VALUES (10, N'Chávez', N'Alejandro', 901234567, N'M', CAST(N'1986-09-06T00:00:00.000' AS DateTime), N'alejandro@mail.com', N'555-6789', N'alejandro_chavez', N'clave890', 1, 1)
SET IDENTITY_INSERT [Usuario].[Usuario] OFF
GO
SET IDENTITY_INSERT [Especialidad].[EspecialistaEspecialidad] ON 

INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (1, 1, 1)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (2, 3, 2)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (3, 5, 3)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (4, 8, 4)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (5, 10, 5)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (6, 1, 6)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (7, 3, 7)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (8, 5, 8)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (9, 8, 9)
INSERT [Especialidad].[EspecialistaEspecialidad] ([IdEspecialistaEspecialidad], [IdUsuario], [IdEspecialidad]) VALUES (10, 10, 10)
SET IDENTITY_INSERT [Especialidad].[EspecialistaEspecialidad] OFF
GO
SET IDENTITY_INSERT [Especialidad].[EstadoTurno] ON 

INSERT [Especialidad].[EstadoTurno] ([IdEstadoTurno], [NombreEstado]) VALUES (1, N'Pendiente')
INSERT [Especialidad].[EstadoTurno] ([IdEstadoTurno], [NombreEstado]) VALUES (2, N'Atendido')
INSERT [Especialidad].[EstadoTurno] ([IdEstadoTurno], [NombreEstado]) VALUES (3, N'Cancelado')
SET IDENTITY_INSERT [Especialidad].[EstadoTurno] OFF
GO
SET IDENTITY_INSERT [Usuario].[Paciente] ON 

INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (1, N'González', N'Elena', 112233445, N'F', CAST(N'1993-02-14T00:00:00.000' AS DateTime), N'elena@mail.com', N'555-1122', N'Obra Social ABC', 12345)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (2, N'Hernández', N'Ricardo', 223344556, N'M', CAST(N'1984-11-27T00:00:00.000' AS DateTime), N'ricardo@mail.com', N'555-3344', N'Prepaga XYZ', 67890)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (3, N'Fernández', N'Camila', 334455667, N'F', CAST(N'1998-07-08T00:00:00.000' AS DateTime), N'camila@mail.com', N'555-5566', N'Particular', 67896)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (4, N'Martínez', N'Gustavo', 445566778, N'M', CAST(N'1979-04-30T00:00:00.000' AS DateTime), N'gustavo@mail.com', N'555-7788', N'Obra Social DEF', 54321)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (5, N'López', N'Ana María', 556677889, N'F', CAST(N'1982-09-17T00:00:00.000' AS DateTime), N'ana_maria@mail.com', N'555-9900', N'Prepaga UVW', 98765)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (6, N'Pérez', N'Jorge', 667788990, N'M', CAST(N'1996-12-03T00:00:00.000' AS DateTime), N'jorge@mail.com', N'555-1122', N'Particular', 67823)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (7, N'Díaz', N'Valentina', 778899001, N'F', CAST(N'1981-05-26T00:00:00.000' AS DateTime), N'valentina@mail.com', N'555-3344', N'Obra Social GHI', 23456)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (8, N'Sánchez', N'Raúl', 889900112, N'M', CAST(N'1997-02-19T00:00:00.000' AS DateTime), N'raul@mail.com', N'555-5566', N'Prepaga JKL', 78901)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (9, N'Gómez', N'Luisa', 990011223, N'F', CAST(N'1989-11-10T00:00:00.000' AS DateTime), N'luisa@mail.com', N'555-7788', N'Particular', 67891)
INSERT [Usuario].[Paciente] ([IdPaciente], [Apellido], [Nombre], [Dni], [Sexo], [FechaNacimiento], [Mail], [Telefono], [Cobertura], [NroCredencial]) VALUES (10, N'Torres', N'Juan Manuel', 100112233, N'M', CAST(N'1994-06-01T00:00:00.000' AS DateTime), N'juan_manuel@mail.com', N'555-9900', N'Obra Social MNO', 34567)
SET IDENTITY_INSERT [Usuario].[Paciente] OFF
GO
SET IDENTITY_INSERT [Especialidad].[Turno] ON 

INSERT [Especialidad].[Turno] ([IdTurno], [IdPaciente], [IdEspecialista], [IdEspecialidad], [FechaHoraTurno], [MotivoConsulta], [Diagnostico], [IdEstadoTurno]) VALUES (1, 4, 2, 4, CAST(N'2023-01-01T11:00:00.000' AS DateTime), N'Dolor fuerte en el cuerpo', N'Sin diagnóstico', 3)
SET IDENTITY_INSERT [Especialidad].[Turno] OFF
GO
