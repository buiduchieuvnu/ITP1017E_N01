drop procedure if exists tu_vung_sua;

DELIMITER $$
CREATE PROCEDURE tu_vung_tim(p_tu_khoa varchar(500))
begin
/*
	Tim tu vung
*/
SELECT * FROM tu_vung
WHERE tieng_anh like concat ('%', p_tu_khoa, '%');
END