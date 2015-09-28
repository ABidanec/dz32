<?php
header("Content-Type: text/html; charset=utf-8");
spl_autoload_register(function($class){
    include 'classes/'.$class.'.class.php';
});
?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Create format file</title>
</head>
<body>

<?php

if($_GET) {
    $get = trim(strip_tags($_GET['action']));
}else{
    $get = false;
}
switch($get){
    case 'format':
        require_once 'view/format.view.php';
        break;
    case 'list':
        require_once 'view/list.view.php';
        break;
    case 'create':
        require_once 'view/create.view.php';
        break;
    case 'write':
        require_once 'view/write.view.php';
        break;
    case 'delete':
        require_once 'view/delete.view.php';
        break;
    default:
        require_once 'view/default.view.php';
}
?>
<p><a href="index.php">На главную</a></p>
</body>
</html>