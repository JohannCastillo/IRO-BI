package classes

import (
	"IRO-Group/IRO-Golang/src/database"
	"strconv"
	"strings"
	"time"
)

type ReferenciaAtencion struct {
	DoctorExterno        string
	FechaHoraReferencia  time.Time
	IdInstitucionExterna int
}

func NewReferenciaAtencion(atencion Atencion) ReferenciaAtencion {
	f := fake
	data := database.GetDataDefault()
	return ReferenciaAtencion{
		DoctorExterno:        f.Person().Name() + " " + f.Person().LastName(),
		FechaHoraReferencia:  f.Time().TimeBetween(atencion.FechaHoraLlegada.AddDate(0, -3, 0), atencion.FechaHoraLlegada.AddDate(0, 0, -2)),
		IdInstitucionExterna: f.IntBetween(data.MinIdInstitucionExternas, data.MaxIdInstitucionExternas),
	}
}

func (r ReferenciaAtencion) GetQuery() string {
	r.DoctorExterno = strings.ReplaceAll(r.DoctorExterno, "'", "")
	return "(" +
		"'" + r.DoctorExterno + "',\n" +
		"CONVERT(datetime,'" + r.FechaHoraReferencia.Format("2006-01-02 15:04:05") + "', 120)," +
		strconv.Itoa(r.IdInstitucionExterna) +
		")"
}
