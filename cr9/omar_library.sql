-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2017 at 02:21 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omar_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookId` int(11) NOT NULL,
  `bookTitle` varchar(30) NOT NULL,
  `bookAuthor` varchar(30) NOT NULL,
  `bookISBN` int(11) NOT NULL,
  `bookShortDescription` varchar(400) NOT NULL,
  `bookImage` varchar(1000) NOT NULL,
  `bookStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookId`, `bookTitle`, `bookAuthor`, `bookISBN`, `bookShortDescription`, `bookImage`, `bookStatus`) VALUES
(1, 'Don Quixote', 'Miguel de Cervantes', 99900099, 'Alonso Quixano, a retired country gentleman in his fifties, lives in an unnamed section of La Mancha with his niece and a housekeeper. He has become obsessed with books of chivalry, and believes their every word to be true, despite the fact that many of the events in them are clearly impossible.', 'https://images-na.ssl-images-amazon.com/images/I/41d-rugLMRL.jpg', 'available '),
(2, 'Moby Dick', 'Herman Melville', 9548795, 'First published in 1851, Melville\'s masterpiece is, in Elizabeth Hardwick\'s words, \"the greatest novel in American literature.', 'https://images-na.ssl-images-amazon.com/images/I/417%2B4OtvXhL.jpg', 'reserved'),
(3, 'In Search of Lost Time', 'Marcel Proust', 45674521, 'Swann\'s Way, the first part of A la recherche de temps perdu, Marcel Proust\'s seven-part cycle, was published in 1913. In it, Proust introduces the themes that run through the entire work. The narrator recalls his childhood, aided by the famous madeleine', 'https://images-na.ssl-images-amazon.com/images/I/51me-a8zgcL.jpg', 'reserved'),
(4, 'Ulysses ', 'James Joyce', 9898989, 'Ulysses chronicles the passage of Leopold Bloom through Dublin during an ordinary day, June 16, 1904. The title parallels and alludes to Odysseus (Latinised into Ulysses), the hero of Homer\'s Odyssey (e.g., the correspondences between Leopold Bloom and Odysseus, Molly Bloom and Penelope, and Stephen Dedalus and Telemachus). Joyce fans worldwide now celebrate June 16 as Bloomsday.', 'http://ecx.images-amazon.com/images/I/41BS9YHQF1L.jpg', 'reserved'),
(5, 'The Odyssey', 'Homer', 659874, 'The Odyssey is one of two major ancient Greek epic poems attributed to Homer. It is, in part, a sequel to the Iliad, the other work traditionally ascribed to Homer. The poem is fundamental to the modern Western canon. Indeed it is the second—the Iliad being the first—extant work of Western literature. ', 'https://images-na.ssl-images-amazon.com/images/I/51cUwb0DUPL.jpg', 'available'),
(6, 'War and Peace', 'Leo Tolstoy', 9874569, 'Epic in scale, War and Peace delineates in graphic detail events leading up to Napoleon\'s invasion of Russia, and the impact of the Napoleonic era on Tsarist society, as seen through the eyes of five Russian aristocratic families.', 'https://images-na.ssl-images-amazon.com/images/I/510UE7bvHoL.jpg', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `librarys`
--

CREATE TABLE `librarys` (
  `libraryId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userSurName` varchar(30) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userName`, `userSurName`, `userEmail`, `userPass`) VALUES
(1, 'hhh', 'iii', 'a@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`);

--
-- Indexes for table `librarys`
--
ALTER TABLE `librarys`
  ADD PRIMARY KEY (`libraryId`),
  ADD UNIQUE KEY `userId` (`userId`),
  ADD UNIQUE KEY `bookId` (`bookId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `librarys`
--
ALTER TABLE `librarys`
  MODIFY `libraryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `librarys`
--
ALTER TABLE `librarys`
  ADD CONSTRAINT `librarys_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `librarys_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
