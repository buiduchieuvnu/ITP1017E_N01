drop procedure if exists tu_vung_sua;

DELIMITER $$
CREATE PROCEDURE tu_vung_sua(
p_id_TU_VUNG INT,
p_tieng_anh varchar(500),
p_tieng_viet varchar(1000),
p_mo_ta text,
p_hinh_anh varchar(500),
p_am_thanh varchar(500),
p_mau_cau varchar(500))
BEGIN
 /* 
	Sua  tu vung
 */
 DECLARE ma CHAR(5) DEFAULT '0000';
 DECLARE thong_bao TEXT;
 DECLARE ket_qua TEXT;
 
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
	ROLLBACK;
    GET DIAGNOSTICS CONDITION 1
    ma = RETURNED_SQLSTATE, thong_bao = MESSAGE_TEXT;
END;

START TRANSACTION;
	UPDATE tu_vung SET
    tieng_anh = p_tieng_anh,
    tieng_viet = p_tieng_viet,
    mo_ta = p_mo_ta,
    hinh_anh = p_hinh_anh,
    am_thanh = p_am_thanh,
    mau_cau = p_mau_cau
    WHERE id_TU_VUNG = p_id_TU_VUNG;
    
COMMIT;
	SET ket_qua = CONVERT(LAST_INSERT_ID(),CHAR(50));
    SET thong_bao = "Sua thanh cong!";
    select ma , thong_bao, ket_qua;
END