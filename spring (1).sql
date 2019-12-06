-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 06 2019 г., 16:28
-- Версия сервера: 10.4.6-MariaDB
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `spring`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(2, 'Canada'),
(3, 'Fort Mill'),
(4, 'Brockton'),
(5, 'Knoxville'),
(6, 'North Augusta\r\n'),
(7, 'Bowling Green'),
(8, 'Sumter');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(100) NOT NULL,
  `postId` int(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `postId`, `author`, `comment`, `date`) VALUES
(1, 10, '33', '55', '2019-11-14 19:32:20'),
(2, 10, '33', '11', '2019-11-14 19:32:24'),
(3, 10, '33', '44', '2019-11-14 18:16:36'),
(4, 10, '33', '4124124', '2019-11-14 18:20:40'),
(5, 10, '33', '124124', '2019-11-14 19:34:36'),
(6, 10, '11', '555', '2019-11-14 19:38:05'),
(7, 14, '11', '44', '2019-11-14 19:41:00'),
(9, 15, 'qwe', 'oqhuroiq', '2019-11-15 06:02:25');

-- --------------------------------------------------------

--
-- Структура таблицы `flats`
--

CREATE TABLE `flats` (
  `id` int(100) NOT NULL,
  `id_users` int(100) NOT NULL,
  `room` int(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `id_streets` int(100) NOT NULL,
  `house` varchar(255) NOT NULL,
  `flat` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `postDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `flats`
--

INSERT INTO `flats` (`id`, `id_users`, `room`, `content`, `id_streets`, `house`, `flat`, `price`, `postDate`) VALUES
(4, 3, 1, '1', 1, '1', '1', 1, '2019-11-27 15:01:30'),
(5, 3, 4, 'Hello', 7, '48', 'qwe', 42.42, '2019-11-28 18:44:10'),
(7, 8, 2, 'Detailed Soap', 10, '24', 'Detailed Soap', 994.23, '2019-11-28 18:46:56'),
(9, 8, 3, 'Bear Winter', 14, '84', 'Bear Winter', 884.99, '2019-11-28 18:47:38'),
(10, 8, 6, 'Leave Purpose', 9, '94', 'Leave Purpose', 284.12, '2019-11-28 18:48:26'),
(11, 3, 0, '0', 1, '0', '0', 0, '2019-11-29 05:10:25');

-- --------------------------------------------------------

--
-- Структура таблицы `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(13),
(13);

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`id`, `name`, `price`) VALUES
(2, 'Nike', 200),
(3, 'Puma', 120),
(10, 'ccdfdf', 23);

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

CREATE TABLE `notes` (
  `id` int(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `postDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `notes`
--

INSERT INTO `notes` (`id`, `author`, `content`, `postDate`) VALUES
(6, 'asd', 'w', '2019-11-26 10:28:59'),
(7, 'asd', 'e', '2019-11-26 10:29:02'),
(11, 'eee', 'e', '2019-11-26 16:24:43'),
(12, '', '321\'', '2019-11-28 19:25:46');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `postDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `author`, `title`, `content`, `postDate`) VALUES
(13, '6', '333', '333', '2019-11-14 17:19:13'),
(14, '333', '55', '31', '2019-11-14 19:46:44'),
(15, 'qwe', 'akslka', '', '2019-11-15 06:02:16');

-- --------------------------------------------------------

--
-- Структура таблицы `streets`
--

CREATE TABLE `streets` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_city` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `streets`
--

INSERT INTO `streets` (`id`, `name`, `id_city`) VALUES
(1, 'Shoe Street', 2),
(2, 'Kamai Street', 2),
(3, '7539 George Circle', 3),
(4, '8815 W. Water Drive', 4),
(5, '528 James St.', 5),
(6, '9141 Edgewater Street', 6),
(7, '7 Goldfield Street\r\n', 7),
(8, '9020 Indian Summer St.', 8),
(9, '435 W. Grove Ave.', 7),
(10, '764 North Saxon Lane\r\n', 4),
(11, '7018 Gonzales Ave.\r\n', 3),
(12, '8357 East Pumpkin Hill St.\r\n', 5),
(13, '26 Railroad Street\r\n', 6),
(14, '9 South Meadow Ave.\r\n', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `t_cars`
--

CREATE TABLE `t_cars` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `t_cars`
--

INSERT INTO `t_cars` (`id`, `name`, `price`, `year`) VALUES
(1, 'q', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `repassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `login`, `password`, `repassword`) VALUES
(3, 'h@gmail.com', 'asd', 'w', 'w'),
(8, 'q@gmail.com', 'eee', 'q', 'q');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `flats`
--
ALTER TABLE `flats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id.users` (`id_users`,`id_streets`),
  ADD KEY `id.streets` (`id_streets`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id.city` (`id_city`);

--
-- Индексы таблицы `t_cars`
--
ALTER TABLE `t_cars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `flats`
--
ALTER TABLE `flats`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `streets`
--
ALTER TABLE `streets`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `t_cars`
--
ALTER TABLE `t_cars`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `flats`
--
ALTER TABLE `flats`
  ADD CONSTRAINT `flats_ibfk_1` FOREIGN KEY (`id_streets`) REFERENCES `streets` (`id`),
  ADD CONSTRAINT `flats_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `streets`
--
ALTER TABLE `streets`
  ADD CONSTRAINT `streets_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
