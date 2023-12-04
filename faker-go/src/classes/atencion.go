package classes

import (
	"IRO-Group/IRO-Golang/src/database"
	"strconv"
	"time"
)

type Atencion struct {
	IdAtencion       int
	FechaHoraLlegada time.Time
	FechaHoraSalida  time.Time
	IdEstado         int
	IdTipoAtencion   int
	IdDoctor         int64
	IdCita           int64
	IdReferencia     int
	IdServicio       int
	IdPaciente       int64
}

func NewAtencion() Atencion {
	f := fake
	data := database.GetDataDefault()
	FechaHoraLlegada := f.Time().TimeBetween(time.Now().AddDate(-10, 0, 0), time.Now())
	FechaHoraSalida := f.Time().TimeBetween(FechaHoraLlegada, FechaHoraLlegada.Add(time.Hour*12))

	return Atencion{
		FechaHoraLlegada: FechaHoraLlegada,
		FechaHoraSalida:  FechaHoraSalida,
		IdEstado:         f.IntBetween(data.MinIdEstadoAtencion, data.MaxIdEstadoAtencion),
		IdTipoAtencion:   f.IntBetween(data.MinIdTipoAtencion, data.MaxIdTipoAtencion),
		IdDoctor:         f.Int64Between(data.MinIdDoctor, data.MaxIdDoctor),
		IdServicio:       f.IntBetween(data.MinIdServicio, data.MaxIdServicio),
		IdPaciente:       f.Int64Between(data.MinIdPaciente, data.MaxIdPaciente),
	}
}

func (a *Atencion) GetQuery() string {
	IdCita := "NULL"
	if a.IdCita != 0 {
		IdCita = strconv.FormatInt(a.IdCita, 10)
	}

	IdReferencia := "NULL"
	if a.IdReferencia != 0 {
		IdReferencia = strconv.Itoa(a.IdReferencia)
	}

	return "(" +
		"CONVERT(datetime,'" + a.FechaHoraLlegada.Format("2006-01-02 15:04:05") + "', 120)," +
		"CONVERT(datetime,'" + a.FechaHoraSalida.Format("2006-01-02 15:04:05") + "', 120)," +
		strconv.Itoa(a.IdEstado) + "," +
		strconv.Itoa(a.IdTipoAtencion) + "," +
		strconv.FormatInt(a.IdDoctor, 10) + "," +
		IdCita + "," +
		IdReferencia + "," +
		strconv.Itoa(a.IdServicio) + "," +
		strconv.FormatInt(a.IdPaciente, 10) +
		")"
}
