<?php
if($_GET['file']) {
    $nameFile = trim(strip_tags($_GET['file']));
    $nameFile = iconv("UTF-8", "WINDOWS-1251", $nameFile);
    var_dump($nameFile);

    if(is_file('files/'.$nameFile)){
        $file = fopen('files/'.$nameFile,"a+");
?>

<form action="<?$_SERVER['PHP_SELF']?>" method="post">
    <fieldset>
        <p>Содержимое файла <?=iconv("WINDOWS-1251", "UTF-8", $nameFile)?>:<br>
            <textarea name="data" cols="80" rows="20">
                <?php
                if($_POST['data']) {
                    $file = fopen('files/' . $nameFile, "w+");
                    $data = trim(strip_tags($_POST['data']));
                    fwrite($file, $data);
                }


                foreach (file('files/'.$nameFile) as $str) {
                    echo $str;
                }

                ?>
            </textarea>
        </p>
        <input type="submit" value="Send">
    </fieldset>
</form>
<?php
} else{
        echo "Такого файла не существует";
    }
}
    echo "<h2>Содержимое файла ".iconv("WINDOWS-1251", "UTF-8", $nameFile)."</h2>";
    foreach (file('files/'.$nameFile) as $str) {
        echo $str."<br>";
    }
?>