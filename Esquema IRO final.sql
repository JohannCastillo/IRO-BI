use master
go
DROP DATABASE IF EXISTS IRO2;
GO
CREATE DATABASE IRO2;
GO
USE IRO2;
GO

CREATE TABLE ASISTENCIA
( 
	IdDoctor             int  NOT NULL ,
	IdCapacitacion       int  NOT NULL ,
	FechaHora            datetime  NULL ,
	Sesion               smallint  NULL 
)
go



ALTER TABLE ASISTENCIA
	ADD CONSTRAINT XPKASISTENCIA PRIMARY KEY  CLUSTERED (IdDoctor ASC,IdCapacitacion ASC)
go



CREATE TABLE ATENCION
( 
	IdEstado             tinyint  NULL ,
	FechaHoraLlegada     datetime  NOT NULL ,
	FechaHoraAtendida    datetime  NOT NULL ,
	IdTipoAtencion       tinyint  NOT NULL ,
	IdServicio           tinyint  NULL ,
	IdAtencion           int identity(1,1)  NOT NULL ,
	IdCita               int  NULL ,
	IdHistoria           bigint  NOT NULL ,
	IdDoctor             int  NULL 
)
go



ALTER TABLE ATENCION
	ADD CONSTRAINT XPKDETALLE_ATENCION PRIMARY KEY  CLUSTERED (IdAtencion ASC)
go



CREATE TABLE CAPACITACION
( 
	IdCapacitacion       int identity(1,1)  NOT NULL ,
	Costo                money  NULL ,
	Modalidad            varchar(20)  NULL ,
	Descripcion          varchar(80)  NULL ,
	TotalSesiones        smallint  NOT NULL ,
	IdInstitucion        smallint  NOT NULL 
)
go



ALTER TABLE CAPACITACION
	ADD CONSTRAINT XPKCAPACITACION PRIMARY KEY  CLUSTERED (IdCapacitacion ASC)
go



CREATE TABLE CITA
( 
	Costo                money  NULL ,
	IdCita               int identity(1,1)  NOT NULL ,
	IdPaciente           bigint  NOT NULL 
)
go



ALTER TABLE CITA
	ADD CONSTRAINT XPKCITA PRIMARY KEY  CLUSTERED (IdCita ASC)
go



CREATE TABLE DISTRITO
( 
	IdDistrito           smallint IDENTITY ( 1,1 ) ,
	Distrito             varchar(30)  NOT NULL ,
	IdProvincia          tinyint  NULL 
)
go



ALTER TABLE DISTRITO
	ADD CONSTRAINT XPKDISTRITO PRIMARY KEY  CLUSTERED (IdDistrito ASC)
go



CREATE TABLE DOCTOR
( 
	IdDoctor             int NOT NULL ,
	IdEspecialidad       tinyint  NOT NULL ,
	Nombre               varchar(50)  NOT NULL ,
	Telefono             char(9)  NULL ,
	Correo               varchar(50)  NULL ,
	Estado               varchar(20)  NULL ,
	DNI                  char(8)  NULL 
)
go



ALTER TABLE DOCTOR
	ADD CONSTRAINT XPKDOCTOR PRIMARY KEY  CLUSTERED (IdDoctor ASC)
go



CREATE TABLE ESPECIALIDAD
( 
	IdEspecialidad       tinyint IDENTITY ( 1,1 ) ,
	Especialidad         varchar(30)  NOT NULL 
)
go



ALTER TABLE ESPECIALIDAD
	ADD CONSTRAINT XPKESPECIALIDAD PRIMARY KEY  CLUSTERED (IdEspecialidad ASC)
go



CREATE TABLE ESTADO_ATENCION
( 
	IdEstado             tinyint IDENTITY ( 1,1 ) ,
	Estado               varchar(40)  NOT NULL 
)
go



ALTER TABLE ESTADO_ATENCION
	ADD CONSTRAINT XPKESTADO PRIMARY KEY  CLUSTERED (IdEstado ASC)
go



CREATE TABLE HISTORIA
( 
	IdHistoria           bigint IDENTITY ( 1,1 ) ,
	IdPaciente           bigint  NOT NULL ,
	FechaRegistro        datetime  NULL 
)
go



ALTER TABLE HISTORIA
	ADD CONSTRAINT XPKATENCION PRIMARY KEY  CLUSTERED (IdHistoria ASC)
go



CREATE TABLE INSTITUCION
( 
	IdInstitucion        smallint  NOT NULL ,
	Nombre               varchar(50)  NULL 
)
go



ALTER TABLE INSTITUCION
	ADD CONSTRAINT XPKINSTITUCION PRIMARY KEY  CLUSTERED (IdInstitucion ASC)
go



CREATE TABLE PACIENTE
( 
	IdPaciente           bigint IDENTITY ( 1,1 ) ,
	IdTipoPaciente       tinyint  NOT NULL ,
	IdDistrito           smallint  NOT NULL ,
	FechaDeNacimiento    datetime  NOT NULL ,
	NombresYApelidos     varchar(50)  NOT NULL ,
	Sexo 			   	 char(1)  NOT NULL ,
	Celular              char(9)  NULL ,
	Correo			     varchar(50)  NULL ,
	Domicilio			 varchar(50)  NULL ,
	TipoSangre			 varchar(3)  NULL ,
	EstadoCivil			 varchar(20)  NULL ,
	DNI                  char(8)  NOT NULL 
)
go

ALTER TABLE PACIENTE
	ADD CONSTRAINT XPKPACIENTE PRIMARY KEY  CLUSTERED (IdPaciente ASC)
go



CREATE TABLE CONTACTO_EMERGENCIA(
	idContactoEmergencia int identity(1,1) not null,
	idPaciente bigint not null,
	Nombre varchar(50) not null,
	Apellidos varchar(50) not null,
	Celular char(9) not null,
	Correo varchar(50) null,
	Relacion varchar(50) not null
)
GO

ALTER TABLE CONTACTO_EMERGENCIA
	ADD CONSTRAINT XPKCONTACTO_EMERGENCIA PRIMARY KEY  CLUSTERED (idContactoEmergencia ASC)
GO



ALTER TABLE CONTACTO_EMERGENCIA
	ADD CONSTRAINT R_100 FOREIGN KEY (idPaciente) REFERENCES PACIENTE(IdPaciente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



CREATE TABLE PROVINCIA
( 
	IdProvincia          tinyint IDENTITY ( 1,1 ) ,
	Provincia            varchar(30)  NOT NULL 
)
go



ALTER TABLE PROVINCIA
	ADD CONSTRAINT XPKPROVINCIA PRIMARY KEY  CLUSTERED (IdProvincia ASC)
go



CREATE TABLE SERVICIO
( 
	IdServicio           tinyint IDENTITY ( 1,1 ) ,
	IdTipoServicio       tinyint  NULL ,
	CostoActual          money  NOT NULL ,
	Descripcion          varchar(40)  NOT NULL 
)
go



ALTER TABLE SERVICIO
	ADD CONSTRAINT XPKSERVICIO PRIMARY KEY  CLUSTERED (IdServicio ASC)
go



CREATE TABLE TIPO_ATENCION
( 
	IdTipoAtencion       tinyint IDENTITY ( 1,1 ) ,
	TipoAtencion         varchar(30)  NULL 
)
go



ALTER TABLE TIPO_ATENCION
	ADD CONSTRAINT XPKTIPO_ATENCION PRIMARY KEY  CLUSTERED (IdTipoAtencion ASC)
go



CREATE TABLE TIPO_PACIENTE
( 
	IdTipoPaciente       tinyint IDENTITY ( 1,1 ) ,
	TipoPaciente         varchar(30)  NOT NULL 
)
go



ALTER TABLE TIPO_PACIENTE
	ADD CONSTRAINT XPKTIPO_PACIENTE PRIMARY KEY  CLUSTERED (IdTipoPaciente ASC)
go



CREATE TABLE TIPO_SERVICIO
( 
	IdTipoServicio       tinyint IDENTITY ( 1,1 ) ,
	TipoServicio         varchar(30)  NOT NULL 
)
go



ALTER TABLE TIPO_SERVICIO
	ADD CONSTRAINT XPKTIPO_SERVICIO PRIMARY KEY  CLUSTERED (IdTipoServicio ASC)
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
	ADD CONSTRAINT R_52 FOREIGN KEY (IdCita) REFERENCES CITA(IdCita)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_58 FOREIGN KEY (IdHistoria) REFERENCES HISTORIA(IdHistoria)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ATENCION
	ADD CONSTRAINT R_59 FOREIGN KEY (IdDoctor) REFERENCES DOCTOR(IdDoctor)
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




ALTER TABLE HISTORIA
	ADD CONSTRAINT R_6 FOREIGN KEY (IdPaciente) REFERENCES PACIENTE(IdPaciente)
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




ALTER TABLE SERVICIO
	ADD CONSTRAINT R_24 FOREIGN KEY (IdTipoServicio) REFERENCES TIPO_SERVICIO(IdTipoServicio)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



CREATE TABLE ENFERMEDAD
( 
	IdEnfermedad	int identity(1,1)  NOT NULL ,
	Nombre			varchar(50)  NOT NULL ,
	Descripcion		varchar(100)  NOT NULL
)
GO

ALTER TABLE ENFERMEDAD
	ADD CONSTRAINT XPKENFERMEDAD PRIMARY KEY  CLUSTERED (IdEnfermedad ASC)
go

CREATE TABLE ENFERMEDAD_DIAGNOSTICADA(
	IdEnfermedadDiagnosticada int identity(1,1) not null,
	IdEnfermedad int not null,
	IdPaciente bigint not null,
	IdDoctor int not null,
	FechaDiagnostico datetime not null
)
go

ALTER TABLE ENFERMEDAD_DIAGNOSTICADA
	ADD CONSTRAINT XPKENFERMEDAD_DIAGNOSTICADA PRIMARY KEY  CLUSTERED (IdEnfermedadDiagnosticada ASC)
go

ALTER TABLE ENFERMEDAD_DIAGNOSTICADA
	ADD CONSTRAINT R_101 FOREIGN KEY (IdEnfermedad) REFERENCES ENFERMEDAD(IdEnfermedad)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE ENFERMEDAD_DIAGNOSTICADA
	ADD CONSTRAINT R_102 FOREIGN KEY (IdPaciente) REFERENCES PACIENTE(IdPaciente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE ENFERMEDAD_DIAGNOSTICADA
	ADD CONSTRAINT R_103 FOREIGN KEY (IdDoctor) REFERENCES DOCTOR(IdDoctor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

CREATE TABLE DIAGNOSTICO(
	IdAtencion int not null,
	Observaciones varchar(100) not null,

	LejosODEsf float null,
	LejosODCil float null,
	LejosODEje float null,
	LejosOIEsf float null,
	LejosOICil float null,
	LejosOIEje float null,

	CercaODEsf float null,
	CercaODCil float null,
	CercaODEje float null,
	CercaOIEsf float null,
	CercaOICil float null,

	AgudezaVisual float null,
	Tonometria float null,
	Refraccion float null,
	Paquimetria float null,
	OCT float null,

	IdEnfermedadDiagnosticada int not null,
)
go

ALTER TABLE DIAGNOSTICO
	ADD CONSTRAINT R_104 FOREIGN KEY (IdAtencion) REFERENCES ATENCION(IdAtencion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE DIAGNOSTICO
	ADD CONSTRAINT R_105 FOREIGN KEY (IdEnfermedadDiagnosticada) REFERENCES ENFERMEDAD_DIAGNOSTICADA(IdEnfermedadDiagnosticada)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

