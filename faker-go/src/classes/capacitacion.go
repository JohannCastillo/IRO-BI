package classes

import (
	"IRO-Group/IRO-Golang/src/constants"
	"IRO-Group/IRO-Golang/src/database"
	"strconv"
	"strings"
	"time"
)

type Capacitacion struct {
	IdCapacitacion int64
	Descripcion    string
	Costo          float64
	Modalidad      string
	TotalSesiones  int
	IdInstitucion  int
}

func NewCapacitacion(id int64) Capacitacion {
	f := fake
	data := database.GetDataDefault()
	return Capacitacion{
		IdCapacitacion: id,
		Descripcion:    f.Lorem().Sentence(10),
		Costo:          f.Float(2, 200, 1000),
		Modalidad:      f.RandomStringElement([]string{"Presencial", "Virtual"}),
		TotalSesiones:  f.IntBetween(4, constants.MaxSessionForCapacitacion),
		IdInstitucion:  f.IntBetween(data.MinIdInstitucionCapacitacion, data.MaxIdInstitucionCapacitacion),
	}
}

func (c Capacitacion) GetQuery() string {
	c.Descripcion = strings.ReplaceAll(c.Descripcion, "'", "")
	return "(" +
		"'" + c.Descripcion + "'," +
		strconv.FormatFloat(c.Costo, 'f', 2, 64) + "," +
		"'" + c.Modalidad + "'," +
		strconv.Itoa(c.TotalSesiones) + "," +
		strconv.Itoa(c.IdInstitucion) +
		")"
}

func (c Capacitacion) GenerateAsistencia() (string, int) {
	totalDoctors := fake.IntBetween(constants.MinDoctorsForCapacitacion, constants.MaxDoctorsForCapacitacion)

	date := fake.Time().TimeBetween(time.Now().AddDate(-1, 0, 0), time.Now().AddDate(0, -3, 0))

	// Generating Dates for each Assistance
	dates := make([]time.Time, c.TotalSesiones)
	for i := 0; i < c.TotalSesiones; i++ {
		dates[i] = date
		date = fake.Time().TimeBetween(date.AddDate(0, 0, 1), date.AddDate(0, 0, 7))
	}

	query := ""
	total := 0

	doctors := database.GetRandomDoctors(totalDoctors)

	for j, doc := range doctors {
		totalSessions := fake.IntBetween(c.TotalSesiones/2, c.TotalSesiones)
		for i := 0; i < totalSessions; i++ {
			assistance := NewAsistenciaCapacitacion(c, i+1, dates[i], doc)
			date = assistance.Fecha
			query += assistance.GetQuery()

			if i != totalSessions-1 || j != totalDoctors-1 {
				query += ",\n"
			}

		}
		query += "\n"
		total += totalSessions
	}
	return query, total
}
