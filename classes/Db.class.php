<?php
/**
 * Created by PhpStorm.
 * User: Александр
 * Date: 02.09.2015
 * Time: 8:49
 */

class Db {
    const DB_TYPE = 'mysql';
    const DB_NAME = 'iCatalog5';
    const DB_HOST = 'localhost';
    const DB_USER = 'root';
    const DB_PASS = '';

    private $pdo;

    /**
     * устанавливается и возвращается соединение с БД
     * конфигурация в константах
     */
    function __construct(){
        try{
            $this->pdo = new PDO(self::DB_TYPE.':dbhost='.self::DB_HOST.';dbname='.self::DB_NAME,self::DB_USER,self::DB_PASS);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            $this->pdo->exec('SET NAMES "utf8"');
            return $this->pdo;
        }catch (PDOException $e){
            echo '<p>It is not possible to connect to the database. Error '.$e->getMessage().'</p>';
            exit;
        }
    }

    /**
     * @return array - массив с названиями всех таблиц БД
     */
    function showTables(){
        try{
            $sql = 'SHOW TABLES';
            $result = $this->pdo->query($sql);
        }catch (PDOException $e){
            die('Error select name table database '.$e->getMessage());
        }

        while($row = $result->fetch()){
            $tName[] = $row;
        }
        foreach($tName as $tn){
            $tableName[] = $tn['Tables_in_'.strtolower(self::DB_NAME)];
        }
        return $tableName;

    }

    /**
     * @param $tName - имя таблицы
     * @return array - передаем результирующий массив массивов с данными
     */
    function selectTable($tName){
        try{
            $tableName = trim(strip_tags($tName));
            $sql = "SELECT * FROM ".$tableName;
            $stmt = $this->pdo->query($sql);
        }catch (PDOException $e){
            die('Error select from database '.$e->getMessage());
        }

        while($row = $stmt->fetch()){
            $data[] = $row;
        }
            return $data; // передаем результирующий массив массивов с данными
    }

    /**
     * @param $tName - имя таблицы
     */
    function showDataTable($tName){
        $data = $this->selectTable($tName);
        // отбираем названия полей таблицы


        // рисуем таблицу
        echo "<table cellspacing='1' cellpadding='1' border='1'>";
        echo '<tr>';
        // шапка
        $key = $this->keyTable($data);
        foreach ($key as $k) {
            echo "<td>".$k.'</td>';
        }
        echo '</tr>';
        // данные
        foreach ($data as $d) {
            echo '<tr>';
            foreach ($key as $k) {
                echo "<td>".$d[$k].'</td>';
            }
            echo '</tr>';
        }
        echo "</table>";
    }

    /**
     * @param $data - массив данных из таблицы SQL
     * @return array - массив строковых ключей
     */
    function keyTable($data){
        foreach(array_keys($data[0]) as $k){
            if(is_string($k)) $key[] = $k;
        }
        return $key;
    }

}