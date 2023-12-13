-- Tabla para datamart: IRO_mart
CREATE TABLE DimPaciente(
  keyPaciente integer identity(1,1),
  IdPaciente integer,
  Paciente char(150),
	Sexo varchar(10),
	RangoEtario varchar(50),
	TipoPaciente varchar(50),
	Distrito varchar(50),
	Provincia varchar(50),
	Departamento varchar(50),
)
go

-- MERGE
MERGE [IRO_MART].[dbo].[DimPaciente]
as dim(
select 
  P.IdPaciente as IdPaciente,
  p.NombresYApelidos as Paciente
	Sexo = case 
		WHEN P.Sexo = 'M' THEN 'HOMBRE'
		ELSE 'MUJER' 
		END,
	D.Distrito as Distrito,
	PV.Provincia as Provincia,
	DP.Departamento as Departamento,
	TP.TipoPaciente as TipoPaciente,
  DATEDIFF(YEAR, P.FechaDeNacimiento, GETDATE()) as Edad,
  RangoEtario = case 
		WHEN DATEDIFF(YEAR, P.FechaDeNacimiento, GETDATE()) < 18 THEN 'MENOR'
		WHEN DATEDIFF(YEAR, P.FechaDeNacimiento, GETDATE()) < 60 THEN 'ADULTO' 
		ELSE 'ADULTO MAYOR' 
		END
from PACIENTE P
inner join DISTRITO D on P.IdDistrito = D.IdDistrito
inner join PROVINCIA PV on PV.IdProvincia = D.IdProvincia
inner join DEPARTAMENTO DP on DP.IdDepartamento = PV.IdDepartamento
inner join TIPO_PACIENTE TP on TP.IdTipoPaciente = P.IdTipoPaciente) as OLTP
ON dim.IdPaciente = oltp.IdPaciente
WHEN NOT MATCHED THEN
	INSERT (IdPaciente, Paciente, Sexo, RangoEtario, TipoPaciente, Distrito, Provincia, Departamento)
	VALUES (IdPaciente, Paciente, Sexo, RangoEtario, TipoPaciente, Distrito, Provincia, Departamento)
GO