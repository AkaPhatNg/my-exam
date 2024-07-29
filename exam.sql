CREATE DATABASE congty
GO

CREATE TABLE PhieuSanPham (
    MaSoSanPham VARCHAR(20),
    NgaySanXuat DATE,
    TenLoaiSanPham VARCHAR(50),
    MaLoaiSanPham VARCHAR(10),
    NguoiChiuTrachNhiem VARCHAR(50),
    MaSoNguoiChiuTrachNhiem INT,
    GhiChu TEXT
);
GO
SELECT * FROM PhieuSanPham

INSERT INTO PhieuSanPham (
    MaSoSanPham,
    NgaySanXuat,
    TenLoaiSanPham,
    MaLoaiSanPham,
    NguoiChiuTrachNhiem,
    MaSoNguoiChiuTrachNhiem,
    GhiChu)
VALUES
    ('Z37 666666', '2009-12-14', 'Máy tính sách tay Z43', 'Z37E', 'Nguyễn Văn An', 987688, 'Lưu ý một sản phẩm thuộc một loại và một người có thể chịu trách nhiệm cho nhiều sản phẩm thuộc nhiều loại khác nhau.'),
    ('P45 222222', '2010-05-20', 'Điện thoại P45', 'P45X', 'Trần Thị B', 123456, 'Sản phẩm thuộc danh mục điện thoại.'),
    ('K89 333333', '2011-08-15', 'Máy ảnh K89', 'K89C', 'Lê Văn C', 654321, 'Máy ảnh chuyên nghiệp với nhiều tính năng hiện đại.'),
    ('L67 444444', '2012-01-30', 'Máy giặt L67', 'L67W', 'Phạm Thị D', 789012, 'Máy giặt với công nghệ tiên tiến tiết kiệm năng lượng.');
GO
--liet ke danh sach loai san pham cua cong ty
SELECT DISTINCT MaLoaiSanPham, TenLoaiSanPham
FROM PhieuSanPham;
--Liet ke danh sach san pham cua cong ty
SELECT MaSoSanPham, TenLoaiSanPham, NgaySanXuat, MaLoaiSanPham
FROM PhieuSanPham;
--Liet ke danh sach nguoi chiu trach nhiem cua cong ty
SELECT DISTINCT NguoiChiuTrachNhiem, MaSoNguoiChiuTrachNhiem
FROM PhieuSanPham;
--Liet ke danh sach san pham cua cong ty theo thu tu tang dan
SELECT DISTINCT MaLoaiSanPham, TenLoaiSanPham
FROM PhieuSanPham
ORDER BY TenLoaiSanPham ASC;
--Liet ke danh sach nguoi chiu trrach nhiem cua cong ty theo thu tu tang dan
SELECT DISTINCT NguoiChiuTrachNhiem, MaSoNguoiChiuTrachNhiem
FROM PhieuSanPham
ORDER BY NguoiChiuTrachNhiem ASC;
--Liet ke cac san pham co ma so la Z37E
SELECT MaSoSanPham, TenLoaiSanPham, NgaySanXuat, MaLoaiSanPham
FROM PhieuSanPham
WHERE MaLoaiSanPham = 'Z37E';
--Liet ke san pham cua nguyen van a theo thu tu giam dan
SELECT MaSoSanPham, TenLoaiSanPham, NgaySanXuat, MaLoaiSanPham
FROM PhieuSanPham
WHERE NguoiChiuTrachNhiem = 'Nguyễn Văn An'
ORDER BY MaSoSanPham DESC;
--So san pham cau tung loai san pham
SELECT MaLoaiSanPham, COUNT(*) AS SoSanPham
FROM PhieuSanPham
GROUP BY MaLoaiSanPham;
--So loai san pham trung binh theo tung loai san pham
SELECT AVG(SoSanPham) AS SoLoaiSanPhamTrungBinh
FROM (
    SELECT COUNT(*) AS SoSanPham
    FROM PhieuSanPham
    GROUP BY MaLoaiSanPham
) AS LoaiSanPhamTrungBinh;
--Hien thi toan bo thonhg tin ve san pham va loai san pham
SELECT MaSoSanPham, NgaySanXuat, TenLoaiSanPham, MaLoaiSanPham
FROM PhieuSanPham;
--Hien thi toan bo thong tin cua nguoi chiu trach nhiem ve san pham va tung loai san pham
SELECT MaSoSanPham, NgaySanXuat, TenLoaiSanPham, MaLoaiSanPham, NguoiChiuTrachNhiem, MaSoNguoiChiuTrachNhiem
FROM PhieuSanPham;
--Viet cau lenh de thay doi truong ngay san xuat la truoc hoac bang ngay hien tai
UPDATE PhieuSanPham
SET NgaySanXuat = getDATE()
WHERE NgaySanXuat > getDATE();
--Viet cau lenh de xac dinh cac truong khoa chinh va ngoai khoa cua bang
ALTER TABLE PhieuSanPham
ADD CONSTRAINT PK_PhieuSanPham PRIMARY KEY (MaSoSanPham);
--Viet cau lenh de them truong phien ban cua san pham
ALTER TABLE PhieuSanPham
ADD PhienBanSanPham VARCHAR(50);
--Dat chi muc index cho nguoi chiu trach nhiem
CREATE INDEX idx_NguoiChiuTrachNhiem
ON PhieuSanPham (NguoiChiuTrachNhiem);
--View sp de hien thi cac thong tin ma san pham ngay san xuat loai san pham
CREATE VIEW View_SanPham AS
SELECT MaSoSanPham, NgaySanXuat, MaLoaiSanPham
FROM PhieuSanPham;
--View san pham nctn hien thi ma san pham ngay san xuat nguoi chiu trach nhiem
CREATE VIEW View_SanPham_NCTN AS
SELECT MaSoSanPham, NgaySanXuat, NguoiChiuTrachNhiem
FROM PhieuSanPham;
--View top san pham hien thi 5 san pham moi nhat
CREATE VIEW View_Top_SanPham AS
SELECT TOP 5 MaSoSanPham, MaLoaiSanPham, NgaySanXuat
FROM PhieuSanPham
ORDER BY NgaySanXuat DESC;
--Them moi motb loai san pham
CREATE PROCEDURE SP_Them_LoaiSP
    @TenLoai NVARCHAR(100) 
AS
BEGIN
    INSERT INTO LoaiSP (TenLoai)
    VALUES (@TenLoai);
END;
--Them moi nguoi chiu trach nhiem vao bang nctn
CREATE PROCEDURE SP_Them_NCTN
    @TenNCTN NVARCHAR(100), 
    @Email NVARCHAR(100)     
AS
BEGIN
    INSERT INTO NCTN (TenNCTN, Email)
    VALUES (@TenNCTN, @Email);
END;
--Them moi mot san pham vao bang san pham
CREATE PROCEDURE SP_Them_SanPham
    @MaSP INT,            
    @TenSP NVARCHAR(100), 
    @Gia DECIMAL(18, 2),  
    @LoaiSP_ID INT,       
    @NCTN_ID INT          
AS
BEGIN
    INSERT INTO SanPham (MaSP, TenSP, Gia, LoaiSP_ID, NCTN_ID)
    VALUES (@MaSP, @TenSP, @Gia, @LoaiSP_ID, @NCTN_ID);
END;
--Xoa mot san pham tu bang san pham
CREATE PROCEDURE SP_Xoa_SanPham
    @MaSP INT 
AS
BEGIN
    DELETE FROM SanPham
    WHERE MaSP = @MaSP;
END;
--Xoa tta ca cac san pham cua mot loai cu the tu bang san pham
CREATE PROCEDURE SP_Xoa_SanPham_TheoLoai
    @LoaiSP_ID INT 
AS
BEGIN
    DELETE FROM SanPham
    WHERE LoaiSP_ID = @LoaiSP_ID;
END;