------------Table No1------------
CREATE TABLE KhachHang
( MSKH            VARCHAR2(12)    NOT NULL          
, HoTen           VARCHAR2(30)    NOT NULL   
, NgaySinh        DATE            NOT NULL
, GioiTinh        VARCHAR2(3)     NOT NULL
, QuocTich        VARCHAR2(20)    NOT NULL
, SoDT            VARCHAR2(13)    NOT NULL
, DiaChi          VARCHAR2(60)    NOT NULL
, MSTTTG          NUMBER
, MSPHH           NUMBER
, MSCB            VARCHAR2(9)
, KhoiLuongVuot   FLOAT
, PRIMARY KEY (MSKH));

------------Table No2------------
CREATE TABLE KhachHangNL
( MSKH            VARCHAR2(12)    NOT NULL
, CMND            VARCHAR2(9)     UNIQUE      NOT NULL
, Passport        VARCHAR2(8)
, PRIMARY KEY (MSKH));

------------Table No3------------
CREATE TABLE KhachHangTE
( MSKH            VARCHAR2(12)    NOT NULL
, ThongTinKSinh   VARCHAR2(60)
, MSNGH           VARCHAR2(12)    NOT NULL
, PRIMARY KEY (MSKH));

------------Table No4------------
CREATE TABLE TrangThaiTG
( MSTTTG          NUMBER          NOT NULL
, TenTT           VARCHAR2(2)     NOT NULL
, PhanTramTP      FLOAT           NOT NULL
, PRIMARY KEY (MSTTTG));

------------Table No5------------
CREATE TABLE PhiVCHH
( MSPHH           NUMBER          NOT NULL
, LoaiVe          VARCHAR2(3)     NOT NULL
, TrongLuongDM    NUMBER          NOT NULL
, DonGia_Kg       NUMBER          NOT NULL
, ThoiDiemApDung  DATE            NOT NULL
, PRIMARY KEY (MSPHH));

------------Table No6------------
CREATE TABLE ChuyenBay
( MSCB            VARCHAR2(9)     NOT NULL
, TrangThai       VARCHAR2(2)     NOT NULL
, SoGheTrong      NUMBER          NOT NULL
, ThoiDiemDi      TIMESTAMP       NOT NULL
, ThoiDiemDen     TIMESTAMP       NOT NULL
, MSMB            VARCHAR2(6)     NOT NULL
, MSTB            NUMBER          NOT NULL
, PRIMARY KEY (MSCB));

------------Table No7------------
CREATE TABLE GheKhach
( MSKH            VARCHAR2(12)    NOT NULL
, GheSo           VARCHAR2(3)     NOT NULL
, Gia             NUMBER          NOT NULL
, PRIMARY KEY (MSKH, GheSo));

------------Table No8------------
CREATE TABLE MayBay
( MSMB            VARCHAR2(6)     NOT NULL
, TongGioBay      NUMBER          NOT NULL
, NamSX           VARCHAR2(4)     NOT NULL
, ThoiDiemSD      DATE            NOT NULL
, MSLMB           NUMBER          NOT NULL
, PRIMARY KEY (MSMB));

------------Table No9------------
CREATE TABLE LoaiMayBay
( MSLMB           NUMBER          NOT NULL
, HangSX          VARCHAR2(10)    NOT NULL
, ModelMayBay     VARCHAR2(10)    NOT NULL
, SoGheVip        NUMBER          NOT NULL
, SoGhePT         NUMBER          NOT NULL
, TongSoGhe       NUMBER          NOT NULL
, PRIMARY KEY (MSLMB));

------------Table No10------------
CREATE TABLE GheNgoi
( MSG             NUMBER          NOT NULL
, GheSo           VARCHAR2(3)     NOT NULL
, LoaiGhe         VARCHAR2(3)     NOT NULL
, MSLMB           NUMBER          NOT NULL
, PRIMARY KEY (MSG));

------------Table No11------------
CREATE TABLE TuyenBay
( MSTB            NUMBER          NOT NULL
, MSG_Di          NUMBER          NOT NULL
, MSG_Den         NUMBER          NOT NULL
, PRIMARY KEY (MSTB));

------------Table No12------------
CREATE TABLE Ga
( MSG             NUMBER          NOT NULL
, TenSB           VARCHAR2(20)    NOT NULL
, ThanhPho        VARCHAR2(20)    NOT NULL
, QuocGia         VARCHAR2(20)    NOT NULL
, PRIMARY KEY (MSG));
 
------------Table No13------------
CREATE TABLE ThucPham
( MSTP            NUMBER          NOT NULL
, Ten             VARCHAR2(20)    NOT NULL      UNIQUE
, MoTa            VARCHAR2(60)
, PRIMARY KEY (MSTP));

------------Table No14------------
CREATE TABLE GiaThucPham
( MSGTP           NUMBER          NOT NULL
, Gia             NUMBER          NOT NULL
, NgayApDung      DATE            NOT NULL
, MSTP            NUMBER          NOT NULL
, PRIMARY KEY (MSGTP));

------------Table No15------------
CREATE TABLE ChuyenBayThucPham
( MSCB            VARCHAR2(9)     NOT NULL
, MSTP            NUMBER          NOt NULL
, PRIMARY KEY (MSCB, MSTP));

------------Table No16------------
CREATE TABLE NhanVien
( MSNV            VARCHAR2(12)    NOT NULL
, HoTen           VARCHAR2(30)    NOT NULL
, NgaySinh        DATE            NOT NULL
, GioiTinh        VARCHAR2(3)     NOT NULL
, QuocTich        VARCHAR2(20)    NOT NULL
, CMND            VARCHAR2(9)     NOT NULL      UNIQUE
, Passport        VARCHAR2(8)
, NgayVaoLam      DATE            NOT NULL
, DiaChi          VARCHAR2(60)    NOT NULL
, SoDT            VARCHAR2(13)    NOT NULL
, TienLuong       NUMBER          NOT NULL
, PRIMARY KEY (MSNV));

------------Table No17------------
CREATE TABLE BangCap
( MSBC            NUMBER          NOT NULL
, TenBangCap      VARCHAR2(20)    NOT NULL
, TruongDaoTao    VARCHAR2(20)    NOT NULL
, NamDat          VARCHAR2(4)     NOT NULL
, MSNV            VARCHAR2(12)    NOT NULL
, PRIMARY KEY (MSBC));

------------Table No18------------
CREATE TABLE PhiCong
( MSNV            VARCHAR2(12)    NOT NULL
, LoaiPhiCong     VARCHAR2(2)     NOT NULL
, PRIMARY KEY (MSNV));

------------Table No19------------
CREATE TABLE TiepVien
( MSNV            VARCHAR2(12)    NOT NULL
, NgoaiNguTT      VARCHAR2(20)    NOT NULL
, PRIMARY KEY (MSNV));

------------Table No20------------
CREATE TABLE ChiNhanh
( MSCN            NUMBER          NOT NULL
, TenChiNhanh     VARCHAR2(20)    NOT NULL
, ThanhPho        VARCHAR2(20)    NOT NULL
, QuocGia         VARCHAR2(20)    NOT NULL
, PRIMARY KEY (MSCN));

------------Table No21------------
CREATE TABLE CaLamViec
( MSCLV           VARCHAR2(2)     NOT NULL
, TuGio           VARCHAR2(5)     NOT NULL
, DenGio          VARCHAR2(5)     NOT NULL
, PRIMARY KEY (MSCLV));

------------Table No22------------
CREATE TABLE NhanVienMD
( MSNV            VARCHAR2(12)    NOT NULL
, MSCN            NUMBER          NOT NULL
, MSNV_Truong     VARCHAR2(12)    NOT NULL
, PRIMARY KEY (MSNV));

------------Table No23------------
CREATE TABLE NVMatDat_CaLV
( MSNV            VARCHAR2(12)    NOT NULL
, MSCLV           VARCHAR2(2)     NOT NULL
, NgayBatDau      DATE            NOT NULL
, PRIMARY KEY (MSNV, MSCLV));

------------Table No24------------
CREATE TABLE VanHanh
( MSNV            VARCHAR2(12)    NOT NULL
, MSCB            VARCHAR2(9)     NOT NULL
, PRIMARY KEY (MSNV, MSCB));

------------Table No25------------
CREATE TABLE Lai
( MSNV            VARCHAR(12)     NOT NULL
, MSLMB           NUMBER          NOT NULL
, PRIMARY KEY (MSNV, MSLMB));

------------Table No26------------
CREATE TABLE KiemTra
( MSNV            VARCHAR2(12)    NOT NULL
, MSCB            VARCHAR2(9)     NOT NULL
, PRIMARY KEY (MSNV, MSCB));

------------Table No27------------
CREATE TABLE ChuyenMonBD
( MSNV            VARCHAR(12)     NOT NULL
, MSLMB           NUMBER          NOT NULL
, PRIMARY KEY (MSNV, MSLMB));