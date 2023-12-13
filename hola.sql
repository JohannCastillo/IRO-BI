create table Dim_Capacitacion(
  keyCapacitacion integer identity(1,1),
  Razon varchar(512),
  Modalidad varchar(512),
  Institucion varchar(512),
  IdCapacitacion integer
)

MERGE [IRO_MART].[dbo].[Dim_Capacitacion]
as dim USING (
    SELECT 
      C.IdCapacitacion,
    	C.Descripcion as Razon,
      C.Modalidad,
      I.Nombre as Institucion
    FROM CAPACITACION C
    INNER JOIN INSTITUCION I on I.IdInstitucion = C.IdInstitucion
) AS OLTP
ON dim.IdCapacitacion = oltp.IdCapacitacion
WHEN NOT MATCHED THEN
	INSERT (Razon,Modalidad,Institucion,IdCapacitacion)
	VALUES (Razon,Modalidad,Institucion,IdCapacitacion);
GO
