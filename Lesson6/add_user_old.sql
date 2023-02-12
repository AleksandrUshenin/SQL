CREATE DEFINER=`root`@`localhost` PROCEDURE `lesson_4`.`add_user_old`(firstname varchar(100), lastname varchar(100), email varchar(100), OUT  tran_result varchar(100))
begin
	DECLARE `_rollback` BIT DEFAULT 0;
	DECLARE code varchar(100);
	DECLARE error_string varchar(100);

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
 		SET `_rollback` = 1;
 		GET stacked DIAGNOSTICS CONDITION 1
			code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
	END;

	START TRANSACTION;
	insert into users_old (firstname, lastname, email)
	values (firstname, lastname, email);

	IF `_rollback` THEN
		SET tran_result = concat('УПС. Ошибка: ', code, ' Текст ошибки: ', error_string);
		ROLLBACK;
	ELSE
		SET tran_result = 'O K';
		COMMIT;
	END IF;
END