
<?php
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $_SESSION['usuario'] = $_POST['usuario'] ;

        header('Location:login.php');
    }

    @$correo = $_POST['correo']; //El @ oculta errores
    @$password = $_POST['password'];

    $db=mysqli_connect("localhost","root","","bd_pintureriaarcoiris") or die ("Error al conectar con el Servidor");
	mysqli_select_db($db, "bd_pintureriaarcoiris") or die ("Error al seleccionar la Base de Datos");


    $consulta = mysqli_query($db, "SELECT * FROM usuarios WHERE correo = '$correo' AND password = '$password'");

    $coincidencias = mysqli_num_rows($consulta);

    if($coincidencias == 1){ //$coincidencias == 1
        header('Location:/PintureriaArcoiris/index.php');
    }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilo-rl.css">
    <script src="jsver.js"></script>
    <title>Iniciar Sesión</title>
</head>
<body >
 <div class="cont-reglog">

    <div class="cont">
    
    <button onclick="vercontenido()" class="cerrar-reglog">✕</button>
        <form action="login.php" method="post">
            <h2>INICIAR SESION |<a href="registro.php"> REGISTRO</a></h2>

            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="correo" required>
     

            <label for="password">Contraseña:</label>
            <div class="password-cont">
            <input type="password" id="password" name="password" required>
            <span id='ver'><img src="/PintureriaArcoiris/iconos/ver.png" alt="icono ojo"></span>
            </div>



            <div class="links">
                <a href="registro.php">¿No tienes cuenta? Presiona aquí</a>
            </div>
            
            <button type="submit">INICIAR SESION</button>
            <?php
                if(isset($_POST["correo"]) && $coincidencias != 1){
                    echo "<span class='error'>⚠️ Credenciales inválidas</span>";
                }
            ?>
        </form>

    </div>
</div>
</body>
</html>

