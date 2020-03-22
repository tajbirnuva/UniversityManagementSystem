USE [master]
GO
/****** Object:  Database [Tasbir]    Script Date: 21-Dec-18 5:50:09 PM ******/
CREATE DATABASE [Tasbir]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tasbir', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tasbir.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tasbir_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tasbir_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Tasbir] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tasbir].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tasbir] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tasbir] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tasbir] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tasbir] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tasbir] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tasbir] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Tasbir] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Tasbir] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tasbir] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tasbir] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tasbir] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tasbir] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tasbir] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tasbir] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tasbir] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tasbir] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tasbir] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tasbir] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tasbir] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tasbir] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tasbir] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tasbir] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tasbir] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tasbir] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tasbir] SET  MULTI_USER 
GO
ALTER DATABASE [Tasbir] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tasbir] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tasbir] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tasbir] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Tasbir]
GO
/****** Object:  Table [dbo].[AllocateClassroom]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateClassroom](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[DeptId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [varchar](50) NOT NULL,
	[ToTime] [varchar](50) NOT NULL,
	[Action] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AllocateClassroom] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[Credit] [float] NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[DeptId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignToTeacher]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseAssignToTeacher](
	[CourseAsgnId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[DeptId] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignToTeacher] PRIMARY KEY CLUSTERED 
(
	[CourseAsgnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DeptId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DeptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designations]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designations](
	[DesignationsId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationsName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designations] PRIMARY KEY CLUSTERED 
(
	[DesignationsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enroll](
	[EnrollId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[GradeId] [int] NULL,
	[Action] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Enroll] PRIMARY KEY CLUSTERED 
(
	[EnrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](50) NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Address] [varchar](50) NULL,
	[DepartmentId] [int] NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Credit] [float] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WeekDays]    Script Date: 21-Dec-18 5:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WeekDays](
	[DayId] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_WeekDays] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AllocateClassroom] ON 

INSERT [dbo].[AllocateClassroom] ([ClassId], [DeptId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (6004, 1, 11, 1, 1, N'10:30 AM', N'11:30 AM', N'insert')
INSERT [dbo].[AllocateClassroom] ([ClassId], [DeptId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (6005, 1, 11, 1, 1, N'11:30 AM', N'12:30 PM', N'insert')
INSERT [dbo].[AllocateClassroom] ([ClassId], [DeptId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (6006, 2, 16, 2, 1, N'11:30 AM', N'12:30 PM', N'insert')
INSERT [dbo].[AllocateClassroom] ([ClassId], [DeptId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (6007, 1, 14, 5, 4, N'11:30 AM', N'12:30 PM', N'insert')
INSERT [dbo].[AllocateClassroom] ([ClassId], [DeptId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (6008, 1, 19, 3, 3, N'10:30 AM', N'11:30 AM', N'insert')
INSERT [dbo].[AllocateClassroom] ([ClassId], [DeptId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (6009, 1, 12, 4, 4, N'11:00 AM', N'12:00 PM', N'insert')
SET IDENTITY_INSERT [dbo].[AllocateClassroom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (10, N'C++ Programming', N'CSE-1234', 2, N'Optional', 1, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (11, N'DataBase', N'CSE-1102', 1, N'Optional', 1, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (12, N'C Programming', N'CSE-1103', 2, N'Optional', 1, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (13, N'C# Programming', N'CSE-1104', 5, N'Optional', 1, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (14, N'Theory of Computing', N'CSE-1105', 5, N'Optional', 1, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (15, N'Java Programming', N'CSE-1106', 5, N'Optional', 1, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (16, N'Accounting', N'BBA-1101', 5, N'Optional', 2, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (17, N'Finance', N'BBA-1102', 5, N'Optional', 2, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (18, N'Data Structure', N'CSE-1107', 2, N'Optional', 1, 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [CourseCode], [Credit], [Description], [DeptId], [SemesterId]) VALUES (19, N'Operating System', N'CSE-1109', 5, N'Optional', 1, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] ON 

INSERT [dbo].[CourseAssignToTeacher] ([CourseAsgnId], [TeacherId], [CourseId], [Action], [DeptId]) VALUES (8, 1007, 11, N'insert', 1)
INSERT [dbo].[CourseAssignToTeacher] ([CourseAsgnId], [TeacherId], [CourseId], [Action], [DeptId]) VALUES (9, 1007, 13, N'insert', 1)
INSERT [dbo].[CourseAssignToTeacher] ([CourseAsgnId], [TeacherId], [CourseId], [Action], [DeptId]) VALUES (10, 1010, 12, N'insert', 1)
INSERT [dbo].[CourseAssignToTeacher] ([CourseAsgnId], [TeacherId], [CourseId], [Action], [DeptId]) VALUES (11, 1010, 15, N'insert', 1)
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DeptId], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Departments] ([DeptId], [Code], [Name]) VALUES (2, N'BBA', N'Business Administration')
INSERT [dbo].[Departments] ([DeptId], [Code], [Name]) VALUES (3, N'EEE', N'Electrical & Electronics Engineering')
INSERT [dbo].[Departments] ([DeptId], [Code], [Name]) VALUES (8, N'CSC', N'Computer Science & Com.')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Designations] ON 

INSERT [dbo].[Designations] ([DesignationsId], [DesignationsName]) VALUES (1, N'Professor')
INSERT [dbo].[Designations] ([DesignationsId], [DesignationsName]) VALUES (2, N'Associate Professor')
INSERT [dbo].[Designations] ([DesignationsId], [DesignationsName]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Designations] ([DesignationsId], [DesignationsName]) VALUES (4, N'Lecturer')
SET IDENTITY_INSERT [dbo].[Designations] OFF
SET IDENTITY_INSERT [dbo].[Enroll] ON 

INSERT [dbo].[Enroll] ([EnrollId], [StudentId], [CourseId], [Date], [GradeId], [Action]) VALUES (1006, 22, 10, CAST(0x033F0B00 AS Date), 1, N'insert')
INSERT [dbo].[Enroll] ([EnrollId], [StudentId], [CourseId], [Date], [GradeId], [Action]) VALUES (1007, 22, 11, CAST(0x033F0B00 AS Date), 1, N'insert')
INSERT [dbo].[Enroll] ([EnrollId], [StudentId], [CourseId], [Date], [GradeId], [Action]) VALUES (1008, 22, 12, CAST(0x033F0B00 AS Date), 5, N'insert')
INSERT [dbo].[Enroll] ([EnrollId], [StudentId], [CourseId], [Date], [GradeId], [Action]) VALUES (1009, 1, 11, CAST(0x033F0B00 AS Date), 1, N'insert')
INSERT [dbo].[Enroll] ([EnrollId], [StudentId], [CourseId], [Date], [GradeId], [Action]) VALUES (1010, 1, 12, CAST(0x023F0B00 AS Date), 1, N'insert')
INSERT [dbo].[Enroll] ([EnrollId], [StudentId], [CourseId], [Date], [GradeId], [Action]) VALUES (1011, 1, 13, CAST(0x1B3F0B00 AS Date), NULL, N'insert')
SET IDENTITY_INSERT [dbo].[Enroll] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (1, N'A+')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (2, N'A')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (3, N'A-')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (4, N'B+')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (5, N'B')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (6, N'B-')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (7, N'C+')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (8, N'C')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (9, N'C-')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (10, N'D+')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (11, N'D')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (12, N'D-')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (13, N'F')
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [RoomName]) VALUES (1, N'AB-101')
INSERT [dbo].[Rooms] ([RoomID], [RoomName]) VALUES (2, N'AB-102')
INSERT [dbo].[Rooms] ([RoomID], [RoomName]) VALUES (3, N'AB-103')
INSERT [dbo].[Rooms] ([RoomID], [RoomName]) VALUES (4, N'AB-104')
INSERT [dbo].[Rooms] ([RoomID], [RoomName]) VALUES (5, N'AB-105')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([SemesterId], [SemesterName]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [StudentName], [ContactNo], [Email], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1, N'Abdullah Al Tajbir', N'01850179564', N'tajbir@gmail.com', CAST(0x173F0B00 AS Date), N'Chittagong', 1, N'CSE-2018-001')
INSERT [dbo].[Student] ([StudentId], [StudentName], [ContactNo], [Email], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (13, N'Md Ariful Islam ', N'01681650106', N'arif@gmail.com', CAST(0x173F0B00 AS Date), N'Comilla', 1, N'CSE-2018-002')
INSERT [dbo].[Student] ([StudentId], [StudentName], [ContactNo], [Email], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (19, N'Hasan Masun', N'01681650106', N'hasan@gmail.com', CAST(0x183F0B00 AS Date), N'Chittagong', 1, N'CSE-2018-003')
INSERT [dbo].[Student] ([StudentId], [StudentName], [ContactNo], [Email], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (20, N'Hasan Abdullah', N'01681650101', N'hasan.abdullah@gmail.com', CAST(0xFF3E0B00 AS Date), N'Feni', 1, N'CSE-2018-004')
INSERT [dbo].[Student] ([StudentId], [StudentName], [ContactNo], [Email], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (21, N'Abdullah Al Tayef', N'01681650106', N'tayef@gmail.com', CAST(0xFF3E0B00 AS Date), N'Feni', 1, N'CSE-2018-005')
INSERT [dbo].[Student] ([StudentId], [StudentName], [ContactNo], [Email], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (22, N'Abdullah Al Fahad', N'01681650108', N'fahad@gmail.com', CAST(0x973D0B00 AS Date), N'Feni', 1, N'CSE-2017-001')
INSERT [dbo].[Student] ([StudentId], [StudentName], [ContactNo], [Email], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (23, N'Saiful Alam Saif', N'01825125833', N'abrar@gmail.com', CAST(0x183F0B00 AS Date), N'Chittagong', 1, N'CSE-2018-006')
INSERT [dbo].[Student] ([StudentId], [StudentName], [ContactNo], [Email], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (24, N'arif', N'01681650104', N'arifhasan@gmail.com', CAST(0x033F0B00 AS Date), N'Dhaka', 1, N'CSE-2018-007')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [Credit]) VALUES (1003, N'Md. Samsul Alam', N'ctg', N'samsul@gmail.com', N'01999999999', 1, 1, 3.5)
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [Credit]) VALUES (1005, N'Abdullah Al Mamun ', N'Dhaka', N'mamun@gmail.com', N'01681650107', 1, 1, 5)
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [Credit]) VALUES (1007, N'Maruf', N'Dhaka', N'maruf@gmail.com', N'01681650101', 2, 1, 3)
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [Credit]) VALUES (1008, N'Faisal', N'Feni', N'faisal@gmail.com', N'01912883417', 2, 1, 2)
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [Credit]) VALUES (1009, N'Mehedi Hasan ', N'Feni', N'mehedi@gmail.com', N'01681650144', 2, 1, 3)
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [Credit]) VALUES (1010, N'Hossain Mehedi ', N'Dhaka', N'kaium@gmail.com', N'01681650199', 2, 1, 2)
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [Credit]) VALUES (1011, N'Masum Mahmud', N'Dhaka', N'masum@gmail.com', N'01681650188', 1, 1, 6)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET IDENTITY_INSERT [dbo].[WeekDays] ON 

INSERT [dbo].[WeekDays] ([DayId], [DayName]) VALUES (1, N'Saturday')
INSERT [dbo].[WeekDays] ([DayId], [DayName]) VALUES (2, N'Sunday')
INSERT [dbo].[WeekDays] ([DayId], [DayName]) VALUES (3, N'Monday')
INSERT [dbo].[WeekDays] ([DayId], [DayName]) VALUES (4, N'Tuesday')
INSERT [dbo].[WeekDays] ([DayId], [DayName]) VALUES (5, N'Wednesday')
INSERT [dbo].[WeekDays] ([DayId], [DayName]) VALUES (6, N'Thursday')
INSERT [dbo].[WeekDays] ([DayId], [DayName]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[WeekDays] OFF
/****** Object:  Index [IX_Course]    Script Date: 21-Dec-18 5:50:10 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course] UNIQUE NONCLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_1]    Script Date: 21-Dec-18 5:50:10 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course_1] UNIQUE NONCLUSTERED 
(
	[CourseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Departments]    Script Date: 21-Dec-18 5:50:10 PM ******/
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [IX_Departments] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Departments_1]    Script Date: 21-Dec-18 5:50:10 PM ******/
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [IX_Departments_1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Course]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Departments] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Departments] ([DeptId])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Departments]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Rooms]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_WeekDays] FOREIGN KEY([DayId])
REFERENCES [dbo].[WeekDays] ([DayId])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_WeekDays]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Departments] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Departments] ([DeptId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Departments]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([SemesterId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Semester]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Course]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_CourseAssignToTeacher] FOREIGN KEY([CourseAsgnId])
REFERENCES [dbo].[CourseAssignToTeacher] ([CourseAsgnId])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_CourseAssignToTeacher]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Departments] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Departments] ([DeptId])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Departments]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Teacher]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Course]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Grade]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DeptId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Departments]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DeptId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Departments]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designations] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designations] ([DesignationsId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designations]
GO
USE [master]
GO
ALTER DATABASE [Tasbir] SET  READ_WRITE 
GO
