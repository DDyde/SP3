-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 20 2021 г., 21:43
-- Версия сервера: 10.4.21-MariaDB
-- Версия PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kondakov`
--

-- --------------------------------------------------------

--
-- Структура таблицы `airplane`
--

CREATE TABLE `airplane` (
  `id_airplane` int(11) NOT NULL,
  `id_airplane_type` int(11) DEFAULT NULL,
  `id_brigades` int(11) DEFAULT NULL,
  `airplane_num` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `airplane_age` int(11) DEFAULT NULL,
  `flight_range` int(11) DEFAULT NULL,
  `id_airplane_model` int(11) DEFAULT NULL,
  `id_airplane_brand` int(11) DEFAULT NULL,
  `id_airport` int(11) DEFAULT NULL,
  `arrived_time` time DEFAULT NULL,
  `parking_time` time DEFAULT NULL,
  `amount_flight` int(11) DEFAULT NULL,
  `amount_repair` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airplane`
--

INSERT INTO `airplane` (`id_airplane`, `id_airplane_type`, `id_brigades`, `airplane_num`, `release_date`, `airplane_age`, `flight_range`, `id_airplane_model`, `id_airplane_brand`, `id_airport`, `arrived_time`, `parking_time`, `amount_flight`, `amount_repair`) VALUES
(1, 1, 1, 13, '0000-00-00', 10, 4900, 1, 1, 2, '16:18:00', '02:10:00', 1, 5),
(2, 2, 2, 81, '0000-00-00', 15, 11000, 2, 2, 1, '11:40:00', '01:00:00', 2, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `airplane_brand`
--

CREATE TABLE `airplane_brand` (
  `id_airplane_brand` int(11) NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airplane_brand`
--

INSERT INTO `airplane_brand` (`id_airplane_brand`, `brand`) VALUES
(1, 'Airbus'),
(2, 'Boeing'),
(3, 'McDonnel-Douglas');

-- --------------------------------------------------------

--
-- Структура таблицы `airplane_model`
--

CREATE TABLE `airplane_model` (
  `id_airplane_model` int(11) NOT NULL,
  `id_airplane_brand` int(11) DEFAULT NULL,
  `model` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_passenger_seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airplane_model`
--

INSERT INTO `airplane_model` (`id_airplane_model`, `id_airplane_brand`, `model`, `num_passenger_seats`) VALUES
(1, 2, 'A320', 180),
(2, 2, '747', 162),
(3, 3, 'no', 5),
(4, 1, 'asdf', 555);

-- --------------------------------------------------------

--
-- Структура таблицы `airplane_type`
--

CREATE TABLE `airplane_type` (
  `id_airplane_type` int(11) NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airplane_type`
--

INSERT INTO `airplane_type` (`id_airplane_type`, `type`) VALUES
(1, 'Региональный'),
(2, 'Широкофюзеляжный'),
(3, 'Узкофюзеляжный');

-- --------------------------------------------------------

--
-- Структура таблицы `airport`
--

CREATE TABLE `airport` (
  `id_airport` int(11) NOT NULL,
  `id_country` int(11) DEFAULT NULL,
  `airport` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airport`
--

INSERT INTO `airport` (`id_airport`, `id_country`, `airport`) VALUES
(1, 1, 'Аэропорт Шереметьево'),
(2, 2, 'Аэропорт Хитроу');

-- --------------------------------------------------------

--
-- Структура таблицы `airport_arrived`
--

CREATE TABLE `airport_arrived` (
  `id_airport_arrived` int(11) NOT NULL,
  `id_airport` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airport_arrived`
--

INSERT INTO `airport_arrived` (`id_airport_arrived`, `id_airport`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `airport_departure`
--

CREATE TABLE `airport_departure` (
  `id_airport_departure` int(11) NOT NULL,
  `id_airport` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airport_departure`
--

INSERT INTO `airport_departure` (`id_airport_departure`, `id_airport`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `baggage_status`
--

CREATE TABLE `baggage_status` (
  `id_baggage_status` int(11) NOT NULL,
  `baggage_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `baggage_status`
--

INSERT INTO `baggage_status` (`id_baggage_status`, `baggage_status`) VALUES
(1, 'Сдан'),
(2, 'Не сдан');

-- --------------------------------------------------------

--
-- Структура таблицы `brigades`
--

CREATE TABLE `brigades` (
  `id_brigades` int(11) NOT NULL,
  `brigades_num` int(11) DEFAULT NULL,
  `id_flight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `brigades`
--

INSERT INTO `brigades` (`id_brigades`, `brigades_num`, `id_flight`) VALUES
(1, 21, 1),
(2, 22, 2),
(3, 23, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id_country` int(11) NOT NULL,
  `full_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reduction` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id_country`, `full_title`, `reduction`) VALUES
(1, 'Россия', 'RU'),
(2, 'Великобритания', 'UK'),
(3, 'Соединенные Штаты Америки', 'USA');

-- --------------------------------------------------------

--
-- Структура таблицы `crew_pilots`
--

CREATE TABLE `crew_pilots` (
  `id_crew_pilots` int(11) NOT NULL,
  `id_personnel` int(11) DEFAULT NULL,
  `med_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `crew_pilots`
--

INSERT INTO `crew_pilots` (`id_crew_pilots`, `id_personnel`, `med_status`) VALUES
(1, 5, 1),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id_department` int(11) NOT NULL,
  `id_personnel` int(11) DEFAULT NULL,
  `department` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id_department`, `id_personnel`, `department`) VALUES
(1, 3, 'Охрана'),
(2, NULL, 'Ремонт'),
(3, NULL, 'Регистрация'),
(4, NULL, 'Авиаперелет');

-- --------------------------------------------------------

--
-- Структура таблицы `employee_position`
--

CREATE TABLE `employee_position` (
  `id_employee_position` int(11) NOT NULL,
  `position` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `employee_position`
--

INSERT INTO `employee_position` (`id_employee_position`, `position`) VALUES
(1, 'Агент по регистрации'),
(2, 'Главный механик'),
(3, 'Главный пилот'),
(4, 'Начальник отдела'),
(5, 'Второй пилот');

-- --------------------------------------------------------

--
-- Структура таблицы `employee_profession`
--

CREATE TABLE `employee_profession` (
  `id_employee_profession` int(11) NOT NULL,
  `profession` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `employee_profession`
--

INSERT INTO `employee_profession` (`id_employee_profession`, `profession`) VALUES
(1, 'Агент по регистрации'),
(2, 'Авиамеханик'),
(3, 'Пилот'),
(4, 'Охранник');

-- --------------------------------------------------------

--
-- Структура таблицы `flight`
--

CREATE TABLE `flight` (
  `id_flight` int(11) NOT NULL,
  `id_airplane` int(11) DEFAULT NULL,
  `id_airplane_type` int(11) DEFAULT NULL,
  `id_route` int(11) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `id_flight_type` int(11) DEFAULT NULL,
  `flight_num` int(11) DEFAULT NULL,
  `travel_time` time DEFAULT NULL,
  `sold_tickets` int(11) DEFAULT NULL,
  `reserved_seats` int(11) DEFAULT NULL,
  `surrendered_tickets` int(11) DEFAULT NULL,
  `delay_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `flight`
--

INSERT INTO `flight` (`id_flight`, `id_airplane`, `id_airplane_type`, `id_route`, `id_country`, `id_flight_type`, `flight_num`, `travel_time`, `sold_tickets`, `reserved_seats`, `surrendered_tickets`, `delay_time`) VALUES
(1, 1, 1, 1, 2, 1, 1, '04:20:00', 180, 0, 0, '00:00:00'),
(2, 2, 2, 2, 1, 2, 2, '01:20:00', 153, 150, 9, '05:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `flight_status`
--

CREATE TABLE `flight_status` (
  `id_flight_status` int(11) NOT NULL,
  `f_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `flight_status`
--

INSERT INTO `flight_status` (`id_flight_status`, `f_status`) VALUES
(1, 'Прибыл'),
(2, 'В полёте'),
(3, 'Задерживается'),
(4, 'Отменен');

-- --------------------------------------------------------

--
-- Структура таблицы `flight_type`
--

CREATE TABLE `flight_type` (
  `id_flight_type` int(11) NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `flight_type`
--

INSERT INTO `flight_type` (`id_flight_type`, `type`) VALUES
(1, 'Международный'),
(2, 'Внутренний');

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `id_gender` int(11) NOT NULL,
  `gender` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`id_gender`, `gender`) VALUES
(1, 'male'),
(2, 'female');

-- --------------------------------------------------------

--
-- Структура таблицы `have_children`
--

CREATE TABLE `have_children` (
  `id_have_children` int(11) NOT NULL,
  `have_children` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `have_children`
--

INSERT INTO `have_children` (`id_have_children`, `have_children`) VALUES
(1, 'yes'),
(2, 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `inspection`
--

CREATE TABLE `inspection` (
  `id_inspection` int(11) NOT NULL,
  `id_airplane` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `date_inspaction` date DEFAULT NULL,
  `time_repair` time DEFAULT NULL,
  `id_repair_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `inspection`
--

INSERT INTO `inspection` (`id_inspection`, `id_airplane`, `id_status`, `date_inspaction`, `time_repair`, `id_repair_status`) VALUES
(1, 1, 1, '2020-08-01', '11:00:00', 1),
(2, 2, 2, '2016-12-20', '07:15:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `med_status`
--

CREATE TABLE `med_status` (
  `id_med_status` int(11) NOT NULL,
  `id_personnel` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `med_status`
--

INSERT INTO `med_status` (`id_med_status`, `id_personnel`, `id_status`, `date`) VALUES
(2, 5, 1, '2020-11-01');

-- --------------------------------------------------------

--
-- Структура таблицы `passeger`
--

CREATE TABLE `passeger` (
  `id_passeger` int(11) NOT NULL,
  `id_country` int(11) DEFAULT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patronymic` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_baggage_status` int(11) DEFAULT NULL,
  `id_ticket_status` int(11) DEFAULT NULL,
  `phone_num` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_num` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `id_gender` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `passeger`
--

INSERT INTO `passeger` (`id_passeger`, `id_country`, `last_name`, `first_name`, `patronymic`, `id_baggage_status`, `id_ticket_status`, `phone_num`, `passport_num`, `age`, `id_gender`) VALUES
(1, 1, 'Вассерман', 'Анатолий', 'Александрович', 1, 2, '8-800-555-35-35', 12345678, 37, 1),
(2, 1, 'Павленко', 'Андрей', 'Николаевич', 2, 1, '8-801-556-36-36', 87654321, 46, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_case`
--

CREATE TABLE `personal_case` (
  `id_personal_case` int(11) NOT NULL,
  `last_name` text DEFAULT NULL,
  `first_name` text DEFAULT NULL,
  `patronymic` text DEFAULT NULL,
  `age` text DEFAULT NULL,
  `amount_children` text DEFAULT NULL,
  `id_gender` int(11) DEFAULT NULL,
  `id_have_children` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `personal_case`
--

INSERT INTO `personal_case` (`id_personal_case`, `last_name`, `first_name`, `patronymic`, `age`, `amount_children`, `id_gender`, `id_have_children`) VALUES
(1, 'Петров ', 'Александр ', 'Васильевич', '38', '1', 1, 1),
(2, 'Совков ', 'Михаил ', 'Дмитриевич', '46', '2', 1, 1),
(3, 'Сорокин ', 'Сергей ', 'Сергеевич', '34', '0', 1, 2),
(4, 'Шмыгнов ', 'Трофим ', 'Елесеевич', '26', '0', 1, 2),
(5, 'Иванов ', 'Иван ', 'Иванович', '27', '0', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `personnel`
--

CREATE TABLE `personnel` (
  `id_personnel` int(11) NOT NULL,
  `id_brigades` int(11) DEFAULT NULL,
  `id_department` int(10) DEFAULT NULL,
  `id_employee_position` int(11) DEFAULT NULL,
  `id_employee_profession` int(11) DEFAULT NULL,
  `id_personal_case` int(11) DEFAULT NULL,
  `work_exp` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personnel`
--

INSERT INTO `personnel` (`id_personnel`, `id_brigades`, `id_department`, `id_employee_position`, `id_employee_profession`, `id_personal_case`, `work_exp`, `salary`) VALUES
(1, 2, 3, 1, 1, 1, 15, 30000),
(2, 2, 2, 2, 2, 2, 5, 45000),
(3, 3, 1, 4, 4, 3, 6, 70000),
(5, 3, 4, 5, 3, 5, 4, 35000);

-- --------------------------------------------------------

--
-- Структура таблицы `reason_for_detention`
--

CREATE TABLE `reason_for_detention` (
  `id_reason_for_detention` int(11) NOT NULL,
  `reason_for_detention` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `reason_for_detention`
--

INSERT INTO `reason_for_detention` (`id_reason_for_detention`, `reason_for_detention`) VALUES
(1, 'Плохие погодные условия'),
(2, 'Техническая неисправность'),
(3, 'Позднее прибытие'),
(4, 'Нет');

-- --------------------------------------------------------

--
-- Структура таблицы `repair_status`
--

CREATE TABLE `repair_status` (
  `id_repair_status` int(11) NOT NULL,
  `repair_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `repair_status`
--

INSERT INTO `repair_status` (`id_repair_status`, `repair_status`) VALUES
(1, 'need'),
(2, 'not need');

-- --------------------------------------------------------

--
-- Структура таблицы `route`
--

CREATE TABLE `route` (
  `id_route` int(11) NOT NULL,
  `route_num` int(11) NOT NULL,
  `id_airport_departure` int(11) DEFAULT NULL,
  `id_airport_arrived` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `route`
--

INSERT INTO `route` (`id_route`, `route_num`, `id_airport_departure`, `id_airport_arrived`) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `seats_class`
--

CREATE TABLE `seats_class` (
  `id_seats_class` int(11) NOT NULL,
  `class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `seats_class`
--

INSERT INTO `seats_class` (`id_seats_class`, `class`) VALUES
(1, 'Эконом'),
(2, 'Первый'),
(3, 'Бизнес'),
(4, 'Отсутствует');

-- --------------------------------------------------------

--
-- Структура таблицы `service_staff`
--

CREATE TABLE `service_staff` (
  `id_service_staff` int(11) NOT NULL,
  `id_personnel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `status` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id_status`, `status`) VALUES
(1, 'yes'),
(2, 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `technician_team`
--

CREATE TABLE `technician_team` (
  `id_technician_team` int(11) NOT NULL,
  `id_personnel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `test1`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `test1` (
`id_timetable` int(11)
,`brand` text
,`model` varchar(20)
,`departure_days` date
,`departure_time` time
,`arrived_time` time
,`flight_num` int(11)
,`free_places` int(11)
,`type` text
,`f_status` text
,`reason_for_detention` text
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `test2`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `test2` (
`id_personnel` int(11)
,`brigades_num` int(11)
,`department` text
,`position` text
,`profession` text
,`last_name` text
,`work_exp` int(11)
,`salary` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `test3`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `test3` (
`id_personal_case` int(11)
,`Фамилия` text
,`Имя` text
,`Отчество` text
,`Возрост` text
,`Кол-во детей` text
,`Пол` text
,`Наличие детей` text
);

-- --------------------------------------------------------

--
-- Структура таблицы `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `id_passeger` int(11) DEFAULT NULL,
  `id_seats_class` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `seat` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `id_flight` int(11) DEFAULT NULL,
  `id_airplane` int(11) DEFAULT NULL,
  `id_flight_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `id_passeger`, `id_seats_class`, `sale_date`, `seat`, `price`, `departure_date`, `id_flight`, `id_airplane`, `id_flight_type`) VALUES
(1, 1, 1, '2021-10-06', 1, 17760, '2021-12-06', 1, 1, 1),
(2, 2, 2, '2022-12-10', 2, 6750, '2022-12-28', 2, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ticket_status`
--

CREATE TABLE `ticket_status` (
  `id_ticket_status` int(11) NOT NULL,
  `ticket_status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `ticket_status`
--

INSERT INTO `ticket_status` (`id_ticket_status`, `ticket_status`) VALUES
(1, 'Сдан'),
(2, 'Не сдан');

-- --------------------------------------------------------

--
-- Структура таблицы `timetable`
--

CREATE TABLE `timetable` (
  `id_timetable` int(11) NOT NULL,
  `id_airplane` int(11) DEFAULT NULL,
  `departure_days` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrived_time` time DEFAULT NULL,
  `id_flight` int(11) DEFAULT NULL,
  `free_places` int(11) DEFAULT NULL,
  `id_flight_type` int(11) DEFAULT NULL,
  `id_flight_status` int(11) DEFAULT NULL,
  `id_reason_for_detention` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `timetable`
--

INSERT INTO `timetable` (`id_timetable`, `id_airplane`, `departure_days`, `departure_time`, `arrived_time`, `id_flight`, `free_places`, `id_flight_type`, `id_flight_status`, `id_reason_for_detention`) VALUES
(1, 1, '2021-12-06', '12:43:00', '05:03:00', 1, 1, 1, 1, 4),
(2, 2, '2022-12-08', '04:50:00', '03:10:00', 2, 10, 2, 4, 1),
(3, 1, '2012-06-01', '18:00:00', '19:00:00', 2, 228, 2, 3, 2);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros1`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros1` (
`first_name` text
,`gender` text
,`age` text
,`department` text
,`position` text
,`have_children` text
,`amount_children` text
,`work_exp` int(11)
,`salary` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros2`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros2` (
`brigades_num` int(11)
,`amount_` bigint(21)
,`average_salary` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros3`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros3` (
`first_name` text
,`status` varchar(3)
,`date` date
,`gender` text
,`age` text
,`salary` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros4`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros4` (
`brand` text
,`model` varchar(20)
,`arrived_time` time
,`parking_time` time
,`amount_flight` int(11)
,`airport` text
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros5`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros5` (
`airplane_num` int(11)
,`status` varchar(3)
,`date_inspaction` date
,`time_repair` time
,`repair_status` text
,`amount_repair` int(11)
,`airplane_age` int(11)
,`amount_flight` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros6`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros6` (
`flight_num` int(11)
,`travel_time` time
,`price` int(11)
,`id_airport_departure` int(11)
,`id_airport_arrived` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros7`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros7` (
`flight_num` int(11)
,`f_status` text
,`id_airport_departure` int(11)
,`id_airport_arrived` int(11)
,`free_places` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros8`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros8` (
`flight_num` int(11)
,`f_status` text
,`reason_for_detention` text
,`id_route` int(11)
,`surrendered_tickets` int(11)
,`delay_time` time
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros9`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros9` (
`flight_num` int(11)
,`type` text
,`sold_tickets` int(11)
,`id_route` int(11)
,`travel_time` time
,`price` int(11)
,`departure_time` time
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros10`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros10` (
`flight_num` int(11)
,`flight_type` text
,`reduction` varchar(3)
,`airplane_type` text
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros11`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros11` (
`first_name` varchar(20)
,`flight_num` int(11)
,`departure_days` date
,`type` text
,`baggage_status` text
,`gender` text
,`age` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros12`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros12` (
`flight_num` int(11)
,`free_places` int(11)
,`reserved_seats` int(11)
,`departure_days` date
,`id_airport_departure` int(11)
,`id_airport_arrived` int(11)
,`price` int(11)
,`departure_time` time
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros13`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros13` (
`flight_num` int(11)
,`surrendered_tickets` int(11)
,`departure_days` date
,`id_airport_departure` int(11)
,`id_airport_arrived` int(11)
,`price` int(11)
,`age` int(11)
,`gender` text
);

-- --------------------------------------------------------

--
-- Структура для представления `test1`
--
DROP TABLE IF EXISTS `test1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test1`  AS SELECT `timetable`.`id_timetable` AS `id_timetable`, `airplane_brand`.`brand` AS `brand`, `airplane_model`.`model` AS `model`, `timetable`.`departure_days` AS `departure_days`, `timetable`.`departure_time` AS `departure_time`, `timetable`.`arrived_time` AS `arrived_time`, `flight`.`flight_num` AS `flight_num`, `timetable`.`free_places` AS `free_places`, `flight_type`.`type` AS `type`, `flight_status`.`f_status` AS `f_status`, `reason_for_detention`.`reason_for_detention` AS `reason_for_detention` FROM (((((((`timetable` join `airplane` on(`airplane`.`id_airplane` = `timetable`.`id_airplane`)) join `airplane_brand` on(`airplane_brand`.`id_airplane_brand` = `airplane`.`id_airplane_brand`)) join `airplane_model` on(`airplane_model`.`id_airplane_model` = `airplane`.`id_airplane_model`)) join `flight` on(`flight`.`id_flight` = `timetable`.`id_flight`)) join `flight_type` on(`flight_type`.`id_flight_type` = `timetable`.`id_flight_type`)) join `flight_status` on(`flight_status`.`id_flight_status` = `timetable`.`id_flight_status`)) join `reason_for_detention` on(`reason_for_detention`.`id_reason_for_detention` = `timetable`.`id_reason_for_detention`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `test2`
--
DROP TABLE IF EXISTS `test2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test2`  AS SELECT `personnel`.`id_personnel` AS `id_personnel`, `brigades`.`brigades_num` AS `brigades_num`, `department`.`department` AS `department`, `employee_position`.`position` AS `position`, `employee_profession`.`profession` AS `profession`, `personal_case`.`last_name` AS `last_name`, `personnel`.`work_exp` AS `work_exp`, `personnel`.`salary` AS `salary` FROM (((((`personnel` join `brigades` on(`brigades`.`id_brigades` = `personnel`.`id_brigades`)) join `department` on(`department`.`id_department` = `personnel`.`id_department`)) join `employee_position` on(`employee_position`.`id_employee_position` = `personnel`.`id_employee_position`)) join `employee_profession` on(`employee_profession`.`id_employee_profession` = `personnel`.`id_employee_profession`)) join `personal_case` on(`personal_case`.`id_personal_case` = `personnel`.`id_personal_case`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `test3`
--
DROP TABLE IF EXISTS `test3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test3`  AS SELECT `personal_case`.`id_personal_case` AS `id_personal_case`, `personal_case`.`last_name` AS `Фамилия`, `personal_case`.`first_name` AS `Имя`, `personal_case`.`patronymic` AS `Отчество`, `personal_case`.`age` AS `Возрост`, `personal_case`.`amount_children` AS `Кол-во детей`, `gender`.`gender` AS `Пол`, `have_children`.`have_children` AS `Наличие детей` FROM ((`personal_case` join `gender` on(`gender`.`id_gender` = `personal_case`.`id_gender`)) join `have_children` on(`have_children`.`id_have_children` = `personal_case`.`id_have_children`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros1`
--
DROP TABLE IF EXISTS `zapros1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros1`  AS SELECT `personal_case`.`first_name` AS `first_name`, `gender`.`gender` AS `gender`, `personal_case`.`age` AS `age`, `department`.`department` AS `department`, `employee_position`.`position` AS `position`, `have_children`.`have_children` AS `have_children`, `personal_case`.`amount_children` AS `amount_children`, `personnel`.`work_exp` AS `work_exp`, `personnel`.`salary` AS `salary` FROM (((((`personnel` join `personal_case` on(`personnel`.`id_personal_case` = `personal_case`.`id_personal_case`)) join `department` on(`personnel`.`id_department` = `department`.`id_department`)) join `gender` on(`gender`.`id_gender` = `personal_case`.`id_gender`)) join `have_children` on(`have_children`.`id_have_children` = `personal_case`.`id_have_children`)) join `employee_position` on(`employee_position`.`id_employee_position` = `personnel`.`id_employee_position`)) ORDER BY `personnel`.`id_personal_case` ASC ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros2`
--
DROP TABLE IF EXISTS `zapros2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros2`  AS SELECT `brigades`.`brigades_num` AS `brigades_num`, count(`personnel`.`id_brigades`) AS `amount_`, avg(`personnel`.`salary`) AS `average_salary` FROM ((((`brigades` join `personnel` on(`personnel`.`id_brigades` = `brigades`.`id_brigades`)) join `department` on(`department`.`id_department` = `personnel`.`id_department`)) join `flight` on(`flight`.`id_flight` = `brigades`.`id_flight`)) join `personal_case` on(`personal_case`.`id_personal_case` = `personnel`.`id_personal_case`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros3`
--
DROP TABLE IF EXISTS `zapros3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros3`  AS SELECT `personal_case`.`first_name` AS `first_name`, `status`.`status` AS `status`, `med_status`.`date` AS `date`, `gender`.`gender` AS `gender`, `personal_case`.`age` AS `age`, `personnel`.`salary` AS `salary` FROM (`med_status` join ((((`crew_pilots` join `personnel` on(`personnel`.`id_personnel` = `crew_pilots`.`id_personnel`)) join `status` on(`status`.`id_status` = `crew_pilots`.`med_status`)) join `personal_case` on(`personal_case`.`id_personal_case` = `personnel`.`id_personal_case`)) join `gender` on(`gender`.`id_gender` = `personal_case`.`id_gender`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros4`
--
DROP TABLE IF EXISTS `zapros4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros4`  AS SELECT `airplane_brand`.`brand` AS `brand`, `airplane_model`.`model` AS `model`, `airplane`.`arrived_time` AS `arrived_time`, `airplane`.`parking_time` AS `parking_time`, `airplane`.`amount_flight` AS `amount_flight`, `airport`.`airport` AS `airport` FROM (((`airplane` join `airplane_brand` on(`airplane_brand`.`id_airplane_brand` = `airplane`.`id_airplane_brand`)) join `airplane_model` on(`airplane_model`.`id_airplane_model` = `airplane`.`id_airplane_model`)) join `airport` on(`airport`.`id_airport` = `airplane`.`id_airport`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros5`
--
DROP TABLE IF EXISTS `zapros5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros5`  AS SELECT `airplane`.`airplane_num` AS `airplane_num`, `status`.`status` AS `status`, `inspection`.`date_inspaction` AS `date_inspaction`, `inspection`.`time_repair` AS `time_repair`, `repair_status`.`repair_status` AS `repair_status`, `airplane`.`amount_repair` AS `amount_repair`, `airplane`.`airplane_age` AS `airplane_age`, `airplane`.`amount_flight` AS `amount_flight` FROM (((`inspection` join `airplane` on(`airplane`.`id_airplane` = `inspection`.`id_airplane`)) join `status` on(`status`.`id_status` = `inspection`.`id_status`)) join `repair_status` on(`repair_status`.`id_repair_status` = `inspection`.`id_repair_status`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros6`
--
DROP TABLE IF EXISTS `zapros6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros6`  AS SELECT `flight`.`flight_num` AS `flight_num`, `flight`.`travel_time` AS `travel_time`, `ticket`.`price` AS `price`, `route`.`id_airport_departure` AS `id_airport_departure`, `route`.`id_airport_arrived` AS `id_airport_arrived` FROM ((`flight` join `ticket` on(`ticket`.`id_flight` = `flight`.`id_flight`)) join `route` on(`route`.`id_airport_departure` = `flight`.`id_route`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros7`
--
DROP TABLE IF EXISTS `zapros7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros7`  AS SELECT `flight`.`flight_num` AS `flight_num`, `flight_status`.`f_status` AS `f_status`, `route`.`id_airport_departure` AS `id_airport_departure`, `route`.`id_airport_arrived` AS `id_airport_arrived`, `timetable`.`free_places` AS `free_places` FROM (((`timetable` join `flight_status` on(`flight_status`.`id_flight_status` = `timetable`.`id_flight_status`)) join `flight` on(`flight`.`id_flight` = `timetable`.`id_flight`)) join `route` on(`route`.`id_airport_departure` = `flight`.`id_route`)) WHERE `flight_status`.`f_status` = 'Отменен' ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros8`
--
DROP TABLE IF EXISTS `zapros8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros8`  AS SELECT `flight`.`flight_num` AS `flight_num`, `flight_status`.`f_status` AS `f_status`, `reason_for_detention`.`reason_for_detention` AS `reason_for_detention`, `flight`.`id_route` AS `id_route`, `flight`.`surrendered_tickets` AS `surrendered_tickets`, `flight`.`delay_time` AS `delay_time` FROM (((`timetable` join `flight` on(`flight`.`id_flight` = `timetable`.`id_flight`)) join `flight_status` on(`flight_status`.`id_flight_status` = `timetable`.`id_flight_status`)) join `reason_for_detention` on(`reason_for_detention`.`id_reason_for_detention` = `timetable`.`id_reason_for_detention`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros9`
--
DROP TABLE IF EXISTS `zapros9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros9`  AS SELECT `flight`.`flight_num` AS `flight_num`, `airplane_type`.`type` AS `type`, `flight`.`sold_tickets` AS `sold_tickets`, `flight`.`id_route` AS `id_route`, `flight`.`travel_time` AS `travel_time`, `ticket`.`price` AS `price`, `timetable`.`departure_time` AS `departure_time` FROM (((`flight` join `airplane_type` on(`airplane_type`.`id_airplane_type` = `flight`.`id_airplane_type`)) join `ticket` on(`ticket`.`id_flight` = `flight`.`id_flight`)) join `timetable` on(`timetable`.`id_flight` = `flight`.`id_flight`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros10`
--
DROP TABLE IF EXISTS `zapros10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros10`  AS SELECT `flight`.`flight_num` AS `flight_num`, `flight_type`.`type` AS `flight_type`, `country`.`reduction` AS `reduction`, `airplane_type`.`type` AS `airplane_type` FROM ((((`flight` join `route` on(`route`.`id_route` = `flight`.`id_route`)) join `airplane_type` on(`airplane_type`.`id_airplane_type` = `flight`.`id_airplane_type`)) join `flight_type` on(`flight_type`.`id_flight_type` = `flight`.`id_flight_type`)) join `country` on(`country`.`id_country` = `flight`.`id_country`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros11`
--
DROP TABLE IF EXISTS `zapros11`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros11`  AS SELECT `passeger`.`first_name` AS `first_name`, `flight`.`flight_num` AS `flight_num`, `timetable`.`departure_days` AS `departure_days`, `flight_type`.`type` AS `type`, `baggage_status`.`baggage_status` AS `baggage_status`, `gender`.`gender` AS `gender`, `passeger`.`age` AS `age` FROM ((((((`ticket` join `passeger` on(`passeger`.`id_passeger` = `ticket`.`id_passeger`)) join `flight` on(`flight`.`id_flight` = `ticket`.`id_flight`)) join `timetable` on(`timetable`.`id_flight` = `ticket`.`id_flight`)) join `baggage_status` on(`baggage_status`.`id_baggage_status` = `passeger`.`id_baggage_status`)) join `gender` on(`gender`.`id_gender` = `passeger`.`id_gender`)) join `flight_type` on(`flight_type`.`id_flight_type` = `ticket`.`id_flight_type`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros12`
--
DROP TABLE IF EXISTS `zapros12`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros12`  AS SELECT `flight`.`flight_num` AS `flight_num`, `timetable`.`free_places` AS `free_places`, `flight`.`reserved_seats` AS `reserved_seats`, `timetable`.`departure_days` AS `departure_days`, `route`.`id_airport_departure` AS `id_airport_departure`, `route`.`id_airport_arrived` AS `id_airport_arrived`, `ticket`.`price` AS `price`, `timetable`.`departure_time` AS `departure_time` FROM (((`timetable` join `flight` on(`flight`.`id_flight` = `timetable`.`id_flight`)) join `route` on(`route`.`id_route` = `flight`.`id_route`)) join `ticket` on(`ticket`.`id_flight` = `timetable`.`id_flight`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros13`
--
DROP TABLE IF EXISTS `zapros13`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapros13`  AS SELECT `flight`.`flight_num` AS `flight_num`, `flight`.`surrendered_tickets` AS `surrendered_tickets`, `timetable`.`departure_days` AS `departure_days`, `route`.`id_airport_departure` AS `id_airport_departure`, `route`.`id_airport_arrived` AS `id_airport_arrived`, `ticket`.`price` AS `price`, `passeger`.`age` AS `age`, `gender`.`gender` AS `gender` FROM (((((`flight` join `timetable` on(`timetable`.`id_flight` = `flight`.`id_flight`)) join `route` on(`route`.`id_route` = `flight`.`id_route`)) join `ticket` on(`ticket`.`id_flight` = `flight`.`id_flight`)) join `passeger` on(`passeger`.`id_passeger` = `ticket`.`id_passeger`)) join `gender` on(`gender`.`id_gender` = `passeger`.`id_gender`)) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `airplane`
--
ALTER TABLE `airplane`
  ADD PRIMARY KEY (`id_airplane`),
  ADD KEY `id_airplane_type` (`id_airplane_type`),
  ADD KEY `id_brigades` (`id_brigades`),
  ADD KEY `id_airplane_model` (`id_airplane_model`),
  ADD KEY `id_airplane_brand` (`id_airplane_brand`),
  ADD KEY `id_airport` (`id_airport`);

--
-- Индексы таблицы `airplane_brand`
--
ALTER TABLE `airplane_brand`
  ADD PRIMARY KEY (`id_airplane_brand`);

--
-- Индексы таблицы `airplane_model`
--
ALTER TABLE `airplane_model`
  ADD PRIMARY KEY (`id_airplane_model`),
  ADD KEY `id_airplane_brand` (`id_airplane_brand`);

--
-- Индексы таблицы `airplane_type`
--
ALTER TABLE `airplane_type`
  ADD PRIMARY KEY (`id_airplane_type`);

--
-- Индексы таблицы `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`id_airport`),
  ADD KEY `id_country` (`id_country`);

--
-- Индексы таблицы `airport_arrived`
--
ALTER TABLE `airport_arrived`
  ADD PRIMARY KEY (`id_airport_arrived`),
  ADD KEY `id_airport` (`id_airport`);

--
-- Индексы таблицы `airport_departure`
--
ALTER TABLE `airport_departure`
  ADD PRIMARY KEY (`id_airport_departure`),
  ADD KEY `id_airport` (`id_airport`);

--
-- Индексы таблицы `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `baggage_status`
--
ALTER TABLE `baggage_status`
  ADD PRIMARY KEY (`id_baggage_status`);

--
-- Индексы таблицы `brigades`
--
ALTER TABLE `brigades`
  ADD PRIMARY KEY (`id_brigades`),
  ADD KEY `id_flight` (`id_flight`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id_country`);

--
-- Индексы таблицы `crew_pilots`
--
ALTER TABLE `crew_pilots`
  ADD PRIMARY KEY (`id_crew_pilots`),
  ADD KEY `med_status` (`med_status`);

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id_department`),
  ADD KEY `id_personnel` (`id_personnel`);

--
-- Индексы таблицы `employee_position`
--
ALTER TABLE `employee_position`
  ADD PRIMARY KEY (`id_employee_position`);

--
-- Индексы таблицы `employee_profession`
--
ALTER TABLE `employee_profession`
  ADD PRIMARY KEY (`id_employee_profession`);

--
-- Индексы таблицы `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id_flight`),
  ADD KEY `id_airplane` (`id_airplane`),
  ADD KEY `id_airplane_type` (`id_airplane_type`),
  ADD KEY `id_route` (`id_route`),
  ADD KEY `id_flight_type` (`id_flight_type`),
  ADD KEY `flight_ibfk_5` (`id_country`);

--
-- Индексы таблицы `flight_status`
--
ALTER TABLE `flight_status`
  ADD PRIMARY KEY (`id_flight_status`);

--
-- Индексы таблицы `flight_type`
--
ALTER TABLE `flight_type`
  ADD PRIMARY KEY (`id_flight_type`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id_gender`);

--
-- Индексы таблицы `have_children`
--
ALTER TABLE `have_children`
  ADD PRIMARY KEY (`id_have_children`);

--
-- Индексы таблицы `inspection`
--
ALTER TABLE `inspection`
  ADD PRIMARY KEY (`id_inspection`),
  ADD KEY `inspection_ibfk_1` (`id_airplane`),
  ADD KEY `inspection_ibfk_2` (`id_status`),
  ADD KEY `inspection_ibfk_3` (`id_repair_status`);

--
-- Индексы таблицы `med_status`
--
ALTER TABLE `med_status`
  ADD PRIMARY KEY (`id_med_status`),
  ADD KEY `id_personnel` (`id_personnel`),
  ADD KEY `id_status` (`id_status`);

--
-- Индексы таблицы `passeger`
--
ALTER TABLE `passeger`
  ADD PRIMARY KEY (`id_passeger`),
  ADD KEY `id_country` (`id_country`),
  ADD KEY `id_gender` (`id_gender`),
  ADD KEY `id_baggage_status` (`id_baggage_status`),
  ADD KEY `id_ticket_status` (`id_ticket_status`);

--
-- Индексы таблицы `personal_case`
--
ALTER TABLE `personal_case`
  ADD PRIMARY KEY (`id_personal_case`),
  ADD KEY `id_gender` (`id_gender`),
  ADD KEY `id_have_children` (`id_have_children`);

--
-- Индексы таблицы `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`id_personnel`),
  ADD KEY `id_brigades` (`id_brigades`),
  ADD KEY `id_employee_position` (`id_employee_position`),
  ADD KEY `id_employee_profession` (`id_employee_profession`),
  ADD KEY `id_department` (`id_department`),
  ADD KEY `id_personal_case` (`id_personal_case`);

--
-- Индексы таблицы `reason_for_detention`
--
ALTER TABLE `reason_for_detention`
  ADD PRIMARY KEY (`id_reason_for_detention`);

--
-- Индексы таблицы `repair_status`
--
ALTER TABLE `repair_status`
  ADD PRIMARY KEY (`id_repair_status`);

--
-- Индексы таблицы `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id_route`),
  ADD KEY `id_airport_departure` (`id_airport_departure`),
  ADD KEY `id_airport_arrived` (`id_airport_arrived`);

--
-- Индексы таблицы `seats_class`
--
ALTER TABLE `seats_class`
  ADD PRIMARY KEY (`id_seats_class`);

--
-- Индексы таблицы `service_staff`
--
ALTER TABLE `service_staff`
  ADD PRIMARY KEY (`id_service_staff`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Индексы таблицы `technician_team`
--
ALTER TABLE `technician_team`
  ADD PRIMARY KEY (`id_technician_team`);

--
-- Индексы таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_passeger` (`id_passeger`),
  ADD KEY `id_seats_class` (`id_seats_class`),
  ADD KEY `id_flight` (`id_flight`),
  ADD KEY `id_airplane` (`id_airplane`),
  ADD KEY `id_flight_type` (`id_flight_type`);

--
-- Индексы таблицы `ticket_status`
--
ALTER TABLE `ticket_status`
  ADD PRIMARY KEY (`id_ticket_status`);

--
-- Индексы таблицы `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id_timetable`),
  ADD KEY `id_airplane` (`id_airplane`),
  ADD KEY `id_flight` (`id_flight`),
  ADD KEY `id_flight_type` (`id_flight_type`),
  ADD KEY `id_flight_status` (`id_flight_status`),
  ADD KEY `id_reason_for_detention` (`id_reason_for_detention`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `airplane`
--
ALTER TABLE `airplane`
  MODIFY `id_airplane` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `airplane_brand`
--
ALTER TABLE `airplane_brand`
  MODIFY `id_airplane_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `airplane_model`
--
ALTER TABLE `airplane_model`
  MODIFY `id_airplane_model` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `airplane_type`
--
ALTER TABLE `airplane_type`
  MODIFY `id_airplane_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `airport`
--
ALTER TABLE `airport`
  MODIFY `id_airport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `airport_arrived`
--
ALTER TABLE `airport_arrived`
  MODIFY `id_airport_arrived` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `airport_departure`
--
ALTER TABLE `airport_departure`
  MODIFY `id_airport_departure` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `baggage_status`
--
ALTER TABLE `baggage_status`
  MODIFY `id_baggage_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `brigades`
--
ALTER TABLE `brigades`
  MODIFY `id_brigades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `crew_pilots`
--
ALTER TABLE `crew_pilots`
  MODIFY `id_crew_pilots` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `id_employee_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `employee_profession`
--
ALTER TABLE `employee_profession`
  MODIFY `id_employee_profession` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `flight`
--
ALTER TABLE `flight`
  MODIFY `id_flight` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `flight_status`
--
ALTER TABLE `flight_status`
  MODIFY `id_flight_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `flight_type`
--
ALTER TABLE `flight_type`
  MODIFY `id_flight_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `id_gender` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `have_children`
--
ALTER TABLE `have_children`
  MODIFY `id_have_children` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `inspection`
--
ALTER TABLE `inspection`
  MODIFY `id_inspection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `med_status`
--
ALTER TABLE `med_status`
  MODIFY `id_med_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `passeger`
--
ALTER TABLE `passeger`
  MODIFY `id_passeger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `personal_case`
--
ALTER TABLE `personal_case`
  MODIFY `id_personal_case` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id_personnel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `reason_for_detention`
--
ALTER TABLE `reason_for_detention`
  MODIFY `id_reason_for_detention` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `repair_status`
--
ALTER TABLE `repair_status`
  MODIFY `id_repair_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `route`
--
ALTER TABLE `route`
  MODIFY `id_route` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `seats_class`
--
ALTER TABLE `seats_class`
  MODIFY `id_seats_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `service_staff`
--
ALTER TABLE `service_staff`
  MODIFY `id_service_staff` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `technician_team`
--
ALTER TABLE `technician_team`
  MODIFY `id_technician_team` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `ticket_status`
--
ALTER TABLE `ticket_status`
  MODIFY `id_ticket_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id_timetable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `airplane`
--
ALTER TABLE `airplane`
  ADD CONSTRAINT `airplane_ibfk_1` FOREIGN KEY (`id_airplane_type`) REFERENCES `airplane_type` (`id_airplane_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `airplane_ibfk_2` FOREIGN KEY (`id_brigades`) REFERENCES `brigades` (`id_brigades`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `airplane_ibfk_3` FOREIGN KEY (`id_airplane_model`) REFERENCES `airplane_model` (`id_airplane_model`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `airplane_ibfk_4` FOREIGN KEY (`id_airplane_brand`) REFERENCES `airplane_brand` (`id_airplane_brand`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `airplane_ibfk_5` FOREIGN KEY (`id_airport`) REFERENCES `airport` (`id_airport`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `airplane_model`
--
ALTER TABLE `airplane_model`
  ADD CONSTRAINT `airplane_model_ibfk_1` FOREIGN KEY (`id_airplane_brand`) REFERENCES `airplane_brand` (`id_airplane_brand`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `airport_arrived`
--
ALTER TABLE `airport_arrived`
  ADD CONSTRAINT `airport_arrived_ibfk_1` FOREIGN KEY (`id_airport`) REFERENCES `airport` (`id_airport`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `airport_departure`
--
ALTER TABLE `airport_departure`
  ADD CONSTRAINT `airport_departure_ibfk_1` FOREIGN KEY (`id_airport`) REFERENCES `airport` (`id_airport`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `brigades`
--
ALTER TABLE `brigades`
  ADD CONSTRAINT `brigades_ibfk_1` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `crew_pilots`
--
ALTER TABLE `crew_pilots`
  ADD CONSTRAINT `crew_pilots_ibfk_1` FOREIGN KEY (`med_status`) REFERENCES `status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id_personnel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`id_airplane`) REFERENCES `airplane` (`id_airplane`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`id_airplane_type`) REFERENCES `airplane_type` (`id_airplane_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`id_route`) REFERENCES `route` (`id_route`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_ibfk_4` FOREIGN KEY (`id_flight_type`) REFERENCES `flight_type` (`id_flight_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_ibfk_5` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `inspection`
--
ALTER TABLE `inspection`
  ADD CONSTRAINT `inspection_ibfk_1` FOREIGN KEY (`id_airplane`) REFERENCES `airplane` (`id_airplane`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inspection_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inspection_ibfk_3` FOREIGN KEY (`id_repair_status`) REFERENCES `repair_status` (`id_repair_status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `med_status`
--
ALTER TABLE `med_status`
  ADD CONSTRAINT `med_status_ibfk_1` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id_personnel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `med_status_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `passeger`
--
ALTER TABLE `passeger`
  ADD CONSTRAINT `passeger_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passeger_ibfk_2` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id_gender`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passeger_ibfk_3` FOREIGN KEY (`id_baggage_status`) REFERENCES `baggage_status` (`id_baggage_status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passeger_ibfk_4` FOREIGN KEY (`id_ticket_status`) REFERENCES `ticket_status` (`id_ticket_status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `personal_case`
--
ALTER TABLE `personal_case`
  ADD CONSTRAINT `id_gender` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id_gender`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_have_children` FOREIGN KEY (`id_have_children`) REFERENCES `have_children` (`id_have_children`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`id_brigades`) REFERENCES `brigades` (`id_brigades`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personnel_ibfk_2` FOREIGN KEY (`id_employee_position`) REFERENCES `employee_position` (`id_employee_position`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personnel_ibfk_3` FOREIGN KEY (`id_employee_profession`) REFERENCES `employee_profession` (`id_employee_profession`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personnel_ibfk_4` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personnel_ibfk_5` FOREIGN KEY (`id_personal_case`) REFERENCES `personal_case` (`id_personal_case`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`id_airport_departure`) REFERENCES `airport_departure` (`id_airport_departure`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`id_airport_arrived`) REFERENCES `airport_arrived` (`id_airport_arrived`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_passeger`) REFERENCES `passeger` (`id_passeger`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_seats_class`) REFERENCES `seats_class` (`id_seats_class`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`id_airplane`) REFERENCES `airplane` (`id_airplane`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`id_flight_type`) REFERENCES `flight_type` (`id_flight_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`id_airplane`) REFERENCES `airplane` (`id_airplane`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_3` FOREIGN KEY (`id_flight_type`) REFERENCES `flight_type` (`id_flight_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_4` FOREIGN KEY (`id_flight_status`) REFERENCES `flight_status` (`id_flight_status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_5` FOREIGN KEY (`id_reason_for_detention`) REFERENCES `reason_for_detention` (`id_reason_for_detention`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
