/* Sequence */
Create Sequence KhachHang_Seq1
Start with 1
Increment by 1;

Create Sequence KhachHang_Seq2
Start with 1
Increment by 1;

Create Sequence TrangThaiTG_Seq
Start with 1
Increment by 1;

Create Sequence PhiVCHH_Seq
Start with 1
increment by 1;

Create Sequence LoaiMayBay_Seq
Start with 1
increment by 1;

Create Sequence GheNgoi_Seq
Start with 1
increment by 1;

Create Sequence TuyenBay_Seq
Start with 1
increment by 1;

Create Sequence Ga_Seq
Start with 1
increment by 1;

Create Sequence ThucPham_Seq
Start with 1
increment by 1;

Create Sequence GiaThucPham_Seq
Start with 1
increment by 1;

Create Sequence NhanVien_Seq1
Start with 1
increment by 1;

Create Sequence NhanVien_Seq2
Start with 1
increment by 1;

Create Sequence NhanVien_Seq3
Start with 1
increment by 1;

Create Sequence NhanVien_Seq4
Start with 1
increment by 1;

Create Sequence NhanVien_Seq5
Start with 1
increment by 1;

Create Sequence BangCap_Seq
Start with 1
increment by 1;

Create Sequence ChiNhanh_Seq
Start with 1
increment by 1;

/* Trigger */
Create Or Replace Trigger KhachHang_Trg
Before Insert Or Update of MSKH on KhachHang
For Each Row
Begin
  if :new.MSKH = 'NL' then
    select :new.MSKH || Lpad( KhachHang_Seq1.NextVal, 10, '0')
    into :new.MSKH
    from DUAL;  
  elsif :new.MSKH = 'TE' then
    select :new.MSKH || Lpad( KhachHang_Seq2.NextVal, 10, '0')
    into :new.MSKH
    from DUAL; 
  else
    Raise_application_error( -20011, 'Nhap sai MSKH. Nhap lai.');
  End if;
End;
/

Create Or Replace Trigger TrangThaiTG_Trg
Before Insert Or Update of MSTTTG on TrangThaiTG
For Each Row
Begin
  :new.MSTTTG := TrangThaiTG_Seq.NextVal;
End;
/

Create Or Replace Trigger PhiVCHH_Trg
Before Insert Or Update of MSPHH on PhiVCHH
For Each Row
Begin
  :new.MSPHH := PhiVCHH_Seq.NextVal;
End;
/

Create Or Replace Trigger LoaiMayBay_Trg
Before Insert Or Update of MSLMB on LoaiMayBay
For Each Row
Begin
  :new.MSLMB := LoaiMayBay_Seq.NextVal;
End;
/

Create Or Replace Trigger GheNgoi_Trg
Before Insert Or Update of MSG on GheNgoi
For Each Row
Begin
  :new.MSG := GheNgoi_Seq.NextVal;
End;
/

Create Or Replace Trigger TuyenBay_Trg
Before Insert Or Update of MSTB on TuyenBay
For Each Row
Begin
  :new.MSTB := TuyenBay_Seq.NextVal;
End;
/

Create Or Replace Trigger Ga_Trg
Before Insert Or Update of MSG on Ga
For Each Row
Begin
  :new.MSG := Ga_Seq.NextVal;
End;
/

Create Or Replace Trigger ThucPham_Trg
Before Insert Or Update of MSTP on ThucPham
For Each Row
Begin
  :new.MSTP := ThucPham_Seq.NextVal;
End;
/

Create Or Replace Trigger GiaThucPham_Trg
Before Insert Or Update of MSGTP on GiaThucPham
For Each Row
Begin
  :new.MSGTP := GiaThucPham_Seq.NextVal;
End;
/

Create Or Replace Trigger GheNgoi_Trg
Before Insert Or Update of MSG on GheNgoi
For Each Row
Begin
  :new.MSG := GheNgoi_Seq.NextVal;
End;
/

Create Or Replace Trigger NhanVien_Trg
Before Insert Or Update of MSNV on NhanVien
For Each Row
Begin
  if :new.MSNV = 'PC' then
    select :new.MSNV || Lpad( NhanVien_Seq1.NextVal, 10, '0')
    into :new.MSNV
    from DUAL;
  elsif :new.MSNV = 'TV' then
    select :new.MSNV || Lpad( NhanVien_Seq2.NextVal, 10, '0')
    into :new.MSNV
    from DUAL;
  elsif :new.MSNV = 'KT' then
    select :new.MSNV || Lpad( NhanVien_Seq3.NextVal, 10, '0')
    into :new.MSNV
    from DUAL;
  elsif :new.MSNV = 'DH' then
    select :new.MSNV || Lpad( NhanVien_Seq4.NextVal, 10, '0')
    into :new.MSNV
    from DUAL;
  elsif :new.MSNV = 'KS' then
    select :new.MSNV || Lpad( NhanVien_Seq5.NextVal, 10, '0')
    into :new.MSNV
    from DUAL;
  else
    Raise_application_error( -20011, 'Nhap sai MSNV. Nhap lai.');
  End if;
End;
/

Create Or Replace Trigger BangCap_Trg
Before Insert Or Update of MSBC on BangCap
For Each Row
Begin
  :new.MSBC := BangCap_Seq.NextVal;
End;
/

Create Or Replace Trigger ChiNhanh_Trg
Before Insert Or Update of MSCN on ChiNhanh
For Each Row
Begin
  :new.MSCN := ChiNhanh_Seq.NextVal;
End;
/

Create Or Replace Trigger check_TongGhe_LoaiMayBay
Before Insert Or Update of TongSoGhe on LoaiMayBay
For Each Row
Begin  
  :new.TongSoGhe := :new.SoGheVip + :new.SoGhePT;  
End;
/