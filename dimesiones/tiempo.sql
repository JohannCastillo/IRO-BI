create table DIM_TIEMPO_ATENCION(
  diaSem varchar(50),
  Mes varchar(50),
  Anio char(04),
)
go


-- Tiempo atencion = FechaHoraAtendida - FechaHoraSolicitada -> minutos
select 
  CAST(a.FechaHoraAtendida as date) as idFecha,
	DATENAME (dw, a.FechaHoraAtendida ) as diaSem,
  DATENAME (mm, a.FechaHoraAtendida ) as Mes,
  DATENAME (yyyy, a.FechaHoraAtendida ) as Anio,
    DATEDIFF(MINUTE, a.FechaHoraLlegada, a.FechaHoraAtendida) as TiempoAtencion
FROM ATENCION A