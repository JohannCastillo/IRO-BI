package classes

import (
	"strconv"
	"strings"
)

type Doctor struct {
	IdDoctor       int
	Nombre         string
	DNI            string
	Telefono       string
	Correo         string
	Estado         string
	IdEspecialidad int
}

func NewDoctor() Doctor {
	f := fake
	estados := []string{"Activo", "Inactivo"}
	return Doctor{
		Nombre:         f.Person().Name() + " " + f.Person().LastName(),
		DNI:            f.Person().SSN()[0:8],
		Telefono:       "9" + f.Person().SSN()[0:8],
		Correo:         f.Internet().Email(),
		Estado:         f.RandomStringElement(estados),
		IdEspecialidad: f.IntBetween(1, 6),
	}
}

func (d Doctor) GetQuery() string {
	d.Nombre = strings.ReplaceAll(d.Nombre, "'", "")

	return "(" +
		"'" + d.Nombre + "',\n" +
		"'" + d.DNI + "'," +
		"'" + d.Telefono + "'," +
		"'" + d.Correo + "'," +
		"'" + d.Estado + "'," +
		strconv.Itoa(d.IdEspecialidad) +
		")"
}
