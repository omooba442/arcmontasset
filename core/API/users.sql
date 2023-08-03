------------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `demo_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `refCode`, `ref_by`, `balance`, `demo_balance`, `password`, `address`, `status`, `kyc_data`, `kv`, `ev`, `sv`, `profile_complete`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Adeleye', 'Godswill', 'futwk402406', 'adesokanadedeji10@gmail.com', 'NG', '23408065864913', 'oiF8lpAAQR', 0, '0.00000000', '0.00000000', '$2y$10$2JDpMZulBRMH.i0XVjRTNeWU3Mqcayiff0KXetYQK2QyA5uUddZai', '{\"country\":\"Nigeria\",\"address\":\"Akure - Ado Ekiti Road\",\"state\":\"Ado Ekiti\",\"zip\":\"360211\",\"city\":\"Ekiti\"}', 1, NULL, 1, 1, 1, 1, '188855', '2023-03-30 02:17:41', 1, 0, NULL, NULL, NULL, '2023-03-30 06:17:40', '2023-06-06 13:22:58'),
(2, 'Ginfinty', 'Institution', 'futwk4536', 'adesokanafdedeji10@gmail.com', 'NG', '2345565864913', 'vb65vfQpeT', 0, '0.00000000', '0.00000000', '$2y$10$tzXRElMSgaY14GSoeZ1jw.rNkQNdEOxspuvjdNtdCCQbx2nSep9gq', '{\"country\":\"Nigeria\",\"address\":\"USA\",\"state\":\"California\",\"zip\":\"90011\",\"city\":\"Lagos\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-03-30 21:52:06', '2023-06-06 13:22:58'),
(3, 'vkvuukjjb', 'lmlml', 'testing', 'admifn@basefex.co1', 'NG', '234097070700707', 'IMBzzUvNPg', 0, '500000.00000000', '0.00000000', '$2y$10$KO2BGAkcog6qxPji2OVdIeKNETVQesEuXjvGtHD91ToK6wVeZU3Qq', '{\"country\":\"Nigeria\",\"address\":\"\'lm\'m\",\"state\":\"lml\",\"zip\":\"lmlm\",\"city\":\"knkn\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'bI44STH2yeWtOOMlZsfjMVkL2qfmPtyi0KC5BBPsb61BuFTXjh3ZQPztJKY4', '2023-03-31 15:17:14', '2023-06-06 13:22:58'),
(4, 'admicsdad', 'admin', 'realadmin', 'meredithhitchko@protonm1ail.com', 'NG', '2340808009844321', 'oQesbWUVlu', 0, '0.00000000', '0.00000000', '$2y$10$nPLkxQFTL/IwIuzMZ4Jw8ebw2gCKNynT0UFKzH9RlzPp89cbbJeO6', '{\"country\":\"Nigeria\",\"address\":\"aerfrefe\",\"state\":\"eREeassA3ed\",\"zip\":\"2444325\",\"city\":\"DDwed\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-01 14:21:37', '2023-06-06 13:22:59'),
(5, 'izzy', 'sir', 'waters', 'vaveyob888@dogemn.com', 'AE', '971521782856', '3fiE6oYjn2', 0, '0.00000000', '1310.00000000', '$2y$10$mMUMSDj2wY6uCbz0eA8NceB92KZ56V2KvxkoRBDpS.STKRpEL0MjC', '{\"country\":\"United Arab Emirates\",\"address\":\"sonapur\",\"state\":\"dubai\",\"zip\":\"100001\",\"city\":\"dubai\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'gZOZiahDes1x2JdbzOThsFEubuSgabyrgoGwMsfMctdfQrZC7i8z6wUyDXVF', '2023-04-02 19:07:35', '2023-06-06 13:22:59'),
(6, 'raymonmaris', 'jerry', 'febxadmin', 'raymondmaris088@gmail.com', 'NG', '2348062153658', 'mrREDyZuFj', 0, '0.00000000', '310.00000000', '$2y$10$lEOL8NGg6j3bNEmv5Nb/euTSxLvjBIN//AMlwJQQDZgWZM9nJsP26', '{\"country\":\"Nigeria\",\"address\":\"24 ijoka Akure\",\"state\":\"Ondo\",\"zip\":\"35110\",\"city\":\"ondo\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'P1P7i8VmFdvpRxRtg6AocKBV96K6oj0ZG1kqYSlPvd8mRz5vEIgaAzGifob8', '2023-04-02 19:12:53', '2023-06-06 13:22:59'),
(7, 'Lee', 'Williams', 'lee043', 'ow7950683@gmail.com', 'GB', '447495737890', 'YhcMWgjTDn', 0, '19066.00000000', '1310.00000000', '$2y$10$MKkt1T7CuWc9mu.zupsEy.SU5rqh5wjadsst1EGRtpW7ecTxbywHK', '{\"country\":\"United Kingdom\",\"address\":\"Old Broad street, Tower 42, London wall\",\"state\":\"London\",\"zip\":\"NW\",\"city\":null}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '8ekU3DhyfnC98pRs2BU1lsvnVnIKJh8ryaheCM9oe9fB8h9lLgJPvzi9U1kq', '2023-04-03 16:36:28', '2023-06-06 13:22:59'),
(8, 'Emeka', 'Emmanuel', 'mekaniz', 'edon4044@gmail.com', 'AE', '971566927367', 'WXV4HvOxjD', 0, '100.00000000', '0.00000000', '$2y$10$dKC2LaA0nHkpx/sYpwuI/OdLYiOR61af6p4rbrxLX470iYdHHc33W', '{\"country\":\"United Arab Emirates\",\"address\":\"Dubai\",\"state\":\"Dubai\",\"zip\":\"4433\",\"city\":\"Deira\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-04 00:39:45', '2023-06-06 13:22:59'),
(9, 'Chucho', 'Raph', 'raphael', 'raphaelchucho93@gmail.com', 'NG', '2349110130686', '3liklBxh6Q', 0, '1300.00000000', '0.00000000', '$2y$10$0/0TFrDVxpG661TognYBXeTGjU65/as2XLk0gixrwF6Vzu6hh72j6', '{\"country\":\"Nigeria\",\"address\":\"Lagos\",\"state\":\"Lagos\",\"zip\":null,\"city\":\"Ikeja\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-04 14:58:22', '2023-06-06 13:22:59'),
(10, 'Mahamadou', 'Hydara', 'aboumuhamad219', 'aboumuhamad219@gmail.com', 'FR', '330634646640', '974Oe1AR55', 0, '1.00000000', '0.00000000', '$2y$10$I9dfka.qrxYp6M5da.m/9uKgQajKH4uAvwLzDCKHQCPSKoe4gvVCi', '{\"country\":\"France\",\"address\":\"9Rue Davoust, 93500 Pantin, France\",\"state\":\"9Rue Davoust, 93500 Pantin,\",\"zip\":\"93500\",\"city\":\"Pantin\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-04 15:59:13', '2023-06-06 13:22:59'),
(11, 'brando', 'brown', 'brandobrown55', 'brandobrown2022@gmail.com', 'PH', '639287611067', 'eo3qqzr4qj', 0, '0.00000000', '0.00000000', '$2y$10$syEUJldZ/ptNas48mE0QxuuR6vjpoXLcoQ7f3DTXZ0OCoTw/G8vQe', '{\"country\":\"Philippines\",\"address\":\"156 Ramon Magsaysay Avenue, corner Emilio Jacinto St, Davao City\",\"state\":\"Davao\",\"zip\":\"8000\",\"city\":\"Barangay 32-D\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-05 13:17:23', '2023-06-06 13:22:59'),
(12, 'ehehe', 'teheh', 'refsfsghss', 'admi1hfhn@basefex.co', 'NG', '2340790707070707', 'Y5F0gCH0UO', 0, '76869699696.00000000', '0.00000000', '$2y$10$xiQ3QqtDMsxFUy8hegeAIuVNrFSR1Fb3Tm9QeUvj1uyb/Yx9n4Hpm', '{\"country\":\"Nigeria\",\"address\":\"ehhehe\",\"state\":\"jeejeje\",\"zip\":null,\"city\":\"ejeejeje\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '0wZO03F7zSJTWD3qawgGRc6dRM1JEhc3fhaf9WLFTljAZOKOBmNc6nNr8ZUR', '2023-04-05 17:00:48', '2023-06-06 13:22:59'),
(13, 'Reply', 'No', 'replyno', 'replyno840@gmail.com', 'NG', '2344444444444', '2ZQEH2tNha', 0, '7000.00000000', '0.00000000', '$2y$10$ba8it.v5/cWeIrFA7rYZ1eRRJc2nfVkHztFj1alxwOE2DfL8eHTcO', '{\"country\":\"Nigeria\",\"address\":\"CRS\",\"state\":\"CRS\",\"zip\":\"500001\",\"city\":\"Calabar\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-06 00:45:32', '2023-06-06 13:22:59'),
(14, 'Jose Harold', 'Da Silva gama', 'jose2323', 'joseharoldodasilvagama@gmail.com', 'BR', '5588996967296', 'yAbXgd33CT', 0, '734.00000000', '0.00000000', '$2y$10$JDEqRzGkDRQYGw2R5pVfCebyzkkZMilxAfwfnjFJYUOylBGol0ohC', '{\"country\":\"Brazil\",\"address\":\"Felix 189 estado\",\"state\":\"Rio Grande Do Norte\",\"zip\":\"59622\",\"city\":\"MOSSORO\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'pkL0t3ng1oLzXX8bM7xM9NYGnjWVIZJ2S0lDkh9a3QVGayFvHcmMyo121qOg', '2023-04-15 14:00:13', '2023-06-06 13:22:59'),
(15, 'Mikhail', 'Podgornyi', 'mikhail_01', 'nuteki163@yandex.ru', 'RU', '79170361205', 'tN1YgwG1He', 0, '0.00000000', '0.00000000', '$2y$10$abGKOEymHQyMFLfTkLFsJuNt1rsFhq7UTL.3dEJjo43VaoJ5CxwyW', '{\"address\":\"Samara region Chapaevsk city Kutuzova street house 102\",\"state\":null,\"zip\":\"446101\",\"country\":\"Russia\",\"city\":\"Chapaevsk\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-16 09:27:28', '2023-06-06 13:22:59'),
(16, 'Olayinka', 'Adeyemi', 'sagex7', 'olayinkaapps@gmail.com', 'NG', '2348140557872', '1QOOfsVMUV', 0, '0.00000000', '0.00000000', '$2y$10$iUqAP.kYiexLhRM5cZn0jeDl.Ba2jokF8XL6ExPF37aEEUXpNQvhq', '{\"country\":\"Switzerland\",\"address\":\"Everywhere\",\"state\":\"Lagos\",\"zip\":\"10001\",\"city\":\"Everywhere\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-17 23:46:51', '2023-06-06 13:22:59'),
(17, 'Bot', 'Sage', 'sagebot', 'danzexperiments@gmail.com', 'NG', '2348140557872', '2vl1XaAtpK', 0, '1954.00000000', '1480.00000000', '$2y$10$.38G7XfI1Zq1qiWqj2k6xOlpf8EQOl2pSKYS8Zy3zN1nyEb46UCdm', '{\"country\":\"Nigeria\",\"address\":\"Earth\",\"state\":\"Human\",\"zip\":\"100001\",\"city\":\"Man\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'mvaNDJEQ3OUuM23b1E78JsBNIT6VhSrstpJeTPmy1YwdplEjIajpE4ihlD8P', '2023-04-19 10:04:02', '2023-06-06 13:22:59'),
(18, 'Mimi', 'Sir', 'miemie', 'kidakak389@momoshe.com', 'AE', '971521782859', 'kRm6Ga6yIT', 0, '1905.00000000', '1500.00000000', '$2y$10$XtqCXt7BM6B13MEeboAxj.xikL0QuULvie2pmuFS8s.HXcASP1oLm', '{\"country\":\"United Arab Emirates\",\"address\":\"sonen\",\"state\":\"dubai\",\"zip\":\"10001\",\"city\":\"Dubai\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-22 11:16:30', '2023-06-06 13:22:59'),
(19, 'Lamia', 'Lam', 'lami042', 'lamonlamai42@gmail.com', 'GB', '447438436445', 'uOmPWVpHdd', 0, '1736.30000000', '1500.00000000', '$2y$10$6vkgalzRgOhfFOX7AdDRXe5eAB.D0mh.YijxFl8WgOlgXwvvMfiRS', '{\"country\":\"United Kingdom\",\"address\":\"0000\",\"state\":\"London\",\"zip\":\"77777\",\"city\":\"L2\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 'vHrKU5xr9omaAK7FjtfrEwriliMRpW9MCwFHbUjHeaGcBieoph0gaAdsixcO', '2023-04-22 12:42:55', '2023-06-06 13:22:59'),
(20, 'Raphael', 'ChuCho', 'aniimpoto', 'emilyayia99@gmail.com', 'NG', '23409110130686', 'aLkCl9eK3Y', 0, '0.00000000', '1310.00000000', '$2y$10$QOSpRIgUoBnDdsSYK5l3vOCjglvtLzPpJ4ZnBiitTb44hLU22beNy', '{\"country\":\"Nigeria\",\"address\":\"6th street, building 56, Al Barsha South 1\",\"state\":\"Dubai\",\"zip\":\"101101\",\"city\":\"Dubai\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-04-22 13:59:53', '2023-06-06 13:22:59'),
(21, 'Fake', 'Account', 'faker123', 'koko@koko.com', 'AF', '938140667872', 'uyitcSFP4N', 17, '0.00000000', '0.00000000', '$2y$10$w2XwQUCFfUODAR724H.Z1ePS.gXhv4cBQvrUKhb0ea/obqkyYy0gu', '{\"country\":\"Afghanistan\",\"address\":\"123 Op\",\"state\":\"Sidian\",\"zip\":\"102394\",\"city\":\"Lagos\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-06-06 13:28:07', '2023-06-06 13:28:40');

------------------------------------------------------------------------

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
