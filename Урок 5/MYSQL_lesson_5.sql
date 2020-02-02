-- use vk;

-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”

-- Задание №1 и №2.

-- ALTER TABLE profiles DROP created_at, drop updated_at, drop age;

-- ALTER TABLE profiles add COLUMN (
-- 	created_at datetime DEFAULT current_timestamp,
-- 	updated_at datetime DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
-- 	age bigint(20));

-- Установление значений сегоднешней даты в столбцах created_at и updated_at.
-- UPDATE profiles SET created_at = now(),
-- updated_at = now();

-- Заполнение столбца age.
-- update profiles set age = TIMESTAMPDIFF(YEAR, birthday, now());

-- use shop;

-- Задание №3.

-- Заполняем столбец value в таблице storehouses_products.

-- INSERT INTO storehouses_products
--   (value)
-- values (250), (0), (750), (2050), (0),
-- 		(2500), (5000), (0), (1250), (11250);

-- select distinct id, value from storehouses_products order by IF (value > 0, 0, 1), value;


-- Задание №4.
-- НЕ ДОДЕЛАНО select id, name, birthday_at from users where birthday_at like '%05___' or birthday_at like '%08___'; 



-- Практическое задание теме “Агрегация данных”

-- Задание №1.

-- select avg(TIMESTAMPDIFF(YEAR, birthday_at, now())) as 'средний возраст' from users;

-- Задание №2.

-- select DATE_FORMAT(DATE_ADD(birthday_at, INTERVAL (TIMESTAMPDIFF(YEAR, birthday_at, now())) year), '%W')
-- 	as 'weekday', count('Количество дней рождения в дне недели')
--	from users group by weekday;











