package database

import (
	"log"
)

type DataDefault struct {
	// Default values
	MinIdTipoPaciente int
	MaxIdTipoPaciente int

	MinIdTipoAntecedente int
	MaxIdTipoAntecedente int

	MinIdAntecedente int
	MaxIdAntecedente int

	MinIdEstadoAtencion int
	MaxIdEstadoAtencion int

	MinIdTipoAtencion int
	MaxIdTipoAtencion int

	MinTipoServicio int
	MaxTipoServicio int

	MinEstadoCita int
	MaxEstadoCita int

	MinIdServicio int
	MaxIdServicio int

	MinIdEspecialidad int
	MaxIdEspecialidad int

	MinIdDistrito int
	MaxIdDistrito int

	MinIdInstitucionExternas int
	MaxIdInstitucionExternas int

	MinIdEnfermedad int
	MaxIdEnfermedad int

	// Others
	MinIdDoctor int64
	MaxIdDoctor int64

	MinIdPaciente int64
	MaxIdPaciente int64

	MinIdAtencion int64
	MaxIdAtencion int64

	MinIdCita int64
	MaxIdCita int64
}

var dataDefault DataDefault

func InitDataDefault() error {
	conn := GetConnection()

	err := conn.SqlDb.QueryRow("SELECT MIN(IdDistrito), MAX(IdDistrito) FROM DISTRITO").Scan(&dataDefault.MinIdDistrito, &dataDefault.MaxIdDistrito)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdTipoPaciente), MAX(IdTipoPaciente) FROM TIPO_PACIENTE").Scan(&dataDefault.MinIdTipoPaciente, &dataDefault.MinIdTipoPaciente)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdTipo), MAX(IdTipo) FROM TIPO_ANTECEDENTE").Scan(&dataDefault.MinIdTipoAntecedente, &dataDefault.MaxIdTipoAntecedente)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdEstado), MAX(IdEstado) FROM ESTADO_ATENCION").Scan(&dataDefault.MinIdEstadoAtencion, &dataDefault.MaxIdEstadoAtencion)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdTipoAtencion), MAX(IdTipoAtencion) FROM TIPO_ATENCION").Scan(&dataDefault.MinIdTipoAtencion, &dataDefault.MaxIdTipoAtencion)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdTipoServicio), MAX(IdTipoServicio) FROM TIPO_SERVICIO").Scan(&dataDefault.MinTipoServicio, &dataDefault.MaxTipoServicio)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdEstado), MAX(IdEstado) FROM CITA_ESTADO").Scan(&dataDefault.MinEstadoCita, &dataDefault.MaxEstadoCita)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdServicio), MAX(IdServicio) FROM SERVICIO").Scan(&dataDefault.MinIdServicio, &dataDefault.MaxIdServicio)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdEspecialidad), MAX(IdEspecialidad) FROM ESPECIALIDAD").Scan(&dataDefault.MinIdEspecialidad, &dataDefault.MaxIdEspecialidad)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdInstitucionExterna), MAX(IdInstitucionExterna) FROM INSTITUCION_EXTERNA").Scan(&dataDefault.MinIdInstitucionExternas, &dataDefault.MaxIdInstitucionExternas)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdEnfermedad), MAX(IdEnfermedad) FROM ENFERMEDAD").Scan(&dataDefault.MinIdEnfermedad, &dataDefault.MaxIdEnfermedad)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(idAntecedente), MAX(idAntecedente) FROM ANTECEDENTE").Scan(&dataDefault.MinIdAntecedente, &dataDefault.MaxIdAntecedente)

	if err != nil {
		return err
	}

	return nil

}

func GetNumPacientes() {
	db := GetConnection()

	var MinIdPaciente any
	var MaxIdPaciente any

	err := db.SqlDb.QueryRow("SELECT MIN(idPaciente), MAX(idPaciente) FROM PACIENTE").Scan(&MinIdPaciente, &MaxIdPaciente)

	if err != nil {
		log.Fatal(err)
	}

	if MinIdPaciente != nil {
		dataDefault.MinIdPaciente = MinIdPaciente.(int64)
	}

	if MaxIdPaciente != nil {
		dataDefault.MaxIdPaciente = MaxIdPaciente.(int64)
	}
}

func GetNumDoctores() {
	db := GetConnection()

	var MinIdDoctor any
	var MaxIdDoctor any

	err := db.SqlDb.QueryRow("SELECT MIN(idDoctor), MAX(idDoctor) FROM DOCTOR").Scan(&MinIdDoctor, &MaxIdDoctor)

	if err != nil {
		log.Fatal(err)
	}

	if MinIdDoctor != nil {
		dataDefault.MinIdDoctor = MinIdDoctor.(int64)
	}

	if MaxIdDoctor != nil {
		dataDefault.MaxIdDoctor = MaxIdDoctor.(int64)
	}
}

func GetNumAtenciones() {
	db := GetConnection()

	var MinIdAtencion any
	var MaxIdAtencion any

	err := db.SqlDb.QueryRow("SELECT MIN(idAtencion), MAX(idAtencion) FROM ATENCION").Scan(&MinIdAtencion, &MaxIdAtencion)

	if err != nil {
		log.Fatal(err)
	}

	if MinIdAtencion != nil {
		dataDefault.MinIdAtencion = MinIdAtencion.(int64)
	}

	if MaxIdAtencion != nil {
		dataDefault.MaxIdAtencion = MaxIdAtencion.(int64)
	}
}

func GetNumCitas() {
	db := GetConnection()

	var MinIdCita any
	var MaxIdCita any

	err := db.SqlDb.QueryRow("SELECT MIN(idCita), MAX(idCita) FROM CITA").Scan(&MinIdCita, &MaxIdCita)

	if err != nil {
		log.Fatal(err)
	}

	if MinIdCita != nil {
		dataDefault.MinIdCita = MinIdCita.(int64)
	}

	if MaxIdCita != nil {
		dataDefault.MaxIdCita = MaxIdCita.(int64)
	}
}

func GetDataDefault() DataDefault {
	return dataDefault
}
