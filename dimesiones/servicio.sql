create table Dim_Servicio (
  KeyServicio int identity primary key,
  Servicio varchar(50) not null,
  TipoServicio varchar(50) not null,
  IdServicio int not null
)
go

-- MERGE
MERGE [IRO_MART].[dbo].[Dim_Servicio]
as dim(
select 
  S.Descripcion as Servicio,
  TS.TipoServicio as TipoServicio,
  S.IdServicio as IdServicio
from SERVICIO S
inner join TIPO_SERVICIO TS on TS.IdTipoServicio = S.IdTipoServicio) as OLTP
ON dim.IdServicio = oltp.IdServicio
WHEN NOT MATCHED THEN
    INSERT (Servicio, TipoServicio, IdServicio)
    VALUES (Servicio, TipoServicio, IdServicio)
GO
