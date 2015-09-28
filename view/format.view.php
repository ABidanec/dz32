<?php
$pdo = new Db();
$tables = $pdo->showTables();
$types = array('xml','json','csv');

if($_GET['table'] or $_GET['format']){
    $format = trim(strip_tags($_GET['format']));
    $table = trim(strip_tags($_GET['table']));
    $data = $pdo->selectTable($table);
    switch ($format){
        case 'xml':
            $nameFile = $table.'.xml';
            $f = new XmlGenerate($nameFile,'utf-8', '1.0');
            $f->createXml($table,mb_substr($table,1),$data);
            break;
        case 'json':
            $nameFile = $table.'.json';
            $f = new JsonGenerate( $nameFile);
            $f->createJsonFile($data);
            break;
        case 'csv':
            $nameFile = $table.'.csv';
            $f = new CSVGenerate($nameFile);
            $f->createCSVFile($data,$pdo->keyTable($data),',');
            break;
        default:
            require_once 'default.view.php';
            break;
    }
}


?>
<form action="<?=$_SERVER['PHP_SELF']?>" method="get">
    <fieldset>
        <input name="action" value="format" type="hidden">
        <p>Выбрать таблицу:
            <select name="table">
                <?php
                foreach($tables as $tb){
                    echo "<option value='{$tb}'>{$tb}</option>";
                }
                ?>
            </select>
        </p>
        <p>Выбрать формат файла:
            <select name="format">
                <?php
                foreach ($types as $tp) {
                    echo "<option value='{$tp}'>{$tp}</option>";
                }

                ?>
            </select>
        </p>
        <input type="submit" value="Send">
    </fieldset>
</form>
<hr>
<p>Ссылки на скачивание файлов</p>
<?php
$fm = new FileManager('format');
if($fm->getFilesList()):
foreach ($fm->getFilesList() as $file) {
    echo "<a href='format/{$file}'>{$file}</a><br>";
}
else:
    echo "Файлы не найдены";
endif;