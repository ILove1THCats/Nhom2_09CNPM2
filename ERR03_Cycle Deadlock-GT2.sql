--ERR03: Cycle Deadlock
--T2 (User = Quản lý): cập nhật thông tin của học sinh.
SET TRANSACTION ISOLATION 
LEVEL READ COMMITED

BEGIN TRAN

--B1: Kiểm tra hồ sơ
DECLARE @MaHoSo VARCHAR(10);
IF @MaHoSo NOT IN (
SELECT ma_ho_so
FROM ho_so_thi_sinh)
BEGIN
PRINT @MaHoSo + N' không tồn tại!!'
ROLLBACK TRAN
RETURN 1
END

--B2: Cập nhật trường thcs đã tốt nghiệp của học sinh
DECLARE @diem_tong_ket_thcs float;
DECLARE @ma_ho_so VARCHAR(10);
UPDATE ho_so_thi_sinh 
SET diem_tong_ket_thcs= @diem_tong_ket_thcs 
WHERE ma_ho_so = @ma_ho_so

go
--B3: Cập nhật trường thcs đã tốt nghiệp của học sinh
DECLARE @truong_thcs VARCHAR(10);
DECLARE @ma_ho_so VARCHAR(10);
UPDATE ho_so_thi_sinh 
SET truong_thcs = @truong_thcs 
WHERE ma_ho_so = @ma_ho_so
COMMIT
