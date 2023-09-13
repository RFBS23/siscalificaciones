<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Acceso Estudiante</title>
    <link href="assets/img/logo.png" rel="icon">
    <!-- Font Icon -->
    <link rel="stylesheet" href="assets/login/fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Main css -->
    <link rel="stylesheet" href="assets/login/css/style.css">
</head>
<body style="user-select: none;">
    <div class="main">
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Notas de Estudiantes</h2>
                        <form method="POST" class="register-form" id="register-form" autocomplete="off">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Usuario"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <select id="select" class="form-select" style="background: transparent; border-radius: .3rem; font-size: 14px; height: 30px; padding: 5px; width: 250px;">
                                    <option selected disabled>Seleccionar...</option>
                                    <option>uno</option>
                                    <option>dos</option>
                                </select>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Buscar"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="assets/login/images/estudiante.jpg" alt="sing up image"></figure>
                        <a href="login.php" class="signup-image-link">Iniciar con Administrador</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- JS -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/login/js/main.js"></script>
</body>
</html>