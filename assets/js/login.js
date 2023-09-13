document.addEventListener("DOMContentLoaded", () => {

    const botonIniciarSesion = document.querySelector("#iniciar");
    const textPassword = document.querySelector("#claveacceso");

    function validarDatos(){
        const usuario = document.querySelector("#nombreusuario");
        const claveacceso = document.querySelector("#claveacceso");

        const parametros = new URLSearchParams();
        parametros.append("operacion", "login")
        parametros.append("usuario", usuario.value)
        parametros.append("claveIngresada", claveacceso.value)
        fetch(`./controllers/usuario.controllers.php`, {
            method: 'POST',
            body: parametros
        })
            .then(respuesta => respuesta.json())
            .then(datos => {
                if (!datos.status){
                    Swal.fire({
                        title: datos.mensaje,
                        allowOutsideClick: false,
                    });
                    //alert(datos.mensaje);
                    usuario.focus();
                } else {
                    Swal.fire({
                        backdrop: 'true',
                        timerProgressBar: 'true',
                        position: 'top-end',
                        icon: 'success',
                        title: `Bienvenido: <b>${datos.nombreusuario}</b>` + `<br><br>`+ `Nivel Acceso: <b>${datos.nivelacceso}</b>`,
                        showConfirmButton: false,
                        timer: 1500,
                        toast: true,
                    }).then((datos) =>{
                        window.location.href = './views/dashboard.php';
                    })
                }
            })
            .catch(error => {
                console.log(error);
            })
    }

    textPassword.addEventListener("keypress", (evt) => {
       if (evt.charCode == 13) validarDatos();
    });
    botonIniciarSesion.addEventListener("click", validarDatos);
});