use siscalificaciones;

DELIMITER $$
create procedure spu_usuarios_login(IN  _nombreusuario varchar(50))
begin
select 
    personas.nombres, personas.apellidos,
    usuarios.idusuario, usuarios.nombreusuario, usuarios.claveacceso, usuarios.correo
    from usuarios
    inner join personas on personas.idpersona = usuarios.idpersona
    where nombreUsuario = _nombreusuario;
END $$
call spu_usuarios_login('fabrizio');

delimiter $$
create procedure spu_personas_registrar(
	in _nombres varchar(70),
    in _apellidos varchar(70),
    in _genero varchar(50),
    in _celular char(9),
    in _direccion varchar(100),
    in _fechanacimiento date,
    in _tipodocumento char(3),
    in _numerodocumento varchar(12)
) begin
	insert into personas(nombres, apellidos, genero, celular, direccion, fechanacimiento, tipodocumento, numerodocumento) 
    values (_nombres, _apellidos, _genero, _celular, _direccion, _fechanacimiento, _tipodocumento, _numerodocumento);
end $$
call spu_personas_registrar('romina daniela', 'perez camacho', 'mujer', '987654321', 'por ahi', '2023-09-01', 'dni', '704929373');

delimiter $$
create procedure spu_personas_listar()
begin
	select
		idpersona,
        nombres,
        apellidos,
        genero,
        celular,
        direccion,
        fechanacimiento,
        tipodocumento,
        numerodocumento
        from personas
        order by idpersona DESC;
END $$
call spu_personas_listar();

CREATE PROCEDURE spu_resultadoevaluacion_registrar
(
    IN _idevaluacion INT,
    IN _idpersona INT,
    IN _calificacion VARCHAR(5)
)
BEGIN 
	INSERT INTO resultado
		(idevaluacion, idpersona, calificacion)
        VALUES(_idevaluacion, _idpersona, _calificacion);
END $$

-- Precio promocional dudas--
CREATE PROCEDURE spu_evaluaciones_registrar
(
	IN _iddetalle 	INT,
    IN _tipo		VARCHAR(20),
    IN _peso		VARCHAR(4)
)
BEGIN
	INSERT INTO evaluacion
		(iddetalle, tipo, peso)
        VALUES(_iddetalle, _tipo, _peso);
END $$

CREATE PROCEDURE spu_docentes_registrar
(
	IN _idpersona INT,
    IN _especialidad VARCHAR(100),
    IN _cv VARCHAR (100),
    IN _numEmergencia CHAR(9)
)
BEGIN
	INSERT INTO docentes
		(idpersona, especialidad, cv, numEmergencia)
        VALUES(_idpersona, _especialidad, _cv, _numEmergencia);
END $$

