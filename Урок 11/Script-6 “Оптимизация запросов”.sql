DROP TABLE IF EXISTS logs;
create table logs(
	table_name varchar(255),
	new_record_id bigint(20),
	record_name varchar(255),
	created_at datetime default current_timestamp
) Engine=Archive;

create trigger log_in_the_users_table after insert on users
	for each row begin
		insert into logs(table_name, new_record_id, record_name)
		values('users', new.id, new.name);
	end;
	
create trigger log_in_the_catalogs_table after insert on catalogs
	for each row begin
		insert into logs(table_name, new_record_id, record_name)
		values('catalogs', new.id, new.name);
	end;

create trigger log_in_the_products_table after insert on products
	for each row begin
		insert into logs(table_name, new_record_id, record_name)
		values('products', new.id, new.name);
	end;

insert into users(name, birthday_at)
		values('Алексей', '1999-02-15');
	
insert into catalogs(name)
		values('SSD');
	
insert into products(name, desription, price)
		values('Системник', 'Крутой системник 123456', '170000');
		
select * from logs;