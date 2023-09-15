drop database if exists siscalificaciones;
create database siscalificaciones;
use siscalificaciones;

create table personas (
    idpersona int primary key auto_increment,
    nombres varchar(70) not null,
    apellidos varchar(70) not null,
    genero varchar(15) not null, -- hombre, mujer
    celular char(9) null,
    direccion varchar(100) not null,
    fechanacimiento date not null,
    tipodocumento char(3) not null, -- DNI, CE: carnet extranjeria
    numerodocumento varchar(12) not null,
    constraint uk_numerodocumento_personas unique (numerodocumento)
);

insert into personas(nombres, apellidos, genero, celular, direccion, fechanacimiento, tipodocumento, numerodocumento) values
    ('kadua felix', 'canchari mexzo', 'hombre', '951235785', 'en el arbol del costado', '1990-10-12', 'dni', '85215932'),
    ('juliana', 'quinto quintana', 'mujer', '987899241', 'por ahi', '2002-03-10', 'cde', '287654321'),
    ('fabrizio', 'barrios', 'hombre', '987653241', 'las palmeras', '2023-03-19', 'dni', '16385274');
select * from personas;

create table usuarios (
    idusuario int primary key auto_increment,
    idpersona int not null ,
    nombreusuario varchar(50) not null,
    claveacceso varchar(100) not null,
    correo varchar(90) not null,
    nivelacceso varchar(20) not null,
    estado char(1) not null default '1', -- 1 = activo / 0 = inactivo
    constraint uk_nomUser_usuarios unique (nombreusuario),
    constraint fk_idpersona_usuarios foreign key (idpersona) references personas(idpersona),
    constraint ck_nivelacceso_usuario check (nivelacceso in ('administrador', 'estudiante', 'profesor'))
);
insert into usuarios (idpersona, nombreusuario, claveacceso, correo, nivelacceso) VALUES
	(1, 'fabri', '12345', 'fabri@hotmail.com', 'administrador'),
	(2, 'juliana QQ', '123456', 'julita@gmail.com', 'estudiante'),
    (3, 'kadua CM', '12345', 'kfelix@hotmail.com', 'profesor');
    
-- le actualizamos la clave 12345 (encriptado)
update usuarios set claveacceso = '$2y$10$63.J.K3knaWLWcT6EHUKr.3Xzt9n5IFmDjtirprFMma3CAzvwibv2' where idusuario = 1;
update usuarios set claveacceso = '$2y$10$S.wXCodQx/jvWnzCkp3JxOIt2n/YuW8Vk86g4Nm5Rtl88AHvGkfoK' where idusuario = 2;
update usuarios set claveacceso = '$2y$10$LGjtp1TvVHJkdeS2ZIdEpeeCwQaEankmEcQNtkobxrNmAoQz/b9oi' where idusuario = 3;
update usuarios set nombreusuario = 'fabri bs' where idusuario = 1;
select * from usuarios;

CREATE TABLE docentes
(
	iddocente int auto_increment primary key,
	idpersona int not null,
	especialidad VARCHAR(100) NOT NULL,
	cv VARCHAR(100) NOT NULL,
	numEmergencia CHAR(9) NOT NULL,
	CONSTRAINT fk_idpersona_docentes FOREIGN KEY (idpersona) REFERENCES personas (idpersona)
); 
insert into docentes (idpersona, especialidad) values
	(3, '', '', '');
select * from docentes;

CREATE TABLE cursos
(
	idcurso	int auto_increment primary key,
	nombrecurso	VARCHAR(50)
);
insert into cursos (nombrecurso) values 
	('ciencias'),
	('letras y humanidades'),
	('oratoria');
select * from cursos;


CREATE TABLE modulos
(
	idmodulo INT AUTO_INCREMENT PRIMARY KEY,
	fechainicio	DATE NOT NULL,
	fechafin DATE NOT NULL,
	precioregular DECIMAL(7,2) NOT NULL,
	preciopromocional DECIMAL(7,2) NOT NULL

);

CREATE TABLE detalles
(
	iddetalle INT AUTO_INCREMENT PRIMARY KEY,
	idmodulo INT NOT NULL,
	idcurso	INT NOT NULL,
	iddocente INT NOT NULL,
	dia	DATE NOT NULL,
	horainicio TIME NOT NULL,
	horafin	TIME NOT NULL,
	CONSTRAINT fk_idmodulo_det FOREIGN KEY (idmodulo) REFERENCES modulos (idmodulo),
	CONSTRAINT fk_iddocente_det FOREIGN KEY (iddocente) REFERENCES docentes (iddocente),
	CONSTRAINT fk_idcurso_det FOREIGN KEY (idcurso) REFERENCES cursos (idcurso)
);

CREATE TABLE listaalumnos
(
	idlistaalumno INT AUTO_INCREMENT PRIMARY KEY,
	iddetalle INT NOT NULL,
	idpersona INT NOT NULL,
	CONSTRAINT fk_iddetalle_lis FOREIGN KEY (iddetalle) REFERENCES detalles (iddetalle),
	CONSTRAINT fk_idpersona_lis FOREIGN KEY (idpersona) REFERENCES personas (idpersona)

);

CREATE TABLE asistenciaalumnos
(
    idasistencia INT AUTO_INCREMENT PRIMARY KEY,
    idalumno INT NOT NULL,
    iddetalle INT NOT NULL,
    fechaasistencia DATE NOT NULL,
    estadoasistencia VARCHAR(20) NOT NULL,
    CONSTRAINT fk_idalumno FOREIGN KEY (idalumno) REFERENCES personas (idpersona),
    CONSTRAINT fk_iddetalle FOREIGN KEY (iddetalle) REFERENCES detalles (iddetalle),
    constraint ck_estadoasistencia check ( estadoasistencia IN ('presente', 'ausente', 'tardanza', 'justificado'))
);

CREATE TABLE evaluacion
(	
	idevaluacion INT AUTO_INCREMENT PRIMARY KEY,
	iddetalle INT NOT NULL,
	tipo VARCHAR(20) NOT NULL,
	peso VARCHAR(4) NOT NULL, -- mano nose como hacer este de peso en porcentaje lo haces p si es que sabes --
	CONSTRAINT fk_iddetalle_eva FOREIGN KEY (iddetalle) REFERENCES detalles (iddetalle)
);

CREATE TABLE resultado
(
	idresultado	INT AUTO_INCREMENT PRIMARY KEY,
	idevaluacion INT NOT NULL,
	idpersona INT NOT NULL,
	calificacion VARCHAR(5),
	estado BIT NOT NULL DEFAULT 1,
	CONSTRAINT fk_idevaluacion_res FOREIGN KEY (idevaluacion) REFERENCES evaluacion (idevaluacion),
	CONSTRAINT fk_idpersona_res FOREIGN KEY (idpersona) REFERENCES personas (idpersona)

);

CREATE TABLE matriculas
(
	idmatricula	INT AUTO_INCREMENT PRIMARY KEY,
	idalumno INT NOT NULL,
	idapoderado	INT NOT NULL,
	idmodulo INT NOT NULL,
	fechamatricula	DATE NOT NULL,
	precioacordado DECIMAL(7,2) NULL,
	observacion	VARCHAR(200) NULL,
	CONSTRAINT fk_idalumno_mat FOREIGN KEY (idalumno) REFERENCES personas (idpersona),
	CONSTRAINT fk_idpersona_mat FOREIGN KEY (idapoderado) REFERENCES personas (idpersona),
	CONSTRAINT fk_idmodulo_mat FOREIGN KEY (idmodulo) REFERENCES modulos (idmodulo)
);

CREATE TABLE formaspago
(
	idformapago	INT AUTO_INCREMENT PRIMARY KEY,
	formapago VARCHAR(100) NOT NULL
);

CREATE TABLE pagos
(
	idpago INT AUTO_INCREMENT PRIMARY KEY,
	idmodulo INT NOT NULL,
	idmatricula INT NOT NULL,
	idformapago INT NOT NULL,
	monto DECIMAL(7,2) NOT NULL,
	fechapago DATE NOT NULL,
	CONSTRAINT fk_idmodulo_pag FOREIGN KEY (idmodulo) REFERENCES modulos (idmodulo),
	CONSTRAINT fk_idmatricula_pag FOREIGN KEY (idmatricula) REFERENCES matriculas (idmatricula),
	CONSTRAINT fk_idformapago_pag FOREIGN KEY (idformapago) REFERENCES formaspago (idformapago)
);