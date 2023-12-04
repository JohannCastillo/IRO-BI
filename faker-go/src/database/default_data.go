package database

import (
	"log"
)

type DataDefault struct {
	MinIdTipoPaciente int
	MaxIdTipoPaciente int

	MinIdServicio int
	MaxIdServicio int

	MinIdEspecialidad int
	MaxIdEspecialidad int

	MinIdDistrito int
	MaxIdDistrito int

	MinIdDoctor int
	MaxIdDoctor int

	MinIdPaciente int
	MaxIdPaciente int

	MinIdAntecedente int
	MaxIdAntecedente int
}

var dataDefault DataDefault

func GetNumPacientes() {
	if dataDefault.MaxIdPaciente > 0 && dataDefault.MinIdPaciente > 0 {
		return
	}

	db := GetConnection()

	err := db.SqlDb.QueryRow("SELECT MIN(idPaciente), MAX(idPaciente) FROM PACIENTE").Scan(&dataDefault.MinIdPaciente, &dataDefault.MaxIdPaciente)

	if err != nil {
		log.Fatal(err)
	}
}

func GetNumAntecedentes() {
	if dataDefault.MaxIdAntecedente > 0 && dataDefault.MinIdAntecedente > 0 {
		return
	}

	db := GetConnection()

	err := db.SqlDb.QueryRow("SELECT MIN(idAntecedente), MAX(idAntecedente) FROM ANTECEDENTE").Scan(&dataDefault.MinIdAntecedente, &dataDefault.MaxIdAntecedente)

	if err != nil {
		log.Fatal(err)
	}
}

func GetDataDefault() DataDefault {
	return dataDefault
}

func InitDataDefault() {
	conn := GetConnection()

	err := conn.SqlDb.QueryRow("SELECT MIN(IdDistrito), MAX(IdDistrito) FROM DISTRITO").Scan(&dataDefault.MinIdDistrito, &dataDefault.MaxIdDistrito)

	if err != nil {
		log.Fatal(err)
	}

}
