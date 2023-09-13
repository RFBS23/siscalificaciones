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