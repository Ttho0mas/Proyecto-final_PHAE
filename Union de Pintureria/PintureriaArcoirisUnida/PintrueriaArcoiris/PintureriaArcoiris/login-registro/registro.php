
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilo-rl.css">
    <script src="jsver.js"></script>
    <title>Registro</title>
</head>

<body >
<div class="cont-reglog">

    <div class="cont">

    <button onclick="vercontenido()"class="cerrar-reglog">✕</button>
       
        <form action="registro.php" method="post">
            <h2>REGISTRO |<a href="login.php"> INICIAR SESION</a></h2>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required>
            
            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="correo" required>
            
            
            <label for="password">Contraseña:</label>
            <div class="password-cont">
            <input type="password" id="password" name="password" required>
            <span id='ver'><img src="/PHAE/PintureriaArcoiris/iconos/ver.png" alt="icono ojo"></span>
            </div>
            
            <button type="submit">REGISTRARSE</button>
        </form>
  
    <?php
 
    session_start();
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_SESSION['registro'] = $_POST['registro'];

            header('Location:registro.php');
        }
   
    $db = mysqli_connect("localhost", "root", "", "bd_pintureriaarcoiris") or die ("Error al conectar con el Servidor");

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    @$nombreu = mysqli_real_escape_string($db, $_POST['nombre']." ".$_POST['apellido']);
    @$correo = mysqli_real_escape_string($db, $_POST['correo']);
    @$password = mysqli_real_escape_string($db, $_POST['password']);

  
    $consulta = "SELECT * FROM usuarios WHERE correo = '$correo'";
    $resultado = mysqli_query($db, $consulta);

    if (mysqli_num_rows($resultado) > 0) {
        echo "<p> ⚠️ El Correo electronico ya consta con una cuenta en esta pagina. Por favor, verifique los datos</p>";
    }

   
    $consulta = "INSERT INTO usuarios (correo, password, nombreu) VALUES ('$correo', '$password', '$nombreu')";
    if (mysqli_query($db, $consulta)) {
        echo "Registro exitoso. Ahora puede <a href='login.php'>iniciar sesión</a>.";
    } else {
        echo "Error: " . $consulta . "<br>" . mysqli_error($db);
    }

   
    mysqli_close($db);
    }
    ?>
    </div>


</body>
</html>

