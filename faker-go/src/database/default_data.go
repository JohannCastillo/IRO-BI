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

	MinIdTrujillo int
	MaxIdTrujillo int

	MinIdLaLibertad int
	MaxIdLaLibertad int

	MinIdInstitucionExternas int
	MaxIdInstitucionExternas int

	MinIdEnfermedad int
	MaxIdEnfermedad int

	MinIdInstitucionCapacitacion int
	MaxIdInstitucionCapacitacion int

	// Others
	MinIdDoctor int64
	MaxIdDoctor int64

	MinIdPaciente int64
	MaxIdPaciente int64

	MinIdCapacitacion int64
	MaxIdCapacitacion int64

	MinIdCita int64
	MaxIdCita int64

	MinIdReferencia int64
	MaxIdReferencia int64
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

	err = conn.SqlDb.QueryRow(`SELECT MIN(d.IdDistrito), Max(d.IdDistrito) 
		FROM PROVINCIA P
		INNER JOIN DISTRITO D on d.IdProvincia = p.IdProvincia
		Where IdDepartamento = 13`).Scan(&dataDefault.MinIdTrujillo, &dataDefault.MaxIdTrujillo)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdDistrito), MAX(IdDistrito) from DISTRITO WHERE IdProvincia = 112").Scan(&dataDefault.MinIdLaLibertad, &dataDefault.MaxIdLaLibertad)

	if err != nil {
		return err
	}

	err = conn.SqlDb.QueryRow("SELECT MIN(IdInstitucion), MAX(IdInstitucion) FROM INSTITUCION").Scan(&dataDefault.MinIdInstitucionCapacitacion, &dataDefault.MaxIdInstitucionCapacitacion)

	return err

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

func GetNumCapacitaciones() {
	db := GetConnection()

	var MinIdCapacitacion any
	var MaxIdCapacitacion any

	err := db.SqlDb.QueryRow("SELECT MIN(IdCapacitacion), MAX(IdCapacitacion) FROM CAPACITACION").Scan(&MinIdCapacitacion, &MaxIdCapacitacion)

	if err != nil {
		log.Fatal(err)
	}

	if MinIdCapacitacion != nil {
		dataDefault.MinIdCapacitacion = MinIdCapacitacion.(int64)
	}

	if MaxIdCapacitacion != nil {
		dataDefault.MaxIdCapacitacion = MaxIdCapacitacion.(int64)
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

func GetNumReferencias() {
	db := GetConnection()

	var MinIdReferencia any
	var MaxIdReferencia any

	err := db.SqlDb.QueryRow("SELECT MIN(idReferencia), MAX(idReferencia) FROM REFERENCIA").Scan(&MinIdReferencia, &MaxIdReferencia)

	if err != nil {
		log.Fatal(err)
	}

	if MinIdReferencia != nil {
		dataDefault.MinIdReferencia = MinIdReferencia.(int64)
	}

	if MaxIdReferencia != nil {
		dataDefault.MaxIdReferencia = MaxIdReferencia.(int64)
	}
}

func GetDataDefault() DataDefault {
	return dataDefault
}
