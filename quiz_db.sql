-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 04:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE `option` (
  `option_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `option_text` text DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `option`
--

INSERT INTO `option` (`option_id`, `question_id`, `option_text`, `is_correct`) VALUES
(1, 1, 'Post the message text on Google+ to see if someone can help translate it to German', 0),
(2, 1, 'Use Gmail to send a message around the school to search for a student who can help translate the email to German', 0),
(3, 1, 'Use Google Search to find someone local offering German translation services to help with the email', 0),
(4, 1, 'Search the Chrome Web Store for the Google Translate extension for Chrome. Use the extension to provide a German version of the text within the email', 1),
(5, 2, 'Students can discuss assignments in a collaborative environment', 1),
(6, 2, 'Students can choose to have assignment results sent directly to their phone as a text message', 0),
(7, 2, 'Students can view each other’s assignments if they need ideas', 0),
(8, 2, 'If students are sick from school they can cancel pending assignments from home using the Cancel button', 0),
(9, 2, 'Assignments and resources are kept organized in one place', 1),
(10, 2, 'Students can see at a glance when assignments are due', 1),
(11, 3, 'Delete bookmarks that are not urgently required and search for them again when they are needed', 0),
(12, 3, 'Use the search function in the Chrome Bookmark Manager', 1),
(13, 3, 'Rename and organize bookmarks into themed folders so they are labeled clearly', 1),
(14, 3, 'Create a Doc that lists all favorite websites with links', 0),
(15, 4, 'Check and change privacy settings on her blog to see if she had shared it with just members of her school or with the public', 1),
(16, 4, 'Document the user’s details', 1),
(17, 4, 'Block the person from accessing the blog', 1),
(18, 4, 'Report the incident to a member of staff if it happens again', 1),
(19, 4, 'Respond directly to the person and challenge their comments', 0),
(20, 4, 'Search for the user through other online networks and retaliate there', 0),
(21, 5, 'Students can browse and copy slides created by any student at any other school', 1),
(22, 5, 'Students can edit speaker notes to help improve each other’s presentation delivery', 0),
(23, 5, 'Students can comment on slides to provide feedback for their group members', 1),
(24, 5, 'Students can collaborate on the slide deck at the same time', 1),
(25, 5, 'Students can import videos from YouTube or a Drive folder they’ve shared with each other without additional software', 1),
(26, 6, 'When a teacher sets an assignment in Classroom, email notifications and the class Stream ensure students don’t need to be constantly reminded', 1),
(27, 6, 'Teachers can define answers when they set assignments to enable auto-grading', 1),
(28, 6, 'When a student completes an assignment, Classroom automatically emails all related documents to peers in their class for review', 0),
(29, 6, 'Teachers can grade and comment on assignments directly in Classroom and students will immediately receive email notifications to view their scores', 1),
(30, 6, 'Students can exchange messages with each other to help clear up any assignment misunderstanding without having to ask their teacher', 0),
(31, 7, 'Students can discuss assignments in a collaborative environment', 1),
(32, 7, 'Students can choose to have assignment results sent direct to their phone as a text message', 0),
(33, 7, 'Students can view each other’s assignments if they need ideas', 0),
(34, 7, 'If students are sick from school they can cancel pending assignments from home using the Cancel button', 0),
(35, 7, 'Students can see at a glance when assignments are due', 1),
(36, 7, 'Assignments and resources are kept organized in one place', 1),
(37, 8, 'Designing a logo for a school football team', 0),
(38, 8, 'Surveys for collecting data for group projects', 1),
(39, 8, 'Gathering feedback on field trips', 1),
(40, 8, 'Create formative quiz checks at the end of each lesson', 1),
(41, 8, 'Performing basic calculations with numeric data', 0),
(42, 8, 'Creating an interactive presentation', 0),
(43, 9, 'Search for emails containing hyperlinks', 0),
(44, 9, 'Search for keywords within emails', 1),
(45, 9, 'Filter emails by word count', 0),
(46, 9, 'Filter emails that have attachments', 1),
(47, 9, 'Search for emails within a label', 1),
(48, 9, 'Search for emails by sender or recipient', 1),
(49, 10, 'Use Hangouts to video call his students when he needs to talk to them urgently outside of school hours', 0),
(50, 10, 'Use Calendar to set up a task calendar for deadlines', 0),
(51, 10, 'Use instant messaging in Hangouts to send messages directly to students, which can be received on a PC or through a mobile app', 1),
(52, 10, 'Use Groups to send group messages to all students in his class', 1),
(53, 11, 'She can use Google Sheets to take minutes during faculty meetings and share them with participants and missing faculty members.', 0),
(54, 11, 'She can use Google Sites to build a website containing all of the school’s policy documentation and set up a contacts page so staff members can send their comments directly to her to distribute to relevant people.', 0),
(55, 11, 'She can use Google Groups to easily create an online discussion forum and invite all relevant people to start conversations and participate in different discussion topics in one accessible place.', 1),
(56, 11, 'She can use Google Drive to create a shared folder containing school admin and policy documents, useful templates and other shared resources.', 0),
(57, 12, 'Use Google Search to find someone local offering German translation services to help with the email', 0),
(58, 12, 'Post the message text on Google+ to see if someone can help translate it to German', 0),
(59, 12, 'Search the Chrome Web Store for the Google Translate extension for Chrome. Use the extension to provide a German version of the text within the email', 1),
(60, 12, 'Use Gmail to send a message around the school to search for a student who can help translate the email to German', 0),
(61, 13, 'By subscribing to a Personal Learning Network, he would get paid access to educational material and advanced digital teaching tools.', 0),
(62, 13, 'By forming a Private Learning Network, he would get access to an exclusive website that allows for cloud-based resource sharing and messaging between local educators.', 0),
(63, 13, 'By joining a Professional Learners’ Network, he would get access to teacher training courses, and join regular seminars conducted by teacher training specialists', 0),
(64, 13, 'By establishing a Personal Learning Network, he would develop links with other local and non-local educators to share ideas and best practices, and to call upon for teaching advice.', 1),
(65, 14, 'So students maximize opportunities to earn money online', 0),
(66, 14, 'So students understand what they should and shouldn’t do online, and to act in a safe and respectful manner', 1),
(67, 14, 'So students can connect with the most relevant people through social media', 0),
(68, 14, 'So students understand how to get the most views and interaction to make their online content go viral', 0),
(69, 15, 'Embed relevant YouTube videos to break up the text and presentation', 1),
(70, 15, 'Insert fonts and color combinations intentionally to attract attention to key elements of the lesson', 1),
(71, 15, 'Use as much text as possible to provide a more thorough understanding of the content', 0),
(72, 15, 'Change the background color of the slides so they are not all white', 0),
(73, 16, 'Google Drive can automatically reformat documents before printing to save on paper', 0),
(74, 16, 'Google Drive makes files easily accessible from anywhere, so there is less need to print and carry documents into class', 1),
(75, 16, 'Google Drive can be configured so the printing of files in class is password protected', 0),
(76, 16, 'All class print requests can be rerouted in Google Drive to the school office', 0),
(77, 16, 'Files in Google Drive can be shared with a simple link in an email. No need to print a copy for someone in class', 1),
(78, 17, 'She can use the Offline View app on her smartphone to download an offline version of all unread emails so she can read her emails while travelling', 0),
(79, 17, 'She can use the YouTube app on her smartphone to listen to music and use that time to relax between on-site meetings', 0),
(80, 17, 'She can use the Gmail mobile app on her smartphone to access her school email account to read, send, and reply emails', 1),
(81, 17, 'She can turn on the Agenda app on her PC before she travels, which will sort her tasks and meetings while she’s travelling and arrange them in priority order when she’s back at her PC', 0),
(82, 18, 'SUGGESTION NOTEPAD', 1),
(83, 18, 'ADDITIONAL REFERENCE MATERIAL', 1),
(84, 18, 'GAUGE UNDERSTANDING', 0),
(85, 18, 'RATE THE CONTENT THAT IS BEING PRESENTED', 0),
(86, 18, 'GRAPHICALLY DESIGN IDEAS', 0),
(87, 19, 'SUGGESTION NOTEPAD', 0),
(88, 19, 'ADDITIONAL REFERENCE MATERIAL', 0),
(89, 19, 'GAUGE UNDERSTANDING', 1),
(90, 19, 'RATE THE CONTENT THAT IS BEING PRESENTED', 1),
(91, 19, 'GRAPHICALLY DESIGN IDEAS', 0),
(92, 20, 'SUGGESTION NOTEPAD', 0),
(93, 20, 'ADDITIONAL REFERENCE MATERIAL', 0),
(94, 20, 'GAUGE UNDERSTANDING', 0),
(95, 20, 'RATE THE CONTENT THAT IS BEING PRESENTED', 0),
(96, 20, 'GRAPHICALLY DESIGN IDEAS', 1),
(101, 23, 'Access to resources and information relevant for different learning speeds', 0),
(102, 23, 'The ability to collaborate remotely in real-time with peers on group projects', 1),
(103, 23, 'Lower printing and copier costs with online resources and file storage', 0),
(104, 23, 'Students given access to different types of information from a range of sources for enhanced problem-solving', 0),
(105, 24, 'Access to resources and information relevant for different learning speeds', 1),
(106, 24, 'The ability to collaborate remotely in real-time with peers on group projects', 0),
(107, 24, 'Lower printing and copier costs with online resources and file storage', 0),
(108, 24, 'Students given access to different types of information from a range of sources for enhanced problem-solving', 0),
(109, 25, 'Access to resources and information relevant for different learning speeds', 0),
(110, 25, 'The ability to collaborate remotely in real-time with peers on group projects', 0),
(111, 25, 'Lower printing and copier costs with online resources and file storage', 1),
(112, 25, 'Students given access to different types of information from a range of sources for enhanced problem-solving', 0),
(113, 26, 'Analyze trends on a record of books read by students', 1),
(114, 26, 'Create a gradebook to track student scores', 1),
(115, 26, 'Protect collected data from change', 1),
(116, 26, 'Check class understanding of a topic', 0),
(117, 26, 'Collect anonymous feedback', 0),
(118, 27, 'Check class understanding of a topic', 1),
(119, 27, 'Collect anonymous feedback', 1),
(120, 27, 'Analyze trends on a record of books read by students', 0),
(121, 27, 'Create a gradebook to track student scores', 0),
(122, 27, 'Protect collected data from change', 0),
(123, 28, 'Meeting can be extended visually with up to 15 remote participants', 1),
(124, 28, 'People can join the meeting even when mobile', 0),
(125, 28, 'Participants can communicate by text without disrupting the meeting and their conversations are saved', 0),
(126, 28, 'Hangout details are simply added when creating a meeting', 0),
(127, 28, 'Any participant can share their desktop with the group', 0),
(128, 29, 'Participants can communicate by text without disrupting the meeting and their conversations are saved', 1),
(129, 29, 'People can join the meeting even when mobile', 0),
(130, 29, 'Meeting can be extended visually with up to 15 remote participants', 0),
(131, 29, 'Hangout details are simply added when creating a meeting', 0),
(132, 29, 'Any participant can share their desktop with the group', 0),
(133, 30, 'Any participant can share their desktop with the group', 1),
(134, 30, 'People can join the meeting even when mobile', 0),
(135, 30, 'Participants can communicate by text without disrupting the meeting and their conversations are saved', 0),
(136, 30, 'Meeting can be extended visually with up to 15 remote participants', 0),
(137, 30, 'Hangout details are simply added when creating a meeting', 0),
(138, 31, 'People can join the meeting even when mobile', 1),
(139, 31, 'Participants can communicate by text without disrupting the meeting and their conversations are saved', 0),
(140, 31, 'Meeting can be extended visually with up to 15 remote participants', 0),
(141, 31, 'Hangout details are simply added when creating a meeting', 0),
(142, 31, 'Any participant can share their desktop with the group', 0),
(143, 32, 'People can join the meeting even when mobile', 0),
(144, 32, 'Participants can communicate by text without disrupting the meeting and their conversations are saved', 0),
(145, 32, 'Meeting can be extended visually with up to 15 remote participants', 0),
(146, 32, 'Hangout details are simply added when creating a meeting', 1),
(147, 32, 'Any participant can share their desktop with the group', 0),
(148, 33, 'Pinning printed projects in wall displays around the school', 1),
(149, 33, 'Working in groups in-person during set hours to collaborate on a joint project', 1),
(150, 33, 'Filing paper-based documents in a physical storage area for safe-keeping', 1),
(151, 33, 'Communicating to a wide audience by publishing work online', 0),
(152, 33, 'Remote collaboration and teamwork with multiple people for the best results', 0),
(153, 33, 'Finding the best online resource, information and method to solve a problem', 0),
(154, 33, 'Looking up an answer in a textbook', 0),
(155, 33, 'Storing documents in the cloud for easy retrieval and editing', 0),
(156, 34, 'Remote collaboration and teamwork with multiple people for the best results', 1),
(157, 34, 'Storing documents in the cloud for easy retrieval and editing', 1),
(158, 34, 'Finding the best online resource, information and method to solve a problem', 1),
(159, 34, 'Communicating to a wide audience by publishing work online', 1),
(160, 34, 'Pinning printed projects in wall displays around the school', 0),
(161, 34, 'Working in groups in-person during set hours to collaborate on a joint project', 0),
(162, 34, 'Filing paper-based documents in a physical storage area for safe-keeping', 0),
(163, 34, 'Looking up an answer in a textbook', 0);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `quiz_id`, `question_text`) VALUES
(1, 1, 'Mr. Yamouth needs to contact a student’s parents to congratulate the student on improved progress. However, their first language is German and they are not fully fluent in English. What is the quickest action he could do to produce an effective email on his own?'),
(2, 1, 'Students already familiar with a web-connected world will feel immediately at home with Google Classroom. What benefits will they enjoy from their assignments going online?'),
(3, 1, 'Mr. Perry has bookmarked a large number of webpages in Chrome while researching class topics. Unfortunately, he’s bookmarked so many that he’s struggling to find relevant content Quickly. What can he do within the Bookmark manager of Chrome to simplify and organize his list of bookmarks?'),
(4, 1, 'Mr. Swanson’s politics students had to create a blog about their policies if they were elected to be on the school’s student council. One student received a nasty response from an online user she doesn’t know. What advice should Mr. Swanson give her to overcome this type of response?'),
(5, 1, 'Ms. Garcia has divided her class into groups to work on different geography projects. Each group will present their project to the class using Google Slides. What are some benefits of using Slides in group projects?'),
(6, 1, 'Mr. Jones is keen to move to a paperless class as he finds the process of managing 150 paper-based assignments time consuming. How will shifting to Classroom help?'),
(7, 1, 'Students already familiar with a web-connected world will feel immediately at home with Google Classroom. What benefits will they enjoy from their assignments going online?'),
(8, 1, 'Mr. Bentley finds it easy to use Google Docs, Sheets, and Slides in his classroom as they are very similar to other programs he’s used in the past. He overhears his colleague Ms. Bernard talk about using Google Forms as well, but isn’t sure how it’s relevant in a school environment. Which of the following are relevant uses for Google Forms in education?'),
(9, 1, 'Mr. Brixham is the principal at the large school and receives an overwhelming volume of emails from teachers, support staff, students, parents, and the school district governors. He often struggles to find important emails quickly. How can he use the search function in Gmail to locate emails more efficiently?'),
(10, 1, 'Mr. Murakami leaves written notes with motivational quotes for his students by writing them on paper and leaving them in different locations in his classroom. Occasionally his students will claim they didn’t get a note or admit that they lost it. What can he do to overcome this issue and still send these motivational messages?'),
(11, 1, 'Ms. Villagarcia has been tasked by the principal to improve communication and discussion between teachers and support staff. What is the most appropriate tool to fulfill the need?'),
(12, 1, 'Mr. Yarmouth needs to contact a student’s parents to congratulate the student on improved progress. However, their first language is German and they are not fully fluent in English. What is the quickest action he could do to produce an effective email on his own?'),
(13, 1, 'Mr. Kapoor struggles to find inspiration from his peers. What is one benefit of establishing a Personal Learning Network (PLN)?'),
(14, 1, 'Why explain the importance of digital citizenship in a digital classroom?'),
(15, 1, 'Mr. Elba is editing a presentation in Google Slides and wants to improve the appearance of the slides. What visual elements can he incorporate into his presentation to make it more visually appealing?'),
(16, 1, 'Mrs Powell is looking at ways to reduce the amount of printing undertaken in class. How can Google Drive help?'),
(17, 1, 'Ms. Pietersen is the deputy principal in a school split across two sites. She travels regularly between the two sites by bus, but is annoyed with the amount of time she wastes traveling. She would like to make better use of her commute time. What can she do?'),
(18, 1, 'Mr. Hoffman is using Google Slides to introduce a new class project. He wants to embed and link to Docs, Forms and Drawings in order to make his slides more interactive. Which options can be used with Google Docs within slides to encourage student participation.'),
(19, 1, 'Mr. Hoffman is using Google Slides to introduce a new class project. He wants to embed and link to Docs, Forms and Drawings in order to make his slides more interactive. Which options can be used with Google Forms within slides to encourage student participation.'),
(20, 1, 'Mr. Hoffman is using Google Slides to introduce a new class project. He wants to embed and link to Docs, Forms and Drawings in order to make his slides more interactive. Which options can be used with Google Drawings within slides to encourage student participation.'),
(21, 1, 'Integrating technology in the classroom can benefit a school in many ways, and for various groups of people. Which is a benefit of \"Prescriptive teaching methods that do not allow for teacher creativity in class instruction or materials\"'),
(23, 1, 'Integrating technology in the classroom can benefit a school in many ways, and for various groups of people. Which is a benefit of \"Students limited to school hours when working with other students on collaborative projects\"'),
(24, 1, 'Integrating technology in the classroom can benefit a school in many ways, and for various groups of people. Which is a benefit of \"Standardized teaching resources for all students regardless of learning speeds and abilities\"'),
(25, 1, 'Integrating technology in the classroom can benefit a school in many ways, and for various groups of people. Which is a benefit of \"High volume of printing for assignments and worksheets, and photocopying from textbooks for take-home resources\"'),
(26, 1, 'Ms. Dent wants to use Google Forms and Google Sheets to collect and track different aspects of her students’ work. Which works for Google Sheets effectively?'),
(27, 1, 'Ms. Dent wants to use Google Forms and Google Sheets to collect and track different aspects of her students’ work. Which works for Google Forms effectively?'),
(28, 1, 'You need to speak with local schools to discuss a sports tournament you are hosting at short notice. Your intention is to gain feedback on a planned program of events and share images of available facilities. What is the benefit of Video Calling?'),
(29, 1, 'You need to speak with local schools to discuss a sports tournament you are hosting at short notice. Your intention is to gain feedback on a planned program of events and share images of available facilities. What is the benefit of Chat?'),
(30, 1, 'You need to speak with local schools to discuss a sports tournament you are hosting at short notice. Your intention is to gain feedback on a planned program of events and share images of available facilities. What is the benefit of Screenshare?'),
(31, 1, 'You need to speak with local schools to discuss a sports tournament you are hosting at short notice. Your intention is to gain feedback on a planned program of events and share images of available facilities. What is the benefit of Android and iOS app?'),
(32, 1, 'You need to speak with local schools to discuss a sports tournament you are hosting at short notice. Your intention is to gain feedback on a planned program of events and share images of available facilities. What is the benefit of Calendar integration'),
(33, 1, 'Mr Blakeney’s students are starting to think about their future careers and which digital classroom skills they need to develop. Which is a Traditional classroom skill?'),
(34, 1, 'Mr Blakeney’s students are starting to think about their future careers and which digital classroom skills they need to develop. Which is a digital classroom skill?');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL,
  `quiz_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `quiz_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Teacher Strategies Quiz', 'A quiz about various teacher strategies and tools', '2024-07-07 20:42:20', '2024-07-07 20:42:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `option`
--
ALTER TABLE `option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `option`
--
ALTER TABLE `option`
  ADD CONSTRAINT `option_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
