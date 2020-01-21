-- Первое задание
-- Не  смог додумать. Получается огромная фигня.

-- Второе задание.
select COUNT(id) as likes from likes where user_id in (
    SELECT user_id FROM media WHERE user_id in(
    select user_id from profiles 
    where (TIMESTAMPDIFF(YEAR, birthday, NOW())) < 10));
    
-- Третье задание.
select if(
  (select count(id) from likes where user_id in
    (select user_id from profiles where gender='f'))>
  (select count(id) from likes where user_id in
    (select user_id from profiles where gender='m')),
  'f', 'm')  as likes;