CREATE DATABASE Shop2
GO
USE Shop2
GO
CREATE TABLE NhomSanPham (
    MaNhom INT PRIMARY KEY NOT NULL,
    TenNhom NVARCHAR(255),
	TrangThai BIT,
);
GO
CREATE TABLE ThuongHieu(
	MaThuongHieu INT PRIMARY KEY NOT NULL,
	TenThuongHieu NVARCHAR(200),
	TrangThai BIT,
);
GO
CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY NOT NULL,
    TenSanPham NVARCHAR(255),
	Gia DECIMAL(18, 0),
    HinhAnh NVARCHAR(255),
	ChiTiet NVARCHAR(255),
	ThongTin NTEXT,
	MaNhom INT,
	MaThuongHieu INT,
	FOREIGN KEY (MaNhom)REFERENCES NhomSanPham(MaNhom),
	FOREIGN KEY (MaThuongHieu)REFERENCES ThuongHieu(MaThuongHieu),
);
GO
select * from SanPham

CREATE TABLE DonHang (
    MaDonHang INT PRIMARY KEY NOT NULL,
	HoTen NVARCHAR(200),
	GioiTinh NVARCHAR(50),
	DiaChi NVARCHAR(500),
    NgayDat DATE,
    TongTien DECIMAL(18, 0),
    TrangThai NVARCHAR(50)
);
GO
CREATE TABLE ChiTietDonHang (
    MaChiTietDonHang INT PRIMARY KEY NOT NULL,
	TenSanPham NVARCHAR(255),
	HinhAnh NVARCHAR(255),
    SoLuong INT,
    DonGia DECIMAL(18, 0),
	MaDonHang INT,
	MaSanPham INT,
	FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
);
GO

CREATE TABLE TaiKhoan (
	MaTaiKhoan INT PRIMARY KEY NOT NULL,
    HoTen NVARCHAR(255),
    Email NVARCHAR(255),
    MatKhau NVARCHAR(255),
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(50),
    MaQuyen INT,
	FOREIGN KEY (MaQuyen) REFERENCES PhanQuyenTaiKhoan(Ma),
);
GO
CREATE TABLE Cart(
	MaGioHang VARCHAR(50) PRIMARY KEY NOT NULL,
	MaSanPham INT,
	SoLuong INT,
	FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
	)
	GO
	alter table Cart
	add TongTien DECIMAL

	drop table Cart
CREATE TABLE PhanQuyenTaiKhoan
(
	Ma INT PRIMARY KEY NOT NULL,
	Ten NVARCHAR(50)
)
GO
Drop table PhanQuyenTaiKhoan
SELECT * FROM NhomSanPham

INSERT INTO PhanQuyenTaiKhoan(Ma, Ten) VALUES(1, N'Admin')
INSERT INTO PhanQuyenTaiKhoan(Ma, Ten) VALUES(0, N'User')

INSERT INTO TaiKhoan(MaTaiKhoan, HoTen, Email, MatKhau, DiaChi, SoDienThoai, MaQuyen) VALUES (1, N'Mai Chí Vĩnh',N'vinh23861@gmail.com',N'Vinh123@', N'Bến Tre', N'0394529044',1)
INSERT INTO TaiKhoan(MaTaiKhoan, HoTen, Email, MatKhau, DiaChi, SoDienThoai, MaQuyen) VALUES (2, N'Lê Phước Bình',N'binh123@gmail.com',N'123', N'Đồng Tháp', N'0394529044',0)

GO

INSERT INTO NhomSanPham (MaNhom, TenNhom, TrangThai) VALUES (1, N'Mỏng nhẹ', 1)---1
INSERT INTO NhomSanPham (MaNhom, TenNhom, TrangThai) VALUES (2, N'Văn phòng', 1)---2
INSERT INTO NhomSanPham (MaNhom, TenNhom, TrangThai) VALUES (3, N'Gaming', 1)---3
INSERT INTO NhomSanPham (MaNhom, TenNhom, TrangThai) VALUES (4, N'MacBook', 1)---4
INSERT INTO NhomSanPham (MaNhom, TenNhom, TrangThai) VALUES (5, N'Cao cấp', 1)---5
GO

INSERT INTO ThuongHieu (MaThuongHieu, TenThuongHieu, TrangThai) VALUES (1, N'Acer', 1)---1
INSERT INTO ThuongHieu (MaThuongHieu, TenThuongHieu, TrangThai) VALUES (2, N'Asus', 1)---2
INSERT INTO ThuongHieu (MaThuongHieu, TenThuongHieu, TrangThai) VALUES (3, N'Apple', 1)---3
INSERT INTO ThuongHieu (MaThuongHieu, TenThuongHieu, TrangThai) VALUES (4, N'Dell', 1)---4
INSERT INTO ThuongHieu (MaThuongHieu, TenThuongHieu, TrangThai) VALUES (5, N'Lenovo', 1)---5
INSERT INTO ThuongHieu (MaThuongHieu, TenThuongHieu, TrangThai) VALUES (6,N'HP', 1)---6
INSERT INTO ThuongHieu (MaThuongHieu, TenThuongHieu, TrangThai) VALUES (7, N'MSI', 1)---7
GO
SELECT * FROM SanPham
INSERT INTO SanPham (MaSanPham, TenSanPham, Gia, HinhAnh, ChiTiet, ThongTin, MaNhom, MaThuongHieu)
VALUES (1, N'Asus VivoBook A415EA i3', 14490000, N'Asus VivoBook A415EA i3.jpg', N'M.HÌNH 14", Full HD' + CHAR(13) + CHAR(10) + N' CPU i3, 1125G4, 2GHz' + CHAR(13) + CHAR(10) + N' CARD Intel UHD ' + CHAR(13) + CHAR(10) + N'PIN 3-cell, 42Wh', N'Asus VivoBook A415EA i3 (EB1748W) sẽ là một sự lựa chọn đáng cân nhắc cho người dùng là học sinh, sinh viên hay dân văn phòng bởi ngoại hình thanh lịch, hiệu năng ổn định cùng mức giá lý tưởng, xử lý đa dạng mọi tác vụ học tập, làm việc hay giải trí cơ bản. ', 1, 2)
INSERT INTO SanPham (MaSanPham, TenSanPham, Gia, HinhAnh, ChiTiet, ThongTin, MaNhom, MaThuongHieu)
VALUES (2, N'Apple MacBook Air M1 2020', 29390000, N'macbook air.jpg', N'M.HÌNH 13.3", Retina' + CHAR(13) + CHAR(10) + N'CPU Apple M1 ' + CHAR(13) + CHAR(10) + N'CARD 8 nhân GPU  ' + CHAR(13) + CHAR(10) + N'PIN Khoảng 10 tiếng ', N'Laptop Apple MacBook Air M1 2020 có thiết kế đẹp, sang trọng với CPU M1 độc quyền từ Apple cho hiệu năng đồ họa cao, màn hình Retina hiển thị siêu nét cùng với hệ thống bảo mật tối ưu.', 4, 3)
INSERT INTO SanPham (MaSanPham, TenSanPham, Gia, HinhAnh, ChiTiet, ThongTin, MaNhom, MaThuongHieu)
VALUES (3, N'Asus TUF Gaming FX517ZC i5', 27990000, N'Asus TUF Gaming FX517ZC i5.jpg', N'M.HÌNH 15.6", Full HD, 144Hz ' + CHAR(13) + CHAR(10) + N'CPU i5, 12450H, 3.3GHz ' + CHAR(13) + CHAR(10) + N'CARD RTX 3050 4GB ' + CHAR(13) + CHAR(10) + N'PIN 4-cell, 76Wh',N'Sở hữu ngoại hình ấn tượng thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ đến từ laptop CPU thế hệ 12 mới nhất, Asus TUF Gaming FX517ZC i5 12450H (HN077W) là lựa chọn xứng tầm cho mọi nhu cầu chiến game giải trí hay đồ hoạ - kỹ thuật của người dùng.', 3, 2)
INSERT INTO SanPham (MaSanPham, TenSanPham, Gia, HinhAnh, ChiTiet, ThongTin, MaNhom, MaThuongHieu)
VALUES (4, N'Apple MacBook Pro M1 2020', 39490000, N'macbook-pro-m1-2020.jpg', N'M.HÌNH 14.2 inch, Retina, 120Hz ' + CHAR(13) + CHAR(10) + N'CPU Apple M1 Max, 400GB/s memory bandwidth ' + CHAR(13) + CHAR(10) + N'CARD 24 nhân GPU ' + CHAR(13) + CHAR(10) + N'PIN Khoảng 10 tiếng', N'Khoác lên mình vẻ ngoài mới lạ so với các dòng Mac trước đó, thiết kế màn hình tai thỏ ấn tượng, bắt mắt cùng bộ hiệu năng đỉnh cao M1 Max mạnh mẽ, MacBook Pro 14 inch M1 Max 2021 xứng tầm là chiếc laptop cao cấp chuyên dụng dành cho dân kỹ thuật - đồ họa, sáng tạo nội dung.', 4, 3)
INSERT INTO SanPham (MaSanPham, TenSanPham, Gia, HinhAnh, ChiTiet, ThongTin, MaNhom, MaThuongHieu)
VALUES (5, N'HP ZBook Firefly 14 G8', 41380000, N'HP ZBook Firefly 14 G8.jpg', N'M.HÌNH 14", Full HD ' + CHAR(13) + CHAR(10) + N'CPU i7, 1165G7, 2.8GHz ' + CHAR(13) + CHAR(10) + N'CARD NVIDIA QuadroT500, 4GB ' + CHAR(13) + CHAR(10) + N'PIN 3-cell, 53Wh',N'HP ZBook Firefly 14 G8 (275V5AV) chinh phục mọi đối tượng khách hàng với phong cách thiết kế thời thượng, gọn nhẹ cùng những tính năng ưu việt mà nó mang lại, đáp ứng tối đa mọi nhu cầu cần thiết từ học tập - văn phòng cơ bản đến thiết kế đồ họa chuyên sâu.', 2, 6)
GO

INSERT INTO DonHang(MaDonHang, HoTen, GioiTinh, NgayDat, TongTien, TrangThai)
VALUES(1, N'Mai Chí Vĩnh', N'Nam', N'2024-10-29', 14490000, N'Đang giao')
INSERT INTO DonHang(MaDonHang, HoTen, GioiTinh, NgayDat, TongTien, TrangThai)
VALUES(2, N'Lê Phước Bình', N'Nam', N'2024-10-29', 29390000, N'Đang xử lý')
INSERT INTO DonHang(MaDonHang, HoTen, GioiTinh, NgayDat, TongTien, TrangThai)
VALUES(3, N'Võ Duy Phương', N'Nam', N'2024-10-29', 27990000, N'Đã duyệt')
GO

INSERT INTO ChiTietDonHang(MaChiTietDonHang, TenSanPham, HinhAnh, SoLuong, DonGia, MaDonHang, MaSanPham)
VALUES (1, N'Apple MacBook Air M1 2020', N'macbook air.jpg',1, 29390000, 2,2)
INSERT INTO ChiTietDonHang(MaChiTietDonHang, TenSanPham, HinhAnh, SoLuong, DonGia, MaDonHang, MaSanPham)
VALUES (2, N'Asus VivoBook A415EA i3', N'Asus VivoBook A415EA i3.jpg',2, 14490000, 1,1)
GO

Select * from SanPham
Select * from DonHang 
Select * from Cart

