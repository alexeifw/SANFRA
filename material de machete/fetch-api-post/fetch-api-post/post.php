<?php

$user = $_POST['user'];
$pass = $_POST['pass'];

if($user === '' || $pass === ''){
    echo json_encode('error');
} else{
    echo json_encode('acceso concedido <br>Usuario: '.$user.'<br>Password: '.$pass);
}