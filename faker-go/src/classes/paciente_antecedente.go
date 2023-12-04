package classes

import (
	"IRO-Group/IRO-Golang/src/database"
	"strconv"
	"strings"
	"time"
)

type PacienteAntecedente struct {
	IdAntecedente int
	IdPaciente    int
	Detalle       string
	FechaRegistro time.Time
}

func NewPacienteAntecedente(PacienteId int) PacienteAntecedente {
	f := fake
	data := database.GetDataDefault()
	return PacienteAntecedente{
		IdAntecedente: f.IntBetween(data.MinIdAntecedente, data.MaxIdAntecedente),
		IdPaciente:    PacienteId,
		Detalle:       f.Lorem().Sentence(10),
		FechaRegistro: f.Time().TimeBetween(time.Now().AddDate(-30, 0, 0), time.Now()),
	}
}

func (p PacienteAntecedente) GetQuery() string {
	p.Detalle = strings.ReplaceAll(p.Detalle, "'", "")

	return "(" +
		strconv.Itoa(p.IdAntecedente) + ",\n" +
		strconv.Itoa(p.IdPaciente) + "," +
		`'` + p.Detalle + `',` +
		"CONVERT(datetime,'" + p.FechaRegistro.Format("2006-01-02 15:04:05") + "', 120)" +
		`)`
}
