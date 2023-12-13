DROP DATABASE IF EXISTS IRO5;
GO
CREATE DATABASE IRO5;
GO
USE IRO5;
GO



CREATE TABLE ANTECEDENTE
( 
	IdAntecedente        int IDENTITY ( 1,1 ) PRIMARY KEY,
	IdTipo               smallint  NULL ,
	Antecedente          varchar(30)  NULL 
)
go


CREATE TABLE ASISTENCIA
( 
	IdDoctor             int  NOT NULL ,
	IdCapacitacion       int  NOT NULL ,
	FechaHora            datetime  NULL ,
	Sesion               smallint  NULL 
)
go

CREATE TABLE ATENCION
( 
	IdAtencion           int IDENTITY ( 1,1 ) PRIMARY KEY,
	IdEstado             tinyint  NULL ,
	FechaHoraLlegada     datetime  NOT NULL ,
	FechaHoraAtendida    datetime  NOT NULL ,
	IdTipoAtencion       tinyint  NOT NULL ,
	IdCita               int  NULL UNIQUE,
	IdDoctor             int  NULL ,
	IdReferencia         int  NULL ,
	IdServicio           tinyint  NULL ,
	IdPaciente           bigint  NULL 
)
go


CREATE TABLE CAPACITACION
( 
	IdCapacitacion       int IDENTITY ( 1,1 )  PRIMARY KEY,
	Costo                money  NULL ,
	Modalidad            varchar(20)  NULL ,
	Descripcion          varchar(80)  NULL ,
	TotalSesiones        smallint  NOT NULL ,
	IdInstitucion        smallint  NOT NULL 
)
go



CREATE TABLE CITA
( 
	Costo                money  NULL ,
	IdCita               int IDENTITY ( 1,1 )  PRIMARY KEY,
	IdPaciente           bigint  NOT NULL ,
	Fecha                datetime  NULL ,
	Motivo               varchar(30)  NULL ,
	IdDoctor             int  NULL ,
	IdCitaEstado         smallint  NULL 
)
go


CREATE TABLE CITA_ESTADO
( 
	IdCitaEstado         smallint IDENTITY ( 1,1 )  PRIMARY KEY,
	Estado               varchar(15)  NULL 
)
go



CREATE TABLE CONTACTO_EMERGENCIA
( 
	idContactoEmergencia bigint IDENTITY ( 1,1 )  PRIMARY KEY,
	Nombre               varchar(25)  NULL ,
	Apellidos            varchar(25)  NULL ,
	Celular              char(9)  NULL ,
	Correo               varchar(50)  NULL ,
	Relacion             varchar(20)  NULL 
)
go



CREATE TABLE DEPARTAMENTO
( 
	IdDepartamento       int IDENTITY ( 1,1 )  PRIMARY KEY,
	Departamento         varchar(30)  NULL 
)
go


CREATE TABLE DIAGNOSTICO
( 
	Observaciones        varchar(100)  NOT NULL ,
	LejosODEsf           float  NULL ,
	LejosODCil           float  NULL ,
	LejosODEje           float  NULL ,
	LejosOIEsf           float  NULL ,
	LejosOICil           float  NULL ,
	LejosOIEje           float  NULL ,
	CercaODEsf           float  NULL ,
	CercaODCil           float  NULL ,
	CercaODEje           float  NULL ,
	CercaOIEsf           float  NULL ,
	CercaOICil           float  NULL ,
	CercaOIEje           float  NULL ,
	IdAtencion           int IDENTITY ( 1,1 )  PRIMARY KEY,
	AgudezaVisual        float  NULL ,
	Tonometria           float  NULL ,
	Refraccion           float  NULL ,
	Campimetria          float  NULL ,
	CurvaturaCorneal     float  NULL ,
	MedicionLagrima      float  NULL ,
	Paquimetria          float  NULL ,
	OCT                  float  NULL 
)
go



CREATE TABLE DISTRITO
( 
	IdDistrito           int IDENTITY ( 1,1 )  PRIMARY KEY,
	Distrito             varchar(36)  NOT NULL ,
	IdProvincia          int  NULL 
)
go


CREATE TABLE DOCTOR
( 
	IdDoctor             int IDENTITY ( 1,1 ) PRIMARY KEY,
	IdEspecialidad       tinyint  NOT NULL ,
	Nombre               varchar(50)  NOT NULL ,
	Telefono             char(9)  NULL ,
	Correo               varchar(50)  NULL ,
	Estado               varchar(20)  NULL ,
	DNI                  char(8)  NULL 
)
go


CREATE TABLE ENFERMEDAD
( 
	idEnfermedad         int IDENTITY ( 1,1 )  PRIMARY KEY,
	nombre               varchar(20)  NULL ,
	descripcion          varchar(40)  NULL ,
	sintomas             varchar(50)  NULL 
)
go


CREATE TABLE ENFERMEDAD_DIAGNOSTICADA
( 
	IdPaciente           bigint  NOT NULL ,
	IdDoctor             int  NULL ,
	FechaDiagnostico     datetime  NULL ,
	idEnfermedad         int  NOT NULL ,
	IdAtencion           int  NULL 
)
go



CREATE TABLE ESPECIALIDAD
( 
	IdEspecialidad       tinyint IDENTITY ( 1,1 )  PRIMARY KEY,
	Especialidad         varchar(30)  NOT NULL 
)
go



CREATE TABLE ESTADO_ATENCION
( 
	IdEstado             tinyint IDENTITY ( 1,1 )  PRIMARY KEY,
	Estado               varchar(40)  NOT NULL 
)
go



CREATE TABLE INSTITUCION
( 
	IdInstitucion        smallint IDENTITY ( 1,1 )  PRIMARY KEY,
	Nombre               varchar(50)  NULL 
)
go




CREATE TABLE INSTITUCION_EXTERNA
( 
	IdInstitucionExterno int IDENTITY ( 1,1 )  PRIMARY KEY,
	Institucion          varchar(40)  NOT NULL 
)
go


CREATE TABLE PACIENTE
( 
	IdPaciente           bigint IDENTITY ( 1,1 )  PRIMARY KEY,
	IdTipoPaciente       tinyint  NOT NULL ,
	IdDistrito           int  NOT NULL ,
	FechaDeNacimiento    date  NOT NULL ,
	NombresYApelidos     varchar(50)  NOT NULL ,
	DNI                  char(8)  NOT NULL ,
	idContactoEmergencia bigint  NULL ,
	Sexo                 char(1)  NULL ,
	Celular              char(9)  NULL ,
	Correo               varchar(30)  NULL ,
	Observaciones        varchar(50)  NULL ,
	Domicilio            varchar(50)  NULL ,
	TipoSangre           varchar(3)  NULL ,
	EstadoCivil          varchar(15)  NULL 
)
go



CREATE TABLE PACIENTE_ANTECEDENTE
( 
	Detalle              varchar(50)  NULL ,
	FechaRegistro        datetime  NULL ,
	IdAntecedente        int  NOT NULL ,
	IdPaciente           bigint  NOT NULL 
)
go



CREATE TABLE PROVINCIA
( 
	IdProvincia          int IDENTITY ( 1,1 )  PRIMARY KEY,
	Provincia            varchar(30)  NOT NULL ,
	IdDepartamento       int  NULL 
)
go


CREATE TABLE REFERENCIA
( 
	IdReferencia         int IDENTITY ( 1,1 )  PRIMARY KEY,
	DoctorExterno        varchar(50)  NOT NULL ,
	FechaHoraReferencia  datetime  NOT NULL ,
	IdInstitucionExterno int  NULL 
)
go


CREATE TABLE SERVICIO
( 
	IdServicio           tinyint IDENTITY ( 1,1 )  PRIMARY KEY,
	IdTipoServicio       tinyint  NULL ,
	CostoActual          money  NOT NULL ,
	Descripcion          varchar(40)  NOT NULL 
)
go


CREATE TABLE TIPO_ANTECEDENTE
( 
	IdTipo               smallint IDENTITY ( 1,1 )  PRIMARY KEY,
	Tipo                 varchar(25)  NULL 
)
go


CREATE TABLE TIPO_ATENCION
( 
	IdTipoAtencion       tinyint IDENTITY ( 1,1 )  PRIMARY KEY,
	TipoAtencion         varchar(30)  NULL 
)
go



CREATE TABLE TIPO_PACIENTE
( 
	IdTipoPaciente       tinyint IDENTITY ( 1,1 )  PRIMARY KEY,
	TipoPaciente         varchar(30)  NOT NULL 
)
go



CREATE TABLE TIPO_SERVICIO
( 
	IdTipoServicio       tinyint IDENTITY ( 1,1 )  PRIMARY KEY,
	TipoServicio         varchar(30)  NOT NULL 
)
go



ALTER TABLE ANTECEDENTE
	ADD CONSTRAINT R_83 FOREIGN KEY (IdTipo) REFERENCES TIPO_ANTECEDENTE(IdTipo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ASISTENCIA
	ADD CONSTRAINT R_34 FOREIGN KEY (IdDoctor) REFERENCES DOCTOR(IdDoctor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ASISTENCIA
	ADD CONSTRAINT R_35 FOREIGN KEY (IdCapacitacion) REFERENCES CAPACITACION(IdCapacitacion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_25 FOREIGN KEY (IdEstado) REFERENCES ESTADO_ATENCION(IdEstado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_43 FOREIGN KEY (IdTipoAtencion) REFERENCES TIPO_ATENCION(IdTipoAtencion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_46 FOREIGN KEY (IdServicio) REFERENCES SERVICIO(IdServicio)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_59 FOREIGN KEY (IdDoctor) REFERENCES DOCTOR(IdDoctor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_87 FOREIGN KEY (IdReferencia) REFERENCES REFERENCIA(IdReferencia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_52 FOREIGN KEY (IdCita) REFERENCES CITA(IdCita)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_91 FOREIGN KEY (IdPaciente) REFERENCES PACIENTE(IdPaciente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE CAPACITACION
	ADD CONSTRAINT R_56 FOREIGN KEY (IdInstitucion) REFERENCES INSTITUCION(IdInstitucion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE CITA
	ADD CONSTRAINT R_57 FOREIGN KEY (IdPaciente) REFERENCES PACIENTE(IdPaciente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE CITA
	ADD CONSTRAINT R_75 FOREIGN KEY (IdDoctor) REFERENCES DOCTOR(IdDoctor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE CITA
	ADD CONSTRAINT R_76 FOREIGN KEY (IdCitaEstado) REFERENCES CITA_ESTADO(IdCitaEstado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE DIAGNOSTICO
	ADD CONSTRAINT R_65 FOREIGN KEY (IdAtencion) REFERENCES ATENCION(IdAtencion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE DISTRITO
	ADD CONSTRAINT R_30 FOREIGN KEY (IdProvincia) REFERENCES PROVINCIA(IdProvincia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE DOCTOR
	ADD CONSTRAINT R_12 FOREIGN KEY (IdEspecialidad) REFERENCES ESPECIALIDAD(IdEspecialidad)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ENFERMEDAD_DIAGNOSTICADA
	ADD CONSTRAINT R_70 FOREIGN KEY (IdPaciente) REFERENCES PACIENTE(IdPaciente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ENFERMEDAD_DIAGNOSTICADA
	ADD CONSTRAINT R_71 FOREIGN KEY (IdDoctor) REFERENCES DOCTOR(IdDoctor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ENFERMEDAD_DIAGNOSTICADA
	ADD CONSTRAINT R_72 FOREIGN KEY (idEnfermedad) REFERENCES ENFERMEDAD(idEnfermedad)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ENFERMEDAD_DIAGNOSTICADA
	ADD CONSTRAINT R_89 FOREIGN KEY (IdAtencion) REFERENCES DIAGNOSTICO(IdAtencion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PACIENTE
	ADD CONSTRAINT R_7 FOREIGN KEY (IdTipoPaciente) REFERENCES TIPO_PACIENTE(IdTipoPaciente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PACIENTE
	ADD CONSTRAINT R_16 FOREIGN KEY (IdDistrito) REFERENCES DISTRITO(IdDistrito)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PACIENTE
	ADD CONSTRAINT R_61 FOREIGN KEY (idContactoEmergencia) REFERENCES CONTACTO_EMERGENCIA(idContactoEmergencia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PACIENTE_ANTECEDENTE
	ADD CONSTRAINT R_84 FOREIGN KEY (IdAntecedente) REFERENCES ANTECEDENTE(IdAntecedente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PACIENTE_ANTECEDENTE
	ADD CONSTRAINT R_86 FOREIGN KEY (IdPaciente) REFERENCES PACIENTE(IdPaciente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PROVINCIA
	ADD CONSTRAINT R_73 FOREIGN KEY (IdDepartamento) REFERENCES DEPARTAMENTO(IdDepartamento)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE REFERENCIA
	ADD CONSTRAINT R_88 FOREIGN KEY (IdInstitucionExterno) REFERENCES INSTITUCION_EXTERNA(IdInstitucionExterno)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE SERVICIO
	ADD CONSTRAINT R_24 FOREIGN KEY (IdTipoServicio) REFERENCES TIPO_SERVICIO(IdTipoServicio)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


