<?php
/**
 * Created by PhpStorm.
 * User: Александр
 * Date: 08.09.2015
 * Time: 9:52
 */
class CSVGenerate{
    private $nameFile;// имя создаваемого файла

    /**
     * @param $nameFile - устанавливает имя создаваемого файла
     */
    function __construct($nameFile){
        $this->nameFile = $nameFile;
    }

    /**
     * @param $data - данные для записи в файл в виде мессива
     * @param $headTable - массив-шапка таблицы
     * @param $split - разделитель данных CSV
     */

    function createCSVFile($data,$headTable,$split){
        $file = fopen('format/'.$this->nameFile,'w');
        fputcsv($file,$headTable,$split);

        foreach ($data as $d) {

            fputcsv($file,$d,$split);
        }
        fclose($file);
    }

}