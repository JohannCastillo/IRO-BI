package constants

const (
	INSERT_PACIENTE = `INSERT INTO PACIENTE (
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

	INSERT_PACIENTE_ANTECEDENTE = `INSERT INTO PACIENTE_ANTECEDENTE (
		IdAntecedente,
		IdPaciente,
		Detalle,
		FechaRegistro) VALUES `

	INSERT_DOCTOR = `INSERT INTO DOCTOR (
		Nombre, 
		DNI, 
		Telefono, 
		Correo,
		Estado, 
		IdEspecialidad) 
		VALUES `

	INSERT_ATENCION = `INSERT INTO ATENCION (
		FechaHoraLlegada,
		FechaHoraAtencion,
		IdEstado,
		IdTipoAtencion,
		IdDoctor,
		IdCita,
		IdReferencia,
		IdServicio,
		IdPaciente) VALUES `

	INSERT_CITA = `INSERT INTO CITA (
		Costo,
		FechaHora,
		Motivo,
		IdPaciente,
		IdDoctor,
		IdEstado) VALUES `

	INSERT_REFERENCIA = `INSERT INTO REFERENCIA (
		DoctorExterno,
		FechaHoraReferencia,
		IdInstitucionExterna)
		VALUES `
)
