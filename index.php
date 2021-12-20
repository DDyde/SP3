<?php
    if(!isset($_POST["sended"])):
        require "form3.html";
    else:
        require "db.php";
        $form = ($_POST["form"]);
        switch($form){
            case 1:
                $qr = "SELECT 'Имя','Пол', 'Возрост', 'Департамент', 'Должность', 'Наличие детей', 'Кол-во детей', 'Опыт работы', 'Зарплата' UNION
                SELECT * FROM zapros1
                WHERE gender = :gender
                AND age = :age
                AND salary = :salary
                AND department = :dep
                AND position = :pos
                AND have_children = :hChild
                AND amount_children = :aChild
                AND work_exp = :work_exp";
                $pr = array(
                    "gender" => $_POST["gender"],
                    "age" => $_POST["age"],
                    "salary" => $_POST["salary"],
                    "dep" => $_POST["dep"],
                    "pos" => $_POST["pos"],
                    "hChild" => $_POST["hChild"],
                    "aChild" => $_POST["aChild"],
                    "work_exp" => $_POST["work_exp"]  
                );
                break;
            case 2:
                $qr = "SELECT 'Номер бригады','Кол-во работников в бригаде', 'Зарплата(сред.)' UNION
                SELECT * FROM zapros2
                WHERE brigades_num = :bNum
                AND average_salary = :aSalary";
                $pr = array(
                    "bNum" => $_POST["bNum"],
                    "aSalary" => $_POST["aSalary"]         
                );
                break;
            case 3:
                $qr = "SELECT 'Имя','Медецинский статус', 'Дата мед.проверки', 'Пол', 'Возрост', 'Зарплата' UNION
                SELECT * FROM zapros3
                WHERE gender = :gender
                AND age = :age
                AND salary = :salary";
                $pr = array(
                    "gender" => $_POST["gender"],
                    "age" => $_POST["age"],
                    "salary" => $_POST["salary"]          
                );
                break;
            case 4:
                $qr = "SELECT 'Бренд','Модель', 'Время прилета', 'Время ожидания', 'Кол-во рейсов', 'Аэропорт' UNION
                SELECT * FROM zapros4
                WHERE arrived_time = :arrTime
                AND parking_time = :parkTime
                AND amount_flight = :amFlight";
                $pr = array(
                    "arrTime" => $_POST["arrTime"],
                    "parkTime" => $_POST["parkTime"],
                    "amFlight" => $_POST["amFlight"]          
                );
                break;
            case 5:
                $qr = "SELECT 'Номер самолета','Статус самолета', 'Дата проверки', 'Время ремонта', 'Нужда в ремонте',
                 'Кол-во ремонтов', 'Возрост самолета', 'Кол-во рейсов' UNION
                SELECT * FROM zapros5
                WHERE date_inspaction = :dateInsp
                AND time_repair = :timeRep
                AND amount_repair = :amRep
                AND amount_flight = :amFlight
                AND airplane_age = :ageAir";
                $pr = array(
                    "dateInsp" => $_POST["dateInsp"],
                    "timeRep" => $_POST["timeRep"],
                    "amRep" => $_POST["amRep"],
                    "amFlight" => $_POST["amFlight"],
                    "ageAir" => $_POST["ageAir"]          
                );
                break;
            case 6:
                $qr = "SELECT 'Номер рейса','Время перелета', 'цена', 'Аэропорт отправления', 'Аэропорт прибытия' UNION
                SELECT * FROM zapros6
                WHERE id_airport_departure = :airDep
                AND id_airport_arrived = :airArr
                AND travel_time = :timeTrav
                AND price = :price";
                $pr = array(
                    "airDep" => $_POST["airDep"],
                    "airArr" => $_POST["airArr"],
                    "timeTrav" => $_POST["timeTrav"],
                    "price" => $_POST["price"]          
                );
                break;
            case 7:
                $qr = "SELECT 'Номер рейса','Статус рейса', 'Аэропорт вылета', 
                'Аэропорт прилета', 'Кол-во свободных мест' UNION
                SELECT * FROM zapros7
                WHERE id_airport_departure = :airDep
                AND id_airport_arrived = :airArr
                AND free_places = :fPlaces";
                $pr = array(
                    "airDep" => $_POST["airDep"],
                    "airArr" => $_POST["airArr"],
                    "fPlaces" => $_POST["fPlaces"]          
                );
                break;
            case 8:
                $qr = "SELECT 'Номер рейса','Статус рейса', 'Причина задержание', 'Номер маршрута',
                 'Кол-во сданных билетов', 'Время задержки' UNION
                SELECT * FROM zapros8
                WHERE f_status = 'Задерживается'
                -- AND reason_for_detention = :reasDet
                 AND id_route = :routeNum
                 AND surrendered_tickets = :surrTick
                 AND delay_time = :delTime";
                 $pr = array(
                    //  "reasDet" => $_POST["reasDet"],
                     "routeNum" => $_POST["routeNum"],
                     "surrTick" => $_POST["surrTick"],
                     "delTime" => $_POST["delTime"]          
                 );
                break;
            case 9:
                $qr = "SELECT 'Номер рейса','Тип самолета','Продано билетов', 'Номер маршрута', 'Время перелета', 'Цена', 'Время вылета' UNION
                SELECT * FROM zapros9
                WHERE type = :type
                AND sold_tickets = :soldTick
                AND id_route = :routeNum
                AND travel_time = :travTime
                AND price = :price
                AND departure_time = :depTime";
                $pr = array(
                    "soldTick" => $_POST["soldTick"],
                    "routeNum" => $_POST["routeNum"],
                    "travTime" => $_POST["travTime"],
                    "price" => $_POST["price"],
                    "depTime" => $_POST["depTime"],
                    "type" => $_POST["type"]          
                );
                break;
            case 10:
                $qr = "SELECT 'Номер рейса','Тип рейса', 'Страна(сокр.)', 'тип самолета' UNION
                SELECT * FROM zapros10
                WHERE flight_type = :fType
                AND airplane_type = :aType
                AND reduction = :red";
                $pr = array(
                    "fType" => $_POST["fType"],
                    "aType" => $_POST["aType"],
                    "red" => $_POST["red"]          
                );
                break;
            case 11:
                $qr = "SELECT 'Имя','Номер рейса', 'День вылета', 'Тип рейса', 'Статус рейса', 'Пол', 'Возрост' UNION
                SELECT * FROM zapros11
                WHERE departure_days = :depDays
                AND baggage_status = :bagStatus
                AND gender = :gender
                AND age = :age
                AND flight_num = :fNum";
                $pr = array(
                    "fNum" => $_POST["fNum"],
                    "gender" => $_POST["gender"],
                    "age" => $_POST["age"],
                    "bagStatus" => $_POST["bagStatus"],
                    "depDays" => $_POST["depDays"]          
                );
                break;
            case 12:
                $qr = "SELECT 'Номер рейса','Свободных мест', 'Зарез. мест', 'День вылета',
                 'Аэропорт вылета', 'Аэропорт прилета', 'Цена', 'Время вылета' UNION
                SELECT * FROM zapros12
                WHERE departure_days = :depDays
                AND id_airport_departure = :airDep
                AND id_airport_arrived = :airArr
                AND price = :price
                AND departure_time = :depTime
                AND flight_num = :fNum";
                $pr = array(
                    "fNum" => $_POST["fNum"],
                    "airDep" => $_POST["airDep"],
                    "airArr" => $_POST["airArr"],
                    "price" => $_POST["price"],
                    "depDays" => $_POST["depDays"],
                    "depTime" => $_POST["depTime"]          
                );
                break;
            case 13:
                $qr = "SELECT 'Номер рейса','Кол-во сданных билетов', 'Дата вылета', 'Аэропорт отправления',
                 'Аэропорт прибытия', 'Цена', 'Возрост', 'Пол' UNION
                SELECT * FROM zapros13
                WHERE gender = :gender
                AND age = :age
                AND departure_days = :depDays
                AND id_airport_departure = :airDep
                AND id_airport_arrived = :airArr
                AND price = :price";
                $pr = array(
                    "gender" => $_POST["gender"],
                    "age" => $_POST["age"],
                    "depDays" => $_POST["depDays"],
                    "airDep" => $_POST["airDep"],
                    "airArr" => $_POST["airArr"],
                    "price" => $_POST["price"]        
                );
                break;
        }
        $rs = db::getAll($qr, $pr); ?>
        <table>
            <?php foreach($rs as $row): ?>
                <tr>
                    <?php foreach($row as $cell => $value): ?>
                        <td><?=$value?></td>
                    <?php endforeach; ?>
                </tr>
            <?php endforeach; ?>
        </table>
    <?php endif; ?>