-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 07 2025 г., 20:14
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tourcompany`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `ID` int(11) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`ID`, `LastName`, `FirstName`, `MiddleName`, `Address`, `Phone`) VALUES
(2, 'Иванов', 'Иван', 'Иванович', 'Москва, ул. Ленина 1', '123-456-789'),
(3, 'Евгений', 'Путевой', 'Александрович', 'Вологда, Ленина 1', '123-456-666'),
(5, 'Иванов', 'Иван', 'Иванович', 'Москва, ул. Ленина, д.10', '89001112233'),
(6, 'Петров', 'Петр', 'Петрович', 'Санкт-Петербург, Невский проспект, д.25', '89112223344'),
(7, 'Сидоров', 'Алексей', 'Андреевич', 'Новосибирск, ул. Гагарина, д.3', '89223334455'),
(8, 'Кузнецова', 'Анна', 'Сергеевна', 'Екатеринбург, ул. Ленина, д.17', '89334445566'),
(9, 'Федоров', 'Дмитрий', 'Олегович', 'Казань, ул. Баумана, д.45', '89445556677'),
(10, 'Морозова', 'Елена', 'Алексеевна', 'Челябинск, ул. Кирова, д.19', '89556667788'),
(11, 'Васильев', 'Сергей', 'Владимирович', 'Омск, ул. Лермонтова, д.9', '89667778899'),
(12, 'Николаев', 'Олег', 'Геннадьевич', 'Тюмень, ул. Республики, д.11', '89778889900'),
(13, 'Попова', 'Мария', 'Викторовна', 'Красноярск, ул. Парковая, д.33', '89889990011'),
(14, 'Григорьев', 'Владимир', 'Игоревич', 'Воронеж, ул. Пушкинская, д.20', '89990001122');

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE `sales` (
  `ID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `TourID` int(11) NOT NULL,
  `SaleDate` date NOT NULL,
  `Discount` decimal(10,2) DEFAULT 0.00,
  `TotalPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `sales`
--

INSERT INTO `sales` (`ID`, `ClientID`, `TourID`, `SaleDate`, `Discount`, `TotalPrice`) VALUES
(61, 11, 1, '2024-05-15', 5000.00, 70000.00),
(62, 12, 2, '2024-06-20', 3000.00, 47000.00),
(63, 3, 3, '2024-07-10', 8000.00, 112000.00),
(64, 14, 4, '2024-08-05', 5000.00, 105000.00),
(65, 5, 5, '2024-09-12', 6000.00, 89000.00),
(66, 6, 6, '2024-10-18', 7000.00, 123000.00),
(67, 7, 7, '2024-11-25', 4000.00, 86000.00),
(68, 8, 8, '2024-12-30', 10000.00, 240000.00),
(69, 9, 9, '2025-01-15', 8000.00, 132000.00),
(70, 10, 10, '2025-02-20', 3610.00, 68590.00);

-- --------------------------------------------------------

--
-- Структура таблицы `tours`
--

CREATE TABLE `tours` (
  `ID` int(11) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Climate` varchar(50) DEFAULT NULL,
  `HotelClass` int(11) DEFAULT NULL CHECK (`HotelClass` between 1 and 5),
  `Duration` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `tours`
--

INSERT INTO `tours` (`ID`, `Country`, `Climate`, `HotelClass`, `Duration`, `Price`) VALUES
(1, 'Турция', 'Средиземноморский', 5, 10, 75000.00),
(2, 'Египет', 'Субтропический', 4, 7, 50000.00),
(3, 'Испания', 'Средиземноморский', 5, 14, 120000.00),
(4, 'Италия', 'Умеренный', 4, 10, 110000.00),
(5, 'Греция', 'Средиземноморский', 5, 12, 95000.00),
(6, 'Франция', 'Умеренный', 5, 7, 130000.00),
(7, 'Таиланд', 'Тропический', 4, 10, 90000.00),
(8, 'Мальдивы', 'Экваториальный', 5, 14, 250000.00),
(9, 'ОАЭ', 'Аридный', 5, 7, 140000.00),
(10, 'Кипр', 'Средиземноморский', 4, 10, 85000.00);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `TourID` (`TourID`);

--
-- Индексы таблицы `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `sales`
--
ALTER TABLE `sales`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT для таблицы `tours`
--
ALTER TABLE `tours`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`TourID`) REFERENCES `tours` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
