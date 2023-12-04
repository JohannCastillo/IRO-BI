package classes

import (
	"strconv"
	"strings"
	"time"
)

type Paciente struct {
	IdPaciente        int
	NombresYApellidos string
	FechaDeNacimiento time.Time
	DNI               string
	Sexo              string
	Celular           string
	Correo            string
	Observaciones     string
	Domicilio         string
	TipoSangre        string
	EstadoCivil       string
	IdTipoPaciente    int
	IdDistrito        int
}

func NewPaciente() Paciente {
	f := fake
	sexos := []string{"H", "M"}
	return Paciente{
		IdPaciente:        0,
		NombresYApellidos: f.Person().Name() + " " + f.Person().LastName(),
		FechaDeNacimiento: f.Time().TimeBetween(time.Now().AddDate(-100, 0, 0), time.Now().AddDate(-3, 0, 0)),
		DNI:               f.Person().SSN()[0:8],
		Celular:           f.Person().SSN(),
		Correo:            f.Internet().Email(),
		Sexo:              f.RandomStringElement(sexos),
		Observaciones:     f.Lorem().Sentence(10),
		Domicilio:         f.Address().Address(),
		TipoSangre:        f.RandomStringElement([]string{"A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"}),
		EstadoCivil:       f.RandomStringElement([]string{"Soltero", "Casado", "Divorciado", "Viudo"}),
		IdTipoPaciente:    f.IntBetween(1, 4),
		IdDistrito:        f.IntBetween(1, 1740),
	}
}

func (p Paciente) ToString() string {
	return "NombresYApellidos: " + p.NombresYApellidos + "\n" +
		"FechaDeNacimiento: " + p.FechaDeNacimiento.String() + "\n" +
		"DNI: " + p.DNI + "\n" +
		"Sexo: " + p.Sexo + "\n" +
		"Celular: " + p.Celular + "\n" +
		"Correo: " + p.Correo + "\n" +
		"Observaciones: " + p.Observaciones + "\n" +
		"Domicilio: " + p.Domicilio + "\n" +
		"TipoSangre: " + p.TipoSangre + "\n" +
		"EstadoCivil: " + p.EstadoCivil + "\n" +
		"IdTipoPaciente: " + strconv.Itoa(p.IdTipoPaciente) + "\n" +
		"IdDistrito: " + strconv.Itoa(p.IdDistrito) + "\n" +
		"idPaciente: " + strconv.Itoa(p.IdPaciente) + "\n"
}

func (p Paciente) GetQuery() string {
	// Replace ' with '' for SQL Server
	p.NombresYApellidos = strings.ReplaceAll(p.NombresYApellidos, "'", "")
	p.Observaciones = strings.ReplaceAll(p.Observaciones, "'", "")
	p.Domicilio = strings.ReplaceAll(p.Domicilio, "'", "")

	return "(" +
		"'" + p.NombresYApellidos + "', \n" +
		"CONVERT(datetime,'" + p.FechaDeNacimiento.Format("2006-01-02 15:04:05") + "', 120)," +
		"'" + p.DNI + "'," +
		"'" + p.Sexo + "'," +
		"'" + p.Celular + "'," +
		"'" + p.Correo + "'," +
		"'" + p.Observaciones + "'," +
		"'" + p.Domicilio + "'," +
		"'" + p.TipoSangre + "'," +
		"'" + p.EstadoCivil + "', " +
		strconv.Itoa(p.IdTipoPaciente) + ", " +
		strconv.Itoa(p.IdDistrito) + ")"
}

func GetQueryPaciente(p Paciente) string {
	// Replace ' with '' for SQL Server
	p.NombresYApellidos = strings.ReplaceAll(p.NombresYApellidos, "'", "")
	p.Observaciones = strings.ReplaceAll(p.Observaciones, "'", "")
	p.Domicilio = strings.ReplaceAll(p.Domicilio, "'", "")

	return "('" +
		p.NombresYApellidos + "', " +
		"CONVERT(datetime,'" + p.FechaDeNacimiento.Format("2006-01-02 15:04:05") + "', 120), '" +
		p.DNI + "', '" +
		p.Sexo + "', '" +
		p.Celular + "', '" +
		p.Correo + "', '" +
		p.Observaciones + "', '" +
		p.Domicilio + "', '" +
		p.TipoSangre + "', '" +
		p.EstadoCivil + "', " +
		strconv.Itoa(p.IdTipoPaciente) + ", " +
		strconv.Itoa(p.IdDistrito) + ")\n"
}
