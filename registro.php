<?php

require 'conexion/database.php';

$message = '';

if (!empty($_POST['email']) && !empty($_POST['userName'])  && !empty($_POST['password'])) {
    $sql = "INSERT INTO users (email, userName, password) VALUES (:email, :userName, :password)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $_POST['email']);
    $stmt->bindParam(':userName', $_POST['userName']);
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $stmt->bindParam(':password', $password);
    

    if ($stmt->execute()) {
        echo'<script languaje="javascript">alert("Su usuario se creo exitosamente")</script>';
        
        header('Location: index.php');
    
    } else {
        $message = 'Lo sentimos, no se pudo completar la operacion';
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

    <title>Registrarse</title>
</head>
<body>
    
    
    <h1 id="tituloLog">Sanfra, tu cuaderno de campo</h1>
    <!-- FORMULARIO DE REGISTRO -->
<section id="registrarse">
    <div id="imgRegistro">
        <img src="img/imgRegistro3.jpg">
    </div>


    <div id="formRegistro">

        <p><h1>Registro de Usuario:</h1></p>
        <form action="registro.php" method="POST">
            
            <input name="email" type="email" placeholder="Ingrese su correo electronico">
            <input name="userName" type="text" placeholder="Ingrese un nombre de usuario">
            <input name="password" type="password" placeholder="Ingrese su contraseña">
            <input name="confirm_password" type="password" placeholder="Confirmar contraseña">
            <input id="botoncito" type="submit" value="Registrarse">
        </form>
        <p>¿Ya tienes una cuenta registrada? Haz click <a href="login.php">AQUI</a> !</p>

    </div>
</section>




<!-- FOOTER -->
<?php include 'partials/footer.php';?>



<link rel="stylesheet" href="css/styles.css">
</body>
</html>