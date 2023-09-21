DROP DATABASE IF EXISTS IRO4;
GO
CREATE DATABASE IRO4;
GO
USE IRO4;
GO



CREATE TABLE ANTECEDENTE
( 
	IdAntecedente        int IDENTITY ( 1,1 ) ,
	IdTipo               smallint  NULL ,
	Antecedente          varchar(30)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKANTECEDENTE ON ANTECEDENTE
( 
	IdAntecedente         ASC
)
go



CREATE NONCLUSTERED INDEX XIF1ANTECEDENTE ON ANTECEDENTE
( 
	IdTipo                ASC
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



CREATE UNIQUE CLUSTERED INDEX XPKASISTENCIA ON ASISTENCIA
( 
	IdDoctor              ASC,
	IdCapacitacion        ASC
)
go



CREATE NONCLUSTERED INDEX XIF1ASISTENCIA ON ASISTENCIA
( 
	IdDoctor              ASC
)
go



CREATE NONCLUSTERED INDEX XIF2ASISTENCIA ON ASISTENCIA
( 
	IdCapacitacion        ASC
)
go



CREATE TABLE ATENCION
( 
	IdEstado             tinyint  NULL ,
	FechaHoraLlegada     datetime  NOT NULL ,
	FechaHoraAtendida    datetime  NOT NULL ,
	IdTipoAtencion       tinyint  NOT NULL ,
	IdAtencion           int IDENTITY ( 1,1 ) ,
	IdCita               int  NULL UNIQUE,
	IdDoctor             int  NULL ,
	IdReferencia         int  NULL ,
	IdServicio           tinyint  NULL ,
	IdPaciente           bigint  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKDETALLE_ATENCION ON ATENCION
( 
	IdAtencion            ASC
)
go



CREATE NONCLUSTERED INDEX XIF3DETALLE_ATENCION ON ATENCION
( 
	IdEstado              ASC
)
go



CREATE NONCLUSTERED INDEX XIF6DETALLE_ATENCION ON ATENCION
( 
	IdTipoAtencion        ASC
)
go



CREATE NONCLUSTERED INDEX XIF8DETALLE_ATENCION ON ATENCION
( 
	IdServicio            ASC
)
go



CREATE NONCLUSTERED INDEX XIF11DETALLE_ATENCION ON ATENCION
( 
	IdDoctor              ASC
)
go



CREATE NONCLUSTERED INDEX XIF12DETALLE_ATENCION ON ATENCION
( 
	IdReferencia          ASC
)
go



CREATE NONCLUSTERED INDEX XIF9DETALLE_ATENCION ON ATENCION
( 
	IdCita                ASC
)
go



CREATE NONCLUSTERED INDEX XIF13DETALLE_ATENCION ON ATENCION
( 
	IdPaciente            ASC
)
go



CREATE TABLE CAPACITACION
( 
	IdCapacitacion       int IDENTITY ( 1,1 ) ,
	Costo                money  NULL ,
	Modalidad            varchar(20)  NULL ,
	Descripcion          varchar(80)  NULL ,
	TotalSesiones        smallint  NOT NULL ,
	IdInstitucion        smallint  NOT NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKCAPACITACION ON CAPACITACION
( 
	IdCapacitacion        ASC
)
go



CREATE NONCLUSTERED INDEX XIF1CAPACITACION ON CAPACITACION
( 
	IdInstitucion         ASC
)
go



CREATE TABLE CITA
( 
	Costo                money  NULL ,
	IdCita               int IDENTITY ( 1,1 ) ,
	IdPaciente           bigint  NOT NULL ,
	Fecha                datetime  NULL ,
	Motivo               varchar(30)  NULL ,
	IdDoctor             int  NULL ,
	IdCitaEstado         smallint  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKCITA ON CITA
( 
	IdCita                ASC
)
go



CREATE NONCLUSTERED INDEX XIF1CITA ON CITA
( 
	IdPaciente            ASC
)
go



CREATE NONCLUSTERED INDEX XIF2CITA ON CITA
( 
	IdDoctor              ASC
)
go



CREATE NONCLUSTERED INDEX XIF3CITA ON CITA
( 
	IdCitaEstado          ASC
)
go



CREATE TABLE CITA_ESTADO
( 
	IdCitaEstado         smallint IDENTITY ( 1,1 ) ,
	Estado               varchar(15)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKEstado ON CITA_ESTADO
( 
	IdCitaEstado          ASC
)
go



CREATE TABLE CONTACTO_EMERGENCIA
( 
	idContactoEmergencia bigint IDENTITY ( 1,1 ) ,
	Nombre               varchar(25)  NULL ,
	Apellidos            varchar(25)  NULL ,
	Celular              char(9)  NULL ,
	Correo               varchar(50)  NULL ,
	Relacion             varchar(20)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKCONTACTO_EMERGENCIA ON CONTACTO_EMERGENCIA
( 
	idContactoEmergencia  ASC
)
go



CREATE TABLE DEPARTAMENTO
( 
	IdDepartamento       int IDENTITY ( 1,1 ) ,
	Departamento         varchar(30)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKDEPARTAMENTO ON DEPARTAMENTO
( 
	IdDepartamento        ASC
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
	IdAtencion           int IDENTITY ( 1,1 ) ,
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



CREATE UNIQUE CLUSTERED INDEX XPKDIAGNOSTICO ON DIAGNOSTICO
( 
	IdAtencion            ASC
)
go



CREATE UNIQUE NONCLUSTERED INDEX XIF1DIAGNOSTICO ON DIAGNOSTICO
( 
	IdAtencion            ASC
)
go



CREATE TABLE DISTRITO
( 
	IdDistrito           int IDENTITY ( 1,1 ) ,
	Distrito             varchar(30)  NOT NULL ,
	IdProvincia          int  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKDISTRITO ON DISTRITO
( 
	IdDistrito            ASC
)
go



CREATE NONCLUSTERED INDEX XIF1DISTRITO ON DISTRITO
( 
	IdProvincia           ASC
)
go



CREATE TABLE DOCTOR
( 
	IdDoctor             int IDENTITY ( 1,1 ) ,
	IdEspecialidad       tinyint  NOT NULL ,
	Nombre               varchar(50)  NOT NULL ,
	Telefono             char(9)  NULL ,
	Correo               varchar(50)  NULL ,
	Estado               varchar(20)  NULL ,
	DNI                  char(8)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKDOCTOR ON DOCTOR
( 
	IdDoctor              ASC
)
go



CREATE NONCLUSTERED INDEX XIF1DOCTOR ON DOCTOR
( 
	IdEspecialidad        ASC
)
go



CREATE TABLE ENFERMEDAD
( 
	idEnfermedad         int IDENTITY ( 1,1 ) ,
	nombre               varchar(20)  NULL ,
	descripcion          varchar(40)  NULL ,
	sintomas             varchar(50)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKENFERMEDAD ON ENFERMEDAD
( 
	idEnfermedad          ASC
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



CREATE UNIQUE CLUSTERED INDEX XPKENFERMEDAD_DIAGNOSTICADA ON ENFERMEDAD_DIAGNOSTICADA
( 
	IdPaciente            ASC,
	idEnfermedad          ASC
)
go



CREATE NONCLUSTERED INDEX XIF1ENFERMEDAD_DIAGNOSTICADA ON ENFERMEDAD_DIAGNOSTICADA
( 
	IdPaciente            ASC
)
go



CREATE NONCLUSTERED INDEX XIF2ENFERMEDAD_DIAGNOSTICADA ON ENFERMEDAD_DIAGNOSTICADA
( 
	IdDoctor              ASC
)
go



CREATE NONCLUSTERED INDEX XIF3ENFERMEDAD_DIAGNOSTICADA ON ENFERMEDAD_DIAGNOSTICADA
( 
	idEnfermedad          ASC
)
go



CREATE NONCLUSTERED INDEX XIF4ENFERMEDAD_DIAGNOSTICADA ON ENFERMEDAD_DIAGNOSTICADA
( 
	IdAtencion            ASC
)
go



CREATE TABLE ESPECIALIDAD
( 
	IdEspecialidad       tinyint IDENTITY ( 1,1 ) ,
	Especialidad         varchar(30)  NOT NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKESPECIALIDAD ON ESPECIALIDAD
( 
	IdEspecialidad        ASC
)
go



CREATE TABLE ESTADO_ATENCION
( 
	IdEstado             tinyint IDENTITY ( 1,1 ) ,
	Estado               varchar(40)  NOT NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKESTADO ON ESTADO_ATENCION
( 
	IdEstado              ASC
)
go



CREATE TABLE INSTITUCION
( 
	IdInstitucion        smallint IDENTITY ( 1,1 ) ,
	Nombre               varchar(50)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKINSTITUCION ON INSTITUCION
( 
	IdInstitucion         ASC
)
go



CREATE TABLE INSTITUCION_EXTERNA
( 
	IdInstitucionExterno int IDENTITY ( 1,1 ) ,
	Institucion          varchar(40)  NOT NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKEXTERNOS ON INSTITUCION_EXTERNA
( 
	IdInstitucionExterno  ASC
)
go



CREATE TABLE PACIENTE
( 
	IdPaciente           bigint IDENTITY ( 1,1 ) ,
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



CREATE UNIQUE CLUSTERED INDEX XPKPACIENTE ON PACIENTE
( 
	IdPaciente            ASC
)
go



CREATE NONCLUSTERED INDEX XIF1PACIENTE ON PACIENTE
( 
	IdTipoPaciente        ASC
)
go



CREATE NONCLUSTERED INDEX XIF3PACIENTE ON PACIENTE
( 
	IdDistrito            ASC
)
go



CREATE NONCLUSTERED INDEX XIF4PACIENTE ON PACIENTE
( 
	idContactoEmergencia  ASC
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



CREATE UNIQUE CLUSTERED INDEX XPKPACIENTE_ANTECEDENTE ON PACIENTE_ANTECEDENTE
( 
	IdAntecedente         ASC,
	IdPaciente            ASC
)
go



CREATE NONCLUSTERED INDEX XIF1PACIENTE_ANTECEDENTE ON PACIENTE_ANTECEDENTE
( 
	IdAntecedente         ASC
)
go



CREATE NONCLUSTERED INDEX XIF2PACIENTE_ANTECEDENTE ON PACIENTE_ANTECEDENTE
( 
	IdPaciente            ASC
)
go



CREATE TABLE PROVINCIA
( 
	IdProvincia          int IDENTITY ( 1,1 ) ,
	Provincia            varchar(30)  NOT NULL ,
	IdDepartamento       int  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKPROVINCIA ON PROVINCIA
( 
	IdProvincia           ASC
)
go



CREATE NONCLUSTERED INDEX XIF1PROVINCIA ON PROVINCIA
( 
	IdDepartamento        ASC
)
go



CREATE TABLE REFERENCIA
( 
	IdReferencia         int IDENTITY ( 1,1 ) ,
	DoctorExterno        varchar(50)  NOT NULL ,
	FechaHoraReferencia  datetime  NOT NULL ,
	IdInstitucionExterno int  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKREFERENCIA ON REFERENCIA
( 
	IdReferencia          ASC
)
go



CREATE NONCLUSTERED INDEX XIF1REFERENCIA ON REFERENCIA
( 
	IdInstitucionExterno  ASC
)
go



CREATE TABLE SERVICIO
( 
	IdServicio           tinyint IDENTITY ( 1,1 ) ,
	IdTipoServicio       tinyint  NULL ,
	CostoActual          money  NOT NULL ,
	Descripcion          varchar(40)  NOT NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKSERVICIO ON SERVICIO
( 
	IdServicio            ASC
)
go



CREATE NONCLUSTERED INDEX XIF1SERVICIO ON SERVICIO
( 
	IdTipoServicio        ASC
)
go



CREATE TABLE TIPO_ANTECEDENTE
( 
	IdTipo               smallint IDENTITY ( 1,1 ) ,
	Tipo                 varchar(25)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKTIPO_ANTECEDENTE ON TIPO_ANTECEDENTE
( 
	IdTipo                ASC
)
go



CREATE TABLE TIPO_ATENCION
( 
	IdTipoAtencion       tinyint IDENTITY ( 1,1 ) ,
	TipoAtencion         varchar(30)  NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKTIPO_ATENCION ON TIPO_ATENCION
( 
	IdTipoAtencion        ASC
)
go



CREATE TABLE TIPO_PACIENTE
( 
	IdTipoPaciente       tinyint IDENTITY ( 1,1 ) ,
	TipoPaciente         varchar(30)  NOT NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKTIPO_PACIENTE ON TIPO_PACIENTE
( 
	IdTipoPaciente        ASC
)
go



CREATE TABLE TIPO_SERVICIO
( 
	IdTipoServicio       tinyint IDENTITY ( 1,1 ) ,
	TipoServicio         varchar(30)  NOT NULL 
)
go



CREATE UNIQUE CLUSTERED INDEX XPKTIPO_SERVICIO ON TIPO_SERVICIO
( 
	IdTipoServicio        ASC
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


