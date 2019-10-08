<?php

session_start();

require 'conexion/database.php';

if (isset($_SESSION['user_id'])) {
    $records = $conn->prepare('SELECT id, email, password FROM users WHERE id = :id');
    $records->bindParam(':id', $_SESSION['user_id']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $user = null;

    if (count($results) > 0) {
        $user = $results;

    }
    //header('Location: principal.php');
} else{
    header('Location: login.php');
};

?>
<?php //session_start();?>
<!DOCTYPE html>
<html lang="es">
<head>
    <!-- HTML:5 -->
    <?php include 'partials/head.php';?>
    <!-- BOOTSTRAP & JQUERY -->
    <?php include 'partials/bootstrap.php';?>
    <!-- SCRIPTS -->
    <?php include 'partials/scripts.php';?>
    <title>Dibujar Parcelas</title>
</head>
<body>
    <!-- NAV BAR -->
    <?php include 'partials/navbar.php';?>
    
    <section id="seccionMapa">
        
        <h2 id="#tituloLog">Utiliza el mouse para dibujar la parcela</h2>
        
        
        <div style="background-color: beige" id="container">	

            <div id="StationList">
                <input id="actionButton" type="button" value="Borrar parcela">
                <div>
                    <ul id="listOverlay"> 
                    </ul>
                </div>

                <div id="botones">
                    <button id="guardar">Guardar Parcela</button>
                    <a href="misParcelas.php" ><button id="finalizar">Finalizar Carga</button></a>
                </div>
            </div>


                <div id="map">
                </div>

        </div>

    </section>







    <!-- FOOTER -->
    <?php include 'partials/footer.php';?>

    <link rel="stylesheet" href="css/styles.css">
    
    
    <script type="text/javascript" src="js/DibujarParcelas.js"></script>
    
</body>
</html>