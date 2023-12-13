package classes

import (
	"strconv"
	"time"
)

type AsistenciaCapacitacion struct {
	IdCapacitacion int64
	IdDoctor       int64
	Sesion         int
	Fecha          time.Time
}

func NewAsistenciaCapacitacion(capacitacion Capacitacion, sesion int, date time.Time, IdDoctor int64) AsistenciaCapacitacion {
	return AsistenciaCapacitacion{
		IdCapacitacion: capacitacion.IdCapacitacion,
		IdDoctor:       IdDoctor,
		Sesion:         sesion,
		Fecha:          date,
	}
}

func (ac AsistenciaCapacitacion) GetQuery() string {
	return "(" +
		strconv.FormatInt(ac.IdCapacitacion, 10) + "," +
		strconv.FormatInt(ac.IdDoctor, 10) + "," +
		strconv.Itoa(ac.Sesion) + "," +
		"CONVERT(datetime,'" + ac.Fecha.Format("2006-01-02 15:04:05") + "', 120)" +
		")"
}
