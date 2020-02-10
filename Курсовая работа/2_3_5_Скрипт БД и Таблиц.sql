-- Создание БД для онлайн библиотеки (самиздат)
drop database if exists litnet_com;
create database litnet_com;
use litnet_com;

-- Создание таблиц для БД litnet.com

DROP TABLE IF EXISTS users; -- Первичные данные.
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	email VARCHAR(70) unique NOT NULL,
	phone bigint(20) unique,
	INDEX users_phone_idx(phone)
);

INSERT INTO users
	(email, phone)
values
	('daugherty.darwin@example.org','7'),
	('abshire.jerald@example.org','417'),
	('anderson.tremayne@example.net','1'),
	('marjorie90@example.net','423'),
	('allen.mraz@example.net','0'),
	('ida46@example.org','719'),
	('hflatley@example.org','866874'),
	('estelle.jones@example.org','960552'),
	('tyrel.rath@example.com','482619'),
	('harber.alysha@example.net','437693'),
	('maybelle.mcclure@example.com','1328661638'),
	('mohammed.beier@example.net','445'),
	('rhoda25@example.org','799483'),
	('hand.alphonso@example.net','68'),
	('cremin.mark@example.net','975956'),
	('juliet32@example.com','522433'),
	('oberbrunner.lou@example.org','606'),
	('cassin.demetrius@example.org','22'),
	('blick.shanna@example.com','370');

DROP TABLE IF EXISTS authorization; -- Данные для авторизации.
CREATE TABLE authorization (
	authorization_id SERIAL PRIMARY KEY,
	login VARCHAR(50) unique NOT NULL,
	password_login VARCHAR(50) NOT null,
	INDEX authorization_login_idx(login),
	FOREIGN KEY (authorization_id) REFERENCES users(id)
);

INSERT INTO authorization
	(authorization_id, login, password_login)
values
	('1', 'Jordred', '123456'),
	('2', 'Hugithris', '123456'),
	('3', 'Malmeena', '123456'),
	('4', 'Conjunius', '123456'),
	('5', 'Ka', '123456'),
	('6', 'Lalore', '123456'),
	('7', 'Gasius', '123456'),
	('8', 'Kiriron', '123456'),
	('9', 'Nuada', '123456'),
	('10', 'Lailmeena', '123456'),
	('11', 'Anadi', '123456'),
	('12', 'Gholbihelm', '123456'),
	('13', 'Sairim', '123456'),
	('14', 'Malawyn', '123456'),
	('15', 'Gadwyn', '123456'),
	('16', 'Laikus', '123456'),
	('17', 'Adothis', '123456'),
	('18', 'Opilar', '123456'),
	('19', 'Adrieginn', '123456');
	
	
DROP TABLE IF EXISTS photo; -- картинки.
CREATE TABLE photo (
	photo_id SERIAL PRIMARY KEY,
    photo_users_id BIGINT UNSIGNED,
    filename VARCHAR(255),
    size INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX photo_filename_idx(filename),
    FOREIGN KEY (photo_users_id) REFERENCES users(id)
);

INSERT INTO photo
	(photo_id, photo_users_id, filename, size, metadata)
values
	('1', null, 'Lol', '11', null);

INSERT INTO photo
	(photo_users_id, filename, size, metadata)
values
	('2', 'fgdfg', '12', null),
	('4', 'dfgdfg', '13', null),
	('6', 'ggsf', '14', null),
	('8', 'gdf', '12', null),
	('10', 'gg', '13', null),
	('12', 'fff', '14', null),
	('14', 'ddd', '12', null),
	('16', 'sss', '13', null),
	('18', 'aaa', '14', null),
	('3', 'eee', '12', null);


DROP TABLE IF EXISTS account; -- Авторизованные пользователи
CREATE TABLE account (
	account_id SERIAL PRIMARY KEY,
	firstname VARCHAR(50),
    lastname VARCHAR(50),
	gender CHAR(1),
	birthday DATE,
	author bigint(1) default 0, -- авторы. 0- читатели, 1- авторы.
	account_photo_id BIGINT unsigned default 1,
	hometown VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX account_firstname_lastname_idx(firstname, lastname),
    FOREIGN KEY (account_id) REFERENCES users(id),
    FOREIGN KEY (account_photo_id) REFERENCES photo(photo_id)
);

INSERT INTO account
	(account_id, firstname, lastname, gender, birthday, account_photo_id, hometown)
values
	('1', 'Владимир', 'Темченко', 'm', '1970-04-14', '1', 'Усть-Джегута'),
	('2', 'Герман', 'Алчевский', 'm', '1993-07-16', '2', 'Петров Вал'),
	('3', 'Яков', 'Кабанов', 'm', '1980-02-03', '11', 'Павловск'),
	('4', 'Устин', 'Медведев', 'm', '1974-11-24', '3', 'Красноярск–45'),
	('5', 'Антон', 'Никитин', 'm', '1993-02-02', '1', 'Олёкминск'),
	('6', 'Трофим', 'Степанов', 'm', '1976-01-12', '4', 'Кондрово'),
	('7', 'Роман', 'Громов', 'm', '1985-07-08', '1', 'Губаха'),
	('8', 'Чеслав', 'Шаров', 'm', '1992-10-09', '5', 'Мамоново'),
	('9', 'Илья', 'Кириллов', 'm', '1997-11-16', '1', 'Тихорецк'),
	('10', 'Зураб', 'Куликов', 'm', '1991-11-04', '6', 'Архангельск'),
	('11', 'Тамара', 'Федотова', 'w', '1974-09-01', '1', 'Тулун'),
	('12', 'Анфиса', 'Фомина', 'w', '1992-08-26', '7', 'Каменногорск'),
	('13', 'Олеся', 'Бердник', 'w', '1992-09-08', '1', 'Черепаново'),
	('14', 'Дарья', 'Федосеева', 'w', '1998-03-21', '8', 'Грязи'),
	('15', 'Зинаида ', 'Кошелева', 'w', '1998-08-02', '1', 'Дно'),
	('16', 'Дина', 'Гребневска', 'w', '1995-11-28', '9', 'Старая Русса'),
	('17', 'Юнона', 'Игнатова', 'w', '1987-12-14', '1', 'Черкесск'),
	('18', 'София', 'Павлик', 'w', '1982-01-31', '10', 'Пущино'),
	('19', 'Доминика', 'Фомина', 'w', '1995-09-10', '1', 'Диксон');


DROP TABLE IF EXISTS authors; -- авторы
CREATE TABLE authors (
	authors_id SERIAL PRIMARY KEY,
	authors_users_id BIGINT UNSIGNED NOT NULL,
	firstname_authors VARCHAR(50),
    lastname_authors VARCHAR(50),
    gender CHAR(1),
	birthday DATE,
	account_photo_id BIGINT unsigned default 1,
    number_of_books int, 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	INDEX account_firstname_authors_lastname_authors_idx(firstname_authors, lastname_authors),
	FOREIGN KEY (authors_users_id) REFERENCES account(account_id)
);

INSERT INTO authors
	(authors_users_id, firstname_authors, lastname_authors, gender, birthday, account_photo_id)
values
	('2', 'Герман', 'Алчевский', 'm', '1993-07-16', '2'),
	('6', 'Трофим', 'Степанов', 'm', '1976-01-12', '4'),
	('14', 'Дарья', 'Федосеева', 'w', '1998-03-21', '8');

DROP TABLE IF EXISTS censor_age; -- возростной цензор
CREATE TABLE censor_age (
	id SERIAL PRIMARY KEY,
	name_censor_age VARCHAR(20)
);

insert into censor_age
	(name_censor_age)
values
	('0+'),
	('3+'),
	('6+'),
	('12+'),
	('16+'),
	('18+'),
	('21+');

DROP TABLE IF EXISTS statuses; -- статусы книг
CREATE TABLE statuses (
	id SERIAL PRIMARY KEY,
	status VARCHAR(50)
);

insert into statuses
	(status)
values
	('В процессе'),
	('Полный текст'),
	('Заморожено');

DROP TABLE IF EXISTS artwork; -- обложки для книг
CREATE TABLE artwork (
	id SERIAL PRIMARY KEY,
    artwork_authors_id BIGINT UNSIGNED,
    filename VARCHAR(255),
    size INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX artwork_filename_idx(filename),
    FOREIGN KEY (artwork_authors_id) REFERENCES authors(authors_users_id) -- Не понял почему не дает поставить authors_id в место authors_users_id ?
	);

insert into artwork
	(artwork_authors_id, filename, size, metadata)
values
	('2', 'pop.jpg', '12', null),
	('2', 'pl.jpg', '12', null),
	('6', 'kok.jpg', '21', null),
	('14', 'sds.jpg', '21', null),
	('14', 'asaa.jpg', '12', null);

DROP TABLE IF EXISTS genres; -- жанры
CREATE TABLE genres (
	genres_id SERIAL PRIMARY KEY,
	genre varchar(100)
);

insert into genres
	(genre)
values
	('Фэнтези'),
	('Любовные романы'),
	('Фантастика'),
	('Молодежная проза'),
	('Попаданцы'),
	('Фанфик'),
	('Детективы'),
	('Проза'),
	('Триллеры'),
	('Мистика/Ужасы');

DROP TABLE IF EXISTS sub_geners; -- поджанры
CREATE TABLE sub_geners (
	id SERIAL PRIMARY KEY,
	genre_id BIGINT UNSIGNED,
	sub_gener varchar(100),
	INDEX sub_geners_sub_gener_idx(sub_gener),
    FOREIGN KEY (genre_id) REFERENCES genres(genres_id)
);

insert into sub_geners
	(genre_id, sub_gener)
values
	('1', 'Боевое фэнтези'),
	('1', 'Любовное фэнтези'),
	('2', 'Короткий любовный роман'),
	('2', 'Исторический любовный роман'),
	('3', 'Боевая фантастика'),
	('3', 'Научная фантастика'),
	('4', 'Молодежная мистика'),
	('4', 'Подростковая проза'),
	('5', 'Попаданцы во времени'),
	('5', 'Попаданцы в другие миры'),
	('6', 'Манга фанфики'),
	('6', 'Аниме фанфики'),
	('7', 'Исторический детектив'),
	('7', 'Классический детектив'),
	('8', 'Современная проза'),
	('8', 'Исторический роман'),
	('9', 'Криминальный триллер'),
	('9', 'Мистический триллер'),
	('10', 'Паранормальное');

DROP TABLE IF EXISTS books; -- книги
CREATE TABLE books (
	id SERIAL PRIMARY KEY,
	name_book varchar(100) NOT NULL,
	description text,
	text_book text,
	number_of_pages MEDIUMINT unsigned,
	author_books_id BIGINT UNSIGNED NOT NULL,
	censor_age_id BIGINT UNSIGNED NOT NULL,
	status_id BIGINT UNSIGNED NOT NULL,
	artwork_id BIGINT UNSIGNED NOT NULL,
	genre_id BIGINT UNSIGNED NOT NULL,
	sub_geners_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	INDEX books_name_book_idx(name_book),
	INDEX books_status_id_idx(status_id),
	INDEX books_genre_id_idx(genre_id),
	FOREIGN KEY (censor_age_id) REFERENCES censor_age(id),
	FOREIGN KEY (status_id) REFERENCES statuses(id),
	FOREIGN KEY (artwork_id) REFERENCES artwork(id),
	FOREIGN KEY (genre_id) REFERENCES genres(genres_id),
	FOREIGN KEY (sub_geners_id) REFERENCES sub_geners(id),
	FOREIGN KEY (author_books_id) REFERENCES authors(authors_id)
);

insert into books
	(name_book, description, text_book, number_of_pages, author_books_id, censor_age_id, status_id, artwork_id, genre_id, sub_geners_id)
values
	('Вася против всех.', null, null, '0', '1', '3', '1', '3', '3', '5'),
	('Вася и домашний инопланетянин.', null, null, '0', '2', '7', '1', '1', '10', '19'),
	('Вася и его новый мобильник.', null, null, '0', '3', '5', '1', '4', '4', '8');

DROP TABLE IF EXISTS books_comments; -- коментарии к книге
CREATE TABLE books_comments (
	id SERIAL PRIMARY KEY,
	book_id BIGINT UNSIGNED NOT NULL,
	book_comments VARCHAR(150),
	FOREIGN KEY (book_id) REFERENCES books(id)
);

insert into books_comments
	(book_id, book_comments)
values
	('1', 'Книга просто огонь. Если хоть одну строчку скинули почитать('),
	('2', 'Вы ссерьезно?');

DROP TABLE IF EXISTS books_like; -- рейтинги книг
CREATE TABLE books_like(
	id SERIAL PRIMARY KEY,
	books_like_book_id BIGINT UNSIGNED NOT NULL,
	books_like_account_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	INDEX books_like_book_id_idx(books_like_book_id),
	FOREIGN KEY (books_like_book_id) REFERENCES books(id),
	FOREIGN KEY (books_like_account_id) REFERENCES account(account_id)
);

insert into books_like
	(books_like_book_id, books_like_account_id)
values
	('1', '5'),
	('1', '6'),
	('1', '4'),
	('1', '3'),
	('2', '1'),
	('2', '2'),
	('3', '12');
	
DROP TABLE IF EXISTS authors_like; -- рейтинги книг
CREATE TABLE authors_like(
	id SERIAL PRIMARY KEY,
	authors_like_author_id BIGINT UNSIGNED NOT NULL,
	books_like_account_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	INDEX authors_like_author_idx(authors_like_author_id),
	FOREIGN KEY (authors_like_author_id) REFERENCES authors(authors_id),
	FOREIGN KEY (books_like_account_id) REFERENCES account(account_id)
);

insert into authors_like
	(authors_like_author_id, books_like_account_id)
values
	('1', '5'),
	('3', '16'),
	('2', '14'),
	('2', '3'),
	('2', '1'),
	('2', '11'),
	('3', '12');

DROP TABLE IF EXISTS blogs; -- блоги писателей
CREATE TABLE blogs (
	id SERIAL PRIMARY KEY,
	blogs_author_id BIGINT UNSIGNED NOT NULL,
	article varchar(200),
	text_blog text,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (blogs_author_id) REFERENCES authors(authors_id)
);

insert into blogs
	(blogs_author_id, article, text_blog)
values
	('1', 'Про книгу.', 'Друзья, подождете чуть-чуть. Скоро появятся первые строки)')





















