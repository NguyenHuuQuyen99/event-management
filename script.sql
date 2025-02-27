USE [master]
GO
/****** Object:  Database [EventManagement]    Script Date: 12/9/2019 11:08:56 PM ******/
CREATE DATABASE [EventManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventManagement', FILENAME = N'D:\Database\EventManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EventManagement_log', FILENAME = N'D:\Database\EventManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EventManagement] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [EventManagement] SET  MULTI_USER 
GO
ALTER DATABASE [EventManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EventManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EventManagement', N'ON'
GO
ALTER DATABASE [EventManagement] SET QUERY_STORE = OFF
GO
USE [EventManagement]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EventManagement]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/9/2019 11:08:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[postdate] [datetime] NULL,
	[eventId] [int] NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[isInActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 12/9/2019 11:08:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[isInactive] [bit] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 12/9/2019 11:08:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[isInactive] [bit] NOT NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Major]    Script Date: 12/9/2019 11:08:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[facultyId] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[isInactive] [bit] NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 12/9/2019 11:08:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[dob] [datetime] NULL,
	[gender] [nvarchar](50) NULL,
	[imageUrl] [nvarchar](max) NULL,
	[role] [nvarchar](50) NOT NULL,
	[majorId] [int] NULL,
	[isInactive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserEvent]    Script Date: 12/9/2019 11:08:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEvent](
	[userId] [nvarchar](50) NOT NULL,
	[eventId] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserEvent] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[eventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([id], [name], [isInactive]) VALUES (1, N'High Quality', 0)
INSERT [dbo].[Faculty] ([id], [name], [isInactive]) VALUES (2, N'Đại Trà', 0)
SET IDENTITY_INSERT [dbo].[Faculty] OFF
SET IDENTITY_INSERT [dbo].[Major] ON 

INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (1, 1, N'Information Technology', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (2, 2, N'Công Nghệ Thông Tin', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (3, 1, N'Electronics', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (4, 2, N'Điện Tử', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (5, 1, N'Fashion', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (6, 2, N'Thời Trang', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (7, 1, N'Mechanics', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (8, 2, N'Cơ Khí', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (9, 1, N'Economics', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (10, 2, N'Kinh Tế', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (11, 1, N'Construction', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (12, 2, N'Xây Dựng', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (13, 1, N'Computer Science', 0)
INSERT [dbo].[Major] ([id], [facultyId], [name], [isInactive]) VALUES (14, 2, N'Khoa Học Máy Tính', 0)
SET IDENTITY_INSERT [dbo].[Major] OFF
INSERT [dbo].[User] ([id], [password], [firstName], [lastName], [dob], [gender], [imageUrl], [role], [majorId], [isInactive]) VALUES (N'17110001', N'D9840773233FA6B19FDE8CAF765402F5', N'Tran', N'Thi A', CAST(N'1999-12-01T00:00:00.000' AS DateTime), N'Female', N'~/Images/637114847700474943_10_EC8DB8EB84A4EC9DBC_ipad.jpg', N'Student', 9, 1)
INSERT [dbo].[User] ([id], [password], [firstName], [lastName], [dob], [gender], [imageUrl], [role], [majorId], [isInactive]) VALUES (N'17110002', N'202CB962AC59075B964B07152D234B70', N'Huynh Van', N'B', CAST(N'1999-12-19T00:00:00.000' AS DateTime), N'Male', N'~/Images/637114899112517313_Hanford_iStock-621586428-1024x768.jpg', N'Student', 14, 1)
INSERT [dbo].[User] ([id], [password], [firstName], [lastName], [dob], [gender], [imageUrl], [role], [majorId], [isInactive]) VALUES (N'17110069', N'202CB962AC59075B964B07152D234B70', N'Truong', N'Minh Quan', CAST(N'1999-10-03T00:00:00.000' AS DateTime), N'Male', N'~/Images/637114381125532941_3.8.16 Scooter.jpg', N'Student', 1, 0)
INSERT [dbo].[User] ([id], [password], [firstName], [lastName], [dob], [gender], [imageUrl], [role], [majorId], [isInactive]) VALUES (N'SA001', N'202CB962AC59075B964B07152D234B70', N'Tran Ngoc', N'Minh Quan', CAST(N'1999-07-01T00:00:00.000' AS DateTime), N'Male', NULL, N'SAdmin', NULL, 0)
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Event_Comment] FOREIGN KEY([eventId])
REFERENCES [dbo].[Event] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Event_Comment]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_User_Comment] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_User_Comment]
GO
ALTER TABLE [dbo].[Major]  WITH CHECK ADD  CONSTRAINT [FK_Major_Faculty] FOREIGN KEY([facultyId])
REFERENCES [dbo].[Faculty] ([id])
GO
ALTER TABLE [dbo].[Major] CHECK CONSTRAINT [FK_Major_Faculty]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Major] FOREIGN KEY([majorId])
REFERENCES [dbo].[Major] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Major]
GO
ALTER TABLE [dbo].[UserEvent]  WITH CHECK ADD  CONSTRAINT [FK_UserEvent_Event] FOREIGN KEY([eventId])
REFERENCES [dbo].[Event] ([id])
GO
ALTER TABLE [dbo].[UserEvent] CHECK CONSTRAINT [FK_UserEvent_Event]
GO
ALTER TABLE [dbo].[UserEvent]  WITH CHECK ADD  CONSTRAINT [FK_UserEvent_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[UserEvent] CHECK CONSTRAINT [FK_UserEvent_User]
GO
USE [master]
GO
ALTER DATABASE [EventManagement] SET  READ_WRITE 
GO
