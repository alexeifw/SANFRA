<?php
$userName = '';
require 'conexion/database.php';
session_start();

if (isset($_SESSION['user_id'])) {
    header('Location:index.php');
}


if (!empty($_POST['userName']) && !empty($_POST['password'])) {
    $records = $conn->prepare('SELECT id, userName, email, password FROM users WHERE userName = :userName');
    $records->bindParam(':userName', $_POST['userName']);
    
    $records->execute();
    $results = ($records->fetch(PDO::FETCH_ASSOC));// esto esta mal     <-----
    
    $_SESSION['nombre_usuario'] = $results['userName'];
    /*
    echo '<pre>';
    print_r($results);
    echo '</pre>';
    $message = '';
    */
    if (count($results) > 0 && password_verify($_POST['password'], $results['password'])) {
    $_SESSION['user_id'] = $results['id'];
        header("Location:index.php");
    } else {
        $message = 'Sorry, those credentials do not match';
    }
    
}

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <!-- HTML:5 -->
    <?php include 'partials/head.php';?>
    <!-- BOOTSTRAP & JQUERY -->
    <?php include 'partials/bootstrap.php';?>
    <title>LogIn</title>
</head>
<body>
<h1 id="tituloLog">Sanfra, tu cuaderno de campo</h1>
    
    <section id="registrarse">
    
        
        <div id="imgRegistro">
            <img src="img/imgLog2.jpg">
        </div>
        
        <div id="formRegistro">
            <h1>Iniciar Sesion:</h1><br>
            <form action="login.php" method="POST">
                <p>Usuario:</p>
                <input name="userName" type="text" placeholder="Ingrese su Usuario">
                <p>Contarseña:</p>
                <input name="password" type="password" placeholder="Ingrese su contraseña"><br>
                <input id="botoncito" type="submit" value="Ingresar">
            </form>
            <p>¿No tienes una cuenta registrada? Haz click <a href="registro.php">AQUI</a> !</p>
        </div>

    </section>









    <!-- FOOTER -->
    <?php include 'partials/footer.php';?>



    <link rel="stylesheet" href="css/styles.css">
</body>
</html>