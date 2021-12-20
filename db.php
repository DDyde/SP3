<?php
    //Объявление класса для подключения к б. д.
    class db {

        private static $host = "localhost";
        private static $port = 3306;
        private static $name = "kondakov";
        private static $db_usr = "root";
        private static $db_psw = "";
        private static $charset = "utf8";


        public static $db = null;
        public static $rs = null;
        public static $qr = "";

        private static function getDb() {
            if(!self::$db) {
                self::$db = new PDO (
                    "mysql:host=" . self::$host . ";
                    port=" . self::$port . ";
                    dbname=" . self::$name . ";
                    charset=" . self::$charset,
                    self::$db_usr,
                    self::$db_psw
                );
            }
            return self::$db;
        }

        public static function set($qr, $pr = array()) {
            self::$rs = self::getDb()->prepare($qr);
            return self::$rs->execute((array)$pr);
        }

        //Данный метод позволяет получить таблицу в виде ассоциативного массива, где каждая строка является индексом(0, 1, ..., N), а каждый столбец и ячейка представляются в виде отношения ключ => значение
        public static function getAll($qr, $pr = array()) {
            self::$rs = self::getDb()->prepare($qr);
            self::$rs->execute((array)$pr);
            return self::$rs->fetchAll(PDO::FETCH_ASSOC);
        }

        //Метод, позволяющий добавлять данные в таблицы базы данных (INSERT). Его особенность будет рассмотрена ниже
        public static function add($qr, $pr = array()) {
            self::$rs = self::getDb()->prepare($qr);
            return (self::$rs->execute((array)$pr)) ? self::getDb()->lastInsertId() : 0;
        }        
        //Получение строки из таблицы
	    public static function getRow($qr, $pr = array()) {
            self::$rs = self::getDb()->prepare($qr);
            self::$rs->execute((array)$pr);
            return self::$rs->fetch(PDO::FETCH_ASSOC);
        }

        //Получение значения из таблицы
	    public static function getId($qr, $pr = array(), $df = null) {
            self::$rs = self::getDb()->prepare($qr);
            self::$rs->execute((array)$pr);
            $result = self::$rs->fetchColumn();
            if($result == FALSE){
                return $df;
            }else{
                return $result;
            }
	    }
        //Получение столбца из таблицы
	    public static function getColumn($qr, $pr = array()) {
            self::$rs = self::getDb()->prepare($qr);
            self::$rs->execute((array)$pr);
            return self::$rs->fetchAll(PDO::FETCH_COLUMN);
	    }
        //Подсчёт строк в таблице
	    public static function rowCount($qr, $pr = array()) {
            self::$rs = self::getDb()->prepare($qr);
            self::$rs->execute((array)$pr);
            return self::$rs->rowCount();	
	    }
    }
?>