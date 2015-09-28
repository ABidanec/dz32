<?php
if($_GET['action' ] == 'delete' or isset($_GET[file])){
    $file = trim(strip_tags($_GET['file']));
    $file = iconv("UTF-8", "WINDOWS-1251", $file);
    unlink('files/'.$file);

    echo "<p><a href='?action=create'>Создать файл</a></p>";
    $fm = new FileManager('files');
    $fm->getListA();
}
