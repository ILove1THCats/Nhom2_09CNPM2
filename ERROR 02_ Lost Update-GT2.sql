--ERROR 02: Lost Update 
--T2 (User = Quản lý): Đang tính điểm tổng cho học sinh
SET TRAN ISOLATION LEVEL 
READ COMMITTED (DEFAULT)

BEGIN TRAN
go
CREATE PROCEDURE pc_tongdiem
@DiemToan FLOAT,
@DiemNgoaiNgu FLOAT,
@DiemNguVan FLOAT,
@DiemCongKhuyenKhich FLOAT,
@DiemCongVaoTong FLOAT
AS
--Bước 1: Tính điểm tổng cho học sinh
CREATE VIEW view_diem_thi AS
SELECT dkt.ma_ho_so AS 'Mã hồ sơ',
@DiemToan AS 'Điểm toán',
@DiemNgoaiNgu AS 'Điểm ngoại ngữ',
@DiemNguVan AS 'Điểm ngữ văn',
ISNULL(ut.diem, 0) AS 'Điểm ưu tiên',
CASE WHEN dck.diem_cong > 2.5 THEN 2.5 ELSE dck.diem_cong END AS 'Điểm cộng khuyến khích',
CASE
WHEN (@DiemToan + @DiemNgoaiNgu + @DiemNguVan) > 24 THEN 0
WHEN (@DiemToan + @DiemNgoaiNgu + @DiemNguVan) > 23.5 THEN
  CASE WHEN @DiemCongKhuyenKhich < 0.5 THEN @DiemCongKhuyenKhich ELSE 0.5 END
WHEN (@DiemToan + @DiemNgoaiNgu + @DiemNguVan) > 23 THEN
  CASE WHEN @DiemCongKhuyenKhich < 1 THEN @DiemCongKhuyenKhich ELSE 1 END
ELSE
  CASE WHEN @DiemCongKhuyenKhich < 2.5 THEN @DiemCongKhuyenKhich ELSE 2.5 END
END AS 'Điểm cộng vào tổng',
(@DiemToan + @DiemNgoaiNgu + @DiemNguVan + @DiemCongVaoTong + ISNULL(ut.diem, 0)) AS 'Tổng điểm'
FROM dang_ki_thi dkt
INNER JOIN ket_qua kq ON kq.ma_dang_ki = dkt.ma_dang_ki
INNER JOIN mon_thi mt ON mt.ma_mon_thi = kq.ma_mon_thi
LEFT JOIN uu_tien ut ON ut.ma_ho_so = dkt.ma_ho_so
LEFT JOIN diem_cong_khuyen_khich dck ON dck.ma_ho_so = dkt.ma_ho_so;
--Bước 2: Kiểm tra lại điểm sau khi tính
SELECT * FROM view_diem_thi WHERE [Mã hồ sơ] = 'Nhập mã hồ sơ';
ROLLBACK TRAN
RETURN 0
END
-- Bước 3: Bắt lỗi hệ thống (nếu có)

BEGIN CATCH 
PRINT N'Lỗi hệ thống ' + 
ERROR_MESSAGE() 

ROLLBACK TRAN 
END CATCH
COMMIT
