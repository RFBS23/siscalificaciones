CREATE DATABASE Olympus;

USE Olympus;

CREATE TABLE personas
(
	idpersona			INT AUTO_INCREMENT PRIMARY KEY,
	nombres				VARCHAR(50) 	NOT NULL,
	apellidos			VARCHAR(50) 	NOT NULL,
	sexo					VARCHAR(20) 	NOT NULL,
	telefono				CHAR(9) 	NOT NULL,
	correo				VARCHAR(40) 	NOT NULL,
	direccion			VARCHAR(100) 	NOT NULL,
	fechaNacimiento	DATE    	NOT NULL,
	tipoDocumento		CHAR(3) 	NOT NULL,
	numeroDocumento	CHAR(12)	NOT NULL,
	CONSTRAINT uk_personas_pe UNIQUE(numeroDocumento),
	CONSTRAINT uk_persona_pe UNIQUE(correo)
)ENGINE = INNODB;

CREATE TABLE usuarios
(
	idusuario			INT AUTO_INCREMENT PRIMARY KEY,
	idpersona			INT 		NOT NULL,
	nombreusuario		VARCHAR(100) 	NOT NULL,
	claveacceso			VARCHAR(200) 	NOT NULL,
	nivelacceso			VARCHAR(14) 	NOT NULL DEFAULT 'Administrador',
	estado				CHAR(1) 	NOT NULL DEFAULT '1',
	CONSTRAINT fk_idpersona_usu FOREIGN KEY (idpersona) REFERENCES personas (idpersona),
	CONSTRAINT uk_usuario_usu UNIQUE (nombreusuario),
	CONSTRAINT uk_usuario_us CHECK(nivelacceso IN ('Administrador', 'Invitado'))
)ENGINE = INNODB;

CREATE TABLE docentes
(
	iddocente			INT AUTO_INCREMENT PRIMARY KEY,
	idpersona			INT 		NOT NULL,
	especialidad		VARCHAR(100) 	NOT NULL,
	cv						VARCHAR(100) 	NOT NULL,
	numEmergencia		CHAR(9) 	NOT NULL,
	CONSTRAINT fk_idpersona_doc FOREIGN KEY (idpersona) REFERENCES personas (idpersona)

)ENGINE = INNODB; 

CREATE TABLE cursos
(
	idcurso				INT AUTO_INCREMENT PRIMARY KEY,
	nombrecurso			VARCHAR(50)

)ENGINE = INNODB;

CREATE TABLE modulos
(
	idmodulo 			INT AUTO_INCREMENT PRIMARY KEY,
	fechainicio			DATE 		NOT NULL,
	fechafin				DATE 		NOT NULL,
	precioregular		DECIMAL(7,2) 	NOT NULL,
	preciopromocional 	DECIMAL(7,2) 	NOT NULL

)ENGINE = INNODB;

CREATE TABLE detalles
(
	iddetalle			INT AUTO_INCREMENT PRIMARY KEY,
	idmodulo 			INT NOT NULL,
	idcurso				INT 	NOT NULL,
	iddocente			INT 	NOT NULL,
	dia					DATE 	NOT NULL,
	horainicio			TIME 	NOT NULL,
	horafin				TIME 	NOT NULL,
	CONSTRAINT fk_idmodulo_det FOREIGN KEY (idmodulo) REFERENCES modulos (idmodulo),
	CONSTRAINT fk_iddocente_det FOREIGN KEY (iddocente) REFERENCES docentes (iddocente),
	CONSTRAINT fk_idcurso_det FOREIGN KEY (idcurso) REFERENCES cursos (idcurso)
)ENGINE = INNODB;

CREATE TABLE listaalumnos
(
	idlistaalumno		INT AUTO_INCREMENT PRIMARY KEY,
	iddetalle			INT NOT NULL,
	idpersona			INT NOT NULL,
	CONSTRAINT fk_iddetalle_lis FOREIGN KEY (iddetalle) REFERENCES detalles (iddetalle),
	CONSTRAINT fk_idpersona_lis FOREIGN KEY (idpersona) REFERENCES personas (idpersona)

)ENGINE = INNODB;

CREATE TABLE asistenciaalumnos
(
    idasistencia 		INT AUTO_INCREMENT PRIMARY KEY,
    idalumno 			INT NOT NULL,
    iddetalle 			INT NOT NULL,
    fechaasistencia 	DATE NOT NULL,
    estadoasistencia VARCHAR(20) NOT NULL,
    CONSTRAINT fk_idalumno FOREIGN KEY (idalumno) REFERENCES personas (idpersona),
    CONSTRAINT fk_iddetalle FOREIGN KEY (iddetalle) REFERENCES detalles (iddetalle)
)ENGINE = INNODB;

CREATE TABLE evaluacion
(	
	idevaluacion		INT AUTO_INCREMENT PRIMARY KEY,
	iddetalle			INT 		NOT NULL,
	tipo					VARCHAR(20) 	NOT NULL,
	peso					VARCHAR(4) 	NOT NULL, -- mano nose como hacer este de peso en porcentaje lo haces p si es que sabes --
	CONSTRAINT fk_iddetalle_eva FOREIGN KEY (iddetalle) REFERENCES detalles (iddetalle)
)ENGINE = INNODB;

CREATE TABLE resultado
(
	idresultado			INT AUTO_INCREMENT PRIMARY KEY,
	idevaluacion		INT 	NOT NULL,
	idpersona			INT 	NOT NULL,
	calificacion		VARCHAR(5),
	estado				BIT 	NOT NULL DEFAULT 1,
	CONSTRAINT fk_idevaluacion_res FOREIGN KEY (idevaluacion) REFERENCES evaluacion (idevaluacion),
	CONSTRAINT fk_idpersona_res FOREIGN KEY (idpersona) REFERENCES personas (idpersona)

)ENGINE = INNODB;

CREATE TABLE matriculas
(
	idmatricula			INT AUTO_INCREMENT PRIMARY KEY,
	idalumno				INT 		NOT NULL,
	idapoderado			INT 		NOT NULL,
	idmodulo				INT 		NOT NULL,
	fechamatricula		DATE 		NOT NULL,
	precioacordado		DECIMAL(7,2) 	NULL,
	observacion			VARCHAR(200) 	NULL,
	CONSTRAINT fk_idalumno_mat FOREIGN KEY (idalumno) REFERENCES personas (idpersona),
	CONSTRAINT fk_idpersona_mat FOREIGN KEY (idapoderado) REFERENCES personas (idpersona),
	CONSTRAINT fk_idmodulo_mat FOREIGN KEY (idmodulo) REFERENCES modulos (idmodulo)

)ENGINE = INNODB;

CREATE TABLE formaspago
(
	idformapago			INT AUTO_INCREMENT PRIMARY KEY,
	formapago			VARCHAR(100) 	NOT NULL

)ENGINE = INNODB;

CREATE TABLE pagos
(
	idpago				INT AUTO_INCREMENT PRIMARY KEY,
	idmodulo				INT 		NOT NULL,
	idmatricula			INT 		NOT NULL,
	idformapago			INT 		NOT NULL,
	monto					DECIMAL(7,2) 	NOT NULL,
	fechapago			DATE 		NOT NULL,
	CONSTRAINT fk_idmodulo_pag FOREIGN KEY (idmodulo) REFERENCES modulos (idmodulo),
	CONSTRAINT fk_idmatricula_pag FOREIGN KEY (idmatricula) REFERENCES matriculas (idmatricula),
	CONSTRAINT fk_idformapago_pag FOREIGN KEY (idformapago) REFERENCES formaspago (idformapago)

)ENGINE = INNODB;
















