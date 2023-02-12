CREATE FUNCTION lesson_4.hello()
RETURNS varchar(50) READS SQL DATA
begin
	set @message = (
		select type_date from date_time where start_time < current_time() and end_time > current_time());
	return @message;
END