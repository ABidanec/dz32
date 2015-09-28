-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 08 2015 г., 21:41
-- Версия сервера: 5.5.38-log
-- Версия PHP: 5.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `iCatalog5`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tOrderPart`
--

CREATE TABLE IF NOT EXISTS `tOrderPart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `count` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `tOrderPart`
--

INSERT INTO `tOrderPart` (`id`, `id_product`, `price`, `count`, `id_user`) VALUES
(1, 2, 2890, 2, 1),
(2, 4, 3520, 3, 18),
(3, 10, 14499, 5, 11),
(4, 25, 4655, 1, 6),
(5, 20, 603, 5, 2),
(6, 17, 1583, 6, 29),
(7, 1, 5, 5, 4),
(8, 7, 1889, 6, 17),
(9, 25, 4655, 1, 4),
(10, 10, 14499, 1, 31),
(11, 26, 19954, 3, 4),
(12, 28, 29584, 1, 7),
(13, 29, 10, 2, 17),
(14, 4, 3520, 3, 20),
(15, 6, 2156, 3, 16),
(16, 23, 5698, 5, 18),
(17, 27, 12045, 2, 17),
(18, 3, 3190, 5, 3),
(19, 19, 2564, 7, 27),
(20, 11, 279, 1, 29),
(21, 9, 15637, 1, 1),
(22, 16, 1286, 2, 27),
(23, 22, 2351, 2, 25),
(24, 12, 18630, 1, 9),
(25, 2, 2890, 6, 23),
(26, 18, 1860, 1, 30),
(27, 6, 2156, 5, 4),
(28, 29, 10, 23, 6),
(29, 11, 279, 34, 14),
(30, 4, 3520, 2, 17),
(31, 23, 5698, 1, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `tOrders`
--

CREATE TABLE IF NOT EXISTS `tOrders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `date_order` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `tOrders`
--

INSERT INTO `tOrders` (`id`, `id_user`, `status`, `date_order`) VALUES
(1, 1, 1, '2015-08-24 09:24:44'),
(2, 4, 0, '2015-06-24 19:24:44'),
(3, 20, 1, '2013-08-24 09:24:00'),
(4, 26, 0, '2015-03-24 09:26:44'),
(5, 2, 1, '2015-01-14 14:25:44'),
(6, 3, 1, '2010-03-24 09:26:48'),
(7, 5, 1, '2015-08-15 06:27:00'),
(8, 6, 1, '2015-11-23 12:28:54'),
(9, 7, 0, '2013-08-24 04:27:10'),
(10, 9, 1, '2014-05-26 10:24:44'),
(11, 8, 1, '2010-03-25 09:26:48'),
(12, 10, 1, '2015-08-24 05:24:44'),
(13, 11, 1, '2010-03-24 09:22:48'),
(14, 12, 0, '2013-08-24 14:27:12'),
(15, 30, 1, '2010-04-24 09:22:48'),
(16, 29, 1, '2015-08-24 09:34:44'),
(17, 27, 1, '2010-03-24 09:12:45'),
(18, 24, 1, '2010-03-24 09:16:47'),
(19, 14, 1, '2010-03-24 19:22:45'),
(20, 19, 1, '2010-11-24 09:22:48'),
(21, 13, 1, '2015-05-24 09:24:44'),
(22, 22, 1, '2015-11-29 09:24:00'),
(23, 25, 0, '2010-06-20 16:22:45'),
(24, 23, 1, '2012-05-24 09:12:47'),
(25, 15, 1, '2015-01-13 19:24:44'),
(26, 20, 1, '2015-08-24 09:11:43'),
(27, 18, 1, '2015-04-25 12:24:44'),
(28, 12, 0, '2010-02-24 09:26:46'),
(29, 17, 1, '2015-05-04 09:24:43'),
(30, 13, 1, '2015-02-01 10:21:55'),
(31, 3, 0, '2015-08-24 09:24:44');

-- --------------------------------------------------------

--
-- Структура таблицы `tProducts`
--

CREATE TABLE IF NOT EXISTS `tProducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `count` int(5) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` text,
  `id_catalog` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_catalog` (`id_catalog`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `tProducts`
--

INSERT INTO `tProducts` (`id`, `title`, `mark`, `count`, `price`, `description`, `id_catalog`) VALUES
(1, 'Core i5', 'Intel', 23, 5, 'Семейство процессора: Intel Core i5\r\nПоколение процессора Intel: Haswell (четвертое)', 1),
(2, 'AMD FX-6300', 'AMD', 56, 2890, 'Семейство процессора: AMD FX-Series\r\nТип разъема: Socket AM3+\r\nВнутренняя тактовая частота: 3500 МГц\r\nКоличество ядер: 6\r\nОбъем кэш памяти 3 уровня: 8 МБ\r\nИнтегрированная графика: Нет', 1),
(3, 'Core i3', 'Intel', 12, 3190, 'Семейство процессора: Intel Core i3\r\nПоколение процессора Intel: Haswell (четвертое)\r\nТип разъема: Socket 1150\r\nВнутренняя тактовая частота: 3600 МГц\r\nКоличество ядер: 2\r\nОбъем кэш памяти 3 уровня: 3 МБ\r\nИнтегрированная графика: Intel HD Graphics 4400', 1),
(4, 'Gigabyte GA-Z97X-Gaming 3', 'Gigabyte', 69, 3520, 'Формфактор: ATX\r\nТип разъема: Socket 1150\r\nПоддержка процессоров: Intel Core i7 / Core i5 / Core i3 / Pentium / Celeron 4е и 5е поколение\r\nПоддержка памяти: 4 x DDR3 DIMM; Количество каналов 2', 2),
(5, 'Asus Z97-Pro Gamer', 'Asus', 89, 4020, 'Формфактор: ATX\r\nТип разъема: Socket 1150\r\nПоддержка процессоров: Intel Core i7 / Core i5 / Core i3 / Pentium / Celeron 4е и 5е поколение\r\nПоддержка памяти: 4 x DDR3 DIMM; Количество каналов 2', 2),
(6, 'Biostar G41-M7', 'Biostar', 105, 2156, 'Формфактор: MicroATX\r\nТип разъема: Socket 775\r\nПоддержка процессоров: Intel Core 2 Quad/Core 2 Duo/Pentium Dual-Core/Celeron Dual-Core/Celeron 400 Series', 2),
(7, 'Zalman Reserator 3 Max', 'Zalman', 265, 1889, 'Тип: Жидкостное охлаждение\r\nСовместимость: Intel: 2011 / 1150 / 1151 / 1155 / 1156 / 1366 / 775\r\nAMD: FM1 / FM2 / AM2 / AM2+ / AM3 / AM3+\r\nПроцессоры:\r\nPentium, Pentium 4, Celeron D, Pentium D, Core 2 Duo, Core 2 Quad, Core 2 Extreme, Pentium Dual Core, Core i7 Extreme, Core i7, Core i5, Core i3, Sempron, Athlon, Athlon FX, Opteron, Phenom, Athlon X2, Phenom II, Athlon II, Trinity, LIano, Vishera, Zambezi.\r\nРазмер вентилятора: 120 мм', 3),
(8, 'DeepCool Gamma Archer Pro', 'DeepCool', 230, 238, 'Тип: Воздушное охлаждение (кулер)\r\nСовместимость: Intel: LGA1150/1155/LGA1156/LGA775\r\nAMD: FM2/FM1/AM3+/AM3/AM2+/AM2/940/939/754\r\nРазмер вентилятора: 120 мм', 3),
(9, 'Asus PCI-Ex GeForce GTX 980 Strix', 'Asus', 562, 15637, 'Графический чип: GeForce GTX 980\r\nОбъем памяти: 4 ГБ\r\nТип памяти: GDDR5\r\nТип системы охлаждения: Активная\r\nРазрядность шины памяти: 256 бит', 4),
(10, '34" LG 34UM67-P', 'LG', 36, 14499, 'Тип матрицы: IPS\r\nОсобенности: "Безрамочный" (Сinema screen)\r\nВремя реакции матрицы: 5 мс (GTG)\r\nЯркость дисплея: 300 кд/м²\r\nКонтрастность дисплея: 1000:1\r\nИнтерфейсы: DisplayPort, DVI, 2 х HDMI', 5),
(11, 'Logitech Wireless Mouse M175', 'Logitech', 562, 279, 'Тип датчика: Оптический\r\nИнтерфейс: Wireless\r\nКоличество кнопок: 2', 6),
(12, 'Lenovo Flex 2 15', 'Lenovo', 241, 18630, 'Экран 15.6" (1920x1080) Full HD LED, глянцевый IPS Multi-Touch / Intel Core i3-4030U (1.9 ГГц) / RAM 4 ГБ / HDD 1 ТБ / nVidia GeForce 820M, 2 ГБ / DVD Super Multi / Wi-Fi / Bluetooth 4.0 / веб-камера / Windows 8.1 / 2.3 кг / черный', 7),
(13, 'HP 250 G4', 'HP', 156, 7060, 'Экран 15.6” (1366x768) HD LED, матовый / Intel Core N3050 (1.6 - 2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / Windows 8.1 64bit / 2.1 кг / черный', 8),
(14, 'Lenovo TAB 2 A7-10 7" 8GB WiFi Black', 'Lenovo', 59, 1250, 'Экран 7" (1024х600) IPS, емкостный Multi-Touch / MediaTek MT8127 (1.3 ГГц) / RAM 1 ГБ / 8 ГБ встроенной памяти + поддержка карт памяти microSD / Wi-Fi / Bluetooth 4.0 / фронтальная камера 0.3 Мп / A-GPS / Android 4.4 / 269 г / черный', 9),
(15, 'Kingston DataTraveler SE9 32GB', 'Kingston', 1005, 566, 'Объём памяти: 32 ГБ\r\nИнтерфейс: USB 2.0\r\nМатериал корпуса: Металл', 10),
(16, 'SSD Kingston SSDNow V300 120GB 2.5"', 'Kingston', 952, 1286, 'Объем: 120 ГБ\r\nИнтерфейс: SATAIII\r\nФормфактор: 2.5"', 11),
(17, 'SilverStone Precision PS10 Black', 'SilverStone', 4005, 1583, 'Форм-фактор: microATX, ATX\r\nТип корпуса: Miditower\r\nНаличие блока питания: В комплекте Aerocool VX-600', 12),
(18, 'Chieftec A-135', 'Chieftec', 789, 1860, 'Код товара APS-850CB\r\nМощность 850 Вт\r\nТип кабелей Модульные\r\nТип разъема подключения к материнской плате ATX 24pin\r\nОхлаждение 1 вентилятор (140 мм)\r\nТип разъема подключения питания процессора 1x4+4pin, 1x8pin\r\nКоличество разъемов дополнительного питания для видеокарт 4\r\nТип разъемов дополнительного питания для видеокарт 4x6+2pin', 13),
(19, 'Acme Ultrathin Bluetooth Keyboard BK01', 'Acme', 365, 2564, 'Интерфейс: Bluetooth', 14),
(20, 'A4Tech PK-920H-3 HD', 'A4Tech', 125, 603, 'Крепление Настольное, Прищепка\r\nРазрешение видео FullHD (1920x1080)\r\nЧастота кадров в секунду 30\r\nФокусировка Автофокус\r\nВстроенный микрофон Есть\r\nДополнительные характеристики Тип сенсора: 1080p Full HD sensor \r\nФотосъемка: до 16 Мп, 4608 х 3456 \r\nВидеосъемка: до 2 Мп \r\nЧастота кадров: До 30 кадров в секунду\r\nСистемные требования Интерфейс: USB 2.0\r\nЦвет Blue\r\nГарантия 12 месяцев', 15),
(21, 'TP-LINK TL-WR743ND', 'TP-LINK', 5987, 362, 'WAN-порт: Ethernet\r\nИнтерфейсы: 4 x LAN 10/100 Мбит/с \r\n1 x WAN 10/100 Мбит/с (с поддержкой PoE)\r\nСкорость Wi-Fi: 150 Мбит/с\r\nЧастота работы Wi-Fi: 2.4 ГГц', 16),
(22, 'Bluetooth-гарнитура Plantronics Explorer ML10', 'Plantronics', 641, 2351, 'Спецификация Bluetooth: Bluetooth 2.0\r\nHands-Free\r\nВремя работы от батареи: До 7 часов в режиме разговора\r\nДо 8 дней в режиме ожидания\r\nВес: 11.5 г', 17),
(23, 'HP LaserJet P2035', 'HP', 200, 5698, 'Тип устройства: Принтеры\r\nТехнология печати: Лазерная печать (ч/б)\r\nДуплекс: Нет', 18),
(24, 'Canon CanoScan LIDE 120', 'Canon', 300, 4525, 'Оптическое разрешение: Разрешение - 2400 x 4800 dpi\r\nСкорость сканирования: 16 сек\r\nСлайд-адаптер: Нет', 19),
(25, 'Epson Expression Home XP-413', 'Epson', 102, 4655, 'Тип устройства: МФУ\r\nТехнология печати: Струйная печать\r\nДуплекс: Нет\r\nСетевые интерфейсы: Wi-Fi', 20),
(26, 'Сабвуфер Behringer B1500DPRO', 'Behringer', 301, 19954, 'Вид: Активные\r\nТип: Поштучные\r\nМощность: 1400 Вт\r\nДиапазон воспроизводимых частот: 32 - 200 Гц', 21),
(27, 'APC Smart-UPS C 1000VA Rack Mountable LCD', 'Smart-UPS', 584, 12045, 'Тип архитектуры Линейно-интерактивный\r\nКоличество розеток 4\r\nВходная мощность 1000 ВА / 600 Вт\r\nДиапазон входного напряжения при работе от сети 180-287 В\r\nВремя работы при полной нагрузке 6 минут\r\nВремя работы при половинной нагрузке 16 минут\r\nИмпульсная защита, Дж 459\r\nТип используемой батареи Необслуживаемая герметичная свинцово-кислотная батарея с загущенным электролитом, защита от утечек\r\nВремя заряда батарей, ч 3\r\nГабариты 432 x 406 x 89 мм\r\nВес 20.52 кг\r\nГарантия 24 месяца', 22),
(28, 'Acer H7550BD', 'Acer', 21, 29584, 'Экран Acer M90-W01MG настенный 90" (16:9) 196 x 110 (MC.JBG11.001) в подарок!\r\n3000 ANSI люмен / 1920x1080 / 3.4 кг', 23),
(29, 'Verbatim CD-R 700Mb 52x Extra', 'Verbatim', 100000, 10, 'Тип: CD-R\r\nКоличество в упаковке: 50', 24),
(30, 'Asus RT-N12 VP', 'Asus', 98, 2654, 'WAN-порт: Ethernet\r\nИнтерфейсы: LAN: 4 x 10/100 BaseT Ethernet\r\nWAN: 1 x 10/100 BaseT\r\nСкорость Wi-Fi: 300 Мбит/с\r\nЧастота работы Wi-Fi: 2.4 ГГц', 25),
(31, 'LG G4 Leather Brown', 'LG', 23, 17000, 'Экран 5.5" IPS (2560х1440, сенсорный, Multi-Touch / моноблок / Qualcomm Snapdragon 808 (1.8 ГГц) / ОЗУ 3 ГБ / 32 ГБ встроенной памяти + поддержка карт microSD / основная камера 16 Мп + фронтальная 8 Мп / Bluetooth 4.1 / Wi-Fi a/b/g/n/ac / NFC / A-GPS / ГЛОНАСС / поддержка 2-х SIM-карт / разъем 3.5 мм / 3G / 4G / OC Android 5.1 (Lollipop) / 148.9 x 76.1 x 8.9 мм, 155 г / коричневый кожаный', 31);

-- --------------------------------------------------------

--
-- Структура таблицы `tProductsCategory`
--

CREATE TABLE IF NOT EXISTS `tProductsCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `tProductsCategory`
--

INSERT INTO `tProductsCategory` (`id`, `title`) VALUES
(1, 'Процессоры'),
(2, 'Материнские платы'),
(3, 'Куллеры'),
(4, 'Видеокарты'),
(5, 'Мониторы'),
(6, 'Мыши'),
(7, 'Ноутбуки'),
(8, 'Нетбуки'),
(9, 'Планшеты'),
(10, 'Флешки'),
(11, 'SSD-накопители'),
(12, 'Корпуса системных блоков'),
(13, 'Блоки питания'),
(14, 'Клавиатуры'),
(15, 'Web-камеры'),
(16, 'Модемы'),
(17, 'Гарнитура'),
(18, 'Принтеры'),
(19, 'Сканеры'),
(20, 'МФУ'),
(21, 'Акустические системы'),
(22, 'Источники бесперебойного питания'),
(23, 'Проекторы'),
(24, 'Оптические диски'),
(25, 'Маршрутизаторы'),
(26, 'Коммутаторы'),
(27, 'Жесткие диски'),
(28, 'ПО'),
(29, 'Моноблоки'),
(30, 'Сетевые карты'),
(31, 'Телефоны');

-- --------------------------------------------------------

--
-- Структура таблицы `tUsers`
--

CREATE TABLE IF NOT EXISTS `tUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `tUsers`
--

INSERT INTO `tUsers` (`id`, `name`, `lastname`, `birthday`, `email`, `password`, `is_active`, `reg_date`, `last_update`) VALUES
(1, 'Alex', 'Alexov', '1987-02-07', 'a@a.com', '1111', 1, '2015-08-24 08:34:00', '2015-08-24 08:34:00'),
(2, 'Olga', 'Olgova', '1987-01-19', 'olga@ddd.com', '2222', 1, '2015-08-24 10:54:02', '2015-08-24 10:54:02'),
(3, 'John', 'Smit', '1990-12-17', 'john@asd.ru', '333', 0, '2015-08-24 14:54:00', '2015-08-24 14:54:00'),
(4, 'Mike', 'Doe', '1968-07-20', 'mike@doe.com', '123', 1, '2014-07-22 08:34:00', '2014-07-22 08:34:00'),
(5, 'Andrey', 'Krupnov', '1998-08-01', 'andrey@wer.ru', '8567456', 0, '1999-12-31 23:59:59', '1999-12-31 23:59:59'),
(6, 'Paul', 'Hauser', '1995-03-14', 'paul@dcx.rf', '7865fdgfdgdfg', 1, '2010-10-17 03:45:09', '2010-10-17 03:45:09'),
(7, 'Angelika', 'Kross', '2001-09-20', 'angela@adfdsj.sd', 'fdsjhuiY76g', 1, '2012-04-28 12:46:23', '2012-04-28 12:46:23'),
(8, 'Иван', 'Ефремов', '1934-12-09', 'efrem@ad.ll', 'jkh8ygytf^fy', 1, '1996-11-11 20:59:59', '1996-11-11 20:59:59'),
(9, 'Иосиф', 'Апанасенко', '1998-10-09', 'iosif@sdfjdsn.ru', 'gfd#RT45yghfGfd', 0, '2012-06-29 12:46:23', '2012-06-29 12:46:23'),
(10, 'Павел', 'Артемьев', '1986-07-03', 'pavel@dsjf.cc', 'dsfertgergerg', 0, '2000-07-17 03:45:09', '2000-07-17 03:45:09'),
(11, 'Иван', 'Баграмян', '1976-07-20', 'ivan@sss.su', '6584316584165', 1, '2002-03-30 19:27:40', '2002-03-30 19:27:40'),
(12, 'Иван', 'Богданов', '1969-08-30', 'ivan@wqws.su', '54hgu77g', 1, '2005-08-27 03:35:08', '2005-08-27 03:35:08'),
(13, 'Семён', 'Будённый', '1981-12-20', 'sem@safds.asd', 'dsfdfghfghfg', 0, '1998-10-13 08:22:16', '1998-10-13 08:22:16'),
(14, 'Александр', 'Василевский', '1983-11-28', 'alex@dff.ccs', 'dfgrfhghjtretg', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Николай', 'Ватутин', '1995-03-22', 'nic@ddjfbdhf.es', '433tg4gthtrh', 1, '2009-07-14 22:34:09', '2009-07-14 22:34:09'),
(16, 'Климент', 'Ворошилов', '1977-05-09', 'kl@fgbs.su', 'ewrf24efefsdf', 0, '2000-10-16 13:25:56', '2000-10-16 13:25:56'),
(17, 'Леонид', 'Говоров', '1982-12-25', 'leon@dss.lo', 'dfgfdddddddd', 1, '1994-02-11 09:12:27', '1994-02-11 09:12:27'),
(18, 'Филипп', 'Голиков', '1974-06-22', 'fil@fdfhb.pp', 'fdffsdfsdfsdf', 0, '1992-08-12 22:09:44', '1992-08-12 22:09:44'),
(19, 'Василий', 'Гордов', '1993-03-15', 'v@sdd.fs', 'dfgewrgegerg', 1, '2015-08-24 06:34:00', '2015-08-24 06:34:00'),
(20, 'Андрей', 'Ерёменко', '2004-02-24', 'a@ddd.add', 'frgehrthtyhjtyj', 0, '2014-09-30 23:04:07', '2014-09-30 23:04:07'),
(21, 'Михаил', 'Ефремов[', '1978-03-30', 'mih@fff.los', 'dfsdgdfgdfgeeve', 1, '2015-03-24 02:34:00', '2015-03-24 02:34:00'),
(22, 'Георгий', 'Жуков', '1959-01-30', 'g@ff.ggg', 'safdrhk5644', 1, '2008-05-02 18:44:23', '2008-05-02 18:44:23'),
(23, 'Георгий', 'Захаров', '1966-05-27', 'g@erfd.cas', 'sfddsfsfwefrgvergv', 0, '2005-02-23 13:35:08', '2005-02-23 13:35:08'),
(24, 'Михаил', 'Кирпонос', '2000-07-21', 'mih.k@df.pd', 'q24t4h5b5tgvbt', 0, '2015-02-13 23:35:08', '2015-02-13 23:35:08'),
(25, 'Михаил', 'Ковалёв', '1967-12-09', 'a@dffwwdf.ccw', 'efwe343ghtj676juyjmn', 1, '2003-11-17 03:45:09', '2003-11-17 03:45:09'),
(26, 'Дмитрий', 'Козлов', '1977-02-27', 'dim@ddsfsdf.pp', 'sahrtkmhgjtyjtnr', 1, '2015-08-24 14:34:00', '2015-08-24 14:34:00'),
(27, 'Иван', 'Конев', '1995-04-21', 'ivan@sdsfsdfss.su', 'ef3334t45t455', 0, '1998-12-23 18:22:16', '1998-12-23 18:22:16'),
(28, 'Фёдор', 'Костенко[', '1996-04-20', 'ds@sjomw.ee', 'ewe232e4f34f', 1, '2013-01-27 23:35:09', '2013-01-27 23:35:09'),
(29, 'Фёдор', 'Кузнецов', '1996-08-30', 'ew@fffew.oow', 'werwevvvbgfbrtgerfvvf', 0, '2011-04-07 20:11:19', '2011-04-07 20:11:19'),
(30, 'Павел', 'Курочкин', '2000-06-11', 'eeerw@eee.vi', 'erwgerhbtyuj6brtrt', 1, '2013-01-13 13:35:39', '2013-01-13 13:35:39'),
(31, 'Константин', 'Рокосовский', '1987-12-07', 'aaa@sdsa.cc', 'dferferferfe', 1, '2015-08-24 08:34:00', '2015-08-24 08:34:00');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `tOrderPart`
--
ALTER TABLE `tOrderPart`
  ADD CONSTRAINT `torderpart_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `tProducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `torderpart_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tOrders`
--
ALTER TABLE `tOrders`
  ADD CONSTRAINT `torders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tProducts`
--
ALTER TABLE `tProducts`
  ADD CONSTRAINT `tproducts_ibfk_1` FOREIGN KEY (`id_catalog`) REFERENCES `tProductsCategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
