package classes

import (
	"IRO-Group/IRO-Golang/src/database"
	"strconv"
	"strings"
	"time"
)

type Cita struct {
	Costo      float64
	FechaHora  time.Time
	Motivo     string
	IdPaciente int64
	IdDoctor   int64
	IdEstado   int
}

func NewCita(atencion Atencion) Cita {
	f := fake
	data := database.GetDataDefault()

	return Cita{
		Costo:      f.Float64(2, 40, 1000),
		FechaHora:  f.Time().TimeBetween(atencion.FechaHoraLlegada.AddDate(0, 0, -30), atencion.FechaHoraLlegada.AddDate(0, 0, -2)),
		Motivo:     f.Lorem().Sentence(20),
		IdPaciente: atencion.IdPaciente,
		IdDoctor:   atencion.IdDoctor,
		IdEstado:   f.IntBetween(data.MinEstadoCita, data.MaxEstadoCita),
	}
}

func (c Cita) GetQuery() string {
	c.Motivo = strings.ReplaceAll(c.Motivo, "'", "")
	return "(" +
		strconv.FormatFloat(c.Costo, 'f', 2, 64) + "," +
		"CONVERT(datetime,'" + c.FechaHora.Format("2006-01-02 15:04:05") + "', 120)," +
		"'" + c.Motivo + "'," +
		strconv.FormatInt(c.IdPaciente, 10) + "," +
		strconv.FormatInt(c.IdDoctor, 10) + "," +
		strconv.Itoa(c.IdEstado) +
		")"
}
