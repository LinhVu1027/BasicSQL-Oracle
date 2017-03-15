------------Table No1------------
ALTER TABLE KhachHang
ADD CONSTRAINT MSKH_KH CHECK
(REGEXP_LIKE(MSKH, '^(NL|TE)[0-9]{10}$')) ENABLE;

ALTER TABLE KhachHang
ADD CONSTRAINT SDT_KH CHECK
(REGEXP_LIKE(SoDT, '^[+](84)[0-9]{9}[0-9]?$')) ENABLE;

ALTER TABLE KhachHang
ADD CONSTRAINT GT_KH CHECK
(GioiTinh IN ('Nam','Nu')) ENABLE;

ALTER TABLE KhachHang
ADD CONSTRAINT KLV_KH CHECK
(KhoiLuongVuot >= 0) ENABLE;

------------Table No2------------
ALTER TABLE KhachHangNL
ADD CONSTRAINT PP_KHNL CHECK
(REGEXP_LIKE(Passport, '^[B][0-9]{7}$')) ENABLE;

------------Table No3------------
------------Table No4------------
ALTER TABLE TrangThaiTG
ADD CONSTRAINT TTT_TTTG CHECK
(TenTT IN ('TG','HH','DD')) ENABLE;

------------Table No5------------
ALTER TABLE PhiVCHH
ADD CONSTRAINT LV_PVCHH CHECK
(LoaiVe IN ('VIP','PT')) ENABLE;

------------Table No6------------
ALTER TABLE ChuyenBay
ADD CONSTRAINT MSCB_CB CHECK
(REGEXP_LIKE(MSCB, '^(SA)[0-9]{7}$')) ENABLE;

ALTER TABLE ChuyenBay
ADD CONSTRAINT TT_CB CHECK
(TrangThai IN ('CB','DB','HB')) ENABLE;

------------Table No7------------
ALTER TABLE GheKhach
ADD CONSTRAINT GS_GK CHECK
(REGEXP_LIKE(GheSo, '^[A-Z][0-9]{2}$')) ENABLE;

------------Table No8------------
ALTER TABLE MayBay
ADD CONSTRAINT MSMB_MB CHECK
(REGEXP_LIKE(MSMB, '^(SAP)[0-9]{3}$')) ENABLE;

------------Table No9------------
------------Table No10------------
ALTER TABLE GheNgoi
ADD CONSTRAINT GS_GN CHECK
(REGEXP_LIKE(GheSo, '^[A-Z][0-9]{2}$')) ENABLE;

ALTER TABLE GheNgoi
ADD CONSTRAINT LG_GN CHECK
(LoaiGhe IN ('VIP','PT')) ENABLE;

------------Table No11------------
------------Table No12------------
------------Table No13------------
------------Table No14------------
------------Table No15------------
------------Table No16------------
ALTER TABLE NhanVien
ADD CONSTRAINT MSNV_NV CHECK
(REGEXP_LIKE(MSNV, '^(PC|TV|KT|DH|KS)[0-9]{10}$')) ENABLE;

ALTER TABLE NhanVien
ADD CONSTRAINT GT_NV CHECK
(GioiTinh IN ('Nam','Nu')) ENABLE;

ALTER TABLE NhanVien
ADD CONSTRAINT SDT_NV CHECK
(REGEXP_LIKE(SoDT, '^[+](84)[0-9]{9}[0-9]?$')) ENABLE;

ALTER TABLE NhanVien
ADD CONSTRAINT PP_NV CHECK
(REGEXP_LIKE(Passport, '^[B][0-9]{7}$')) ENABLE;

------------Table No17------------
------------Table No18------------
ALTER TABLE PhiCong
ADD CONSTRAINT LPC_NV CHECK
(LoaiPhiCong IN ('CT','PL')) ENABLE;

------------Table No19------------
------------Table No20------------
------------Table No21------------
ALTER TABLE CaLamViec 
ADD CONSTRAINT MSCLV_CLV CHECK
(REGEXP_LIKE(MSCLV, '^[C][1-3]$')) ENABLE;

------------Table No22------------
------------Table No23------------
------------Table No24------------
------------Table No25------------
------------Table No26------------
------------Table No27------------