CREATE DATABASE QUAN_LY_DE_TAI

USE QUAN_LY_DE_TAI

EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

CREATE TABLE SINHVIEN 
(
MSSV char(8) PRIMARY KEY, 
TENSV nvarchar(30) NOT NULL, 
SODT varchar(10), 
LOP char(10) NOT NULL, 
DIACHI nchar(50) NOT NULL, 
)

CREATE TABLE DETAI
(
MSDT char(6) PRIMARY KEY, 
TENDT nvarchar(30) NOT NULL, 
)

CREATE TABLE SV_DETAI
(
MSSV char(8) FOREIGN KEY REFERENCES SINHVIEN(MSSV), 
MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT), 
)

CREATE TABLE HOCHAM
(
MSHH int PRIMARY KEY,
TENHH nvarchar(20) NOT NULL,
)

CREATE TABLE GIAOVIEN
(
MSGV int PRIMARY KEY,
TENGV nvarchar(30) NOT NULL,
DIACHI nvarchar(50) NOT NULL,
SODT varchar(10) NOT NULL,
MSHH int FOREIGN KEY REFERENCES HOCHAM(MSHH),
NAMHH smalldatetime NOT NULL,
)

CREATE TABLE HOCVI
(
MSHV int PRIMARY KEY,
TENHV nvarchar(20) NOT NULL,
)

CREATE TABLE CHUYENNGANH
(
MSCN int PRIMARY KEY,
TENCN nvarchar(30) NOT NULL,
)

CREATE TABLE GV_HV_CN
(
MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),
MSHV int FOREIGN KEY REFERENCES HOCVI(MSHV),
MSCN int FOREIGN KEY REFERENCES CHUYENNGANH(MSCN),
NAM smalldatetime NOT NULL,
CONSTRAINT PK_GV_HV_CN PRIMARY KEY (MSGV, MSHV, MSCN)
)

CREATE TABLE GV_HDDT
(
MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),
MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),
DIEM float NOT NULL,
CONSTRAINT PK_GV_HDDT PRIMARY KEY (MSGV, MSDT)
)

CREATE TABLE GV_PBDT
(
MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),
MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),
DIEM float NOT NULL,
CONSTRAINT PK_GV_PBDT PRIMARY KEY (MSGV, MSDT)
)

CREATE TABLE GV_UVDT
(
MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),
MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),
DIEM float NOT NULL,
CONSTRAINT PK_GV_UVDT PRIMARY KEY (MSGV, MSDT)
)

CREATE TABLE HOIDONG
(
MSHD int PRIMARY KEY,
PHONG int,
TGBD smalldatetime,
NGAYHD smalldatetime NOT NULL,
TINHTRANG nvarchar(30) NOT NULL,
MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),
)

CREATE TABLE HOIDONG_GV
(
MSHD int FOREIGN KEY REFERENCES HOIDONG(MSHD),
MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),
CONSTRAINT PK_HOIDONG_GV PRIMARY KEY (MSHD,MSGV),
)

CREATE TABLE HOIDONG_DT
(
MSHD int FOREIGN KEY REFERENCES HOIDONG(MSHD),
MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),
QUYETDINH nchar(10),
CONSTRAINT PK_HOIDONG_DT PRIMARY KEY (MSHD,MSDT),
)

INSERT INTO SINHVIEN values (13520001,N'Nguyễn Văn An',0906762255,N'SE103.U32',N'THỦ ĐỨC')
INSERT INTO SINHVIEN values (13520002,N'Phan Tấn Đạt',0975672350,N'IE204.T21',N'QUẬN 1')
INSERT INTO SINHVIEN values (13520003,N'Nguyễn Anh Hải',0947578688,N'IE205.R12',N'QUẬN 9')
INSERT INTO SINHVIEN values (13520004,N'Phạm Tài',0956757869,N'IE202.A22',N'QUẬN 1')
INSERT INTO SINHVIEN values (13520005,N'Lê Thúy Hằng',0976668688,N'SE304.E22',N'THỦ ĐỨC')
INSERT INTO SINHVIEN values (13520006,N'Ưng Hồng Ân',0957475898,N'IE208.F33',N'QUẬN 2')

INSERT INTO DETAI values (97001,N'Quản lý thư viện')
INSERT INTO DETAI values (97002,N'Nhận dạng vân tay')
INSERT INTO DETAI values (97003,N'Bán đấu giá trên mạng')
INSERT INTO DETAI values (97004,N'Quản lý siêu thị')
INSERT INTO DETAI values (97005,N'Xử lý ảnh')
INSERT INTO DETAI values (97006,N'Hệ giải toán thông minh')

INSERT INTO SV_DETAI values(13520001,97004)
INSERT INTO SV_DETAI values(13520002,97005)
INSERT INTO SV_DETAI values(13520003,97001)
INSERT INTO SV_DETAI values(13520004,97002)
INSERT INTO SV_DETAI values(13520005,97003)
INSERT INTO SV_DETAI values(13520006,97005)

INSERT INTO HOCHAM values (1,N'PHÓ GIÁO SƯ')
INSERT INTO HOCHAM values (2,N'GIÁO SƯ')

INSERT INTO GIAOVIEN values(00201,N'Trần Trung',N'Bến Tre',35353535,1,1996)
INSERT INTO GIAOVIEN values(00202,N'Nguyễn Văn An',N'Tiềng Giang',67868688,1,1996)
INSERT INTO GIAOVIEN values(00203,N'Trần Thu Trang',N'Cần Thơ',74758687,1,1996)
INSERT INTO GIAOVIEN values(00204,N'Nguyễn Thị Loan',N'TP. HCM',56575868,2,2005)
INSERT INTO GIAOVIEN values(00205,N'Chu Tiến',N'Hà Nội',46466646,2,2005)

INSERT INTO HOCVI values(1,N'Kỹ sư')
INSERT INTO HOCVI values(2,N'Cử nhân')
INSERT INTO HOCVI values(3,N'Thạc sĩ')
INSERT INTO HOCVI values(4,N'Tiến sĩ')
INSERT INTO HOCVI values(5,N'Tiến sĩ Khoa học')

INSERT INTO CHUYENNGANH values(1,N'Công nghệ Web')
INSERT INTO CHUYENNGANH values(2,N'Mạng xã hội')
INSERT INTO CHUYENNGANH values(3,N'Quản lý CNTT')
INSERT INTO CHUYENNGANH values(4,N'GIS')

INSERT INTO GV_HV_CN values(00201,1,1,2013)
INSERT INTO GV_HV_CN values(00201,1,2,2013)
INSERT INTO GV_HV_CN values(00201,2,1,2014)
INSERT INTO GV_HV_CN values(00202,3,2,2013)
INSERT INTO GV_HV_CN values(00203,2,4,2014)
INSERT INTO GV_HV_CN values(00204,3,2,2014)

INSERT INTO GV_HDDT values(00201,97001,8)
INSERT INTO GV_HDDT values(00202,97002,7)
INSERT INTO GV_HDDT values(00205,97001,9)
INSERT INTO GV_HDDT values(00204,97004,7)
INSERT INTO GV_HDDT values(00203,97005,9)

INSERT INTO GV_PBDT values(00201,97005,8)
INSERT INTO GV_PBDT values(00202,97001,7)
INSERT INTO GV_PBDT values(00205,97004,9)
INSERT INTO GV_PBDT values(00204,97003,7)
INSERT INTO GV_PBDT values(00203,97002,9)

INSERT INTO GV_UVDT values(00205,97005,8)
INSERT INTO GV_UVDT values(00202,97005,7)
INSERT INTO GV_UVDT values(00204,97005,9)
INSERT INTO GV_UVDT values(00203,97001,7)
INSERT INTO GV_UVDT values(00204,97001,9)
INSERT INTO GV_UVDT values(00205,97001,8)
INSERT INTO GV_UVDT values(00203,97003,7)
INSERT INTO GV_UVDT values(00201,97003,9)
INSERT INTO GV_UVDT values(00202,97003,7)
INSERT INTO GV_UVDT values(00201,97004,9)
INSERT INTO GV_UVDT values(00202,97004,8)
INSERT INTO GV_UVDT values(00203,97004,7)
INSERT INTO GV_UVDT values(00201,97002,9)
INSERT INTO GV_UVDT values(00204,97002,7)
INSERT INTO GV_UVDT values(00205,97002,9)
INSERT INTO GV_UVDT values(00201,97006,9)
INSERT INTO GV_UVDT values(00202,97006,7)
INSERT INTO GV_UVDT values(00204,97006,9)

INSERT INTO HOIDONG values(1,002,N'7:00',11/29/2014,N'Thật',00201)
INSERT INTO HOIDONG values(2,102,N'7:00',12/5/2014,N'Thật',00202)
INSERT INTO HOIDONG values(3,003,N'8:00',12/6/2014,N'Thật',00203)

INSERT INTO HOIDONG_GV values(1,00201)
INSERT INTO HOIDONG_GV values(1,00202)
INSERT INTO HOIDONG_GV values(1,00203)
INSERT INTO HOIDONG_GV values(1,00204)
INSERT INTO HOIDONG_GV values(2,00203)
INSERT INTO HOIDONG_GV values(2,00202)
INSERT INTO HOIDONG_GV values(2,00205)
INSERT INTO HOIDONG_GV values(2,00204)
INSERT INTO HOIDONG_GV values(3,00201)
INSERT INTO HOIDONG_GV values(3,00202)
INSERT INTO HOIDONG_GV values(3,00203)
INSERT INTO HOIDONG_GV values(3,00204)

INSERT INTO HOIDONG_DT values(1,97001,N'Được')
INSERT INTO HOIDONG_DT values(1,97002,N'Được')
INSERT INTO HOIDONG_DT values(2,97001,N'Không')
INSERT INTO HOIDONG_DT values(2,97004,N'Không')
INSERT INTO HOIDONG_DT values(1,97005,N'Được')
INSERT INTO HOIDONG_DT values(3,97001,N'Không')
INSERT INTO HOIDONG_DT values(3,97002,N'Được')
	
------CÂU A1--------
--Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH.
--Trước khi insert dữ liệu cần kiểm tra MSHH đã tồn tại trong table HOCHAM
--chưa, nếu chưa thì trả về giá trị 0.
CREATE PROCEDURE PROC_A1 (@MSGV int,@TENGV nvarchar(30), @DIACHI nvarchar(50),@SODT varchar(10),@MSHH int,@NAMHH smalldatetime)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM HOCHAM WHERE MSHH=@MSHH)
		PRINT '0'
	ELSE
		INSERT INTO GIAOVIEN (MSGV,TENGV,SODT,DIACHI,MSHH,NAMHH) VALUES (@MSGV,@TENGV,@SODT,@DIACHI,@MSHH,@NAMHH)
END
--Thực thi PROCEDUREDS
EXEC PROC_A1 00601,'Nguyen Van A','Ho Chi Minh','1234567890', 1,'2022'
EXEC PROC_A1 00801,'Le Thi L','Da Nang','12345567801', 8,'2000'

------CÂU A2--------
--Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH.
--Trước khi insert dữ liệu cần kiểm tra MSGV trong table GIAOVIEN có trùng
--không, nếu trùng thì trả về giá trị 0.
CREATE PROCEDURE PROC_A2 (@MSGV int,@TENGV nvarchar(30),@SODT varchar(10),@DIACHI nvarchar(50),@MSHH int,@NAMHH smalldatetime)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM GIAOVIEN WHERE MSGV=@MSGV)
		INSERT INTO GIAOVIEN (MSGV,TENGV,SODT,DIACHI,MSHH,NAMHH) VALUES (@MSGV,@TENGV,@SODT,@DIACHI,@MSHH,@NAMHH)
	ELSE
		PRINT '0'
END
--Thực thi PROCEDUREDS
EXEC PROC_A2 00601,'Nguyen Van A','Ho Chi Minh','1234567890', 1,'2022'
EXEC PROC_A2 00801,'Le Thi L','Da Nang','12345567801', 8,'2000'

------CÂU A3--------
--Giống (1) và (2) kiểm tra xem MSGV có trùng không? MSHH có tồn tại
--chưa? Nếu MSGV trùng thì trả về 0. Nếu MSHH chưa tồn tại trả về 1, ngược
--lại cho insert dữ liệu.
CREATE PROCEDURE PROC_A3 (@MSGV int,@TENGV nvarchar(30),@SODT varchar(10),@DIACHI nvarchar(50),@MSHH int,@NAMHH smalldatetime)
AS
BEGIN
	IF EXISTS (SELECT * FROM GIAOVIEN WHERE MSGV=@MSGV)
		PRINT '0'
	ELSE IF NOT EXISTS (SELECT * FROM HOCHAM WHERE MSHH=@MSHH)
		PRINT '1'
	ELSE
		INSERT INTO GIAOVIEN (MSGV,TENGV,SODT,DIACHI,MSHH,NAMHH) VALUES (@MSGV,@TENGV,@SODT,@DIACHI,@MSHH,@NAMHH)
END

-- Thực thi PROCEDURERS
EXEC PROC_A3 00252,'Tran An','5124685789','TP.HCM',2,'2022'
EXEC PROC_A3 00242,'Tran An','7584625942','TP.HCM',2,'2023'
EXEC PROC_A3 00252,'Tran An','0698635257','TP.HCM',5,'2022'

------CÂU A4--------
--Đưa vào MSDT cũ, TENDT mới. Hãy cập nhật tên đề tài mới với mã đề tài
--cũ không đổi nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.
CREATE PROCEDURE PROC_A4 (@MSDT CHAR(6),@TENDT NVARCHAR(30))
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM DETAI WHERE MSDT=@MSDT)
		PRINT '0'
	ELSE
		BEGIN
			UPDATE DETAI
			SET TENDT=@TENDT
			WHERE MSDT=@MSDT
			PRINT '1'
		END
END
-- Thực thi PROCEDURERS
EXEC PROC_A4 97010,'quan ly de tai'
EXEC PROC_A4 97001,'quan ly de tai tot nghiep'

------CÂU A5--------
--Tham số đưa vào MSSV, TENSV mới, DIACHI mới thủ lục dùng để cập
--nhật sinh viên trên, nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.
CREATE PROCEDURE PROC_A5 (@MSSV CHAR(8),@TENSV
NVARCHAR(30),@DIACHI NVARCHAR(50))
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM SINHVIEN WHERE MSSV=@MSSV)
		PRINT '0'
	ELSE
		BEGIN
			UPDATE SINHVIEN
			SET TENSV=@TENSV, DIACHI=@DIACHI
			WHERE MSSV=@MSSV
			PRINT '1'
		END
END
-- Thực thi PROCEDURERS
EXEC PROC_A5 13520001,'Tran Huynh Quoc An','Ho Chi Minh'
EXEC PROC_A5 25020955,'Tran Huynh Quoc An','Da Nang'

------CÂU B1--------
--1. Đưa vào TENHV trả ra: Số GV thỏa học vị,
--nếu không tìm thấy trả về 0.
CREATE PROC PROC_B1 (@tenhv nvarchar(20), @sogv int OUTPUT)
AS
IF EXISTS(SELECT * FROM HOCVI WHERE TENHV = @tenhv)
	BEGIN
		SELECT @sogv = COUNT(A.MSGV)
		FROM GV_HV_CN A, HOCVI B, GIAOVIEN C
		WHERE A.MSHV = B.MSHV AND A.MSGV = C.MSGV
		AND B.TENHV = @tenhv
	END
ELSE
	BEGIN
		PRINT N'LỖI. ' + @tenhv + N' KHÔNG TỒN TẠI.'
		RETURN 0
	END

--CHẠY PROCEDUCE--
DECLARE @tenhv NVARCHAR(20), @sogv INT
SET @tenhv= N'Cử nhân'
EXEC PROC_B1 @tenhv, @sogv OUTPUT
PRINT N'Số giáo viên có học vị ' + @tenhv + N' là ' + CAST(@sogv AS VARCHAR)

--CHẠY PROCEDUCE--
DECLARE @SoGVien INT
EXEC PROC_B1 N'Cử nhân', @SoGVien OUTPUT
PRINT N'Số giáo viên có học vị ' + N'Cử nhân' + N' là ' + CAST(@SoGVien AS VARCHAR)

---------CÂU B2--------
--Đưa vào MSDT cho biết: Điểm trung bình của đề tài,
--nếu không tìm thấy trả về 0.
CREATE PROCEDURE PROC_B2 (@msdt char(6), @diemTB numeric(5,2) OUT)
AS
	BEGIN
	-- Nếu mã đề tài có tồn tại trong bảng DETAI --
	IF(EXISTS(SELECT * FROM DETAI WHERE MSDT=@msdt))
	BEGIN
		-- Tính điểm trung bình cho đề tài đó --
		DECLARE @tongdiem float = 0, @tongGV float = 0
		-- 1/. Tính tổng số điểm của GV chấm và tổng số GV đã chấm ở bảng GV_HDDT:
		IF(EXISTS(SELECT * FROM GV_HDDT WHERE MSDT=@msdt))
		BEGIN
			SELECT @tongdiem = SUM(DIEM)+@tongdiem, @tongGV = COUNT(*)+@tongGV
			FROM GV_HDDT
			WHERE MSDT=@msdt
		END
		-- 2/. Tính tổng số điểm của GV chấm và tổng số GV đã chấm ở bảng GV_PBDT:
		IF(EXISTS(SELECT * FROM GV_PBDT WHERE MSDT=@msdt))
		BEGIN
			SELECT @tongdiem = SUM(DIEM)+@tongdiem, @tongGV = COUNT(*)+@tongGV
			FROM GV_PBDT
			WHERE MSDT=@msdt
		END
		-- 3/. Tính tổng số điểm của GV chấm và tổng số GV đã chấm ở bảng GV_UVDT:
		IF(EXISTS(SELECT * FROM GV_UVDT WHERE MSDT=@msdt))
		BEGIN
			SELECT @tongdiem = SUM(DIEM)+@tongdiem, @tongGV = COUNT(*)+@tongGV
			FROM GV_UVDT
			WHERE MSDT=@msdt
		END
		-- 4/. Tính điểm trung bình của đề tài
		SET @diemTB = @tongdiem / @tongGV
	END
		-- ngược lại --
	ELSE
		BEGIN
			-- thông báo không tìm thấy đề tài --
			PRINT N'Lỗi. Mã đề tài ' + @msdt + N' không tồn tại.'
			-- trả về 0 --
			RETURN 0
		END
	END

--KIỂM TRA B2
--Tồn tại MSDT
DECLARE @diem_TB numeric(5, 2), @msdt char(6)
SET @msdt='97002'
EXEC PROC_B2 @msdt, @diem_TB OUTPUT
-- Thông báo kết quả --
PRINT N'ĐTB của đề tài có mã ' + @msdt + N' là: ' + CAST(@diem_TB AS VARCHAR)

--Không tồn tại MSDT
DECLARE @diem_TB numeric(5, 2), @msdt char(6)
SET @msdt='95554'
EXEC PROC_B2 @msdt, @diem_TB OUTPUT

------CÂU B3--------
-- Đưa vào TENGV trả ra: SDT của giáo viên đó, nếu không tìm thấy trả về 0.
-- Nếu trùng tên thì có báo lỗi không?
CREATE PROCEDURE PROC_B3 (@SODT NVARCHAR(100) OUTPUT, @SDT1 INT
OUTPUT, @TENGV NVARCHAR(30))
AS
BEGIN
	SET @SODT=''
	IF EXISTS (SELECT * FROM GIAOVIEN WHERE TENGV=@TENGV)
		BEGIN
			SELECT @SODT=SODT + ', ' + @SODT
			FROM GIAOVIEN
			WHERE TENGV=@TENGV
			SELECT @SDT1=count(*)
			FROM GIAOVIEN
			WHERE TENGV=@TENGV
		END
	ELSE
		PRINT '0'
END
--Thực thi PROCEDUREDS
DECLARE @SDT1 INT, @SODT1 NVARCHAR(100)
EXEC PROC_B3 @SODT1 OUTPUT, @SDT1 OUTPUT, N'Chu Tiến'
PRINT CAST(@SDT1 AS NVARCHAR(10)) + ', ' + @SODT1

DECLARE @SDT2 INT, @SODT2 NVARCHAR(100)
EXEC PROC_B3 @SODT2 OUTPUT, @SDT2 OUTPUT, N'Tran An'
PRINT CAST(@SDT2 AS NVARCHAR(10)) + ', ' + @SODT2

------CÂU B4--------
-- Đưa vào MSHD cho biết: Điểm trung bình các đề tài của hội đồng đó.
CREATE PROCEDURE PROC_B4 (@MSHD INT, @TB FLOAT OUTPUT)
AS
BEGIN
	IF EXISTS (SELECT * FROM HOIDONG WHERE MSHD=@MSHD)
		BEGIN
			SELECT @TB=AVG(DIEM)
			FROM HOIDONG_GV JOIN (SELECT * FROM GV_HDDT
							UNION SELECT * FROM GV_PBDT
							UNION SELECT * FROM GV_UVDT) AS TTT
			ON HOIDONG_GV.MSGV=TTT.MSGV
			WHERE MSHD=@mshd
		END
	ELSE
		PRINT '0'
END
--Thực thi PROCEDUREDS
DECLARE @MSHD INT, @DTB FLOAT
SET @MSHD = 1;
EXEC PROC_B4 @MSHD, @DTB OUTPUT
PRINT concat(N'Điểm trung bình của hội đồng ', @MSHD , ' là: ', @DTB)

------------C. TRIGGER----------
----CÂU C1
--1. Tạo TRIGGER thỏa mãn điều kiện khi xóa một đề tài sẽ xóa các thông tin liên quan.
CREATE TRIGGER Trigger_C1 on DETAI for DELETE
AS
	BEGIN
	-- Nếu bảng DETAI không có dòng dữ liệu nào --
	IF(@@ROWCOUNT=0)
	BEGIN
		-- thông báo --
		PRINT N'Lỗi. Bảng DETAI không chứa dữ liệu.'
		RETURN
	END
	-- Nếu có dữ liệu --
	ELSE
	BEGIN
		-- Xóa dữ liệu trong bảng SV_DETAI --
		DELETE SV_DETAI
		FROM SV_DETAI t1, deleted t2
		WHERE t1.MSDT=t2.MSDT
		-- Xóa dữ liệu trong bảng GV_HDDT --
		DELETE GV_HDDT
		FROM GV_HDDT t1, deleted t2
		WHERE t1.MSDT=t2.MSDT
		-- Xóa dữ liệu trong bảng GV_PBDT --
		DELETE GV_PBDT
		FROM GV_PBDT t1, deleted t2
		WHERE t1.MSDT=t2.MSDT
		-- Xóa dữ liệu trong bảng GV_UVDT --
		DELETE GV_UVDT
		FROM GV_UVDT t1, deleted t2
		WHERE t1.MSDT=t2.MSDT
		-- Xóa dữ liệu trong bảng HOIDONG_DT --
		DELETE HOIDONG_DT
		FROM HOIDONG_DT t1, deleted t2
		WHERE t1.MSDT=t2.MSDT
		-- thông báo xóa thành công --
		PRINT N'Đã xóa dữ liệu thành công'
	END
END

-- Tạo procedure để thực thi TRIGGER --
-- khởi tạo procedure --
CREATE PROC Proc_C1(@msdt char(6))
AS
BEGIN
-- nếu @msdt có trong bảng DETAI --
IF(exists(SELECT * FROM DETAI WHERE @msdt=MSDT))
	BEGIN
		-- Vô hiệu hóa các ràng buộc liên quan đến bảng DETAI --
		ALTER TABLE SV_DETAI NOCHECK CONSTRAINT ALL
		ALTER TABLE GV_HDDT NOCHECK CONSTRAINT ALL
		ALTER TABLE GV_PBDT NOCHECK CONSTRAINT ALL
		ALTER TABLE GV_UVDT NOCHECK CONSTRAINT ALL
		ALTER TABLE HOIDONG_DT NOCHECK CONSTRAINT ALL
		------ Gọi lệnh DELETE để thực thi TRIGGER ------
		DELETE FROM DETAI
		WHERE MSDT=@msdt
		-- Sau khi xóa, kích hoạt lại các ràng buộc liên quan đến bảng DETAI --
		ALTER TABLE SV_DETAI CHECK CONSTRAINT ALL
		ALTER TABLE GV_HDDT CHECK CONSTRAINT ALL
		ALTER TABLE GV_PBDT CHECK CONSTRAINT ALL
		ALTER TABLE GV_UVDT CHECK CONSTRAINT ALL
		ALTER TABLE HOIDONG_DT CHECK CONSTRAINT ALL
	END
	-- không tồn tại @msdt --
ELSE
	BEGIN
		-- thông báo --
		PRINT N'Lỗi. Mã đề tài ' + @msdt + N'không tồn tại'
		-- trả về 0 --
		RETURN 0
	END
END

-- Gọi procedure để thực thi TRIGGER --

EXEC Proc_C1 '97001'
EXEC Proc_C1 '1'
-- Kiểm tra lại trong các bảng --
select * FROM DETAI
select * FROM SV_DETAI
select * FROM GV_HDDT
select * FROM GV_PBDT
select * FROM GV_UVDT
select * FROM HOIDONG_DT

------CÂU C2--------
--Tạo Trigger thỏa mãn ràng buộc là một hội đồng không quá 10 đề tài. Dùng “Group by” có được không
CREATE TRIGGER Proc_C2
ON HOIDONG_DT FOR INSERT
AS
BEGIN
	DECLARE @MSHD INT
	SET @MSHD = (SELECT MSHD FROM INSERTED)
	IF(SELECT COUNT(*) FROM HOIDONG_DT WHERE MSHD=@MSHD GROUP BY MSHD) > 10
		BEGIN
			PRINT N'Hội đồng không quá 10 đề tài'
			ROLLBACK TRANSACTION
		END
END

------CÂU C3--------
--Tạo Trigger thỏa mãn ràng buộc là một đề tài không quá 3 sinh viên. Dùng “Group by” có được không? Giải thích.
CREATE TRIGGER Proc_C3
ON SV_DETAI FOR INSERT
AS
BEGIN
	DECLARE @MSDT INT
	SET @MSDT = (SELECT MSDT FROM INSERTED)
	IF(SELECT COUNT(*) FROM SV_DETAI WHERE MSDT=@MSDT GROUP BY MSDT) > 3
		BEGIN
			PRINT N'Đề tài không quá 3 sinh viên'
			ROLLBACK TRANSACTION
		END
END

------CÂU D1--------
--Viết hàm tính điểm trung bình của một đề tài. Giá trị trả về là điểm trung bình ứng với mã số đề tài nhập vào
CREATE FUNCTION dbo.Proc_D1 (@MSDT CHAR(6))
RETURNS FLOAT
AS
BEGIN
	DECLARE @DTB FLOAT
	SELECT @DTB = ((SUM(HDDT.DIEM) + SUM(UVDT.DIEM) + SUM(PBDT.DIEM)) / (COUNT(HDDT.DIEM) + COUNT(UVDT.DIEM) + COUNT(PBDT.DIEM)))
	FROM DETAI DT, GV_HDDT HDDT, GV_PBDT PBDT, GV_UVDT UVDT
	WHERE DT.MSDT=HDDT.MSDT AND DT.MSDT=PBDT.MSDT AND DT.MSDT=UVDT.MSDT AND DT.MSDT=@MSDT
	RETURN @DTB
END

-- Thực hiện Function
DECLARE @MSDT CHAR(6), @DTB FLOAT
SET @MSDT = '97002';
SET @DTB  = dbo.Proc_D1(@MSDT);
PRINT concat(N'Điểm trung bình của đề tài ', @MSDT , ' là: ', @DTB)

------CÂU D2--------
--Trả về kết quả của đề tài theo MSDT nhập vào. Kết quả là DAT nếu như điểm trung
--bình từ 5 trở lên, và KHONGDAT nếu như điểm trung bình dưới 5.
CREATE FUNCTION dbo.Proc_D2 (@MSDT CHAR(6))
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @DIEMTB FLOAT
	SELECT @DIEMTB=dbo.Proc_D1(MSDT)
	FROM DETAI
	WHERE MSDT=@MSDT
	IF(@DIEMTB>5)
		RETURN 'DAT'
	RETURN 'KHONG DAT'
END

-- Thực hiện Function
DECLARE @MSDT CHAR(6), @KQ VARCHAR(10)
SET @MSDT = '97002';
SET @KQ  = dbo.Proc_D2(@MSDT);
PRINT concat(N'Kết quả của đề tài ', @MSDT , ' là: ', @KQ)
