-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 10:54 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `c_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `msg` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`c_id`, `name`, `msg`) VALUES
(1, 'poonam ', 'hello how are');

-- --------------------------------------------------------

--
-- Table structure for table `py_tut`
--

CREATE TABLE `py_tut` (
  `py_id` int(200) NOT NULL,
  `slug` varchar(21) NOT NULL,
  `py_intro` varchar(500) NOT NULL,
  `py_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `py_tut`
--

INSERT INTO `py_tut` (`py_id`, `slug`, `py_intro`, `py_content`) VALUES
(1, 'Python-introduction', 'What is Python?', 'Python is an easy to learn, powerful programming language. It has efficient high-level data structures and a simple but effective approach to object-oriented programming. Python’s elegant syntax and dynamic typing, together with its interpreted nature, make it an ideal language for scripting and rapid application development in many areas on most platforms. The Python interpreter and the extensive standard library are freely available in source or binary form for all major platforms from the Python Web site  The Python interpreter is easily extended with new functions and data types implemented in C or C++ (or other languages callable from C). Python is also suitable as an extension language for customizable applications.'),
(7, 'Python-basic-Syntax', 'Python Syntax', 'The Python language has many similarities to Perl, C, and Java. However, there are some definite differences between the languages.\r\nLet us execute programs in different modes of programming.\r\n\r\nInteractive Mode Programming\r\nInvoking the interpreter without passing a script file as a parameter brings up the following prompt −\r\n$ python\r\nPython 2.4.3 (#1, Nov 11 2010, 13:34:43)\r\n[GCC 4.1.2 20080704 (Red Hat 4.1.2-48)] on linux2\r\nType \"help\", \"copyright\", \"credits\" or \"license\" for more information.\r\n>>>\r\nType the following text at the Python prompt and press the Enter −\r\n>>> print \"Hello, Python!\"'),
(8, 'python-variable', 'Python Variable ', 'Variables are nothing but reserved memory locations to store values. This means that when you create a variable you reserve some space in memory.\r\n\r\nBased on the data type of a variable, the interpreter allocates memory and decides what can be stored in the reserved memory. Therefore, by assigning different data types to variables, you can store integers, decimals or characters in these variables. Python variables do not need explicit declaration to reserve memory space. The declaration happens automatically when you assign a value to a variable. The equal sign (=) is used to assign values to variables.\r\n\r\n\r\nThe operand to the left of the = operator is the name of the variable and the operand to the right of the = operator is the value stored in the variable\r\nThe data stored in memory can be of many types. For example, a person\'s age is stored as a numeric value and his or her address is stored as alphanumeric characters. Python has various standard data types that are used to define the operations possible on them and the storage method for each of them.\r\n\r\nPython has five standard data types −\r\n\r\nNumbers\r\nString\r\nList\r\nTuple\r\nDictionary\r\n\r\nNumber data types store numeric values. Number objects are created when you assign a value to them. For example −\r\n\r\nvar1 = 1\r\nvar2 = 10\r\n\r\nPython Strings\r\nStrings in Python are identified as a contiguous set of characters represented in the quotation marks. Python allows for either pairs of single or double quotes. Subsets of strings can be taken using the slice operator ([ ] and [:] ) with indexes starting at 0 in the beginning of the string and working their way from -1 at the end\r\nPython Lists\r\nLists are the most versatile of Python\'s compound data types. A list contains items separated by commas and enclosed within square brackets ([]). To some extent, lists are similar to arrays in C. One difference between them is that all the items belonging to a list can be of different data type'),
(9, 'python-Datatype', 'Python Data type', 'List, Tuple, Set, String, Integer, Float are the Data type of Python Language.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `py_tut`
--
ALTER TABLE `py_tut`
  ADD PRIMARY KEY (`py_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `py_tut`
--
ALTER TABLE `py_tut`
  MODIFY `py_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
