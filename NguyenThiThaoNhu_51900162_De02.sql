CREATE DATABASE BTL_QuanLyStudio
USE BTL_QuanLyStudio

-- Bảng 1
create table NhanVien(
	MSNV varchar(50) check	 (MSNV like 'SA[0-9][0-9][0-9]'
						or  MSNV like 'PG[0-9][0-9][0-9]'
						or  MSNV like 'SL[0-9][0-9][0-9]'
						or  MSNV like 'TP[0-9][0-9][0-9]'
						or  MSNV like 'TD[0-9][0-9][0-9]'
						or  MSNV like 'VP[0-9][0-9][0-9]'),
	HoTen nvarchar(80),
	NgaySinh date,
	GioiTinh nvarchar(10),
	CMND varchar(9) unique not null,
	DiaChi nvarchar(100),
	Email varchar(50),
	primary key (MSNV)
)
---...//
set dateformat DMY
insert into NhanVien values
('SA001','Nguyen Tran Minh Hoa','4/2/2001','Nữ','123456789','TPHCM','hoatran@gmail.com')
insert into NhanVien values
('SA002','Nguyen Tran Minh Hau','4/1/2001','Nam','123456799','TPHCM','conghau@gmail.com')
insert into NhanVien values
('SA003','Nguyen Thi Tan','4/7/2001','Nu','133456799','TPHCM','tanthi@gmail.com')
insert into NhanVien values
('SA004','Nguyen Kim Huong','2/7/2001','Nu','133456199','TPHCM','huongkim@gmail.com')
insert into NhanVien values
('PG001','Nguyen Thi Kieu','5/07/2001','Nữ','123457799','Cao Lãnh','kieuthi@gmail.com')
insert into NhanVien values
('PG002','Hoang Nhat Tan','9/07/2001','Nam','123477799','Cao Lãnh','tanhoang@gmail.com')
insert into NhanVien values
('PG003','Nguyen Van Kieu','5/7/2001','Nam','123457789','Cao Lãnh','kieuvan@gmail.com')
insert into NhanVien values
('PG004','Hoang Hoang Tuan','12/10/2001','Nam','12347799','Vung Tau','tanhoang@gmail.com')
insert into NhanVien values
('SL001','Nguyen Nhat Bang','6/1/1968','Nữ','124459999','Đồng Tháp','bangvo@gmail.com')
insert into NhanVien values
('SL002','Nguyen Thi Bang','6/1/1968','Nữ','122459919','Huế','bangthi@gmail.com')
insert into NhanVien values
('SL003','Tran Thi Bang','6/11/1968','Nữ','124458999','Đồng Tháp','bangtran@gmail.com')
insert into NhanVien values
('SL004','Tran Van Hau','6/3/1968','Nam','121459919','Huế','hauvan@gmail.com')
insert into NhanVien values
('TP001','Nguyen N','6/6/1968','Nam','123455999','Lâm Đồng','nnguyen@gmail.com')
insert into NhanVien values
('TP002','Nguyen T','6/8/1968','Nữ','123442959','TPHCM','tnguyen@gmail.com')
insert into NhanVien values
('TP003','Nguyen Van K','5/12/1968','Nam','123452999','Lâm Đồng','nnguyenK@gmail.com')
insert into NhanVien values
('TP004','Nguyen T','6/12/1968','Nữ','123456959','TPHCM','tnguyen@gmail.com')
insert into NhanVien values
('TD001','Nguyen Thi Linh','6/1/2001','Nu','123455939','Vinh Long','nnguyenlinh@gmail.com')
insert into NhanVien values
('TD002','Nguyen Thi Tam','6/2/1968','Nu','123146959','Tien Giang','tnguyentam@gmail.com')
insert into NhanVien values
('TD003','Nguyen Van Kieu','5/12/1968','Nam','123452919','Lâm Đồng','nnguyenKieu@gmail.com')
insert into NhanVien values
('TD004','Tran Dan','6/1/1967','Nu','123456989','TPHCM','trandan@gmail.com')
insert into NhanVien values
('VP001','Nguyen K','5/5/1968','Nam','122446899','TPHCM','knguyen@gmail.com')
insert into NhanVien values
('VP002','Nguyen L','5/9/1968','Nữ','122446979','TPHCM','lnguyen@gmail.com')
insert into NhanVien values
('VP003','Nguyen Bang','3/2/1968','Nam','121446899','TPHCM','knguyenbang@gmail.com')
insert into NhanVien values
('VP004','Nguyen Long','5/9/1968','Nữ','122446779','TPHCM','lnguyen@gmail.com')
--drop table NhanVien
--Bảng 2, xem lại check sdt
create table DienThoaiNV(
	MSNV int identity(1,1),
	DienThoai char(20) check (DienThoai like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	primary key(MSNV,DienThoai)
)
insert into DienThoaiNV values
('+84234567823')
insert into DienThoaiNV values
('+84345678834')
insert into DienThoaiNV values
('+84234567843')
insert into DienThoaiNV values
('+84234561122')
--drop table DienThoaiNV
--Bảng 3
create table ThoSuaAnh(
	MS_ThoSuaAnh varchar(50),
	primary key(MS_ThoSuaAnh)
)
--Tạo khóa ngoại MS_ThoSuaAnh đến NhanVien(MSNV)
alter table ThoSuaAnh
add constraint fk_ThoSuaAnh foreign key (MS_ThoSuaAnh) references NhanVien(MSNV)

insert into ThoSuaAnh values
('SA001')
insert into ThoSuaAnh values
('SA002')
insert into ThoSuaAnh values
('SA003')
insert into ThoSuaAnh values
('SA004')
--Bảng 4
create table Photographer_ChupKiSu(
	MS_PhotographerKiSu varchar(50),
	KienThucPS int check (KienThucPS in (0,1)),
	KinhNghiem int,
	primary key(MS_PhotographerKiSu)
)
-- Tạo khóa ngoại MS_PhotographerKiSu đến Nhanvien(MSNV)
alter table Photographer_ChupKiSu
add constraint fk_MsPhotoKiSu foreign key(MS_PhotographerKiSu) references NhanVien(MSNV)

insert into Photographer_ChupKiSu values
('PG001',1,5)
insert into Photographer_ChupKiSu values
('PG002',0,2)
insert into Photographer_ChupKiSu values
('PG003',1,1)
insert into Photographer_ChupKiSu values
('PG004',0,3)
-- Bảng 5
create table Photographer_ChupAlbumCuoi(
	MS_PhotographerAlbum varchar(50),
	KienThucPS int check (KienThucPS in (0,1)),
	KinhNghiem int,
	primary key(MS_PhotographerAlbum)
)
-- Tạo khóa ngoại MS_PhotographerAlbum đến Nhanvien(MSNV)
alter table Photographer_ChupAlbumCuoi
add constraint fk_MsPhotoAlbum foreign key(MS_PhotographerAlbum) references NhanVien(MSNV)

insert into Photographer_ChupAlbumCuoi values
('PG001',1,5)
insert into Photographer_ChupAlbumCuoi values
('PG002',0,2)
insert into Photographer_ChupAlbumCuoi values
('PG003',1,5)
insert into Photographer_ChupAlbumCuoi values
('PG004',0,2)
-- Bảng 6
create table Stylist(
	MS_Stylist varchar(50),
	primary key(MS_Stylist)
)
-- Tạo khóa ngoại MS_Stylist đến Nhanvien(MSNV)
alter table Stylist
add constraint fk_Stylist foreign key(MS_Stylist) references NhanVien(MSNV)

insert into Stylist values
('SL001')
insert into Stylist values
('SL002')
insert into Stylist values
('SL003')
insert into Stylist values
('SL004')
-- Bảng 7
create table ThoPhu(
	MS_ThoPhu varchar(50),
	primary key(MS_ThoPhu)
)
--drop table ThoPhu
-- Tạo khóa ngoại ThoPhu đến Nhanvien(MSNV)
alter table ThoPhu
add constraint fk_MSThoPhu foreign key(MS_ThoPhu) references NhanVien(MSNV)

insert into ThoPhu values
('TP001')
insert into ThoPhu values
('TP002')
insert into ThoPhu values
('TP003')
insert into ThoPhu values
('TP004')
-- Bảng 8
create table CVTrangDiem(
	MS_CVTrangDiem varchar(50),
	GiaCoDau float,
	GiaNguoiNha float,
	primary key(MS_CVTrangDiem)
)
-- Tạo khóa ngoại MSCVTD đến NhanVien(MSNV)
alter table CVTrangDiem
add constraint fk_MSCVTrangDiem foreign key(MS_CVTrangDiem) references NhanVien(MSNV)

insert into CVTrangDiem values
('TD002',15200000,1100000)
insert into CVTrangDiem values
('TD001',1100000,1000000)
insert into CVTrangDiem values
('TD003',25200000,1500000)
insert into CVTrangDiem values
('TD004',1200000,1100000)
--Bảng 9
create table PhongCach_CVTrangDiem(
	MS_CVTrangDiem varchar(50),
	PhongCach nvarchar(50),
	primary key(MS_CVTrangDiem,PhongCach)
)
-- Tạo khóa ngoại
alter table PhongCach_CVTrangDiem
add constraint fk_CVTrangDiem foreign key(MS_CVTrangDiem) references CVTrangDiem(MS_CVTrangDiem)

insert into PhongCach_CVTrangDiem values
('TD002','Đám tiệc')
insert into PhongCach_CVTrangDiem values
('TD001','Hóa trang')
insert into PhongCach_CVTrangDiem values
('TD003','Đám tiệc')
insert into PhongCach_CVTrangDiem values
('TD004','Hóa trang')

--Bảng 10
create table NVVanPhong(
	MS_VanPhong varchar(50),
	ViTri nvarchar(50),
	KiNang nvarchar(50),
	primary key(MS_VanPhong)
)
-- Tạo khóa ngoại
alter table NVVanPhong
add constraint fk_MSVanPhong foreign key(MS_VanPhong) references NhanVien(MSNV)

insert into NVVanPhong values
('VP001','Hành chính','Viết')
insert into NVVanPhong values
('VP002','Hành chính','Giao tiếp')
insert into NVVanPhong values
('VP003','Nhân sự','Quản trị')
insert into NVVanPhong values
('VP004','Nhân sự','thống kê')
--drop table NVVanPhong
--Bảng 11
create function IND_MSKH()
returns varchar(50)
as
	begin
		declare @SL int
		set @SL = (select count(*) from KhachHang)
		declare @MSKH varchar(50)
		set @MSKH = 'KH' + cast(@SL +1 as char)
		return @MSKH
end
--drop function AUTO_MSKH
--drop table KhachHang
create table KhachHang
(
	MSKH varchar(50) default DBO.IND_MSKH(),
	DiaChi nvarchar(100),
	NgayCuoi date not null check(NgayCuoi > getdate()),
	HoTenCR nvarchar(50) not null,
	NgaySinhCR date,
	DienThoaiCR char(20) check (DienThoaiCR like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	EmailCR varchar(100) check (EmailCR like '%@%.%'),
	HoTenCD nvarchar(50) not null,
	NgaySinhCD date,
	DienThoaiCD char(20) check (DienThoaiCD like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	EmailCD varchar(100) check (EmailCD like '%@%.%'),
	primary key(MSKH)
)
set dateformat DMY
insert into KhachHang(DiaChi,NgayCuoi,HoTenCR,NgaySinhCR,DienThoaiCR,EmailCR,HoTenCD,NgaySinhCD,DienThoaiCD,EmailCD) values
(N'Thành phố HCM','5/5/2021',N'Nguyen Hung','3/2/1996','+84234561122','hungnguyen@gmail.com',N'Nguyen Ngoc','3/2/1996','+84234561122','ngocnguyen@gmail.com')
insert into KhachHang(DiaChi,NgayCuoi,HoTenCR,NgaySinhCR,DienThoaiCR,EmailCR,HoTenCD,NgaySinhCD,DienThoaiCD,EmailCD) values
(N'Hà Nội','5/9/2021',N'Tran Cong Hau','3/2/1996','+84234561121','haunguyen@gmail.com',N'Ngo Tien Dat','3/1/1996','+84234561122','datnguyen@gmail.com')
insert into KhachHang(DiaChi,NgayCuoi,HoTenCR,NgaySinhCR,DienThoaiCR,EmailCR,HoTenCD,NgaySinhCD,DienThoaiCD,EmailCD) values
(N'Thanh Hóa','5/5/2021',N'Trần Thị Kiều','3/2/1996','+84234561122','kieutran@gmail.com',N'Nguyen Long','1/12/1996','+84234561122','longnguyen@gmail.com')
insert into KhachHang(DiaChi,NgayCuoi,HoTenCR,NgaySinhCR,DienThoaiCR,EmailCR,HoTenCD,NgaySinhCD,DienThoaiCD,EmailCD) values
(N'Quảng trị','5/5/2021',N'Minh Hoa','3/12/1996','+84234561122','hoanguyen@gmail.com',N'Nguyen Minh','3/12/1991','+84234561122','minhnguyen@gmail.com')

--drop table KhachHang

--drop table KhachHang
-- Tạo ràng buộc kiểm tra số điện thoại
alter table KhachHang 
add constraint Check_SDT check ((DienThoaiCR is not null and DienThoaiCD is not null) or (DienThoaiCR is not null and DienThoaiCD is null) or (DienThoaiCR is null and DienThoaiCD is not null))

-- Tạo ràng buộc kiểm tra email
alter table KhachHang 
add constraint Check_email check ((EmailCR is not null and EmailCD is not null) or (EmailCR is not null and EmailCD is null) or (EmailCR is null and EmailCD is not null))


--Bảng 12
create function IND_HD()
returns varchar(50)
as
	begin
		declare @SL int
		set @SL = (select count(*) from HopDong)
		declare @MSHD varchar(10)
		set @MSHD = 'HD' + cast(@SL +1 as char)
		return @MSHD
end
--drop function AUTO_HD
--drop table HopDong
create table HopDong(
	MSHD varchar(10) default DBO.IND_HD(),
	ThoiDiemKi date not null,
	TongGia float,
	MSKH varchar(50),
	MS_VanPhong varchar(50),
	primary key (MSHD)
)
set dateformat DMY
insert into HopDong(ThoiDiemKi,TongGia,MSKH,MS_VanPhong) values
('5/12/2021',0,'KH1','VP001')
insert into HopDong(ThoiDiemKi,TongGia,MSKH,MS_VanPhong) values
('5/11/2021',0,'KH2','VP002')
insert into HopDong (ThoiDiemKi,TongGia,MSKH,MS_VanPhong)values
('8/11/2021',0,'KH3','VP003')
insert into HopDong (ThoiDiemKi,TongGia,MSKH,MS_VanPhong)values
('12/12/2021',0,'KH4','VP004')
--drop table HopDong
-- Tạo khóa ngoại
alter table HopDong
add constraint fk_MSVP foreign key(MS_VanPhong) references NVVanPhong(MS_VanPhong)

-- Thủ tục tổng giá trị hợp đồng
create proc TONGGIA(@MSHD varchar(20))
as
begin
	declare @TongGia1 int
	declare @TongGia2 int
	declare @TongGia3 int
	set @TongGia1 = (select TongGia from DVAlbumCuoi where MSHD = @MSHD)
	set @TongGia2 = (select TongGia from DVVayCuoi where MSHD = @MSHD)
	set @TongGia3 = (select TongGia from DVNgayCuoi where MSHD = @MSHD)
	update HopDong 
	set TongGia = @TongGia1 + @TongGia2 + @TongGia3
	where MSHD = @MSHD
end
exec TONGGIA 'HD1'
exec TONGGIA 'HD2'
exec TONGGIA 'HD3'
exec TONGGIA 'HD4'

--drop proc TONGGIA
alter table HopDong
add constraint fk_MSHD foreign key(MSKH) references KhachHang(MSKH)
-- Bảng 13
create table HopDong_LanThanhToan(
	MSHD varchar(10),
	primary key (MSHD),
	ThoiDiem date check(ThoiDiem > getdate()),
	SoTien float
)
insert into HopDong_LanThanhToan values
('HD1','8/12/2022',2200000)
insert into HopDong_LanThanhToan values
('HD2','9/12/2022',2100000)
insert into HopDong_LanThanhToan values
('HD3','1/12/2022',2300000)
insert into HopDong_LanThanhToan values
('HD4','2/12/2022',2400000)
--Tạo khóa ngoại
alter table HopDong_LanThanhToan
add constraint fk_MSHD_LanThanhToan foreign key(MSHD) references HopDong(MSHD)
-- bảng 14
create function IND_DVAlbum()
returns varchar(50)
as
	begin
		declare @SL int
		set @SL = (select count(*) from DVAlbumCuoi)
		declare @MSDVAlbum varchar(10)
		set @MSDVAlbum = 'DVA' + cast(@SL +1 as char)
		return @MSDVAlbum
end

create table DVAlbumCuoi(
	MSDVAlbum varchar(10)default DBO.IND_DVAlbum(),
	MSHD varchar(10),
	MS_PhotographerAlbum varchar(50),
	MS_Stylist varchar(50),
	MS_ThoPhu varchar(50),
	MS_CVTrangDiem varchar(50),
	MSVest1 varchar(10) ,
	MSVest2 varchar(10) ,
	TongGia float,
	primary key(MSDVAlbum)
)
--drop table DVAlbumCuoi
--Tạo khóa ngoại
alter table DVAlbumCuoi
add constraint fk_MSHD_DVA foreign key(MSHD) references HopDong(MSHD)

--alter table DVAlbumCuoi
--drop constraint fk_MSHD_DVA

alter table DVAlbumCuoi 
add constraint fk_MStylist foreign key(MS_Stylist) references Stylist(MS_Stylist)

--alter table DVAlbumCuoi 
--drop constraint fk_MStylist

alter table DVAlbumCuoi 
add constraint fk_MSThoPhu_DVA foreign key(MS_ThoPhu) references ThoPhu(MS_ThoPhu)

--alter table DVAlbumCuoi 
--drop constraint fk_MSThoPhu_DVA

alter table DVAlbumCuoi 
add constraint fk_MSCVTrangDiem_DVA foreign key(MS_CVTrangDiem) references CVTrangDiem(MS_CVTrangDiem)

--alter table DVAlbumCuoi 
--drop constraint fk_MSCVTrangDiem_DVA

alter table DVAlbumCuoi 
add constraint fk_MSPhoAlbum_DVA foreign key(MS_PhotographerAlbum) references Photographer_ChupAlbumCuoi(MS_PhotographerAlbum)
---....//..

insert into DVAlbumCuoi (MSHD,MS_PhotographerAlbum,MS_Stylist,MS_ThoPhu,MS_CVTrangDiem,MSVest1,MSVest2,TongGia) values 
('HD1','PG001','SL001','TP001','TD001','V01','V02',2000000)
insert into DVAlbumCuoi(MSHD,MS_PhotographerAlbum,MS_Stylist,MS_ThoPhu,MS_CVTrangDiem,MSVest1,MSVest2,TongGia) values 
('HD2','PG002','SL002','TP001','TD002','V04','V01',2500000)
insert into DVAlbumCuoi(MSHD,MS_PhotographerAlbum,MS_Stylist,MS_ThoPhu,MS_CVTrangDiem,MSVest1,MSVest2,TongGia) values 
('HD3','PG003','SL003','TP003','TD003','V02','V04',3000000)
insert into DVAlbumCuoi(MSHD,MS_PhotographerAlbum,MS_Stylist,MS_ThoPhu,MS_CVTrangDiem,MSVest1,MSVest2,TongGia) values 
('HD4','PG004','SL004','TP004','TD004','V01','V03',1500000)


-- Bảng 15

create function IND_AoVest()
returns varchar(10)
as
	begin
		declare @SL int
		set @SL = (select count(*) from AoVest)
		declare @MSVest varchar(10)
		set @MSVest = 'Ve' + cast(@SL +1 as char)
		return @MSVest
end
--drop function IND_AoVest
--drop table AoVest

create table AoVest(
	MSVest varchar(10) default DBO.IND_AoVest(),
	Kieu nvarchar(20),
	Mau nvarchar(20),
	KichCo char(5) not null check (KichCo in('XS','S','M','L','XL','XXL')),
	SoLuong int default(0),
	GiaThue float,
	primary key(MSVest)
)
--drop table AoVest
insert into AoVest(Kieu,Mau,KichCo,SoLuong,GiaThue) values
('cổ điển','đen','XS',8,500000)
insert into AoVest(Kieu,Mau,KichCo,SoLuong,GiaThue)  values
('hiện đại','đen','S',3,550000)
insert into AoVest(Kieu,Mau,KichCo,SoLuong,GiaThue)  values
('lolita',N'trắng','M',5,530000)
insert into AoVest(Kieu,Mau,KichCo,SoLuong,GiaThue) values
('cổ điển',N'xám','L',5,580000)
-- Bảng 16
create function IND_DaoCu()
returns varchar(50)
as
	begin
		declare @SL int
		set @SL = (select count(*) from DaoCu)
		declare @MSDC varchar(10)
		set @MSDC = 'DC' + cast(@SL +1 as char)
		return @MSDC
end

--drop function AUTO_DaoCu
--drop table DaoCu

create table DaoCu(
	MSDC varchar(10) default DBO.IND_DaoCu(),
	SoLuong int default(0),
	primary key(MSDC)
)
insert into DaoCu (SoLuong) values
(3)
insert into DaoCu (SoLuong) values
(5)
insert into DaoCu (SoLuong) values
(8)
insert into DaoCu (SoLuong) values
(9)
--Bảng 17	
create table DVAlbum_DaoCu(
	MSDVAlbum varchar(10),
	MSDC varchar(10),
	primary key(MSDVAlbum,MSDC)
)
--Tạo khóa ngoại
alter table DVAlbum_DaoCu
add constraint fk_MSDVA_DC foreign key(MSDVAlbum) references DVAlbumCuoi(MSDVAlbum)

alter table DVAlbum_DaoCu
add constraint fk_MSDC_DC foreign key(MSDC) references DaoCu(MSDC)
--....//..
insert into DVAlbum_DaoCu values
('DVA1','DC1')
insert into DVAlbum_DaoCu values
('DVA2','DC2')
insert into DVAlbum_DaoCu values
('DVA3','DC3')
insert into DVAlbum_DaoCu values
('DVA4','DC4')

--Tạo bảng 18
create function IND_DiaDiem()
returns varchar(10)
as
	begin
		declare @SL int
		set @SL = (select count(*) from DiaDiem)
		declare @MSDD varchar(10)
		set @MSDD = 'DD' + cast(@SL +1 as char)
		return @MSDD
end

--drop table DiaDiem
--drop function IND_DiaDiem

create table DiaDiem(
	MSDD varchar(10) default DBO.IND_DiaDiem(),
	Ten nvarchar(50) unique not null,
	Gia float,
	ViTri nvarchar(50),
	TongThoiGianChup varchar(50),
	GiaBoSung float,
	primary key(MSDD)
)

insert into DiaDiem (Ten,Gia,ViTri,TongThoiGianChup,GiaBoSung) values
('TPHCM','1500000','Công Viên','1 ngay',700000)
insert into DiaDiem (Ten,Gia,ViTri,TongThoiGianChup,GiaBoSung) values
('Tien Giang',1510000,'Công Viên','2 ngay',200000)
insert into DiaDiem (Ten,Gia,ViTri,TongThoiGianChup,GiaBoSung) values
('Vung Tau',1520000,'Công Viên','15 ngay',500000)
insert into DiaDiem (Ten,Gia,ViTri,TongThoiGianChup,GiaBoSung) values
('Cao Lanh',1530000,'Công Viên','05 ngay',500000)
-- Tạo bảng 19
create table DVAlbum_DiaDiem(
	MSDVAlbum varchar(10),
	MSDD varchar(10),
	ThoiDiemChup date,
	primary key(MSDVAlbum,MSDD)
)
--..//..
set dateformat DMY
insert into DVAlbum_DiaDiem values
('DVA1','DD1','7/10/2021')
insert into DVAlbum_DiaDiem values
('DVA2','DD2','8/3/2021')
insert into DVAlbum_DiaDiem values
('DVA3','DD3','9/3/2021')
insert into DVAlbum_DiaDiem values
('DVA4','DD4','10/4/2021')
--...
alter table DVAlbum_DiaDiem
add constraint fk_MSDVA_DD foreign key(MSDVAlbum) references DVAlbumCuoi(MSDVAlbum)

alter table DVAlbum_DiaDiem
add constraint fk_MSDD_DD foreign key(MSDD) references DiaDiem(MSDD)

--Tạo bảng 20
create table GocChup(
	MSDD varchar(10),
	TenGocChup nvarchar(50),
	primary key(MSDD,TenGocChup)
)

insert into GocChup values
('DD1','Sông')
insert into GocChup values
('DD2','Núi lửa')
insert into GocChup values
('DD3','Hồ Thủy Điện')
insert into GocChup values
('DD4','Thung Lũng')

alter table GocChup
add constraint fk_MSDD_GC foreign key(MSDD) references DiaDiem(MSDD)

--Tạo bảng 21
create table DV_Goc_Vay(
	MSDVAlbum varchar(10),
	MSDD varchar(10),
	TenGocChup nvarchar(50),
	MSVChup varchar(10),
	GocBoSung int check(GocBoSung in (0,1)),
	primary key(MSDD,TenGocChup,MSDVAlbum)
)
---...
--drop table DV_Goc_Vay
alter table DV_Goc_Vay
add constraint fk_MSDV_GV foreign key(MSDVAlbum) references DVAlbumCuoi(MSDVAlbum)

alter table DV_Goc_Vay
add constraint fk_MSDD_GV foreign key(MSDD) references DiaDiem(MSDD)

alter table DV_Goc_Vay
add constraint fk_TenGocChup_GV foreign key(MSDD,TenGocChup) references GocChup(MSDD,TenGocChup)
--...//...
alter table DV_Goc_Vay
add constraint fk_MSVChup_GV foreign key(MSVChup) references VayChupHinh(MSVChup)
--...//..
insert into DV_Goc_Vay values
('DVA1','DD1',N'Sông','Va1',0)
insert into DV_Goc_Vay values
('DVA2','DD2','Núi lửa','Va2',1)	
insert into DV_Goc_Vay values
('DVA3','DD3','Hồ Thủy Điện','Va3',1)
insert into DV_Goc_Vay values
('DVA4','DD4','Thung Lũng','Va4',1)
-- Tạo bảng 22

create function IND_Vay()
returns varchar(10)
as
	begin
		declare @SL int
		set @SL = (select count(*) from Vay)
		declare @MSV varchar(10)
		set @MSV = 'Va' + cast(@SL +1 as char)
		return @MSV
end

--drop table Vay
--drop function AUTO_Vay

create table Vay(
	MSV varchar(10) default DBO.IND_Vay(),
	Ten nvarchar(50),
	Kieu nvarchar(50),
	HinhAnh varchar(100),
	Mau nvarchar(20),
	ChatLieu nvarchar(50),
	NguonGoc nvarchar(50),
	TinhTrang char(1) check (TinhTrang in ('B','T','K','U')),
	primary key(MSV)
)
insert into Vay (Ten,Kieu,HinhAnh,Mau,ChatLieu,NguonGoc,TinhTrang) values
('Đồ cưới','Suong','jjjjjjjjjjppppppppgggggg',N'Trắng','Ren','Korea','B')
insert into Vay (Ten,Kieu,HinhAnh,Mau,ChatLieu,NguonGoc,TinhTrang)values
('Đồ cưới',N'Xòe','jjjjjjjjjjppppppppgggggg',N'Hồng','Nhung','Viet Nam','T')
insert into Vay (Ten,Kieu,HinhAnh,Mau,ChatLieu,NguonGoc,TinhTrang)values
('Đồ cưới','Suông','jjjjjjjjjjppppppppgggggg',N'Tím','Ren','Korea','U')
insert into Vay(Ten,Kieu,HinhAnh,Mau,ChatLieu,NguonGoc,TinhTrang) values
('Đồ cưới',N'Xòe','jjjjjjjjjjppppppppgggggg',N'Vàng',N'Lụa','Canada','K')

--drop table Vay
--Tạo bảng 23
create table VayChupHinh(
	MSVChup varchar(10),
	primary key(MSVChup)
)
alter table VayChupHinh
add constraint fk_MSVChup_VCH foreign key(MSVChup) references Vay(MSV)

--alter table VayChupHinh
--drop constraint fk_MSVChup_VCH 

insert into VayChupHinh values
('Va1')
insert into VayChupHinh values
('Va2')
insert into VayChupHinh values
('Va3')
insert into VayChupHinh values
('Va4')
-- Tạo bảng 24
create table VayNgayCuoi(
	MSVCuoi varchar(10),
	GiaThue float,
	GiaBan float,
	SoLanThue int default(0),
	MSDVVay varchar(10),
	NgayBan date,
	Discount int,
	primary key(MSVCuoi)
)
---drop table VayNgayCuoi
--....
ALTER TABLE VayNgayCuoi 
ADD CONSTRAINT CHECK_DISCOUNT  CHECK ((Discount LIKE '[1-9][0-9]' ) OR (Discount LIKE '[0-9]' ) OR Discount LIKE '100' )


alter table VayNgayCuoi
add constraint check_gia check (GiaBan > GiaThue)

alter table VayNgayCuoi
add constraint fk_MSVCuoi_VNC foreign key(MSVCuoi) references Vay(MSV)

--alter table VayNgayCuoi
--drop constraint fk_MSVCuoi_VNC


--..//
alter table VayNgayCuoi
add constraint fk_MSDVVay_VNC foreign key(MSDVVay) references DVVayCuoi(MSDVVay)

--alter table VayNgayCuoi
--drop constraint fk_MSDVVay_VNC
---...j
--alter table VayNgayCuoi
--drop constraint fk_MSDVVay_VNC
--..//--j
set dateformat DMY
insert into VayNgayCuoi values
('Va1',1500000,5000000,1,'DVV1','5/5/2021','5')
insert into VayNgayCuoi values
('Va2',1500000,5000000,1,'DVV2','6/1/2021','4')
insert into VayNgayCuoi values
('Va3',1500000,5000000,1,'DVV3','7/3/2021','9')
insert into VayNgayCuoi values
('Va4',1500000,5000000,1,'DVV4','5/2/2021','11')

-- Tạo bảng 25
create function AUTO_Album()
returns varchar(10)
as
	begin
		declare @SL int
		set @SL = (select count(*) from Album)
		declare @MSAlbum varchar(10)
		set @MSAlbum = 'Al' + cast(@SL +1 as char)
		return @MSAlbum
end
create table Album(
	MSAlbum varchar(10) default DBO.AUTO_Album(),
	SoTo int check (SoTo >= 15),
	MSDVAlbum varchar(10),
	MSBia varchar(10),
	MSGiay varchar(10),
	primary key(MSAlbum)
)
--....
alter table Album
add constraint fk_MSDVAlbum_Album foreign key(MSDVAlbum) references DVAlbumCuoi(MSDVAlbum)
--..//
alter table Album
add constraint fk_MSBia_Album foreign key(MSBia) references Bia(MSBia)

--alter table Album
--drop constraint fk_MSBia_Album

alter table Album
add constraint fk_MSGiay_Album foreign key(MSGiay) references GiayIn(MSGiay)

--alter table Album
--drop constraint fk_MSGiay_Album
--..//..
insert into Album (SoTo,MSDVAlbum,MSBia,MSGiay) values
('16','DVA1','Bia1','Giay1')
insert into Album (SoTo,MSDVAlbum,MSBia,MSGiay)values
('26','DVA2','Bia2','Giay2')
insert into Album (SoTo,MSDVAlbum,MSBia,MSGiay)values
('56','DVA3','Bia3','Giay3')
insert into Album (SoTo,MSDVAlbum,MSBia,MSGiay) values
('54','DVA4','Bia4','Giay4')
--Tạo bảng 26
create function IND_Bia()
returns varchar(50)
as
	begin
		declare @SL int
		set @SL = (select count(*) from Bia)
		declare @MSBia varchar(10)
		set @MSBia = 'Bia' + cast(@SL +1 as char)
		return @MSBia
end

create table Bia(
	MSBia varchar(10) default DBO.IND_Bia(),
	Ten nvarchar(50),
	Gia float, 
	Mau nvarchar(20),
	ChatLieu nvarchar(20),
	primary key(MSBia)
)
insert into Bia(Ten,Gia,Mau,ChatLieu) values 
('Hoa',1500000,'Hong','Giay')
insert into Bia(Ten,Gia,Mau,ChatLieu) values 
('Bien',1200000,'Xanh','Lua')
insert into Bia(Ten,Gia,Mau,ChatLieu)values 
('Rung',1100000,'Xanh','Nhung')
insert into Bia(Ten,Gia,Mau,ChatLieu)values 
('Song',1300000,'Trang','Giay')
-- Tạo bảng 27

create function IND_GiayIn()
returns varchar(10)
as
	begin
		declare @SL int
		set @SL = (select count(*) from GiayIn)
		declare @MSGiay varchar(10)
		set @MSGiay = 'Giay' + cast(@SL +1 as char)
		return @MSGiay
end
--drop function AUTO_GiayIn
--drop table GiayIn
create table GiayIn(
	MSGiay varchar(10) default DBO.IND_GiayIn(),
	ChatLieu nvarchar(20),
	Gia float,
	primary key(MSGiay)
)
insert into GiayIn(ChatLieu,Gia) values
('Nhung',500000)
insert into GiayIn(ChatLieu,Gia) values
('Lua',700000)
insert into GiayIn(ChatLieu,Gia)values
('Giay',200000)
insert into GiayIn(ChatLieu,Gia)values
('Vai',300000)

-- Tạo bảng 28
create function IND_DVVayCuoi()
returns varchar(10)
as
	begin
		declare @SL int
		set @SL = (select count(*) from DVVayCuoi)
		declare @MSDVVay varchar(10)
		set @MSDVVay = 'DVV' + cast(@SL +1 as char)
		return @MSDVVay
end
--drop function AUTO_DVVayCuoi
--drop table DVVayCuoi

create table DVVayCuoi(
	MSDVVay varchar(10) default DBO.IND_DVVayCuoi(),
	MSHD varchar(10),
	TongGia float,
	primary key(MSDVVay)
)

alter table DVVayCuoi
add constraint fk_MSHD_DVVC foreign key(MSHD) references HopDong(MSHD)
insert into DVVayCuoi(MSHD,TongGia) values
('HD1',3000000)
insert into DVVayCuoi(MSHD,TongGia) values
('HD2',1000000)
insert into DVVayCuoi(MSHD,TongGia) values
('HD3',1500000)
insert into DVVayCuoi (MSHD,TongGia)values
('HD4',2100000)
-- Tạo bảng 29
create table DVVayCuoi_Thue(
	MSDVVay varchar(10),
	MSVCuoi varchar(10),
	NgayBatDau date,
	NgayKetThuc date,
	primary key(MSDVVay,MSVCuoi)
)
--..//..//
insert into DVVayCuoi_Thue values
('DVV1','Va1','4/5/2021','5/5/2021')
insert into DVVayCuoi_Thue values
('DVV2','Va2','4/1/2021','5/5/2021')
insert into DVVayCuoi_Thue values
('DVV3','Va3','4/3/2021','5/5/2021')
insert into DVVayCuoi_Thue values
('DVV4','Va4','4/2/2021','5/9/2021')

alter table DVVayCuoi_Thue
add constraint check_Ngay check(NgayKetThuc > NgayBatDau)

alter table DVVayCuoi_Thue
add constraint fk_MSVVay_DVVayCuoi foreign key (MSDVVay) references DVVayCuoi(MSDVVay)

alter table DVVayCuoi_Thue
add constraint fk_MSVCuoi_VayCuoiNgay foreign key(MSVCuoi) references VayNgayCuoi(MSVCuoi)

--alter table DVVayCuoi_Thue
--drop constraint fk_MSVCuoi_VayCuoiNgay

-- Tạo bảng 30

create function IND_DVNgayCuoi()
returns varchar(10)
as
	begin
		declare @SL int
		set @SL = (select count(*) from DVNgayCuoi)
		declare @MSDVNgay varchar(10)
		set @MSDVNgay = 'DVN' + cast(@SL +1 as char)
		return @MSDVNgay
end

--drop function AUTO_DVNgayCuoi
--drop table DVNgayCuoi

create table DVNgayCuoi(
	MSDVNgay varchar(10) default DBO.IND_DVNgayCuoi(),
	SoLuongNguoiNha int default(0),
	MSHD varchar(10),
	MS_PhotographerKiSu varchar(50),
	MS_ThoPhu varchar(50),
	Gia float,
	ThoiDiem time,
	DiaDiem varchar(50),
	TongGia float,
	primary key(MSDVNgay)
)
insert into DVNgayCuoi (SoLuongNguoiNha,MSHD,MS_PhotographerKiSu,MS_ThoPhu,Gia,ThoiDiem,DiaDiem,TongGia) values
(5,'HD1','PG001','TP001',1500000,'7:00','TPHCM',3000000)
insert into DVNgayCuoi (SoLuongNguoiNha,MSHD,MS_PhotographerKiSu,MS_ThoPhu,Gia,ThoiDiem,DiaDiem,TongGia) values
(2,'HD2','PG002','TP002',1100000,'7:30','TPHCM',3200000)
insert into DVNgayCuoi (SoLuongNguoiNha,MSHD,MS_PhotographerKiSu,MS_ThoPhu,Gia,ThoiDiem,DiaDiem,TongGia) values
(4,'HD3','PG003','TP003',1200000,'7:25','TPHCM',2000000)
insert into DVNgayCuoi (SoLuongNguoiNha,MSHD,MS_PhotographerKiSu,MS_ThoPhu,Gia,ThoiDiem,DiaDiem,TongGia) values
(10,'HD4','PG004','TP004',1300000,'7:10','TPHCM',2500000)
--drop table DVNgayCuoi

alter table DVNgayCuoi
add constraint fk_MSHD_DVNC foreign key(MSHD) references HopDong(MSHD)

alter table DVNgayCuoi
add constraint fk_MSPTKS_DVNC foreign key(MS_PhotographerKiSu) references Photographer_ChupKiSu(MS_PhotographerKiSu)

alter table DVNgayCuoi
add constraint fk_MSTP_DVNC foreign key(MS_ThoPhu) references ThoPhu(MS_ThoPhu)

-- Tạo bảng 31
create table NgayCuoi_TrangDiem(
	MSDVNgay varchar(10),
	MS_CVTrangDiem varchar(50),
	ThoiDiem time,
	CoDauNguoiNha int check (CoDauNguoiNha in (0,1)),
	primary key(MSDVNgay,MS_CVTrangDiem,ThoiDiem)
)
insert into NgayCuoi_TrangDiem values
('DVN1','TD001','8:00',0)
insert into NgayCuoi_TrangDiem values
('DVN2','TD002','7:30',1)
insert into NgayCuoi_TrangDiem values
('DVN3','TD003','6:15',0)
insert into NgayCuoi_TrangDiem values
('DVN4','TD004','5:30',1)

--drop table NgayCuoi_TrangDiem
alter table NgayCuoi_TrangDiem
add constraint fk_MSDVNgay_NCTD foreign key(MSDVNgay) references DVNgayCuoi(MSDVNgay)

alter table NgayCuoi_TrangDiem
add constraint fk_MSCVTD_NCTD foreign key(MS_CVTrangDiem) references CVTrangDiem(MS_CVTrangDiem)

-- II: Tạo index

create index thongtin_Vay
on Vay(Kieu)

--drop index thongtin_Vay on Vay

create index thongtin_Khachang
on KhachHang(NgayCuoi)

--drop index thongtin_Khachhang on KhachHang

--Phần 2: 
--I.Trigger
--Câu 1
create trigger DiscountVay
on Vay
for update
as
	declare @Tinhtrang varchar(10)
	set @Tinhtrang = (select Tinhtrang from inserted)
	if (@Tinhtrang = 'T')
	begin
		update VayNgayCuoi
		set SoLanThue = SoLanThue + 1, Discount = Discount + 5
		where VayNgayCuoi.MSVCuoi = (select MSV from inserted)
end
--Câu 2
create trigger TinhTrangVayBan
on VayNgayCuoi
for insert
as
begin
	update Vay
	set TinhTrang = 'B'
	from Vay
	inner join VayNgayCuoi
	on Vay.MSV = VayNgayCuoi.MSDVVay
	where VayNgayCuoi.NgayBan is not null
end
--Câu 3
create trigger SoLanThueVay
on VayNgayCuoi
for update, insert
as
begin
	declare @SoLanThue int
	declare @MSVCuoi varchar(10)
	declare @MSVCuoiInsert varchar(10)

	set @MSVCuoiInsert = (select MSVCuoi from inserted)
	set @SoLanThue = (select SoLanThue from VayNgayCuoi where MSVCuoi = @MSVCuoiInsert)

	if (@SoLanThue = 5)
	begin
		set @MSVCuoi = (select MSVCuoi from VayNgayCuoi where MSVCuoi = @MSVCuoiInsert)
		insert into VayChupHinh values (@MSVCuoi)
		delete from DVVayCuoi_Thue where MSVCuoi = @MSVCuoi
		delete from VayNgayCuoi where MSVCuoi = @MSVCuoi
	end
end
--II.Function:
create proc TongGiaDVVayCuoi(@MSDVVay varchar(10))
as
begin
	declare @TongGiaBan float, @TongGiaThue float, @TongGia float

	set @TongGiaBan = (select sum(GiaBan*Discount/100) from VayNgayCuoi where MSDVVay = @MSDVVay)
	set @TongGiaThue = (select sum(GiaThue) from VayNgayCuoi where MSDVVay = @MSDVVay)
	
	--Trường hợp không thuê
	if (@TongGiaThue is null)
		set @TongGia = @TongGiaBan
	--Trường hợp không mua
	else if (@TongGiaBan is null)
		set @TongGia = @TongGiaThue
	--Trường hợp không mua không thuê
	else if(@TongGiaThue is null and @TongGiaBan is null)
		set @TongGia = 0
	else
		set @TongGia = @TongGiaBan + @TongGiaThue

	update DVVayCuoi
	set TongGia = @TongGia 
	where MSDVVay = @MSDVVay
end



exec TongGiaDVVayCuoi 'DVV1' 

--PHẦN 3: THAO TÁC DỮ LIỆU
--I. Nhập dữ liệu
--Nhập dưới mỗi bảng

--II. DELETE

ALTER TABLE HopDong_LanThanhToan
DROP CONSTRAINT fk_MSHD_LanThanhToan

ALTER TABLE DVAlbumCuoi
DROP CONSTRAINT fk_MSHD_DVA

ALTER TABLE DVVayCuoi
DROP CONSTRAINT fk_MSHD_DVVC

ALTER TABLE DVNgayCuoi
DROP CONSTRAINT fk_MSHD_DVNC

DELETE
FROM HopDong
WHERE MSHD = 'HD1'

--IV. SELECT
--Câu a
SELECT CVTrangDiem.MS_CVTrangDiem, NhanVien.HoTen,(	SELECT COUNT(*) FROM NgayCuoi_TrangDiem 
													WHERE CoDauNguoiNha=0 and CVTrangDiem.MS_CVTrangDiem=NgayCuoi_TrangDiem.MS_CVTrangDiem)  
													AS N'Số lần trang điểm cô dâu',
												  (	SELECT COUNT(*) FROM NgayCuoi_TrangDiem 
													WHERE CoDauNguoiNha=1 and CVTrangDiem.MS_CVTrangDiem = NgayCuoi_TrangDiem.MS_CVTrangDiem)  
													AS N'Số lần trang điểm người nhà'
FROM CVTrangDiem, NhanVien, NgayCuoi_TrangDiem
WHERE NhanVien.MSNV = CVTrangDiem.MS_CVTrangDiem AND CVTrangDiem.MS_CVTrangDiem = NgayCuoi_TrangDiem.MS_CVTrangDiem
GROUP BY NhanVien.HoTen, CVTrangDiem.MS_CVTrangDiem, CoDauNguoiNha


-- Câu b
SELECT Photographer_ChupAlbumCuoi.MS_PhotographerAlbum,HoTen, ThoiDiemChup, Ten,  TongThoiGianChup
FROM NhanVien, Photographer_ChupAlbumCuoi, DiaDiem, DVAlbum_DiaDiem, DVAlbumCuoi
WHERE NhanVien.MSNV = Photographer_ChupAlbumCuoi.MS_PhotographerAlbum 
	  AND Photographer_ChupAlbumCuoi.MS_PhotographerAlbum = DVAlbumCuoi.MS_PhotographerAlbum
      AND DiaDiem.MSDD = DVAlbum_DiaDiem.MSDD
	  AND DVAlbum_DiaDiem.MSDVAlbum = DVAlbumCuoi.MSDVAlbum

-- Câu c
SELECT HopDong.MSHD,DVAlbumCuoi.TongGia as N'Dịch vụ Album Cưới', DVVayCuoi.TongGia as N'Dịch vụ váy cưới', DVNgayCuoi.TongGia as N'Dịch vụ ngày cưới'
FROM DVAlbumCuoi, DVVayCuoi, DVNgayCuoi, HopDong
WHERE HopDong.MSHD = DVVayCuoi.MSHD and HopDong.MSHD = DVAlbumCuoi.MSHD and HopDong.MSHD = DVNgayCuoi.MSHD

--PHẦN 4: PHÂN QUYỀN TRUY CẬP
--1. TẠO USER
sp_addlogin 'NVVanPhong','123','BTL_QuanLyStudio'
sp_addlogin 'KhachHang','456','BTL_QuanLyStudio'

--2. PHÂN QUYỀN TRUY CẬP
--1. GÁN QUYỀN KẾT NỐI CHO 2 USER TRÊN
sp_adduser 'NVVanPhong','NVVanPhong'
sp_adduser 'KhachHang','KhachHang'

--2.User NVVanPhong 
GRANT INSERT, UPDATE, DELETE
ON HopDong
TO NVVanPhong

GRANT INSERT, UPDATE, DELETE
ON DVVayCuoi
TO NVVanPhong

GRANT INSERT, UPDATE, DELETE
ON DVVayCuoi_Thue
TO NVVanPhong

GRANT INSERT, UPDATE, DELETE
ON DVNgayCuoi
TO NVVanPhong

GRANT INSERT, UPDATE, DELETE
ON HopDong_LanThanhToan
TO NVVanPhong

--3. User khachhang
GRANT SELECT
ON NhanVien
TO KhachHang

GRANT SELECT
ON Bia
TO KhachHang

GRANT SELECT
ON GiayIn
TO KhachHang

GRANT SELECT
ON VayChupHinh
TO KhachHang

GRANT SELECT
ON VayNgayCuoi
TO KhachHang

GRANT SELECT
ON DiaDiem
TO KhachHang

GRANT SELECT
ON DaoCu
TO KhachHang

GRANT SELECT
ON AoVest
TO KhachHang