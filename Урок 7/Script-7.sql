-- Задание 1.

INSERT INTO orders (user_id) values (1), (2), (1), (2), (3);

select * from users where id in (select user_id from orders);

-- Задание 2.

select products.name, catalogs.name from products, catalogs
where catalogs.id=products.catalog_id;

-- Задание 3.

