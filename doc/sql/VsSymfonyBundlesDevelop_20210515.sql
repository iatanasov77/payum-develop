-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 15, 2021 at 11:08 AM
-- Server version: 8.0.21
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `VsSymfonyBundlesDevelop`
--

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_LogEntries`
--

CREATE TABLE `VSAPP_LogEntries` (
  `id` int NOT NULL,
  `action` varchar(16) NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` int DEFAULT NULL,
  `object_class` varchar(128) NOT NULL,
  `version` int NOT NULL,
  `data` varchar(256) NOT NULL,
  `username` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSAPP_LogEntries`
--

INSERT INTO `VSAPP_LogEntries` (`id`, `action`, `logged_at`, `object_id`, `object_class`, `version`, `data`, `username`) VALUES
(2, 'create', '2021-05-15 08:13:17', 13, 'App\\Entity\\Cms\\Page', 1, 'a:1:{s:4:\"text\";s:16:\"<p>TEST PAGE</p>\";}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Settings`
--

CREATE TABLE `VSAPP_Settings` (
  `id` int NOT NULL,
  `site_id` int DEFAULT NULL,
  `maintenanceMode` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_page_id` int NOT NULL,
  `language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'en',
  `theme` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSAPP_Settings`
--

INSERT INTO `VSAPP_Settings` (`id`, `site_id`, `maintenanceMode`, `maintenance_page_id`, `language`, `theme`) VALUES
(1, 1, 1, 1, 'en', NULL),
(2, NULL, 1, 1, 'en', 'vankosoft/test-theme'),
(3, 2, 1, 1, 'en', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Sites`
--

CREATE TABLE `VSAPP_Sites` (
  `id` int NOT NULL,
  `title` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSAPP_Sites`
--

INSERT INTO `VSAPP_Sites` (`id`, `title`) VALUES
(1, 'Site 1'),
(2, 'Site 2');

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Taxonomy`
--

CREATE TABLE `VSAPP_Taxonomy` (
  `id` int NOT NULL,
  `root_taxon_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSAPP_Taxonomy`
--

INSERT INTO `VSAPP_Taxonomy` (`id`, `root_taxon_id`, `name`, `description`) VALUES
(1, 4, 'Test', 'Description'),
(2, 5, 'TEST 2', 'TEST 2'),
(3, 8, 'Page Categories', 'Page Categories'),
(4, 9, 'Test 999', 'Test 999'),
(5, 16, 'TEST 999', 'TEST 999'),
(6, 17, 'TEST 1000', 'TEST 1000');

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Taxons`
--

CREATE TABLE `VSAPP_Taxons` (
  `id` int NOT NULL,
  `code` varchar(64) DEFAULT NULL,
  `tree_left` int NOT NULL,
  `tree_right` int NOT NULL,
  `tree_level` int NOT NULL,
  `position` int DEFAULT NULL,
  `tree_root` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSAPP_Taxons`
--

INSERT INTO `VSAPP_Taxons` (`id`, `code`, `tree_left`, `tree_right`, `tree_level`, `position`, `tree_root`, `parent_id`) VALUES
(1, NULL, 1, 2, 0, NULL, 1, NULL),
(3, NULL, 1, 2, 0, NULL, 3, NULL),
(4, 'taxon_4', 1, 4, 0, NULL, 4, NULL),
(5, NULL, 1, 2, 0, NULL, 5, NULL),
(6, NULL, 2, 3, 1, NULL, 4, 4),
(8, NULL, 1, 2, 0, NULL, 8, NULL),
(9, NULL, 1, 6, 0, NULL, 9, NULL),
(10, NULL, 1, 2, 0, NULL, 10, NULL),
(11, NULL, 2, 9, 1, NULL, 8, 8),
(12, NULL, 1, 2, 0, NULL, 12, NULL),
(13, NULL, 3, 4, 2, NULL, 8, 11),
(14, NULL, 5, 8, 2, NULL, 8, 11),
(15, NULL, 6, 7, 3, NULL, 8, 14),
(16, NULL, 1, 2, 0, NULL, 16, NULL),
(17, NULL, 1, 2, 0, NULL, 17, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_TaxonTranslations`
--

CREATE TABLE `VSAPP_TaxonTranslations` (
  `id` int NOT NULL,
  `translatable_id` int DEFAULT NULL,
  `locale` varchar(6) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSAPP_TaxonTranslations`
--

INSERT INTO `VSAPP_TaxonTranslations` (`id`, `translatable_id`, `locale`, `slug`, `name`, `description`) VALUES
(1, 3, 'en_US', 'test', 'TEST', 'TEST'),
(2, 4, 'en_US', 'test-last', 'TEST LAST', 'TEST LAST'),
(3, 5, 'en_US', 'test-2', 'TEST 2', 'Root taxon of Taxonomy: \"TEST 2\"'),
(4, 6, 'en_US', 'test-999', 'TEST 999', 'TEST 999'),
(6, 8, 'en_US', 'page-categories', 'Page Categories', 'Root taxon of Taxonomy: \"Page Categories\"'),
(7, 9, 'en_US', 'test-999', 'Test 999', 'Root taxon of Taxonomy: \"Test 999\"'),
(8, 10, 'en_US', 'test-998', 'TEST 998', 'TEST 998'),
(9, 11, 'en_US', 'test-997', 'TEST 997', 'TEST 997'),
(10, 12, 'en_US', 'test-996', 'TEST 996', 'TEST 996'),
(11, 13, 'en_US', 'test-995', 'TEST 995', 'TEST 995'),
(12, 14, 'en_US', 'test-994', 'TEST 994', 'TEST 994'),
(13, 15, 'en_US', 'test-993', 'TEST 993', 'TEST 993'),
(14, 16, 'en_US', 'test-999', 'TEST 999', 'Root taxon of Taxonomy: \"TEST 999\"'),
(15, 17, 'en_US', 'test-1000', 'TEST 1000', 'Root taxon of Taxonomy: \"TEST 1000\"');

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Translations`
--

CREATE TABLE `VSAPP_Translations` (
  `id` int NOT NULL,
  `locale` varchar(8) NOT NULL,
  `object_class` varchar(255) NOT NULL,
  `field` varchar(32) NOT NULL,
  `foreign_key` varchar(64) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSAPP_Translations`
--

INSERT INTO `VSAPP_Translations` (`id`, `locale`, `object_class`, `field`, `foreign_key`, `content`) VALUES
(1, 'en', 'App\\Entity\\Cms\\PageCategory', 'name', '1', 'Main Category'),
(2, 'en', 'App\\Entity\\Cms\\PageCategory', 'name', '2', 'Projects'),
(3, 'en', 'App\\Entity\\Cms\\Page', 'title', '1', 'Introduction ( TEST PAGE )'),
(4, 'en', 'App\\Entity\\Cms\\Page', 'text', '1', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->'),
(5, 'bg', 'App\\Entity\\Cms\\Page', 'title', '1', 'TEST'),
(6, 'bg', 'App\\Entity\\Cms\\Page', 'text', '1', '<p>TEST</p>'),
(7, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'name', '1', 'TEST'),
(8, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'description', '1', 'TEST'),
(9, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'name', '2', 'TEST 2'),
(10, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'description', '2', 'TEST 2'),
(11, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'name', '3', 'Page Categories en_US Translation'),
(12, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'description', '3', 'Page Categories'),
(13, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'name', '4', 'Test 999'),
(14, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'description', '4', 'Test 999'),
(15, 'en_US', 'App\\Entity\\Cms\\Page', 'title', '1', 'TEST'),
(16, 'en_US', 'App\\Entity\\Cms\\Page', 'text', '1', '<p>TEST</p>'),
(17, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'name', '5', 'TEST 999'),
(18, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'description', '5', 'TEST 999'),
(19, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'name', '6', 'TEST 1000'),
(20, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', 'description', '6', 'TEST 1000'),
(21, 'en', 'App\\Entity\\Cms\\Page', 'title', '13', 'TEST PAGE'),
(22, 'en', 'App\\Entity\\Cms\\Page', 'text', '13', '<p>TEST PAGE</p>');

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_PageCategories`
--

CREATE TABLE `VSCMS_PageCategories` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `taxon_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSCMS_PageCategories`
--

INSERT INTO `VSCMS_PageCategories` (`id`, `parent_id`, `taxon_id`) VALUES
(1, 4, 13),
(2, NULL, 14),
(3, 2, 15),
(4, NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_Pages`
--

CREATE TABLE `VSCMS_Pages` (
  `id` int NOT NULL,
  `slug` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `text` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSCMS_Pages`
--

INSERT INTO `VSCMS_Pages` (`id`, `slug`, `title`, `text`, `published`) VALUES
(1, 'Test', 'Introduction ( TEST PAGE )', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(2, 'under-construction', 'Under Construction', '<h1>Under Construction</h1>', 0),
(5, 'test-2', 'Test', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(7, 'web-content-thief', 'Web Content Thief', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(8, 'web-guitar-pro', 'Web Guitar Pro', '<center><h2>MUSIC NOTATION AND GUITAR TABLATURE ONLINE PLAYER</h2></center>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<ul>\r\n	<li><strong>Cross Platform: </strong> <code> alphaTab runs on multiple platforms. Chrome, Firefox, Internet Explorer, Opera, Safari, .net. Java, Android and iOS are on the roadmap. </code></li>\r\n	<li><strong>Open Source:</strong> <code> alphaTab is licensed under LGPL. Use alphaTab anywhere as long you keep our copyright and contribute your changes. </code></li>\r\n</ul>', 0),
(9, 'salary-j-2', 'Salary J-2', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(10, 'card-games', 'Card Games', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(11, 'maintenance', 'Maintenance', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n<title>Coming Soon Page</title>\r\n<meta charset=\"UTF-8\">\r\n<meta content=\"IE=edge,chrome=1\" http-equiv=\"X-UA-Compatible\">\r\n<meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\r\n<meta content=\"\" name=\"description\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Neuton|Roboto\" rel=\"stylesheet\">\r\n<style>\r\n.holder{\r\nwidth: 480px;\r\ntext-align: center;\r\nmargin: 0 auto;\r\npadding-top: 120px;\r\n}\r\n.holder h1 {\r\nfont-family: \'loveloblack\', sans-serif;\r\nfont-size:5em;\r\ncolor:#2d2d2d;\r\ntext-shadow: 3px 3px 0 #e3e3e3;\r\nline-height: 27px;\r\nmargin-top: 12px;\r\nmargin-bottom: 10px;\r\n}\r\n.holder h1 span.tbl{\r\nfont-family: Dosis,Tahoma,sans-serif;\r\nfont-size:35px;\r\ncolor:#2d2d2d;\r\nline-height:1em;\r\nfont-weight: bold;\r\nletter-spacing: -1px;\r\nline-height: 1;\r\ntext-shadow: -1px 1px 1px rgba(0, 0, 0, 0.3);\r\n}\r\n.holder h1 span {\r\nfont-family: Dosis,Tahoma,sans-serif;\r\nfont-size:1em;\r\ncolor:#3d9df8;\r\nline-height:1em;\r\nfont-weight: bold;\r\nletter-spacing: -1px;\r\nline-height: 1;\r\ntext-shadow: -1px 1px 1px rgba(0, 0, 0, 0.3);\r\n}  \r\np{\r\nfont-size: 18px;\r\nfont-weight: 600;\r\ncolor: #13447E;\r\nfont-family: \'Neuton\', serif;\r\n}\r\n</style>\r\n</head>\r\n<body>\r\n<div class=\"holder\">\r\n<img src=\"/build/img/coderdocs-logo.svg\" style=\"width:250px\" />\r\n<h1><span class=\"tbl\">Website is currently under maintenance.</span></h1>\r\n<p><span class=\"tbl\">We\'ll be back shortly.</span></p><br>\r\n<br />\r\n</div>\r\n</body>\r\n</html>', 0),
(12, 'FOS CkEditor integration', 'FOS CkEditor integration', '<blockquote>\r\n<pre>\r\n$ composer require friendsofsymfony/ckeditor-bundle\r\n$ ./bin/console ckeditor:install\r\n$ ./bin/console assets:install --symlink</pre>\r\n</blockquote>', 0),
(13, 'Test_Page', 'TEST PAGE', '<p>TEST PAGE</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_Pages_Categories`
--

CREATE TABLE `VSCMS_Pages_Categories` (
  `id` int NOT NULL,
  `page_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSCMS_Pages_Categories`
--

INSERT INTO `VSCMS_Pages_Categories` (`id`, `page_id`, `category_id`) VALUES
(1, 2, 1),
(2, 8, 1),
(4, 13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_ResetPasswordRequests`
--

CREATE TABLE `VSUM_ResetPasswordRequests` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(24) NOT NULL,
  `hashedToken` varchar(128) NOT NULL,
  `requestedAt` datetime NOT NULL,
  `expiresAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_Users`
--

CREATE TABLE `VSUM_Users` (
  `id` int NOT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `username` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `subscriptionId` int DEFAULT NULL,
  `user_info_id` int DEFAULT NULL,
  `prefered_locale` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'en_US',
  `first_name` varchar(64) NOT NULL DEFAULT 'NOT_EDITED_YET',
  `last_name` varchar(64) NOT NULL DEFAULT 'NO_EDITED_YET',
  `info_id` int DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSUM_Users`
--

INSERT INTO `VSUM_Users` (`id`, `api_token`, `username`, `email`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `subscriptionId`, `user_info_id`, `prefered_locale`, `first_name`, `last_name`, `info_id`, `verified`) VALUES
(1, NULL, 'admin', 'admin', 1, 'ZEAYhdMkJnNRZ0t5JO0Ol5AecbXAwj3ennB0CrmBIBY', '$argon2i$v=19$m=65536,t=4,p=1$MWFNejhXMzFwVFdpVElGMg$qq6lIt3kFlHxPq6plag34jEwsfMvglffqYH9UkKL26Q', '2020-04-18 13:20:04', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', 3, 4, 'en_US', 'Admin', 'Admin', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_UsersActivities`
--

CREATE TABLE `VSUM_UsersActivities` (
  `id` int NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  `activity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSUM_UsersActivities`
--

INSERT INTO `VSUM_UsersActivities` (`id`, `date`, `user_id`, `activity`) VALUES
(1, '2019-11-04 00:00:00', 1, 'Test Activity'),
(2, '2019-11-05 20:13:17', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(3, '2019-11-06 04:30:04', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(4, '2019-11-06 05:04:54', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(5, '2019-11-06 05:13:26', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(6, '2019-11-06 05:17:53', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(7, '2019-11-06 06:00:12', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(8, '2019-11-06 07:49:02', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(9, '2019-11-06 07:49:45', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(10, '2019-11-06 19:27:31', 1, 'User cancel recurring payment for \"paypal_express_checkout_recurring_payment\".'),
(11, '2019-11-13 11:13:37', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(12, '2019-11-14 10:17:34', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(13, '2019-11-14 10:42:39', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(14, '2019-11-14 13:08:16', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(15, '2019-11-14 13:08:31', 1, 'User cancel recurring payment for \"paypal_express_checkout_recurring_payment\".');

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_UsersInfo`
--

CREATE TABLE `VSUM_UsersInfo` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `apiToken` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `occupation` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSUM_UsersInfo`
--

INSERT INTO `VSUM_UsersInfo` (`id`, `user_id`, `apiToken`, `profile_picture`, `firstName`, `lastName`, `country`, `birthday`, `mobile`, `website`, `occupation`) VALUES
(4, 1, NULL, 'TestImage-2-6077b7d3daf9b.jpg', 'Ivan', 'Atanasov', 'BG', '1977-08-09 00:00:00', '449999999999', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_UsersNotifications`
--

CREATE TABLE `VSUM_UsersNotifications` (
  `id` int NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  `notification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VSUM_UsersNotifications`
--

INSERT INTO `VSUM_UsersNotifications` (`id`, `date`, `user_id`, `notification`) VALUES
(1, '2019-11-04 00:00:00', 1, 'Test Notification');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `VSAPP_LogEntries`
--
ALTER TABLE `VSAPP_LogEntries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSAPP_Settings`
--
ALTER TABLE `VSAPP_Settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSAPP_Sites`
--
ALTER TABLE `VSAPP_Sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSAPP_Taxonomy`
--
ALTER TABLE `VSAPP_Taxonomy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSAPP_Taxons`
--
ALTER TABLE `VSAPP_Taxons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSAPP_TaxonTranslations`
--
ALTER TABLE `VSAPP_TaxonTranslations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSAPP_Translations`
--
ALTER TABLE `VSAPP_Translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSCMS_PageCategories`
--
ALTER TABLE `VSCMS_PageCategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSCMS_Pages`
--
ALTER TABLE `VSCMS_Pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSCMS_Pages_Categories`
--
ALTER TABLE `VSCMS_Pages_Categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`),
  ADD KEY `taxon_id` (`category_id`);

--
-- Indexes for table `VSUM_ResetPasswordRequests`
--
ALTER TABLE `VSUM_ResetPasswordRequests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSUM_Users`
--
ALTER TABLE `VSUM_Users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSUM_UsersActivities`
--
ALTER TABLE `VSUM_UsersActivities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSUM_UsersInfo`
--
ALTER TABLE `VSUM_UsersInfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9E6E7D917BA2F5EB` (`apiToken`);

--
-- Indexes for table `VSUM_UsersNotifications`
--
ALTER TABLE `VSUM_UsersNotifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `VSAPP_LogEntries`
--
ALTER TABLE `VSAPP_LogEntries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `VSAPP_Settings`
--
ALTER TABLE `VSAPP_Settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `VSAPP_Sites`
--
ALTER TABLE `VSAPP_Sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `VSAPP_Taxonomy`
--
ALTER TABLE `VSAPP_Taxonomy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `VSAPP_Taxons`
--
ALTER TABLE `VSAPP_Taxons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `VSAPP_TaxonTranslations`
--
ALTER TABLE `VSAPP_TaxonTranslations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `VSAPP_Translations`
--
ALTER TABLE `VSAPP_Translations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `VSCMS_PageCategories`
--
ALTER TABLE `VSCMS_PageCategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `VSCMS_Pages`
--
ALTER TABLE `VSCMS_Pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `VSCMS_Pages_Categories`
--
ALTER TABLE `VSCMS_Pages_Categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `VSUM_ResetPasswordRequests`
--
ALTER TABLE `VSUM_ResetPasswordRequests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `VSUM_Users`
--
ALTER TABLE `VSUM_Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `VSUM_UsersActivities`
--
ALTER TABLE `VSUM_UsersActivities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `VSUM_UsersInfo`
--
ALTER TABLE `VSUM_UsersInfo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `VSUM_UsersNotifications`
--
ALTER TABLE `VSUM_UsersNotifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
