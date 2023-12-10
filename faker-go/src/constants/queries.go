package constants

const (
	InsertPaciente = `INSERT INTO PACIENTE (
		NombresYApellidos, 
		FechaDeNacimiento, 
		DNI, 
		Sexo, 
		Celular, 
		Correo, 
		Observaciones, 
		Domicilio,
		TipoSangre, 
		EstadoCivil, 
		IdTipoPaciente, 
		IdDistrito) VALUES `

	InsertPacienteAntecedente = `INSERT INTO PACIENTE_ANTECEDENTE (
		IdAntecedente,
		IdPaciente,
		Detalle,
		FechaRegistro) VALUES `

	InsertDoctor = `INSERT INTO DOCTOR (
		Nombre, 
		DNI, 
		Telefono, 
		Correo,
		Estado, 
		IdEspecialidad) 
		VALUES `

	InsertAtencion = `INSERT INTO ATENCION (
		FechaHoraLlegada,
		FechaHoraAtencion,
		IdEstado,
		IdTipoAtencion,
		IdDoctor,
		IdCita,
		IdReferencia,
		IdServicio,
		IdPaciente) VALUES `

	InsertCita = `INSERT INTO CITA (
		Costo,
		FechaHora,
		Motivo,
		IdPaciente,
		IdDoctor,
		IdEstado) VALUES `

	InsertReferencia = `INSERT INTO REFERENCIA (
		DoctorExterno,
		FechaHoraReferencia,
		IdInstitucionExterna)
		VALUES `

	InsertCapacitacion = `INSERT INTO CAPACITACION (
		Descripcion,
		Costo,
		Modalidad,
		TotalSesiones,
		IdInstitucion)
		VALUES `

	InsertAsistenciaCapacitacion = `INSERT INTO ASISTENCIA (
        IdCapacitacion,
		IdDoctor,
		Sesion,
        Fecha)
    	VALUES `
)
