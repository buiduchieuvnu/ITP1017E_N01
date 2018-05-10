drop procedure if exists tu_vung_them;

DELIMITER $$
CREATE PROCEDURE tu_vung_them(p_tieng_anh varchar(500),
p_tieng_viet varchar(1000),
p_mo_ta text,
p_hinh_anh varchar(500),
p_am_thanh varchar(500),
p_mau_cau varchar(500))
BEGIN
 /* Them moi tu vung
 
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
	INSERT INTO tu_vung(
		tieng_anh,
        tieng_viet,
        mo_ta,
        hinh_anh,
        am_thanh,
        mau_cau
    )values(
		p_tieng_anh,
        p_tieng_viet,
        p_mo_ta,
        p_hinh_anh,
        p_am_thanh,
        p_mau_cau
    );
COMMIT;
	SET ket_qua = CONVERT(LAST_INSERT_ID(),CHAR(50));
    SET thong_bao = "Them thanh cong!";
    select ma , thong_bao, ket_qua;
END