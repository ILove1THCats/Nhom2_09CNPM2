--ERROR 01: Dirty read
--T2 (User = Học sinh): Đang xem điểm 
go
SET TRAN ISOLATION LEVEL
READ COMMITTED 
BEGIN TRAN


go
-- bước 1: Nhập thông tin ma_thi_sinh
DECLARE @ma_thi_sinh VARCHAR(10) ;
SET @ma_thi_sinh = (SELECT TOP 1 ma_thi_sinh FROM thi_sinh);

IF EXISTS (SELECT * FROM thi_sinh WHERE ma_thi_sinh = @ma_thi_sinh)
    PRINT 'Mã học sinh tồn tại trong hệ thống'
ELSE
    PRINT 'Mã học sinh không tồn tại trong hệ thống'
ROLLBACK TRAN
RETURN
END
go
-- bước 2: Kiểm tra điểm
DECLARE @ma_thi_sinh VARCHAR(10);
DECLARE @ma_mon_thi VARCHAR(10);

SET @ma_thi_sinh = 'TS001'; 
SET @ma_mon_thi = 'T01'; 

SELECT kq.diem_thi
FROM ho_so_thi_sinh hs
INNER JOIN dang_ki_thi dk ON hs.ma_ho_so = dk.ma_ho_so
INNER JOIN ket_qua kq ON dk.ma_dang_ki = kq.ma_dang_ki
INNER JOIN mon_thi mt ON dk.ma_mon_thi = mt.ma_mon_thi
WHERE hs.ma_thi_sinh = @ma_thi_sinh AND mt.ma_mon_thi = @ma_mon_thi;

-- Bước 3: Bắt lỗi hệ thống (nếu có)

BEGIN CATCH 
PRINT N'Lỗi hệ thống ' + 
ERROR_MESSAGE() 

ROLLBACK TRAN 
END CATCH
COMMIT



