--ERROR 02: Lost Update 
--T1 (User = Giáo viên): Đang cập nhật lại điểm thi cho học sinh

SET TRAN ISOLATION LEVEL 
READ COMMITTED (DEFAULT)
BEGIN TRAN

-- Bước 1: Kiểm tra điểm của tất cả thí sinh
SELECT hs.ma_thi_sinh, kt.diem_thi, mt.ten_mon_thi
FROM ho_so_thi_sinh hs
JOIN dang_ki_thi dk ON hs.ma_ho_so = dk.ma_ho_so
JOIN mon_thi mt ON dk.ma_mon_thi = mt.ma_mon_thi
JOIN ket_qua kt ON dk.ma_dang_ki = kt.ma_dang_ki
WHERE hs.ma_thi_sinh IN (
    SELECT ma_thi_sinh FROM diem_cong_kk
    UNION
    SELECT ma_thi_sinh FROM diem_uu_tien
)
ORDER BY hs.ma_thi_sinh, mt.ngay_thi;
ROLLBACK TRAN
RETURN 0
END
-- Bước 2: Nhập thông tin cập nhật
DECLARE @ma_dang_ki VARCHAR(10);
DECLARE @ma_mon_thi VARCHAR(10);
DECLARE @diem_thi FLOAT;

SET @ma_dang_ki = CAST(READLINE('Nhap ma dang ki: ') AS VARCHAR(10));
SET @ma_mon_thi = CAST(READLINE('Nhap ma mon thi: ') AS VARCHAR(10));
SET @diem_thi = CAST(READLINE('Nhap diem thi: ') AS FLOAT);

UPDATE kq
SET kq.diem_thi = @diem_thi
FROM ket_qua kq
INNER JOIN dang_ki_thi dkt ON kq.ma_dang_ki = dkt.ma_dang_ki
INNER JOIN ho_so_thi_sinh hsts ON dkt.ma_ho_so = hsts.ma_ho_so
INNER JOIN mon_thi mt ON dkt.ma_mon_thi = mt.ma_mon_thi
WHERE kq.ma_dang_ki = @ma_dang_ki
AND dkt.ma_mon_thi = @ma_mon_thi;
WAITFOR DELAY '00:00:05'

-- Bước 4: Kiểm tra lại điểm sau khi cập nhật.
SELECT hs.ma_thi_sinh, kt.diem_thi, mt.ten_mon_thi
FROM ho_so_thi_sinh hs
JOIN dang_ki_thi dk ON hs.ma_ho_so = dk.ma_ho_so
JOIN mon_thi mt ON dk.ma_mon_thi = mt.ma_mon_thi
JOIN ket_qua kt ON dk.ma_dang_ki = kt.ma_dang_ki
WHERE hs.ma_thi_sinh IN (
    SELECT ma_thi_sinh FROM diem_cong_kk
    UNION
    SELECT ma_thi_sinh FROM diem_uu_tien
)
ORDER BY hs.ma_thi_sinh, mt.ngay_thi;
ROLLBACK TRAN
RETURN 0
END
-- Bước 5: Bắt lỗi hệ thống (nếu có)

BEGIN CATCH 
PRINT N'Lỗi hệ thống ' + 
ERROR_MESSAGE() 

ROLLBACK TRAN 
END CATCH
COMMIT
