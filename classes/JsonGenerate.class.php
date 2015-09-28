<?php
/**
 * Created by PhpStorm.
 * User: Александр
 * Date: 02.09.2015
 * Time: 18:47
 */

class JsonGenerate {
    private $nameFile; // имя создаваемого файла

    /**
     * @param $nameFile - устанавливает имя создаваемого файла
     */
    function __construct($nameFile){
        $this->nameFile = $nameFile;
    }

    /**
     * @param $data массив данных, выгруженых с таблицы БД
     */
    function createJsonFile($data){
      $d = json_encode($data);
      $file = fopen('format/'.$this->nameFile,'a+');
        fwrite($file,$d);
        fclose($file);
    }
}