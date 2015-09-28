<?php

if($_POST['nameFile'] && $_POST['textFile']){
    $nameFile = trim(strip_tags($_POST['nameFile']));
    $nameFile = iconv("UTF-8","WINDOWS-1251",$nameFile);
    $textFile = trim(strip_tags($_POST['textFile']));

    if(!file_exists('files/'.$nameFile)){
       $file = fopen('files/'.$nameFile,"a+");
        fwrite($file,$textFile);
        fclose($file);
    }
}

?>

<form action="" method="post">
    <fieldset>
        <p>Имя файла: <br><input type="text" name="nameFile"></p>
        <p>Содержание файла: <br><textarea name="textFile" cols="100" rows="10"></textarea></p>
        <input type="submit" value="Send">
    </fieldset>
</form>
<hr>
<?php
if($nameFile && file_exists('files/'.$nameFile)) {
    echo "Файл <strong>".iconv("WINDOWS-1251", "UTF-8", $nameFile)."</strong> успешно создан!<br>";
    echo "Содержимое файла:";
    foreach (file('files/' . $nameFile) as $fl) {
        echo $fl.'<br>';
    }
    echo "<p><a href='/?action=list'>Перейти к списку файлов</a></p>";
}