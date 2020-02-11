-- Представления.

-- Названия книг + их жанры.
create view gol_1 as
	(select books.name_book, genres.genre as total
	from litnet_com.books
	join litnet_com.genres on litnet_com.books.genre_id = litnet_com.genres.genres_id);

select * from gol_1;

-- Названия книг + их жанры + под жанры.
create view gol_3 as
	(select books.name_book, genres.genre, sub_geners.sub_gener as total
	from litnet_com.books
	join litnet_com.genres on litnet_com.books.genre_id = litnet_com.genres.genres_id
	join litnet_com.sub_geners on litnet_com.books.sub_geners_id = litnet_com.sub_geners.id);

select * from gol_3;

-- Авторы и их книги.
create view gol_6 as
	(select concat(authors.firstname_authors, ' ', authors.lastname_authors) as name, books.name_book
	from litnet_com.authors
	join litnet_com.books on litnet_com.authors.authors_id = litnet_com.books.author_books_id);

select * from gol_6;



