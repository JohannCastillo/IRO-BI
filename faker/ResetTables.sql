delete from DISTRITO
DBCC CHECKIDENT ('PROVINCIA', RESEED, 0);
GO

delete from PROVINCIA
DBCC CHECKIDENT ('PROVINCIA', RESEED, 0);
GO

delete from DEPARTAMENTO
DBCC CHECKIDENT ('DEPARTAMENTO', RESEED, 0);
GO

delete from TIPO_ANTECEDENTE
DBCC CHECKIDENT ('TIPO_ANTECEDENTE', RESEED, 0);
GO

delete from TIPO_PACIENTE
DBCC CHECKIDENT ('TIPO_PACIENTE', RESEED, 0);
GO

delete from ENFERMEDAD
DBCC CHECKIDENT ('ENFERMEDAD', RESEED, 0);
GO

delete from SERVICIO
DBCC CHECKIDENT ('SERVICIO', RESEED, 0);
GO

delete from TIPO_SERVICIO
DBCC CHECKIDENT ('TIPO_SERVICIO', RESEED, 0);
GO

delete from ESTADO_ATENCION
DBCC CHECKIDENT ('ESTADO_ATENCION', RESEED, 0);
GO

delete from TIPO_ATENCION
DBCC CHECKIDENT ('TIPO_ATENCION', RESEED, 0);
GO

delete from CITA_ESTADO
DBCC CHECKIDENT ('CITA_ESTADO', RESEED, 0);
GO

delete from ESPECIALIDAD
DBCC CHECKIDENT ('ESPECIALIDAD', RESEED, 0);
GO

delete from INSTITUCION_EXTERNA
DBCC CHECKIDENT ('INSTITUCION_EXTERNA', RESEED, 0);
GO

