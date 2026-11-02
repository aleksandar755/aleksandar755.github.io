-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2026 at 09:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

CREATE DATABASE IF NOT EXISTS quiz_platform;
USE quiz_platform;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT 'Opšte',
  `answer_a` varchar(200) DEFAULT NULL,
  `answer_b` varchar(200) DEFAULT NULL,
  `answer_c` varchar(200) DEFAULT NULL,
  `answer_d` varchar(200) DEFAULT NULL,
  `correct_answer` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `category`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_answer`) VALUES
(1, 'Koji je glavni grad Francuske?', 'Opšte', 'Berlin', 'Madrid', 'Pariz', 'Rim', 'C'),
(2, 'Koji planet je poznat kao Crvena planeta?', 'Opšte', 'Venera', 'Mars', 'Jupiter', 'Saturn', 'B'),
(3, 'Koji je hemijski simbol za zlato?', 'Opšte', 'Ag', 'Fe', 'Au', 'Pb', 'C'),
(4, 'Koja je najveća planeta u Sunčevom sistemu?', 'Opšte', 'Zemlja', 'Mars', 'Jupiter', 'Neptun', 'C'),
(5, 'Koji se gas najviše nalazi u atmosferi Zemlje?', 'Opšte', 'Kiseonik', 'Azot', 'Ugljen-dioksid', 'Vodonik', 'B'),
(6, 'Ko je napisao \"Na Drini ćuprija\"?', 'Opšte', 'Miloš Crnjanski', 'Ivo Andrić', 'Meša Selimović', 'Desanka Maksimović', 'B'),
(7, 'Koji je glavni grad Italije?', 'Opšte', 'Milano', 'Venecija', 'Napulj', 'Rim', 'D'),
(8, 'Koji je najbrži kopneni sisar?', 'Opšte', 'Lav', 'Gepard', 'Konj', 'Zebra', 'B'),
(9, 'Koliko okeana postoji na Zemlji?', 'Opšte', '3', '4', '5', '6', 'C'),
(10, 'Koja reka protiče kroz London?', 'Opšte', 'Sena', 'Dunav', 'Temza', 'Tibar', 'C'),
(11, 'Koji je najviši vrh na svetu?', 'Opšte', 'K2', 'Kilimandžaro', 'Mont Everest', 'Akonkagva', 'C'),
(12, 'Koji metal je tečan na sobnoj temperaturi?', 'Opšte', 'Gvožđe', 'Živa', 'Bakar', 'Aluminijum', 'B'),
(13, 'Koja država ima najveći broj stanovnika?', 'Opšte', 'Indija', 'Kina', 'SAD', 'Rusija', 'A'),
(14, 'Koji je najveći organ ljudskog tela?', 'Opšte', 'Srce', 'Pluća', 'Jetra', 'Koža', 'D'),
(15, 'U kojoj zemlji su piramide u Gizi?', 'Opšte', 'Meksiko', 'Egipat', 'Peru', 'Grčka', 'B'),
(16, 'Koji je najtvrđi prirodni materijal?', 'Opšte', 'Čelik', 'Zlato', 'Dijamant', 'Gvožđe', 'C'),
(17, 'Ko je naslikao Mona Lizu?', 'Opšte', 'Van Gog', 'Pikaso', 'Leonardo da Vinči', 'Mikelanđelo', 'C'),
(18, 'Šta znači skraćenica RAM?', 'IT', 'Read Access Memory', 'Random Access Memory', 'Run Active Module', 'Rapid Area Mode', 'B'),
(19, 'Ko je osnivač Microsofta?', 'IT', 'Steve Jobs', 'Elon Musk', 'Bill Gates', 'Mark Zuckerberg', 'C'),
(20, 'Koji jezik se koristi za razvoj Android aplikacija?', 'IT', 'Swift', 'Kotlin', 'PHP', 'Ruby', 'B'),
(21, 'Šta radi HTML oznaka <a>?', 'IT', 'Pravi sliku', 'Pravi tabelu', 'Pravi link', 'Pravi naslov', 'C'),
(22, 'Koja kompanija je napravila iPhone?', 'IT', 'Samsung', 'Apple', 'Huawei', 'Google', 'B'),
(23, 'Šta znači skraćenica CPU?', 'IT', 'Central Processing Unit', 'Computer Personal Unit', 'Central Phone Utility', 'Core Process Unit', 'A'),
(24, 'Šta je \"bit\" u računarstvu?', 'IT', 'Deo procesora', 'Najmanja jedinica podataka', 'Programski jezik', 'Vrsta monitora', 'B'),
(25, 'Koji se protokol koristi za prenos web stranica?', 'IT', 'FTP', 'HTTP', 'SMTP', 'SSH', 'B'),
(26, 'Šta znači skraćenica SQL?', 'IT', 'Simple Query Logic', 'Structured Query Language', 'Standard Quick Link', 'System Quest List', 'B'),
(27, 'Koji OS koristi jezgro Linux?', 'IT', 'Windows', 'macOS', 'Android', 'iOS', 'C'),
(28, 'Koja je osnovna jedinica za brzinu procesora?', 'IT', 'Bajt', 'Herc', 'Bit', 'Vat', 'B'),
(29, 'Kako se zove prvi programski jezik?', 'IT', 'C', 'Fortran', 'Python', 'Pascal', 'B'),
(30, 'Šta je \"Bug\" u programiranju?', 'IT', 'Virus', 'Greška u kodu', 'Vrsta procesora', 'Hardverski deo', 'B'),
(31, 'Koji taster se najčešće koristi za \"Refresh\" stranice?', 'IT', 'F1', 'F5', 'F12', 'ESC', 'B'),
(32, 'Koji domen je namenjen komercijalnim sajtovima?', 'IT', '.org', '.net', '.com', '.edu', 'C'),
(33, 'Koja društvena mreža je poznata po porukama od 280 karaktera?', 'IT', 'Facebook', 'Instagram', 'Twitter (X)', 'LinkedIn', 'C'),
(34, 'Koji je najpopularniji jezik za baze podataka?', 'IT', 'SQL', 'Python', 'Java', 'PHP', 'A'),
(35, 'Koliko traje fudbalska utakmica (regularni deo)?', 'Sport', '45 min', '60 min', '90 min', '100 min', 'C'),
(36, 'Koji sportista ima nadimak \"Air\"?', 'Sport', 'Lionel Messi', 'Michael Jordan', 'Roger Federer', 'Usain Bolt', 'B'),
(37, 'U kom gradu su održane prve moderne Olimpijske igre?', 'Sport', 'Atina', 'Pariz', 'London', 'Rim', 'A'),
(38, 'Koji teniser ima najviše osvojenih Grend slemova?', 'Sport', 'Roger Federer', 'Rafael Nadal', 'Novak Đoković', 'Andy Murray', 'C'),
(39, 'Koliko igrača ima u prvoj postavi košarkaškog tima?', 'Sport', '11', '7', '5', '6', 'C'),
(40, 'U kom sportu se koristi termin \"hole-in-one\"?', 'Sport', 'Tenis', 'Golf', 'Vaterpolo', 'Bilijar', 'B'),
(41, 'U kom gradu se igra finale teniskog turnira Vimbldon?', 'Sport', 'Njujork', 'Pariz', 'London', 'Melburn', 'C'),
(42, 'Ko drži rekord za najbrži sprint na 100 metara?', 'Sport', 'Carl Lewis', 'Usain Bolt', 'Tyson Gay', 'Yohan Blake', 'B'),
(43, 'Koliko poena nosi \"trojka\" u košarci?', 'Sport', '2', '3', '4', '1', 'B'),
(44, 'Koji fudbalski klub ima nadimak \"Kraljevski klub\"?', 'Sport', 'Barcelona', 'Bayern', 'Real Madrid', 'Milan', 'C'),
(45, 'U kom sportu se koristi pak?', 'Sport', 'Fudbal', 'Hokej na ledu', 'Tenis', 'Bejzbol', 'B'),
(46, 'Koliko setova je potrebno za pobedu u muškom tenisu na Grend slemu?', 'Sport', '2', '3', '4', '5', 'B'),
(47, 'Koji sport se igra na \"Rolan Garosu\"?', 'Sport', 'Golf', 'Tenis', 'Kriket', 'Ragbi', 'B'),
(48, 'Koja država je osvojila najviše Svetskih prvenstava u fudbalu?', 'Sport', 'Nemačka', 'Italija', 'Brazil', 'Argentina', 'C'),
(49, 'Koliko prstenova ima na olimpijskoj zastavi?', 'Sport', '4', '5', '6', '7', 'B'),
(50, 'Koji vozač Formule 1 ima najviše titula?', 'Sport', 'Vettel', 'Hamilton', 'Alonso', 'Verstappen', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `user_id`, `score`, `date`) VALUES
(1, 1, 3, '2026-03-10 22:55:05'),
(2, 1, 3, '2026-03-10 22:56:01'),
(3, 1, 1, '2026-03-10 23:24:49'),
(4, 1, 0, '2026-03-10 23:33:48'),
(5, 1, 0, '2026-03-10 23:34:57'),
(6, 1, 15, '2026-03-10 23:36:00'),
(7, 1, 0, '2026-03-10 23:37:36'),
(8, 1, 0, '2026-03-10 23:42:54'),
(9, 1, 1, '2026-03-10 23:46:06'),
(10, 1, 2, '2026-03-10 23:52:02'),
(11, 1, 1, '2026-03-10 23:52:11'),
(12, 1, 1, '2026-03-10 23:54:21'),
(13, 1, 0, '2026-03-10 23:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'test', 'test@gmail', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
