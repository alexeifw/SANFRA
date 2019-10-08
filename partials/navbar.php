<?php

echo '<nav class="navbar navbar-expand-lg navbar-light bg-light" id="barra_navegacion_superior">          
<a id="icono" class="navbar-brand" href="index.php"><img src="img/logo.png" alt="Logotipo de la empresa SanFrA" usemap="#workmap">
</a>

<button id="boton" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse"  id="navbarSupportedContent">        
    <ul class="navbar-nav ml-auto">                  
        
        <li class="nav-item active"> 
            <a id="ej" class="nav-link" href="cuadernoDeCampo.php">Cuaderno de Campo</a>
        </li>   

        <li class="nav-item active">     
            <a class="nav-link" href="informacion.php">Informacion</a>
        </li>     

        <li class="nav-item active">     
            <a class="nav-link" href="contacto.php">Contacto</a>                                 
        </li> 



    <!-- DROPDOWN LISTA -->
    <li class="nav-item dropdown">

        <a style="color: rgb(4, 84, 255);" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        '.$_SESSION['nombre_usuario'].'</a>
        
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">

            <a class="dropdown-item" href="micuenta.php">Mi cuenta</a>

            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="salir.php">cerrar sesion</a>
        
        </div>
    
    </li>



        <!--
        <li class="nav-item active">     
            <a class="nav-link" href="salir.php">cerrar sesion</a>                               
        </li> 
        -->
    </ul>
</div>
</nav>';
?>