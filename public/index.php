<?php

use App\Config\ErrorLog;
use App\Config\ResponseHttp;

// ResponseHttp::headerHttpDev($_SERVER['REQUEST_METHOD']);//CORS Desarrollo
// ErrorLog::activateErrorLog();

require dirname(__DIR__) . '/vendor/autoload.php';

if (isset($_GET['route'])) {
    $url = explode('/', $_GET['route']);
    $lista = ['auth', 'user'];
    $file = dirname(__DIR__) . '/libs/Routes/' . $url[0]. '.php';

    if (!in_array($url[0], $lista)) {
        echo 'La ruta no existe';
        exit;
    }

    if (is_readable($file)) {
        require_once $file;
        exit;
    } else {
        echo 'El archivo no existe';
        exit;
    }
} else {
    echo 'No existe la variedad';
}
