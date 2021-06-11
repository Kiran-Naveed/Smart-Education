USE [master]
GO
/****** Object:  Database [SmartEducation]    Script Date: 6/2/2021 7:05:28 PM ******/
CREATE DATABASE [SmartEducation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartEducation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SmartEducation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartEducation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SmartEducation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SmartEducation] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartEducation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartEducation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartEducation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartEducation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartEducation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartEducation] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartEducation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartEducation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartEducation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartEducation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartEducation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartEducation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartEducation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartEducation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartEducation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartEducation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartEducation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartEducation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartEducation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartEducation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartEducation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartEducation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartEducation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartEducation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartEducation] SET  MULTI_USER 
GO
ALTER DATABASE [SmartEducation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartEducation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartEducation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartEducation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartEducation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SmartEducation] SET QUERY_STORE = OFF
GO
USE [SmartEducation]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 6/2/2021 7:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[LecturesId] [int] IDENTITY(1,1) NOT NULL,
	[eId] [int] NOT NULL,
	[InfoType] [varchar](50) NOT NULL,
	[Value] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LecturesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassSchedule]    Script Date: 6/2/2021 7:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSchedule](
	[CsId] [int] IDENTITY(1,1) NOT NULL,
	[cId] [int] NOT NULL,
	[Day] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 6/2/2021 7:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[cId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](255) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 6/2/2021 7:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[eId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[cId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[eId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 6/2/2021 7:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[LecturesId] [int] IDENTITY(1,1) NOT NULL,
	[LsId] [int] NOT NULL,
	[LectureDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LecturesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LectureSchedual]    Script Date: 6/2/2021 7:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureSchedual](
	[LsId] [int] IDENTITY(1,1) NOT NULL,
	[CsId] [int] NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[StartTime] [time](7) NOT NULL,
 CONSTRAINT [PK__LectureS__4D78DA94B2DC6FE0] PRIMARY KEY CLUSTERED 
(
	[LsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentImage]    Script Date: 6/2/2021 7:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentImage](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ImageType] [varchar](50) NOT NULL,
	[ImagePath] [varchar](255) NOT NULL,
	[ImageDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 6/2/2021 7:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClassSchedule] ON 

INSERT [dbo].[ClassSchedule] ([CsId], [cId], [Day]) VALUES (1, 1, N'Monday')
INSERT [dbo].[ClassSchedule] ([CsId], [cId], [Day]) VALUES (2, 2, N'Monday')
INSERT [dbo].[ClassSchedule] ([CsId], [cId], [Day]) VALUES (3, 3, N'Tuesday')
INSERT [dbo].[ClassSchedule] ([CsId], [cId], [Day]) VALUES (4, 1, N'Tuesday')
SET IDENTITY_INSERT [dbo].[ClassSchedule] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([cId], [CourseName], [CourseCode]) VALUES (1, N'Programming Fundamentals', N'CS678')
INSERT [dbo].[Courses] ([cId], [CourseName], [CourseCode]) VALUES (2, N'Object Oreinted programming', N'CS123')
INSERT [dbo].[Courses] ([cId], [CourseName], [CourseCode]) VALUES (3, N'Database', N'CS687')
INSERT [dbo].[Courses] ([cId], [CourseName], [CourseCode]) VALUES (4, N'Discrete Math', N'CS178')
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[LectureSchedual] ON 

INSERT [dbo].[LectureSchedual] ([LsId], [CsId], [EndTime], [StartTime]) VALUES (1, 1, CAST(N'10:00:00' AS Time), CAST(N'08:00:00' AS Time))
INSERT [dbo].[LectureSchedual] ([LsId], [CsId], [EndTime], [StartTime]) VALUES (2, 2, CAST(N'12:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[LectureSchedual] ([LsId], [CsId], [EndTime], [StartTime]) VALUES (3, 3, CAST(N'10:00:00' AS Time), CAST(N'08:00:00' AS Time))
INSERT [dbo].[LectureSchedual] ([LsId], [CsId], [EndTime], [StartTime]) VALUES (4, 4, CAST(N'12:00:00' AS Time), CAST(N'10:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[LectureSchedual] OFF
SET IDENTITY_INSERT [dbo].[StudentInfo] ON 

INSERT [dbo].[StudentInfo] ([StudentId], [Name], [Email], [RegNo], [Password]) VALUES (1, N'Kiran Naveed', N'kirannaveed956@gmail.com', N'2017-CS-160', N'Kiran*123')
SET IDENTITY_INSERT [dbo].[StudentInfo] OFF
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([eId])
REFERENCES [dbo].[Enroll] ([eId])
GO
ALTER TABLE [dbo].[ClassSchedule]  WITH CHECK ADD FOREIGN KEY([cId])
REFERENCES [dbo].[Courses] ([cId])
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD FOREIGN KEY([cId])
REFERENCES [dbo].[Courses] ([cId])
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentInfo] ([StudentId])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK__Lectures__LsId__5629CD9C] FOREIGN KEY([LsId])
REFERENCES [dbo].[LectureSchedual] ([LsId])
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK__Lectures__LsId__5629CD9C]
GO
ALTER TABLE [dbo].[LectureSchedual]  WITH CHECK ADD  CONSTRAINT [FK__LectureSch__LsId__534D60F1] FOREIGN KEY([LsId])
REFERENCES [dbo].[ClassSchedule] ([CsId])
GO
ALTER TABLE [dbo].[LectureSchedual] CHECK CONSTRAINT [FK__LectureSch__LsId__534D60F1]
GO
ALTER TABLE [dbo].[StudentImage]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentInfo] ([StudentId])
GO
/****** Object:  StoredProcedure [dbo].[timeTable]    Script Date: 6/2/2021 7:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[timeTable]
AS

SELECT CourseName,Day,StartTime,EndTime
FROM LectureSchedual
Left JOIN ClassSchedule
ON LectureSchedual.CsId = ClassSchedule.CsId left join Courses on ClassSchedule.cId=Courses.cId

GO
USE [master]
GO
ALTER DATABASE [SmartEducation] SET  READ_WRITE 
GO
