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
    ('juliana', 'quinto quintana', 'mujer', '987899241', 'por ahi', '2002/03/10', 'cde', '287654321'),
    ('fabrizio', 'barrios', 'hombre', '987653241', 'las palmeras', '2023/03/19', 'dni', '16385274');
select * from personas;

create table usuarios (
    idusuario int primary key auto_increment,
    idpersona int not null ,
    nombreusuario varchar(50) not null,
    claveacceso varchar(100) not null,
    correo varchar(90) not null,
    nivelacceso varchar(14) not null default 'administrador',
    estado char(1) not null default '1', -- 1 = activo / 0 = inactivo
    constraint uk_nomUser_usuarios unique (nombreusuario),
    constraint fk_idpersona_usuarios foreign key (idpersona) references personas(idpersona)
);
insert into usuarios (idpersona, nombreusuario, claveacceso, correo, nivelacceso) VALUES
    (2, 'juliana QQ', '123456', 'julita@gmail.com', 'estudiante'),
    (1, 'administracion', '12345', 'fabri@hotmail.com', 'administrador');

-- le actualizamos la clave 12345 (encriptado)
update usuarios set claveacceso = '$2y$10$63.J.K3knaWLWcT6EHUKr.3Xzt9n5IFmDjtirprFMma3CAzvwibv2' where idusuario = 1;
update usuarios set claveacceso = '$2y$10$S.wXCodQx/jvWnzCkp3JxOIt2n/YuW8Vk86g4Nm5Rtl88AHvGkfoK' where idusuario = 2;
update usuarios set nombreusuario = 'fabrizio' where idusuario = 1;
select * from usuarios;
