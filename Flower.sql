USE [master]
GO
/****** Object:  Database [Flower]    Script Date: 4/26/2021 8:14:06 PM ******/
CREATE DATABASE [Flower]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Flower', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Flower.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Flower_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Flower_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Flower] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Flower].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Flower] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Flower] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Flower] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Flower] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Flower] SET ARITHABORT OFF 
GO
ALTER DATABASE [Flower] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Flower] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Flower] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Flower] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Flower] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Flower] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Flower] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Flower] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Flower] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Flower] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Flower] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Flower] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Flower] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Flower] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Flower] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Flower] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Flower] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Flower] SET RECOVERY FULL 
GO
ALTER DATABASE [Flower] SET  MULTI_USER 
GO
ALTER DATABASE [Flower] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Flower] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Flower] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Flower] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Flower] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Flower', N'ON'
GO
USE [Flower]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/26/2021 8:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detailId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/26/2021 8:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](16) NULL,
	[totalPrice] [float] NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK__Orders__0809335DA684991C] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/26/2021 8:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[img] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/26/2021 8:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [char](1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/26/2021 8:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleId] [char](1) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (1, 1, 2, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (2, 1, 3, 2)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (3, 2, 3, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (4, 3, 13, 2)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (5, 3, 14, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (6, 4, 14, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (7, 5, 15, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (8, 6, 13, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (9, 7, 14, 2)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (10, 7, 15, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (11, 8, 13, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (12, 9, 13, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (13, 10, 16, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (14, 11, 14, 1)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (15, 12, 15, 8)
GO
INSERT [dbo].[OrderDetail] ([detailId], [orderId], [productId], [quantity]) VALUES (16, 13, 15, 5)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (1, N'hoangnt', 800, CAST(N'2021-04-21T14:11:48.900' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (2, N'admin', 300, CAST(N'2021-04-23T13:37:27.630' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (3, N'hoangnt', 446, CAST(N'2021-04-26T10:40:24.343' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (4, N'hoangnt', 200, CAST(N'2021-04-26T10:40:51.013' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (5, N'hoangnt', 150, CAST(N'2021-04-26T10:41:15.447' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (6, N'hoangnt', 123, CAST(N'2021-04-26T10:42:14.400' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (7, N'hoangnt', 550, CAST(N'2021-04-26T10:42:31.723' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (8, N'hoangnt', 123, CAST(N'2021-04-26T10:44:40.297' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (9, N'hoangnt', 123, CAST(N'2021-04-26T11:01:47.350' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (10, N'hoangnt', 130, CAST(N'2021-04-26T11:04:45.713' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (11, N'hoangnt', 200, CAST(N'2021-04-26T11:11:20.370' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (12, N'hoangnt', 1200, CAST(N'2021-04-26T11:11:57.760' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (13, N'hoangnt', 750, CAST(N'2021-04-26T11:12:06.490' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (14, N'hoangnt', 0, CAST(N'2021-04-26T11:27:24.473' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (15, N'hoangnt', 0, CAST(N'2021-04-26T11:28:33.880' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (16, N'hoangnt', 0, CAST(N'2021-04-26T11:32:40.560' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (17, N'hoangnt', 0, CAST(N'2021-04-26T11:35:37.747' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (18, N'hoangnt', 0, CAST(N'2021-04-26T13:52:15.023' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (19, N'hoangnt', 0, CAST(N'2021-04-26T13:52:49.377' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (20, N'hoangnt', 0, CAST(N'2021-04-26T13:57:22.257' AS DateTime))
GO
INSERT [dbo].[Orders] ([orderId], [userId], [totalPrice], [create_at]) VALUES (21, N'hoangnt', 0, CAST(N'2021-04-26T13:59:15.897' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([id], [name], [price], [quantity], [img]) VALUES (15, N'lan', 150, 4, N'lan.jpg')
GO
INSERT [dbo].[Products] ([id], [name], [price], [quantity], [img]) VALUES (17, N'hong', 300, 15, N'hong.jpg')
GO
INSERT [dbo].[Products] ([id], [name], [price], [quantity], [img]) VALUES (18, N'cuc', 120, 10, N'cuc.jpg')
GO
INSERT [dbo].[Products] ([id], [name], [price], [quantity], [img]) VALUES (19, N'ly', 15, 2, N'')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (N'A', N'admin')
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (N'U', N'user')
GO
INSERT [dbo].[Users] ([userId], [name], [password], [roleId]) VALUES (N'admin', N'ADMIN', N'1', N'A')
GO
INSERT [dbo].[Users] ([userId], [name], [password], [roleId]) VALUES (N'annguyen', N'AnNguyen', N'2', N'U')
GO
INSERT [dbo].[Users] ([userId], [name], [password], [roleId]) VALUES (N'hoangnt', N'HoangNT', N'123', N'U')
GO
INSERT [dbo].[Users] ([userId], [name], [password], [roleId]) VALUES (N'huhu', N'run', N'123', N'U')
GO
INSERT [dbo].[Users] ([userId], [name], [password], [roleId]) VALUES (N'khoipham', N'KhoiPham', N'123456', N'U')
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
USE [master]
GO
ALTER DATABASE [Flower] SET  READ_WRITE 
GO
