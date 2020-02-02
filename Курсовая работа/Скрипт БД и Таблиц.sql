-- Создание БД
drop database if exists litnet_com;
create database litnet_com;
use litnet_com;

-- Создание таблиц для БД litnet.com

DROP TABLE IF EXISTS users; -- Первичные данные.
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	email VARCHAR(70) unique NOT NULL,
	phone bigint(20) unique
);

DROP TABLE IF EXISTS authorization; -- Данные для авторизации.
CREATE TABLE authorization (
	authorization_id SERIAL PRIMARY KEY,
	login VARCHAR(50) unique NOT NULL,
	password_login VARCHAR(50) NOT null,
	FOREIGN KEY (authorization_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS photo; -- картинки.
CREATE TABLE photo (
	id SERIAL PRIMARY KEY,
    photo_users_id BIGINT UNSIGNED NOT NULL,
    filename VARCHAR(255),
    size INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (photo_users_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS account; -- Авторизованные пользователи
CREATE TABLE account (
	account_id SERIAL PRIMARY KEY,
	firstname VARCHAR(50),
    lastname VARCHAR(50),
	gender CHAR(1),
	birthday DATE,
	author bigint(1) default 0, -- авторы. 0- читатели, 1- авторы.
	photo_id BIGINT UNSIGNED null default 1,
	hometown VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photo(id)
);

DROP TABLE IF EXISTS authors; -- авторы
CREATE TABLE authors (
	authors_users_id SERIAL PRIMARY KEY,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (authors_users_id) REFERENCES account(account_id)
);




DROP TABLE IF EXISTS censor_age; -- возростной цензор
CREATE TABLE censor_age (
	id SERIAL PRIMARY KEY,
	name_censor_age bigint(20)
);

DROP TABLE IF EXISTS statuses; -- статусы книг
CREATE TABLE statuses (
	id SERIAL PRIMARY KEY,
	status VARCHAR(50)
);

DROP TABLE IF EXISTS artwork; -- обложки для книг
CREATE TABLE artwork (
	id SERIAL PRIMARY KEY,
    artwork_authors_id BIGINT UNSIGNED NOT NULL,
    filename VARCHAR(255),
    size INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (artwork_authors_id) REFERENCES authors(authors_users_id)
	);

DROP TABLE IF EXISTS genres; -- жанры
CREATE TABLE genres (
	id SERIAL PRIMARY KEY,
	genre varchar(100)
);

DROP TABLE IF EXISTS sub_geners; -- поджанры
CREATE TABLE sub_geners (
	id SERIAL PRIMARY KEY,
	sub_gener varchar(100)
);

DROP TABLE IF EXISTS books; -- книги
CREATE TABLE books (
	id SERIAL PRIMARY KEY,
	name_book varchar(100),
	description text,
	number_of_pages MEDIUMINT unsigned,
	author_id bigint(20),
	censor_age_id bigint(20),
	booсk_price SMALLINT unsigned,
	status_id bigint(20),
	artwork_id bigint(20),
	genre_id bigint(20),
	sub_geners_id bigint(20),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (censor_age_id) REFERENCES censor_age(id),
	FOREIGN KEY (status_id) REFERENCES statuses(id),
	FOREIGN KEY (artwork_id) REFERENCES artwork(id),
	FOREIGN KEY (genre_id) REFERENCES genres(id),
	FOREIGN KEY (sub_geners_id) REFERENCES sub_geners(id),
	FOREIGN KEY (author_id) REFERENCES account(account_id)
);

DROP TABLE IF EXISTS books_comments; -- коментарии к книге
CREATE TABLE books_comments (
	id SERIAL PRIMARY KEY,
	book_id bigint(20),
	book_comments VARCHAR(150),
	FOREIGN KEY (book_id) REFERENCES books(id)
);

DROP TABLE IF EXISTS books_rating; -- рейтинги книг
CREATE TABLE books_rating(
	id SERIAL PRIMARY KEY,
	book_id bigint(20),
	books_rating_account_id bigint(20),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (book_id) REFERENCES books(id),
	FOREIGN KEY (books_rating_account_id) REFERENCES account(account_id)
);

DROP TABLE IF EXISTS blogs; -- блоги писателей
CREATE TABLE blogs (
	id SERIAL PRIMARY KEY,
	blogs_author_id bigint(20),
	article varchar(200),
	text_blog text,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (blogs_author_id) REFERENCES authors(authors_users_id)
);























