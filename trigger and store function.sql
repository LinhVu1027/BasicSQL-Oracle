CREATE TRIGGER LoaiMayBay_TongSoVe
BEFORE INSERT ON LoaiMayBay
FOR EACH ROW 
BEGIN
  IF (:new.TongSoGhe != :new.SoGheVip + :new.SoGhePT)
      OR :new.TongSoGhe IS NULL
  THEN :new.TongSoGhe := :new.SoGheVip + :new.SoGhePT;
  END IF;
END;
/

CREATE TRIGGER TongGioBay_MayBay
BEFORE INSERT OR UPDATE OF TrangThai ON ChuyenBay
FOR EACH ROW
BEGIN
  IF UPDATING THEN
    IF (:old.TrangThai <> 'DB' AND :new.TrangThai = 'DB') THEN
      UPDATE MayBay
        SET TongGioBay = TongGioBay 
                    + EXTRACT(DAY FROM (:new.ThoiDiemDen - :new.ThoiDiemDi))*24
                    + EXTRACT(HOUR FROM (:new.ThoiDiemDen - :new.ThoiDiemDi))
                    + EXTRACT(MINUTE FROM (:new.ThoiDiemDen - :new.ThoiDiemDi))/60
      WHERE MSMB = :new.MSMB;
    END IF;
  ELSIF INSERTING THEN
    IF (:new.TrangThai = 'DB') THEN
      UPDATE MayBay
      SET TongGioBay = TongGioBay 
                    + EXTRACT(DAY FROM (:new.ThoiDiemDen - :new.ThoiDiemDi))*24
                    + EXTRACT(HOUR FROM (:new.ThoiDiemDen - :new.ThoiDiemDi))
                    + EXTRACT(MINUTE FROM (:new.ThoiDiemDen - :new.ThoiDiemDi))/60
      WHERE MSMB = :new.MSMB;
    END IF;
  END IF;
END;
/
CREATE OR REPLACE PROCEDURE update_status 
( p_mskh IN KHACHHANG.MSKH%TYPE,
  p_msphh IN PhiVCHH.MSPHH%TYPE )
AS 
BEGIN
  UPDATE KhachHang
  SET MSPHH=p_msphh
  WHERE MSKH=p_mskh;
  COMMIT;
END update_status;
/
CREATE OR REPLACE PROCEDURE capnhat_khoiluong 
(p_mskh IN KHACHHANG.MSKH%TYPE,
 p_msphh IN PhiVCHH.MSPHH%TYPE,
 p_trongluong IN NUMBER)
AS
 v_kldm NUMBER;
BEGIN
  SELECT PhiVCHH.TrongLuongDM
  INTO v_kldm
  FROM PhiVCHH
  WHERE MSPHH=p_msphh;
   
  UPDATE KHACHHANG
  SET KhoiLuongVuot=p_trongluong-v_kldm
  WHERE MSPHH=p_msphh AND MSKH=p_mskh;
  
END capnhat_khoiluong;
/
CREATE OR REPLACE FUNCTION tinhtien
(p_msphh IN PhiVCHH.MSPHH%TYPE,
 p_trongluong IN INT)
RETURN NUMBER
AS 
 v_kldm INT;
 v_dongia INT;
  CURSOR c1 IS 
    SELECT PhiVCHH.TrongLuongDM,PhiVCHH.DonGia_Kg 
    FROM PhiVCHH
    WHERE MSPHH=p_msphh;
BEGIN
  OPEN c1;
  FETCH c1 INTO v_kldm,v_dongia;
  close c1;
  RETURN (p_trongluong-v_kldm)*v_dongia;
END tinhtien;
/