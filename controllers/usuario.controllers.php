<?php
session_start();
$_SESSION["login"] = [];

require_once '../models/usuario.models.php';

if (isset($_POST['operacion'])){
    $usuario = new Usuario();

    if ($_POST['operacion'] == 'login'){
        //buscamos al usuario a traves de su nombre
        $datoObtenido = $usuario->login($_POST['usuario']);
        //arreglo que contiene datos de login
        $resultado = [
            "status" => false,
            "nombreusuario" => "",
            "correo" => "",
            "nivelacceso" => "",
            "mensaje" => ""
        ];

        if ($datoObtenido){
            //encontramos el registro
            $claveEncriptada = $datoObtenido['claveacceso'];
            if (password_verify($_POST['claveIngresada'], $claveEncriptada)){
                //clave correcta
                $resultado["status"] = true;
                $resultado["nombreusuario"] = $datoObtenido["nombreusuario"];
                $resultado["correo"] = $datoObtenido["correo"];
                $resultado["nivelacceso"] = $datoObtenido["nivelacceso"];
            } else {
                //clave incorrecta
                $resultado["mensaje"] = "Contraseña incorrecta";
            }
        } else {
            //usuario no encontrado
            $resultado["mensaje"] = "no se encuentra al usuario";
        }
        $_SESSION["login"] = $resultado;

        echo json_encode($resultado);
    }
}

if (isset($_GET['operacion']) == 'destroy'){
    session_destroy();
    session_unset();
    header("location: ../login.php");
}

?>