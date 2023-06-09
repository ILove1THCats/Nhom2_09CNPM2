
GO
/****** Object:  Database [QLTSTHPT]    Script Date: 4/18/2023 10:33:19 PM ******/
CREATE DATABASE [QLTSTHPT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTSTHPT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLTSTHPT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLTSTHPT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLTSTHPT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLTSTHPT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTSTHPT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTSTHPT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTSTHPT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTSTHPT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTSTHPT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTSTHPT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTSTHPT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLTSTHPT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTSTHPT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTSTHPT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTSTHPT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTSTHPT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTSTHPT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTSTHPT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTSTHPT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTSTHPT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTSTHPT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTSTHPT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTSTHPT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTSTHPT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTSTHPT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTSTHPT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTSTHPT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTSTHPT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLTSTHPT] SET  MULTI_USER 
GO
ALTER DATABASE [QLTSTHPT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTSTHPT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTSTHPT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTSTHPT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTSTHPT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLTSTHPT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLTSTHPT] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLTSTHPT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLTSTHPT]
GO
/****** Object:  User [QL]    Script Date: 4/18/2023 10:33:19 PM ******/
CREATE USER [QL] FOR LOGIN [QL] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HS]    Script Date: 4/18/2023 10:33:19 PM ******/
CREATE USER [HS] FOR LOGIN [HS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [hoc_sinh2]    Script Date: 4/18/2023 10:33:19 PM ******/
CREATE USER [hoc_sinh2] FOR LOGIN [hoc_sinh2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [hoc_sinh1]    Script Date: 4/18/2023 10:33:19 PM ******/
CREATE USER [hoc_sinh1] FOR LOGIN [hoc_sinh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [GV]    Script Date: 4/18/2023 10:33:19 PM ******/
CREATE USER [GV] FOR LOGIN [GV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [giao_vien2]    Script Date: 4/18/2023 10:33:19 PM ******/
CREATE USER [giao_vien2] FOR LOGIN [giao_vien2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [giao_vien1]    Script Date: 4/18/2023 10:33:19 PM ******/
CREATE USER [giao_vien1] FOR LOGIN [giao_vien] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [QL]
GO
/****** Object:  Table [dbo].[dang_ki_thi]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dang_ki_thi](
	[ma_dang_ki] [varchar](10) NOT NULL,
	[ma_ho_so] [varchar](10) NULL,
	[ma_mon_thi] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_dang_ki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diem_cong_kk]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diem_cong_kk](
	[ma_thanh_tich] [varchar](10) NOT NULL,
	[thanh_tich] [nvarchar](50) NULL,
	[diem_cong] [float] NULL,
 CONSTRAINT [PK__diem_con__E2BDE0EF4D4554E0] PRIMARY KEY CLUSTERED 
(
	[ma_thanh_tich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diem_uu_tien]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diem_uu_tien](
	[ma_uu_tien] [varchar](10) NOT NULL,
	[loai_uu_tien] [varchar](50) NULL,
	[diem] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_uu_tien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ho_so_thi_sinh]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ho_so_thi_sinh](
	[ma_ho_so] [varchar](10) NOT NULL,
	[ma_thi_sinh] [varchar](10) NULL,
	[truong_thcs] [nvarchar](100) NULL,
	[diem_tong_ket_thcs] [float] NULL,
	[hanh_kiem] [nvarchar](20) NULL,
	[nam_tot_nghiep] [int] NULL,
	[hinh_thuc_tuyen_sinh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_ho_so] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ket_qua]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ket_qua](
	[ma_dang_ki] [varchar](10) NOT NULL,
	[diem_thi] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_dang_ki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mon_thi]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_thi](
	[ma_mon_thi] [varchar](10) NOT NULL,
	[ten_mon_thi] [nvarchar](100) NULL,
	[ngay_thi] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_mon_thi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguyen_vong]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguyen_vong](
	[ma_ho_so] [varchar](10) NOT NULL,
	[ma_truong] [varchar](10) NOT NULL,
	[thu_tu_nguyen_vong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_ho_so] ASC,
	[ma_truong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phu_huynh]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phu_huynh](
	[ma_thi_sinh] [varchar](10) NOT NULL,
	[ho_ten] [nvarchar](50) NULL,
	[nghe_nghiep] [nvarchar](50) NULL,
	[quan_he] [nvarchar](20) NULL,
	[dia_chi] [nvarchar](100) NULL,
	[so_dien_thoai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_thi_sinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thi_sinh]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thi_sinh](
	[ma_thi_sinh] [varchar](10) NOT NULL,
	[ho_ten] [nvarchar](50) NULL,
	[ngay_sinh] [date] NULL,
	[gioi_tinh] [nvarchar](5) NULL,
	[dan_toc] [nvarchar](50) NULL,
	[dia_chi] [nvarchar](100) NULL,
	[kho_khan] [nvarchar](50) NULL,
	[ma_uu_tien] [varchar](10) NULL,
	[ma_thanh_tich] [varchar](10) NULL,
	[so_dien_thoai] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_thi_sinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[truong_dang_ki]    Script Date: 4/18/2023 10:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[truong_dang_ki](
	[ma_truong] [varchar](10) NOT NULL,
	[ten_truong] [nvarchar](100) NULL,
	[diem_trung_tuyen1] [float] NULL,
	[diem_trung_tuyen2] [float] NULL,
	[diem_trung_tuyen3] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_truong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0001', N'HS0001', N'T01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0002', N'HS0001', N'NN01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0003', N'HS0001', N'NV01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0004', N'HS0002', N'T01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0005', N'HS0002', N'NN01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0006', N'HS0002', N'NV01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0007', N'HS0003', N'T01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0008', N'HS0003', N'NN01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0009', N'HS0003', N'NV01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0010', N'HS0004', N'T01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0011', N'HS0004', N'NN01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0012', N'HS0004', N'NV01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0013', N'HS0005', N'T01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0014', N'HS0005', N'NN01')
INSERT [dbo].[dang_ki_thi] ([ma_dang_ki], [ma_ho_so], [ma_mon_thi]) VALUES (N'DK0015', N'HS0005', N'NV01')
GO
INSERT [dbo].[diem_cong_kk] ([ma_thanh_tich], [thanh_tich], [diem_cong]) VALUES (N'QH01', N'Giải nhất quận/huyện', 2)
INSERT [dbo].[diem_cong_kk] ([ma_thanh_tich], [thanh_tich], [diem_cong]) VALUES (N'QH02', N'Giải nhì quận/huyện', 1.5)
INSERT [dbo].[diem_cong_kk] ([ma_thanh_tich], [thanh_tich], [diem_cong]) VALUES (N'QH03', N'Giải ba quận/huyện', 1)
INSERT [dbo].[diem_cong_kk] ([ma_thanh_tich], [thanh_tich], [diem_cong]) VALUES (N'TP01', N'Giải nhất thành phố', 2.5)
INSERT [dbo].[diem_cong_kk] ([ma_thanh_tich], [thanh_tich], [diem_cong]) VALUES (N'TP02', N'Giải nhì thành phố', 2)
INSERT [dbo].[diem_cong_kk] ([ma_thanh_tich], [thanh_tich], [diem_cong]) VALUES (N'TP03', N'Giải ba thành phố', 1.5)
INSERT [dbo].[diem_cong_kk] ([ma_thanh_tich], [thanh_tich], [diem_cong]) VALUES (N'TP04', N'Giải khuyến khích thành phố', 1.5)
GO
INSERT [dbo].[diem_uu_tien] ([ma_uu_tien], [loai_uu_tien], [diem]) VALUES (N'N01', N'Nhóm 1', 1.5)
INSERT [dbo].[diem_uu_tien] ([ma_uu_tien], [loai_uu_tien], [diem]) VALUES (N'N02', N'Nhóm 2', 1)
INSERT [dbo].[diem_uu_tien] ([ma_uu_tien], [loai_uu_tien], [diem]) VALUES (N'N03', N'Nhóm 3', 0.5)
GO
INSERT [dbo].[ho_so_thi_sinh] ([ma_ho_so], [ma_thi_sinh], [truong_thcs], [diem_tong_ket_thcs], [hanh_kiem], [nam_tot_nghiep], [hinh_thuc_tuyen_sinh]) VALUES (N'HS0001', N'TS0001', N'THCS Ngô Sĩ Liên', 7.5, N'Tốt', 2023, N'Thi tuyển')
INSERT [dbo].[ho_so_thi_sinh] ([ma_ho_so], [ma_thi_sinh], [truong_thcs], [diem_tong_ket_thcs], [hanh_kiem], [nam_tot_nghiep], [hinh_thuc_tuyen_sinh]) VALUES (N'HS0002', N'TS0002', N'THCS Lê Quý Đôn', 8.5, N'Tốt', 2023, N'Thi tuyển')
INSERT [dbo].[ho_so_thi_sinh] ([ma_ho_so], [ma_thi_sinh], [truong_thcs], [diem_tong_ket_thcs], [hanh_kiem], [nam_tot_nghiep], [hinh_thuc_tuyen_sinh]) VALUES (N'HS0003', N'TS0003', N'THCS Bạch Đằng', 8.3, N'Tốt', 2023, N'Thi tuyển')
INSERT [dbo].[ho_so_thi_sinh] ([ma_ho_so], [ma_thi_sinh], [truong_thcs], [diem_tong_ket_thcs], [hanh_kiem], [nam_tot_nghiep], [hinh_thuc_tuyen_sinh]) VALUES (N'HS0004', N'TS0004', N'THCS Hai Bà Trưng', 8, N'Tốt', 2023, N'Thi tuyển')
INSERT [dbo].[ho_so_thi_sinh] ([ma_ho_so], [ma_thi_sinh], [truong_thcs], [diem_tong_ket_thcs], [hanh_kiem], [nam_tot_nghiep], [hinh_thuc_tuyen_sinh]) VALUES (N'HS0005', N'TS0005', N'THCS Đoàn Thị Điểm', 7.8, N'Tốt', 2023, N'Thi tuyển')
GO
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0001', 7.5)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0002', 7.5)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0003', 8)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0004', 9)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0005', 8.5)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0006', 7)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0007', 9)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0008', 8.5)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0009', 8)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0010', 8)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0011', 8)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0012', 7)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0013', 7.5)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0014', 7.25)
INSERT [dbo].[ket_qua] ([ma_dang_ki], [diem_thi]) VALUES (N'DK0015', 6)
GO
INSERT [dbo].[mon_thi] ([ma_mon_thi], [ten_mon_thi], [ngay_thi]) VALUES (N'NN01', N'Ngoại ngữ', CAST(N'2023-04-06T13:00:00' AS SmallDateTime))
INSERT [dbo].[mon_thi] ([ma_mon_thi], [ten_mon_thi], [ngay_thi]) VALUES (N'NV01', N'Ngữ văn', CAST(N'2023-05-06T07:00:00' AS SmallDateTime))
INSERT [dbo].[mon_thi] ([ma_mon_thi], [ten_mon_thi], [ngay_thi]) VALUES (N'T01', N'Toán', CAST(N'2023-04-06T07:00:00' AS SmallDateTime))
GO
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0001', N'THPT04', 1)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0001', N'THPT06', 2)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0001', N'THPT08', 3)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0002', N'THPT01', 1)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0002', N'THPT03', 2)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0002', N'THPT05', 3)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0003', N'THPT01', 1)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0003', N'THPT03', 2)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0003', N'THPT05', 3)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0004', N'THPT03', 1)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0004', N'THPT05', 2)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0004', N'THPT07', 3)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0005', N'THPT01', 1)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0005', N'THPT04', 2)
INSERT [dbo].[nguyen_vong] ([ma_ho_so], [ma_truong], [thu_tu_nguyen_vong]) VALUES (N'HS0005', N'THPT08', 3)
GO
INSERT [dbo].[phu_huynh] ([ma_thi_sinh], [ho_ten], [nghe_nghiep], [quan_he], [dia_chi], [so_dien_thoai]) VALUES (N'TS0001', N'Nguyễn Văn Bình', N'Kỹ sư', N'Cha', N'Quận 8', N'0952411151')
INSERT [dbo].[phu_huynh] ([ma_thi_sinh], [ho_ten], [nghe_nghiep], [quan_he], [dia_chi], [so_dien_thoai]) VALUES (N'TS0002', N'Trần Thị Cao', N'Bác sĩ', N'Mẹ', N'Quận 3', N'0966554658')
INSERT [dbo].[phu_huynh] ([ma_thi_sinh], [ho_ten], [nghe_nghiep], [quan_he], [dia_chi], [so_dien_thoai]) VALUES (N'TS0003', N'Phạm Văn Dũng', N'Giáo viên', N'Cha', N'Quận 4', N'0985554545')
INSERT [dbo].[phu_huynh] ([ma_thi_sinh], [ho_ten], [nghe_nghiep], [quan_he], [dia_chi], [so_dien_thoai]) VALUES (N'TS0004', N'Lê Văn Duy', N'Công an', N'Cha', N'Quận 1', N'0965566522')
INSERT [dbo].[phu_huynh] ([ma_thi_sinh], [ho_ten], [nghe_nghiep], [quan_he], [dia_chi], [so_dien_thoai]) VALUES (N'TS0005', N'Nguyễn Quang Thọ', N'Giáo viên', N'Cha', N'Quận Tân Bình', N'0921656558')
GO
INSERT [dbo].[thi_sinh] ([ma_thi_sinh], [ho_ten], [ngay_sinh], [gioi_tinh], [dan_toc], [dia_chi], [kho_khan], [ma_uu_tien], [ma_thanh_tich], [so_dien_thoai]) VALUES (N'TS0001', N'Nguyễn Văn Anh', CAST(N'2008-02-10' AS Date), N'Nam', N'Kinh', N'Quận 8', N'Hộ nghèo', N'N03', NULL, N'0987654321')
INSERT [dbo].[thi_sinh] ([ma_thi_sinh], [ho_ten], [ngay_sinh], [gioi_tinh], [dan_toc], [dia_chi], [kho_khan], [ma_uu_tien], [ma_thanh_tich], [so_dien_thoai]) VALUES (N'TS0002', N'Trần Ngọc Bích', CAST(N'2008-12-03' AS Date), N'Nữ', N'Kinh', N'Quận 3', NULL, NULL, N'TP01', N'0912345678')
INSERT [dbo].[thi_sinh] ([ma_thi_sinh], [ho_ten], [ngay_sinh], [gioi_tinh], [dan_toc], [dia_chi], [kho_khan], [ma_uu_tien], [ma_thanh_tich], [so_dien_thoai]) VALUES (N'TS0003', N'Phạm Văn Cao', CAST(N'2008-01-15' AS Date), N'Nam', N'Kinh', N'Quận 4', NULL, NULL, NULL, N'0911225544')
INSERT [dbo].[thi_sinh] ([ma_thi_sinh], [ho_ten], [ngay_sinh], [gioi_tinh], [dan_toc], [dia_chi], [kho_khan], [ma_uu_tien], [ma_thanh_tich], [so_dien_thoai]) VALUES (N'TS0004', N'Lê Mỹ Dung', CAST(N'2008-11-20' AS Date), N'Nữ', N'Kinh', N'Quận 1', NULL, NULL, NULL, N'0987123456')
INSERT [dbo].[thi_sinh] ([ma_thi_sinh], [ho_ten], [ngay_sinh], [gioi_tinh], [dan_toc], [dia_chi], [kho_khan], [ma_uu_tien], [ma_thanh_tich], [so_dien_thoai]) VALUES (N'TS0005', N'Hoàng Văn Giang', CAST(N'2008-03-05' AS Date), N'Kinh', N'Nam', N'Quận Tân Bình', NULL, NULL, NULL, N'0978123456')
GO
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT01', N'THPT Nguyễn Thị Minh Khai', 23.25, 23.5, 23.75)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT02', N'THPT Lê Quý Đôn', 22.25, 22.5, 23.5)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT03', N'THPT Lương Thế Vinh', 21, 22, 22.25)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT04', N'THPT Võ Trường Toản', 20.75, 21.75, 22)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT05', N'THPT Nguyễn Công Trứ', 20, 21.25, 22)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT06', N'THPT Nguyễn Du', 20.5, 21, 21.25)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT07', N'THPT Lê Trọng Tấn', 19, 19.25, 19.5)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT08', N'THPT Nguyễn Hiền', 18.5, 18.75, 19)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT09', N'THPT Trường Chinh', 17.75, 18.25, 18.5)
INSERT [dbo].[truong_dang_ki] ([ma_truong], [ten_truong], [diem_trung_tuyen1], [diem_trung_tuyen2], [diem_trung_tuyen3]) VALUES (N'THPT10', N'THPT Lê Thánh Tôn', 17, 18, 18.25)
GO
ALTER TABLE [dbo].[dang_ki_thi]  WITH CHECK ADD  CONSTRAINT [FK_dang_ki_thi_ho_so_thi_sinh] FOREIGN KEY([ma_ho_so])
REFERENCES [dbo].[ho_so_thi_sinh] ([ma_ho_so])
GO
ALTER TABLE [dbo].[dang_ki_thi] CHECK CONSTRAINT [FK_dang_ki_thi_ho_so_thi_sinh]
GO
ALTER TABLE [dbo].[dang_ki_thi]  WITH CHECK ADD  CONSTRAINT [FK_dang_ki_thi_mon_thi] FOREIGN KEY([ma_mon_thi])
REFERENCES [dbo].[mon_thi] ([ma_mon_thi])
GO
ALTER TABLE [dbo].[dang_ki_thi] CHECK CONSTRAINT [FK_dang_ki_thi_mon_thi]
GO
ALTER TABLE [dbo].[ho_so_thi_sinh]  WITH CHECK ADD FOREIGN KEY([ma_thi_sinh])
REFERENCES [dbo].[thi_sinh] ([ma_thi_sinh])
GO
ALTER TABLE [dbo].[ket_qua]  WITH CHECK ADD  CONSTRAINT [FK_ket_qua_dang_ki_thi] FOREIGN KEY([ma_dang_ki])
REFERENCES [dbo].[dang_ki_thi] ([ma_dang_ki])
GO
ALTER TABLE [dbo].[ket_qua] CHECK CONSTRAINT [FK_ket_qua_dang_ki_thi]
GO
ALTER TABLE [dbo].[nguyen_vong]  WITH CHECK ADD FOREIGN KEY([ma_truong])
REFERENCES [dbo].[truong_dang_ki] ([ma_truong])
GO
ALTER TABLE [dbo].[nguyen_vong]  WITH CHECK ADD  CONSTRAINT [FK_nguyen_vong_ho_so_thi_sinh] FOREIGN KEY([ma_ho_so])
REFERENCES [dbo].[ho_so_thi_sinh] ([ma_ho_so])
GO
ALTER TABLE [dbo].[nguyen_vong] CHECK CONSTRAINT [FK_nguyen_vong_ho_so_thi_sinh]
GO
ALTER TABLE [dbo].[phu_huynh]  WITH CHECK ADD FOREIGN KEY([ma_thi_sinh])
REFERENCES [dbo].[thi_sinh] ([ma_thi_sinh])
GO
ALTER TABLE [dbo].[thi_sinh]  WITH CHECK ADD FOREIGN KEY([ma_uu_tien])
REFERENCES [dbo].[diem_uu_tien] ([ma_uu_tien])
GO
ALTER TABLE [dbo].[thi_sinh]  WITH CHECK ADD  CONSTRAINT [FK_thi_sinh_diem_cong_kk] FOREIGN KEY([ma_thanh_tich])
REFERENCES [dbo].[diem_cong_kk] ([ma_thanh_tich])
GO
ALTER TABLE [dbo].[thi_sinh] CHECK CONSTRAINT [FK_thi_sinh_diem_cong_kk]
GO
ALTER TABLE [dbo].[diem_cong_kk]  WITH CHECK ADD  CONSTRAINT [CK__diem_cong__diem___3D5E1FD2] CHECK  (([diem_cong]>=(0) AND [diem_cong]<=(2.5)))
GO
ALTER TABLE [dbo].[diem_cong_kk] CHECK CONSTRAINT [CK__diem_cong__diem___3D5E1FD2]
GO
ALTER TABLE [dbo].[diem_uu_tien]  WITH CHECK ADD CHECK  (([diem]>=(0) AND [diem]<=(1.5)))
GO
ALTER TABLE [dbo].[ho_so_thi_sinh]  WITH CHECK ADD CHECK  (([diem_tong_ket_thcs]>=(0) AND [diem_tong_ket_thcs]<=(10)))
GO
ALTER TABLE [dbo].[ket_qua]  WITH CHECK ADD CHECK  (([diem_thi]>=(0) AND [diem_thi]<=(10)))
GO
ALTER TABLE [dbo].[truong_dang_ki]  WITH CHECK ADD CHECK  (([diem_trung_tuyen1]>=(0) AND [diem_trung_tuyen1]<=(30)))
GO
ALTER TABLE [dbo].[truong_dang_ki]  WITH CHECK ADD CHECK  (([diem_trung_tuyen2]>=(0) AND [diem_trung_tuyen2]<=(30)))
GO
ALTER TABLE [dbo].[truong_dang_ki]  WITH CHECK ADD CHECK  (([diem_trung_tuyen3]>=(0) AND [diem_trung_tuyen3]<=(30)))
GO
USE [master]
GO
ALTER DATABASE [QuanLyTSTHPT] SET  READ_WRITE 
GO
/****** Object:  StoredProcedure [dbo].[proc_thi_sinh_by_dia_chi]    Script Date: 4/18/2023 10:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_thi_sinh_by_dia_chi]
    @dia_chi NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM thi_sinh
    WHERE dia_chi = @dia_chi
END
EXEC proc_thi_sinh_by_dia_chi 'Quận 8'
GO
USE [master]
GO
ALTER DATABASE [QLTSTHPT] SET  READ_WRITE 
GO
