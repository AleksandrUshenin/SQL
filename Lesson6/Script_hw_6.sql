use lesson_4;

-- create database lesson_6;
-- пользователи
DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

select * from users;
select * from users_old;

-- Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно 
-- переместить любого (одного) пользователя из таблицы users в таблицу users_old. (использование транзакции с 
-- выбором commit или rollback – обязательно).

call lesson_4.add_user_old2('New', 'User', 'new_user@mail.com', @tran_result);
SELECT @tran_result;

set @name = (select firstname from users where id = 5);
set @name2 = (select lastname from users where id = 5);
set @mail = (select email from users where id = 5);

call lesson_4.add_user_old2(@name, @name2, @mail, @tran_result);
SELECT @tran_result;

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DROP TABLE IF EXISTS date_time;
CREATE TABLE date_time (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    type_date VARCHAR(50),
    start_time time,
    end_time time
);
insert into date_time(type_date, start_time, end_time) values
('Доброе утро', '6:00:01', '12:00:00'),
('Добрый день', '12:00:01', '18:00:00'),
('Добрый вечер', '18:00:01', '0:00:00'),
('Доброй ночи', '0:00:01', '6:00:00');

select lesson_4.hello();





