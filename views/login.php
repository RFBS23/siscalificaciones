<?php
    session_start();
    $_SESSION['personas'];
?>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Acceso Administrativo</title>
    <link href="../assets/img/logo.png" rel="icon">
    <!-- Font Icon -->
    <link rel="stylesheet" href="../assets/login/fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Main css -->
    <link rel="stylesheet" href="../assets/login/css/style.css">
</head>
<body style="user-select: none;">
    <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="../assets/login/images/administracion.jpg" alt="sing up image"></figure>
                        <a href="login_estudiantes.php" class="signup-image-link">Ver Notas de Estudiantes</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Acceso Administrativo</h2>
                        <form method="POST" class="register-form" id="login-form" autocomplete="off">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="nombreuser" id="usuario" placeholder="Nombre De Usuario"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="clave" id="clave" placeholder="Contraseña"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="verpass" class="agree-term" />
                                <label for="verpass" class="label-agree-term" id="remember-me"><span><span></span></span>Ver Contraseña</label>
                            </div>

                            <div class="form-group form-button">
                                <input type="submit" name="login" id="login" class="form-submit" value="Iniciar Sesion"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- JS -->
    <script src="../assets/login/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/login/js/main.js"></script>
    <script src="../assets/login/js/clave.js"></script>
</body>
</html>