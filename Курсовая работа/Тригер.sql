-- Тригер по добавлению данных в таблицу с авторвми при изменении статуса юзер/автор в таблице акаунты.
DELIMITER //

drop TRIGGER if exists user_autor;
CREATE TRIGGER user_autor BEFORE UPDATE ON accounts
FOR EACH ROW
begin
    IF NEW.author = '1' THEN
        INSERT INTO litnet_com.authors(author_user_id, firstname_author, lastname_author, gender, birthday, account_photo_id)
			SELECT account_id, firstname, lastname, gender, birthday, account_photo_id
			FROM litnet_com.accounts where account_id=3; -- Как тут дублировать данные из update запроса?
    END IF;
end//

DELIMITER ;

update accounts SET author='1' where account_id=3;

select * from authors;