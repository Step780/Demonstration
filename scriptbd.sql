USE [master]
GO
/****** Object:  Database [TkaniBase]    Script Date: 29.05.2022 20:43:21 ******/
CREATE DATABASE [TkaniBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TkaniBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.STEPAN\MSSQL\DATA\TkaniBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TkaniBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.STEPAN\MSSQL\DATA\TkaniBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TkaniBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TkaniBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TkaniBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TkaniBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TkaniBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TkaniBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TkaniBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TkaniBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TkaniBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TkaniBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TkaniBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TkaniBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TkaniBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TkaniBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TkaniBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TkaniBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TkaniBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TkaniBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TkaniBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TkaniBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TkaniBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TkaniBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TkaniBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TkaniBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TkaniBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TkaniBase] SET  MULTI_USER 
GO
ALTER DATABASE [TkaniBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TkaniBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TkaniBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TkaniBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TkaniBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TkaniBase] SET QUERY_STORE = OFF
GO
USE [TkaniBase]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 29.05.2022 20:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[ID_Pickup] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pickups]    Script Date: 29.05.2022 20:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pickups](
	[Pickup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pickups] PRIMARY KEY CLUSTERED 
(
	[Pickup_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 29.05.2022 20:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Cost] [int] NOT NULL,
	[ID_Order] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 29.05.2022 20:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.05.2022 20:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[ID_Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Order_ID], [Date], [ID_Pickup]) VALUES (1, CAST(N'2002-02-14' AS Date), 1)
INSERT [dbo].[Orders] ([Order_ID], [Date], [ID_Pickup]) VALUES (2, CAST(N'2025-05-20' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Pickups] ON 

INSERT [dbo].[Pickups] ([Pickup_ID], [Address]) VALUES (1, N'Латышская')
INSERT [dbo].[Pickups] ([Pickup_ID], [Address]) VALUES (2, N'Нахим')
INSERT [dbo].[Pickups] ([Pickup_ID], [Address]) VALUES (3, N'Нежка')
SET IDENTITY_INSERT [dbo].[Pickups] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Product_ID], [Name], [Cost], [ID_Order]) VALUES (2, N'Синтетика', 200, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Cost], [ID_Order]) VALUES (3, N'Атлас', 1900, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Cost], [ID_Order]) VALUES (6, N'Шерсть', 190, 1)
INSERT [dbo].[Products] ([Product_ID], [Name], [Cost], [ID_Order]) VALUES (7, N'Вискоза', 865, NULL)
INSERT [dbo].[Products] ([Product_ID], [Name], [Cost], [ID_Order]) VALUES (8, N'Лен', 732, NULL)
INSERT [dbo].[Products] ([Product_ID], [Name], [Cost], [ID_Order]) VALUES (9, N'Акрил', 1321, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Cost], [ID_Order]) VALUES (10, N'Полиэстер', 726, 2)
INSERT [dbo].[Products] ([Product_ID], [Name], [Cost], [ID_Order]) VALUES (11, N'Батист', 270, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Role_ID], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([Role_ID], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[Roles] ([Role_ID], [Name]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [Login], [Password], [ID_Role]) VALUES (1, N'oqumeh', N'11', 1)
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [ID_Role]) VALUES (2, N'stepan', N'11', 1)
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [ID_Role]) VALUES (3, N'sanya', N'11', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Pickups] FOREIGN KEY([ID_Pickup])
REFERENCES [dbo].[Pickups] ([Pickup_ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Pickups]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Orders] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Orders] ([Order_ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Orders]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Roles] ([Role_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [TkaniBase] SET  READ_WRITE 
GO
