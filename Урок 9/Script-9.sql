-- Урок 9.
-- “Транзакции, переменные, представления”
-- Задание 1.

start transaction;

select * from shop.users where id=1;

INSERT INTO sample.users (name, birthday_at)
  select name, birthday_at from shop.users where id=1;
  
delete from shop.users where id=1;

commit;

-- Задание 2.

create view general as
	(SELECT products.name, catalogs.name AS total_produkts
	FROM shop.products
    JOIN shop.catalogs ON shop.products.catalog_id = shop.catalogs.id
	);
select * from general;


-- “Администрирование MySQL”
-- Задание 1.

CREATE USER 'shop'@'localhost2' IDENTIFIED BY '4321';

GRANT ALL PRIVILEGES ON shop.* TO 'shop'@'localhost2';

CREATE USER 'shop_read'@'localhost2' IDENTIFIED BY '1234';

GRANT SELECT ON shop.* TO 'shop_read'@'localhost2';


-- “Хранимые процедуры и функции, триггеры"
-- Задание 1.

DROP PROCEDURE IF EXISTS exercise_1;
CREATE PROCEDURE exercise_1 (greeting time)
BEGIN
  if (greeting < '06:00:00') THEN
    SELECT "Доброй ночи" AS exercise_1;
  ELSEIF (greeting < '12:00:00') THEN
    SELECT "Доброе утро" AS exercise_1;
  ELSEIF (greeting < '18:00:00') THEN
    SELECT "Добрый день" AS exercise_1;
  ELSEIF (greeting >= '18:00:00') THEN
    SELECT "Добрый вечер" AS exercise_1;
  ELSE
    select "Произошел временной калапс."; -- ошибка
  END if;
end;
CALL exercise_1 (now());

-- Задание 2.

CREATE TRIGGER against_four_hollows_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
  IF(new.name IS null or new.desription is null)
  	THEN 
  	signal sqlstate '45000'
  	set message_text = 'Поле не может быть NULL.';
  end if;
end;

CREATE TRIGGER against_four_hollows_insert BEFORE update ON products
FOR EACH ROW
BEGIN
  IF(new.name IS null or new.desription is null)
  	THEN 
  	signal sqlstate '45000'
  	set message_text = 'Поле не может быть NULL.';
  end if;
end;
























