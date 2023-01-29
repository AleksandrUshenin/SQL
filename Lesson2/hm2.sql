DROP DATABASE IF EXISTS lesson_2;
CREATE DATABASE lesson_2;
USE lesson_2;

-- создание таблицы 
DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
	id int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    order_date date NOT NULL, 
    count_product int UNSIGNED NOT NULL
);
-- заполнение таблицы
INSERT INTO sales (order_date, count_product)
VALUE 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

-- добавим столбец
ALTER TABLE sales
ADD type_order varchar(20) NOT NULL AFTER count_product;

UPDATE sales SET type_order = 'Маленький заказ' WHERE count_product  < 100;
UPDATE sales SET type_order = 'Средний заказ' WHERE count_product > 100 AND 
count_product < 200;
UPDATE sales SET type_order = 'Большой заказ' WHERE count_product >= 200;

SELECT * FROM sales;

-- создание таблицы orders
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id int UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    employee_id varchar(5) NOT NULL,
    amount decimal NOT NULL, 
    order_status varchar(20) NOT NULL
);
-- заполнение таблицы
INSERT INTO orders (employee_id, amount, order_status)
VALUE 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT 
	id, 
    employee_id, 
    amount 
    order_status,
    CASE
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
        ELSE 'Не указана'
	END AS order_status
FROM orders;

-- null указывает на "пустое место" a "0" — это значение, константа.