-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 07 Eyl 2023, 11:33:55
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `vipub-sm`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_add_balance`
--

CREATE TABLE `vipub_add_balance` (
  `b_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `added_balance` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `receipt_image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_api_usage`
--

CREATE TABLE `vipub_api_usage` (
  `usage_id` int(11) NOT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `url_using` varchar(255) DEFAULT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  `api_user_key` varchar(255) NOT NULL,
  `usage_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_bookmarks`
--

CREATE TABLE `vipub_bookmarks` (
  `b_id` int(11) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `post_bookmarks` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_follow`
--

CREATE TABLE `vipub_follow` (
  `f_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `follower_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_hashtag`
--

CREATE TABLE `vipub_hashtag` (
  `h_id` int(11) NOT NULL,
  `htag` varchar(255) NOT NULL,
  `total_post` varchar(255) DEFAULT NULL,
  `add_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_likes`
--

CREATE TABLE `vipub_likes` (
  `l_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_messages`
--

CREATE TABLE `vipub_messages` (
  `m_id` int(11) NOT NULL,
  `sender_id` varchar(255) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `notifs_status` varchar(10) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_notifs`
--

CREATE TABLE `vipub_notifs` (
  `n_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `sender_id` varchar(255) NOT NULL,
  `post_id` varchar(255) DEFAULT NULL,
  `type` enum('like','comment','follow','mention','mention_reply','verified') DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `notifs_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_oauth_settings`
--

CREATE TABLE `vipub_oauth_settings` (
  `oa_id` int(11) UNSIGNED NOT NULL,
  `twitter_api_key` varchar(255) DEFAULT NULL,
  `twitter_api_key_secret` varchar(255) DEFAULT NULL,
  `twitter_callback_url` varchar(255) DEFAULT NULL,
  `twitter_login_status` varchar(255) DEFAULT '0',
  `oauth_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vipub_oauth_settings`
--

INSERT INTO `vipub_oauth_settings` (`oa_id`, `twitter_api_key`, `twitter_api_key_secret`, `twitter_callback_url`, `twitter_login_status`, `oauth_name`) VALUES
(1, NULL, NULL, 'YourTwitterCallbackURL', '0', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_pages`
--

CREATE TABLE `vipub_pages` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_title_seo` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_content` text NOT NULL,
  `page_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vipub_pages`
--

INSERT INTO `vipub_pages` (`page_id`, `page_title`, `page_title_seo`, `page_name`, `page_content`, `page_date`) VALUES
(1, 'Privacy policy', 'privacy-policy', 'Privacy policy', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam diam nunc, sollicitudin ac tempor pretium, tristique nec sem. Aenean accumsan, urna sed porttitor interdum, erat ligula lacinia dui, ut sodales ante neque vel quam. Donec efficitur arcu id metus condimentum, quis luctus tellus condimentum. Sed erat erat, placerat non neque suscipit, tempor efficitur dolor. Donec eget posuere est. Fusce volutpat metus at sagittis ultricies. Suspendisse eget ex consectetur, ultricies arcu ut, accumsan enim. Praesent sollicitudin orci ac sem venenatis, eget ultricies urna mollis. Sed dapibus malesuada tellus finibus dignissim. Nam ac arcu sed turpis elementum pellentesque. Donec porta pretium dolor. Curabitur quis mi ligula.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam diam nunc, sollicitudin ac tempor pretium, tristique nec sem. Aenean accumsan, urna sed porttitor interdum, erat ligula lacinia dui, ut sodales ante neque vel quam. Donec efficitur arcu id metus condimentum, quis luctus tellus condimentum. Sed erat erat, placerat non neque suscipit, tempor efficitur dolor. Donec eget posuere est. Fusce volutpat metus at sagittis ultricies. Suspendisse eget ex consectetur, ultricies arcu ut, accumsan enim. Praesent sollicitudin orci ac sem venenatis, eget ultricies urna mollis. Sed dapibus malesuada tellus finibus dignissim. Nam ac arcu sed turpis elementum pellentesque. Donec porta pretium dolor. Curabitur quis mi ligula.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam diam nunc, sollicitudin ac tempor pretium, tristique nec sem. Aenean accumsan, urna sed porttitor interdum, erat ligula lacinia dui, ut sodales ante neque vel quam. Donec efficitur arcu id metus condimentum, quis luctus tellus condimentum. Sed erat erat, placerat non neque suscipit, tempor efficitur dolor. Donec eget posuere est. Fusce volutpat metus at sagittis ultricies. Suspendisse eget ex consectetur, ultricies arcu ut, accumsan enim. Praesent sollicitudin orci ac sem venenatis, eget ultricies urna mollis. Sed dapibus malesuada tellus finibus dignissim. Nam ac arcu sed turpis elementum pellentesque. Donec porta pretium dolor. Curabitur quis mi ligula.</p>', '2023-04-08 17:11:36'),
(2, 'Terms policy', 'terms-policy', 'Terms policy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dui augue, pretium in lacus sed, aliquam ultricies risus. Suspendisse iaculis massa ut ex aliquam tempus. Ut eu laoreet nulla. Cras at orci sit amet lectus fermentum luctus. Nunc tristique sagittis mauris eget dapibus. Quisque aliquam sem nec mattis convallis. Nullam interdum diam orci, nec sollicitudin sapien iaculis id. Nam vulputate tristique felis non ultricies. Integer velit velit, sagittis a nulla non, tincidunt tempor nunc. Integer ut lectus nunc. Suspendisse commodo auctor tellus, a sollicitudin dolor.\r\n\r\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ornare sollicitudin porta. Proin sit amet dolor lacinia, pharetra augue ac, lacinia arcu. Sed iaculis, dui quis lobortis ultricies, neque lorem cursus nulla, non tempor massa quam nec orci. Ut porttitor sapien at congue rutrum. Praesent pharetra dapibus orci non laoreet. Aliquam nec justo imperdiet turpis tincidunt tempor. Suspendisse potenti. Mauris ut justo et sapien auctor blandit non a nunc. Pellentesque in justo id elit auctor ultrices id ut quam. Vivamus interdum tortor a sem porttitor, eget bibendum lectus auctor. Sed eu dignissim ligula. Praesent semper nec orci vel sodales. Integer nec consectetur sapien.\r\n\r\nSed euismod, mauris quis placerat finibus, mi ligula molestie tellus, varius tempor arcu augue in urna. Aliquam leo diam, consectetur et orci vel, interdum ornare nibh. Ut elementum, quam et elementum efficitur, neque ipsum maximus nisl, vel aliquam purus arcu vel metus. Maecenas luctus mattis lacus, sit amet viverra mauris tristique placerat. In a tempus sapien. Nam eget consectetur eros. In sapien lectus, venenatis quis volutpat nec, convallis eget magna. Integer hendrerit at risus vitae tincidunt. Integer dignissim ultricies finibus. Quisque a velit eget enim imperdiet condimentum. Nam posuere eros vel placerat ultrices. Sed nibh arcu, lacinia id neque eget, egestas consequat mauris. Pellentesque mollis condimentum imperdiet. Vivamus mollis sed ipsum et condimentum.\r\n\r\n', '2023-04-08 17:11:36'),
(3, 'Cookies policy', 'cookies-policy', 'Cookies policy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dui augue, pretium in lacus sed, aliquam ultricies risus. Suspendisse iaculis massa ut ex aliquam tempus. Ut eu laoreet nulla. Cras at orci sit amet lectus fermentum luctus. Nunc tristique sagittis mauris eget dapibus. Quisque aliquam sem nec mattis convallis. Nullam interdum diam orci, nec sollicitudin sapien iaculis id. Nam vulputate tristique felis non ultricies. Integer velit velit, sagittis a nulla non, tincidunt tempor nunc. Integer ut lectus nunc. Suspendisse commodo auctor tellus, a sollicitudin dolor.\r\n\r\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ornare sollicitudin porta. Proin sit amet dolor lacinia, pharetra augue ac, lacinia arcu. Sed iaculis, dui quis lobortis ultricies, neque lorem cursus nulla, non tempor massa quam nec orci. Ut porttitor sapien at congue rutrum. Praesent pharetra dapibus orci non laoreet. Aliquam nec justo imperdiet turpis tincidunt tempor. Suspendisse potenti. Mauris ut justo et sapien auctor blandit non a nunc. Pellentesque in justo id elit auctor ultrices id ut quam. Vivamus interdum tortor a sem porttitor, eget bibendum lectus auctor. Sed eu dignissim ligula. Praesent semper nec orci vel sodales. Integer nec consectetur sapien.\r\n\r\nSed euismod, mauris quis placerat finibus, mi ligula molestie tellus, varius tempor arcu augue in urna. Aliquam leo diam, consectetur et orci vel, interdum ornare nibh. Ut elementum, quam et elementum efficitur, neque ipsum maximus nisl, vel aliquam purus arcu vel metus. Maecenas luctus mattis lacus, sit amet viverra mauris tristique placerat. In a tempus sapien. Nam eget consectetur eros. In sapien lectus, venenatis quis volutpat nec, convallis eget magna. Integer hendrerit at risus vitae tincidunt. Integer dignissim ultricies finibus. Quisque a velit eget enim imperdiet condimentum. Nam posuere eros vel placerat ultrices. Sed nibh arcu, lacinia id neque eget, egestas consequat mauris. Pellentesque mollis condimentum imperdiet. Vivamus mollis sed ipsum et condimentum.\r\n\r\n', '2023-04-08 17:11:36'),
(4, 'Help center', 'help-center', 'Help center', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dui augue, pretium in lacus sed, aliquam ultricies risus. Suspendisse iaculis massa ut ex aliquam tempus. Ut eu laoreet nulla. Cras at orci sit amet lectus fermentum luctus. Nunc tristique sagittis mauris eget dapibus. Quisque aliquam sem nec mattis convallis. Nullam interdum diam orci, nec sollicitudin sapien iaculis id. Nam vulputate tristique felis non ultricies. Integer velit velit, sagittis a nulla non, tincidunt tempor nunc. Integer ut lectus nunc. Suspendisse commodo auctor tellus, a sollicitudin dolor.\r\n\r\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ornare sollicitudin porta. Proin sit amet dolor lacinia, pharetra augue ac, lacinia arcu. Sed iaculis, dui quis lobortis ultricies, neque lorem cursus nulla, non tempor massa quam nec orci. Ut porttitor sapien at congue rutrum. Praesent pharetra dapibus orci non laoreet. Aliquam nec justo imperdiet turpis tincidunt tempor. Suspendisse potenti. Mauris ut justo et sapien auctor blandit non a nunc. Pellentesque in justo id elit auctor ultrices id ut quam. Vivamus interdum tortor a sem porttitor, eget bibendum lectus auctor. Sed eu dignissim ligula. Praesent semper nec orci vel sodales. Integer nec consectetur sapien.\r\n\r\nSed euismod, mauris quis placerat finibus, mi ligula molestie tellus, varius tempor arcu augue in urna. Aliquam leo diam, consectetur et orci vel, interdum ornare nibh. Ut elementum, quam et elementum efficitur, neque ipsum maximus nisl, vel aliquam purus arcu vel metus. Maecenas luctus mattis lacus, sit amet viverra mauris tristique placerat. In a tempus sapien. Nam eget consectetur eros. In sapien lectus, venenatis quis volutpat nec, convallis eget magna. Integer hendrerit at risus vitae tincidunt. Integer dignissim ultricies finibus. Quisque a velit eget enim imperdiet condimentum. Nam posuere eros vel placerat ultrices. Sed nibh arcu, lacinia id neque eget, egestas consequat mauris. Pellentesque mollis condimentum imperdiet. Vivamus mollis sed ipsum et condimentum.\r\n\r\n', '2023-04-08 17:11:36'),
(5, 'Company about', 'about', 'Company about', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dui augue, pretium in lacus sed, aliquam ultricies risus. Suspendisse iaculis massa ut ex aliquam tempus. Ut eu laoreet nulla. Cras at orci sit amet lectus fermentum luctus. Nunc tristique sagittis mauris eget dapibus. Quisque aliquam sem nec mattis convallis. Nullam interdum diam orci, nec sollicitudin sapien iaculis id. Nam vulputate tristique felis non ultricies. Integer velit velit, sagittis a nulla non, tincidunt tempor nunc. Integer ut lectus nunc. Suspendisse commodo auctor tellus, a sollicitudin dolor.\r\n\r\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ornare sollicitudin porta. Proin sit amet dolor lacinia, pharetra augue ac, lacinia arcu. Sed iaculis, dui quis lobortis ultricies, neque lorem cursus nulla, non tempor massa quam nec orci. Ut porttitor sapien at congue rutrum. Praesent pharetra dapibus orci non laoreet. Aliquam nec justo imperdiet turpis tincidunt tempor. Suspendisse potenti. Mauris ut justo et sapien auctor blandit non a nunc. Pellentesque in justo id elit auctor ultrices id ut quam. Vivamus interdum tortor a sem porttitor, eget bibendum lectus auctor. Sed eu dignissim ligula. Praesent semper nec orci vel sodales. Integer nec consectetur sapien.\r\n\r\nSed euismod, mauris quis placerat finibus, mi ligula molestie tellus, varius tempor arcu augue in urna. Aliquam leo diam, consectetur et orci vel, interdum ornare nibh. Ut elementum, quam et elementum efficitur, neque ipsum maximus nisl, vel aliquam purus arcu vel metus. Maecenas luctus mattis lacus, sit amet viverra mauris tristique placerat. In a tempus sapien. Nam eget consectetur eros. In sapien lectus, venenatis quis volutpat nec, convallis eget magna. Integer hendrerit at risus vitae tincidunt. Integer dignissim ultricies finibus. Quisque a velit eget enim imperdiet condimentum. Nam posuere eros vel placerat ultrices. Sed nibh arcu, lacinia id neque eget, egestas consequat mauris. Pellentesque mollis condimentum imperdiet. Vivamus mollis sed ipsum et condimentum.\r\n\r\n', '2023-04-08 17:11:36');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_posts`
--

CREATE TABLE `vipub_posts` (
  `p_id` int(11) NOT NULL,
  `reply_post_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `content_post` text NOT NULL,
  `content_image` varchar(255) DEFAULT NULL,
  `content_video` varchar(255) DEFAULT NULL,
  `likes` varchar(255) NOT NULL DEFAULT '0',
  `reply` varchar(255) NOT NULL DEFAULT '0',
  `repost` varchar(255) NOT NULL DEFAULT '0',
  `post_type` varchar(55) DEFAULT 'post',
  `post_joined` datetime NOT NULL DEFAULT current_timestamp(),
  `content_gif` varchar(255) DEFAULT NULL,
  `bookmarks` varchar(255) DEFAULT '0',
  `reply_status` int(11) NOT NULL DEFAULT 1,
  `post_lang` varchar(50) DEFAULT 'en',
  `language_match` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_premium_active_users`
--

CREATE TABLE `vipub_premium_active_users` (
  `au_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `subs_status` varchar(25) DEFAULT '1',
  `starting_date` datetime DEFAULT current_timestamp(),
  `end_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_premium_package`
--

CREATE TABLE `vipub_premium_package` (
  `pack_id` int(11) UNSIGNED NOT NULL,
  `package_price` varchar(255) NOT NULL,
  `package_name` varchar(255) NOT NULL DEFAULT 'Individual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vipub_premium_package`
--

INSERT INTO `vipub_premium_package` (`pack_id`, `package_price`, `package_name`) VALUES
(1, '25', 'Individual'),
(2, '75', 'Establishment');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_repost`
--

CREATE TABLE `vipub_repost` (
  `r_id` int(11) UNSIGNED NOT NULL,
  `repost_user_id` int(11) NOT NULL,
  `repost_post_id` int(11) NOT NULL,
  `reposted_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_session`
--

CREATE TABLE `vipub_session` (
  `id` int(11) NOT NULL,
  `session_user_id` int(11) NOT NULL,
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vipub_session`
--

INSERT INTO `vipub_session` (`id`, `session_user_id`, `last_seen`) VALUES
(1, 1, '2023-09-07 09:33:49');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_settings`
--

CREATE TABLE `vipub_settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `site_title` varchar(255) NOT NULL DEFAULT '',
  `site_description` varchar(255) NOT NULL DEFAULT 'Now login, now register!',
  `site_keywords` varchar(255) NOT NULL DEFAULT 'vipub, login, register, vipub codecanyon, vipub teskale, vipub codecanyon script, twitter analog, twitter script, twitter buy script, vipub buy, vipub twitter script',
  `site_register_status` tinyint(25) NOT NULL DEFAULT 0,
  `user_sent_verified` enum('No','Active') NOT NULL DEFAULT 'Active',
  `upload_image` varchar(55) NOT NULL,
  `upload_video` varchar(55) NOT NULL,
  `translate_tweet` varchar(55) NOT NULL,
  `hashtag_display` varchar(255) NOT NULL,
  `user_display` varchar(255) NOT NULL,
  `default_theme` varchar(255) NOT NULL DEFAULT 'master.white.theme',
  `post_maxlength` varchar(255) NOT NULL DEFAULT '280',
  `message_maxlength` varchar(255) NOT NULL DEFAULT '500',
  `site_white_logo` varchar(255) DEFAULT 'themes/default/statics/images/logo.png',
  `site_dark_logo` varchar(255) DEFAULT 'themes/default/statics/images/logo_white.png',
  `site_favicon` varchar(255) DEFAULT 'themes/default/statics/images/favicon.png',
  `email_notifications` enum('Active','Disabled') DEFAULT 'Active',
  `chat_time_interval` enum('1000','2000','3000','4000','5000','6000','7000','8000','9000','10000','11000','12000','13000','14000','15000','16000','17000','18000','19000','20000') DEFAULT '7000',
  `timeline_time_interval` enum('1000','2000','3000','4000','5000','6000','7000','8000','9000','10000','11000','12000','13000','14000','15000','16000','17000','18000','19000','20000') DEFAULT '10000',
  `site_currency` varchar(255) NOT NULL DEFAULT 'usd',
  `premium_verified` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vipub_settings`
--

INSERT INTO `vipub_settings` (`id`, `site_name`, `site_title`, `site_description`, `site_keywords`, `site_register_status`, `user_sent_verified`, `upload_image`, `upload_video`, `translate_tweet`, `hashtag_display`, `user_display`, `default_theme`, `post_maxlength`, `message_maxlength`, `site_white_logo`, `site_dark_logo`, `site_favicon`, `email_notifications`, `chat_time_interval`, `timeline_time_interval`, `site_currency`, `premium_verified`) VALUES
(1, 'Vipub', 'Welcome to Vipub', 'Quickly launch your own Twitter website with Vipub Social Media Sharing Platform.', 'vipub, login, register, vipub codecanyon, vipub teskale, vipub codecanyon script, twitter analog, twitter script, twitter buy script, vipub buy, vipub twitter script', 0, 'Active', 'Active', 'Active', 'Active', 'all', 'Most followed', 'master.white.theme', '2000', '2000', 'themes/default/statics/images/logo.png', 'themes/default/statics/images/logo_white.png', 'themes/default/statics/images/favicon.png', 'Active', '7000', '10000', 'usd', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_smtp`
--

CREATE TABLE `vipub_smtp` (
  `smtp_id` int(11) UNSIGNED NOT NULL,
  `smtp_host` varchar(255) NOT NULL DEFAULT 'smtp.gmail.com',
  `smtp_username` varchar(255) NOT NULL DEFAULT 'robertdayzen@gmail.com',
  `smtp_password` varchar(255) NOT NULL DEFAULT 'owphckyevuarefwo',
  `smtp_port` int(6) NOT NULL DEFAULT 587
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vipub_smtp`
--

INSERT INTO `vipub_smtp` (`smtp_id`, `smtp_host`, `smtp_username`, `smtp_password`, `smtp_port`) VALUES
(1, 'smtp.gmail.com', 'robertdayzen@gmail.com', 'owphckyevuarefwo', 587);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_users`
--

CREATE TABLE `vipub_users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'upload/default/avatar.png',
  `cover` varchar(255) NOT NULL DEFAULT 'upload/default/cover.png',
  `user_bio` varchar(255) DEFAULT NULL,
  `user_location` varchar(255) DEFAULT NULL,
  `user_website` varchar(255) DEFAULT NULL,
  `following` varchar(255) NOT NULL DEFAULT '0',
  `followers` varchar(255) NOT NULL DEFAULT '0',
  `verified` varchar(255) NOT NULL DEFAULT '0',
  `theme_color` varchar(255) NOT NULL DEFAULT 'master.white.theme',
  `admin_status` varchar(5) DEFAULT '0',
  `account_status` varchar(5) NOT NULL DEFAULT '0',
  `dm_notification` enum('Active','Disabled') NOT NULL DEFAULT 'Active',
  `follow_notification` enum('Active','Disabled') NOT NULL DEFAULT 'Active',
  `like_notification` enum('Active','Disabled') NOT NULL DEFAULT 'Active',
  `reply_notification` enum('Active','Disabled') NOT NULL DEFAULT 'Active',
  `joined` datetime NOT NULL DEFAULT current_timestamp(),
  `user_wallet` decimal(10,2) DEFAULT 0.00,
  `reset_token` varchar(255) DEFAULT NULL,
  `premium_account` int(11) NOT NULL DEFAULT 0,
  `verified_category` int(11) NOT NULL DEFAULT 0,
  `oauth` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vipub_users`
--

INSERT INTO `vipub_users` (`id`, `fullname`, `username`, `email`, `password`, `avatar`, `cover`, `user_bio`, `user_location`, `user_website`, `following`, `followers`, `verified`, `theme_color`, `admin_status`, `account_status`, `dm_notification`, `follow_notification`, `like_notification`, `reply_notification`, `joined`, `user_wallet`, `reset_token`, `premium_account`, `verified_category`, `oauth`) VALUES
(1, 'Robert Dayzen', 'admin', 'site-admin@vipubsm.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'upload/default/avatar.png', 'upload/default/cover.png', 'Thank you for purchasing Vipub!', 'CodeCanyon', 'https://vipubsm.com', '0', '0', '0', 'master.white.theme', '1', '0', 'Active', 'Active', 'Active', 'Active', '2023-04-10 13:02:36', '0.00', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vipub_verified`
--

CREATE TABLE `vipub_verified` (
  `verified_id` int(11) UNSIGNED NOT NULL,
  `verified_uid` varchar(255) NOT NULL,
  `verified_category` varchar(255) NOT NULL,
  `verified_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `vipub_add_balance`
--
ALTER TABLE `vipub_add_balance`
  ADD PRIMARY KEY (`b_id`);

--
-- Tablo için indeksler `vipub_api_usage`
--
ALTER TABLE `vipub_api_usage`
  ADD PRIMARY KEY (`usage_id`);

--
-- Tablo için indeksler `vipub_bookmarks`
--
ALTER TABLE `vipub_bookmarks`
  ADD PRIMARY KEY (`b_id`);

--
-- Tablo için indeksler `vipub_follow`
--
ALTER TABLE `vipub_follow`
  ADD PRIMARY KEY (`f_id`);

--
-- Tablo için indeksler `vipub_hashtag`
--
ALTER TABLE `vipub_hashtag`
  ADD PRIMARY KEY (`h_id`);

--
-- Tablo için indeksler `vipub_likes`
--
ALTER TABLE `vipub_likes`
  ADD PRIMARY KEY (`l_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`post_id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`post_id`),
  ADD UNIQUE KEY `user_id_3` (`user_id`,`post_id`);

--
-- Tablo için indeksler `vipub_messages`
--
ALTER TABLE `vipub_messages`
  ADD PRIMARY KEY (`m_id`);

--
-- Tablo için indeksler `vipub_notifs`
--
ALTER TABLE `vipub_notifs`
  ADD PRIMARY KEY (`n_id`);

--
-- Tablo için indeksler `vipub_oauth_settings`
--
ALTER TABLE `vipub_oauth_settings`
  ADD PRIMARY KEY (`oa_id`);

--
-- Tablo için indeksler `vipub_pages`
--
ALTER TABLE `vipub_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Tablo için indeksler `vipub_posts`
--
ALTER TABLE `vipub_posts`
  ADD PRIMARY KEY (`p_id`);

--
-- Tablo için indeksler `vipub_premium_active_users`
--
ALTER TABLE `vipub_premium_active_users`
  ADD PRIMARY KEY (`au_id`);

--
-- Tablo için indeksler `vipub_premium_package`
--
ALTER TABLE `vipub_premium_package`
  ADD PRIMARY KEY (`pack_id`);

--
-- Tablo için indeksler `vipub_repost`
--
ALTER TABLE `vipub_repost`
  ADD PRIMARY KEY (`r_id`);

--
-- Tablo için indeksler `vipub_session`
--
ALTER TABLE `vipub_session`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `vipub_settings`
--
ALTER TABLE `vipub_settings`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `vipub_smtp`
--
ALTER TABLE `vipub_smtp`
  ADD PRIMARY KEY (`smtp_id`);

--
-- Tablo için indeksler `vipub_users`
--
ALTER TABLE `vipub_users`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `vipub_verified`
--
ALTER TABLE `vipub_verified`
  ADD PRIMARY KEY (`verified_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `vipub_add_balance`
--
ALTER TABLE `vipub_add_balance`
  MODIFY `b_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_api_usage`
--
ALTER TABLE `vipub_api_usage`
  MODIFY `usage_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_bookmarks`
--
ALTER TABLE `vipub_bookmarks`
  MODIFY `b_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_follow`
--
ALTER TABLE `vipub_follow`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_hashtag`
--
ALTER TABLE `vipub_hashtag`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_likes`
--
ALTER TABLE `vipub_likes`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_messages`
--
ALTER TABLE `vipub_messages`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_notifs`
--
ALTER TABLE `vipub_notifs`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_oauth_settings`
--
ALTER TABLE `vipub_oauth_settings`
  MODIFY `oa_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_pages`
--
ALTER TABLE `vipub_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_posts`
--
ALTER TABLE `vipub_posts`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_premium_active_users`
--
ALTER TABLE `vipub_premium_active_users`
  MODIFY `au_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_premium_package`
--
ALTER TABLE `vipub_premium_package`
  MODIFY `pack_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_repost`
--
ALTER TABLE `vipub_repost`
  MODIFY `r_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_session`
--
ALTER TABLE `vipub_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_settings`
--
ALTER TABLE `vipub_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_smtp`
--
ALTER TABLE `vipub_smtp`
  MODIFY `smtp_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_users`
--
ALTER TABLE `vipub_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `vipub_verified`
--
ALTER TABLE `vipub_verified`
  MODIFY `verified_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
