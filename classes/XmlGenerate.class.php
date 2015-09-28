<?php
class XmlGenerate{
    private $nameFile; // имя файла
    private $encode; // кодировка файла
    private $version; // версия XML

    /**
     * @param $nameFile - имя файла
     * @param $encode - кодировка файла
     * @param $version - версия XML
     */
    function __construct($nameFile,$encode,$version){
        $this->encode = $encode;
        $this->nameFile = $nameFile;
        $this->version = $version;
    }

    /**
     * @param $nameRoot - имя корня xml
     * @param $nameBigElement - имя узла в который записываются данные из массива $data
     * @param $data - массив с данными выгружеными из таблицы
     */
    function createXml($nameRoot,$nameBigElement,$data){
        // создает XML-строку и XML-документ при помощи DOM
        $dom = new DomDocument($this->version,$this->encode);

        // добавление корня
        $root = $dom->appendChild($dom->createElement($nameRoot));

        // отбираем названия полей таблицы
        foreach (array_keys($data[0]) as $k) {
            if(is_string($k)) $key[] = $k;
        }
        // формируем элементы с данными
        foreach ($data as $d) {
            //добавление элемента $nameBigElement в корень
            $bigElement = $root->appendChild($dom->createElement($nameBigElement));
            foreach ($key as $k) {
                $element = $bigElement->appendChild($dom->createElement($k));
                $element->appendChild($dom->createTextNode($d[$k]));
            }
        }
        // сохраняем результат в файл
        $dom->save('format/'.$this->nameFile);
        unset($dom);
    }
}