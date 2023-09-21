

-- Tabla para datamart: IRO_mart
CREATE TABLE Paciente_mart(
	Doctor varchar(50),
    Especialidad varchar(50),
)
go


SELECT 
	D.Nombre,
	d.IdDoctor,
	  D.DNI,
	  D.Telefono,
	  D.Estado,
	E.Especialidad
FROM DOCTOR D
INNER JOIN ESPECIALIDAD E on E.IdEspecialidad = D.IdEspecialidad
