<?php
/**
 * Created by PhpStorm.
 * User: Александр
 * Date: 08.09.2015
 * Time: 10:31
 */

class FileManager{
    private $arrayFileName;
    private $filesList;

    /**
     * @param $nameDir - Имя каталога где размещаются файлы
     * метод записывает в массив $filesList список файлов в каталоге
     */
    function __construct($nameDir){
        $dir = opendir($nameDir);
        while (false !== ($marker = readdir($dir))) {
            if($marker === '.' or $marker === '..') continue;

            $this->filesList[] = $marker;
        }
    }
    function getFilesList(){
        return $this->filesList;
    }

    function getListA(){
        echo '<ul>';
        if(!is_null($this->filesList)) {

            foreach ($this->filesList as $f) {
                $f = iconv("WINDOWS-1251","UTF-8", $f);
                echo "<li>" . $f . "
                <a href='?action=write&file=" . $f . "'>Редактировать</a>
                <a href='?action=delete&file=" . $f . "'>Удалить</a> </li>";
            }
            echo '</ul>';
        }else{
            echo "<p>В данном каталоге файлов не найдено</p>";
        }
    }
}