USE [master]
GO
/****** Object:  Database [OJTDb]    Script Date: 5/21/2021 4:35:23 PM ******/
CREATE DATABASE [OJTDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OJTDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OJTDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OJTDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OJTDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OJTDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OJTDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OJTDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OJTDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OJTDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OJTDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OJTDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [OJTDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OJTDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OJTDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OJTDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OJTDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OJTDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OJTDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OJTDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OJTDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OJTDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OJTDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OJTDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OJTDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OJTDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OJTDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OJTDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [OJTDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OJTDb] SET RECOVERY FULL 
GO
ALTER DATABASE [OJTDb] SET  MULTI_USER 
GO
ALTER DATABASE [OJTDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OJTDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OJTDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OJTDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OJTDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OJTDb', N'ON'
GO
ALTER DATABASE [OJTDb] SET QUERY_STORE = OFF
GO
USE [OJTDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/21/2021 4:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abilities]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abilities](
	[AbilityId] [int] IDENTITY(1,1) NOT NULL,
	[AbilityName] [nvarchar](200) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Abilities] PRIMARY KEY CLUSTERED 
(
	[AbilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[GuardianId] [nvarchar](450) NULL,
	[CourseCurrentId] [int] NOT NULL,
	[StudentCode] [nvarchar](100) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[EventContentId] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Text] [nvarchar](500) NOT NULL,
	[RealTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventContentAbilities]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventContentAbilities](
	[EventContentId] [int] NOT NULL,
	[AbilityId] [int] NOT NULL,
 CONSTRAINT [PK_EventContentAbilities] PRIMARY KEY CLUSTERED 
(
	[EventContentId] ASC,
	[AbilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventContents]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventContents](
	[EventContentId] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[StudentId] [nvarchar](450) NULL,
	[CommunityAbility] [nvarchar](500) NOT NULL,
	[ActionAbility] [nvarchar](500) NOT NULL,
	[DemonstratedAbility] [nvarchar](500) NOT NULL,
	[SelfDevelopment] [nvarchar](500) NOT NULL,
	[ThinkingAbility] [nvarchar](500) NOT NULL,
	[CourseCurrentId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_EventContents] PRIMARY KEY CLUSTERED 
(
	[EventContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](200) NOT NULL,
	[Icon] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationEventContents]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationEventContents](
	[NotificationEventContentId] [int] IDENTITY(1,1) NOT NULL,
	[EventContentId] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Notification] [int] NOT NULL,
 CONSTRAINT [PK_NotificationEventContents] PRIMARY KEY CLUSTERED 
(
	[NotificationEventContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCourseDetails]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCourseDetails](
	[CourseCurrentId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [nvarchar](450) NULL,
	[DoctorId] [nvarchar](450) NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_UserCourseDetails] PRIMARY KEY CLUSTERED 
(
	[CourseCurrentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wikis]    Script Date: 5/21/2021 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wikis](
	[TableId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[TableName] [nvarchar](100) NOT NULL,
	[StatusName] [nvarchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Wikis] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210414020728_InitSQL', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210414020851_CreateDatabaseAndSeedingData', N'5.0.5')
SET IDENTITY_INSERT [dbo].[Abilities] ON 

INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (1, N'Tính tự lập', N'#3a2d38')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (2, N'Khả năng làm việc', N'#1d545b')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (3, N'Khả năng thực hành', N'#f4d8cd')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (4, N'Khả năng giải quyết vấn đề', N'#f78c3a')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (5, N'Khả năng lập kế hoạch', N'#d62f0a')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (6, N'Khả năng sáng tạo', N'#efa101')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (7, N'Khả năng truyền đạt', N'#5db1bf')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (8, N'Khả năng thấu hiểu', N'#662d9a')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (9, N'Có tính mềm dẻo, linh hoạt', N'#2a9034')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (10, N'Khả năng nắm bắt tình huống', N'#efaac3')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (11, N'Có tính kỷ luật', N'#a33972')
INSERT [dbo].[Abilities] ([AbilityId], [AbilityName], [Color]) VALUES (12, N'Khả năng chịu được áp lực', N'#7291b6')
SET IDENTITY_INSERT [dbo].[Abilities] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'291cbc7f-1345-45df-b8c2-96111d13ad60', N'System Admin', N'SYSTEM ADMIN', N'7f1afc1e-eb95-4455-b6b9-301e5fc46ac4')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'947b70ee-4b80-4299-a3e4-b03df15501c1', N'Student', N'STUDENT', N'ead43932-327f-411e-9313-bc399e503d22')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a35c7eb1-a14a-4eed-9ec2-467127acedc1', N'Guardian', N'GUARDIAN', N'cd64acc6-d3ee-42f5-96a1-0518e9e94509')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e346ef58-52dd-485d-92a3-25a64144bdfa', N'Teacher', N'TEACHER', N'b5591e23-dda4-4788-a3b6-1fb3b1f07d04')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f7e3b187-7743-4c11-a73f-398fe418acd1', N'Doctor', N'DOCTOR', N'5836f016-3405-4b44-b692-44cf861babb0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'06b12f97-bb16-434a-9982-e3d3dc1c5145', N'291cbc7f-1345-45df-b8c2-96111d13ad60')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'a35c7eb1-a14a-4eed-9ec2-467127acedc1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'a35c7eb1-a14a-4eed-9ec2-467127acedc1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1efe96d9-6618-4269-a6e3-ae1e3d3eecc4', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2115c7e6-9aae-43cb-a406-d504578498ba', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'06b12f97-bb16-434a-9982-e3d3dc1c5145', N'TeamNET', NULL, 0, NULL, N'superadmin@gmail.com', NULL, N'superadmin@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEN7MyPQ8Ruz6cc3bMXmZwiWu5Pgv15S/acRf/txsUHsOuf/INiT2ATy102MUrFkdKg==', N'f3959cd7-4baf-4ccd-9f9f-01f3788e58ea', N'ddce747e-d985-43ca-a3e8-d1d3329660ff', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'Teacher1', NULL, 2, NULL, N'teacher1@gmail.com', NULL, N'teacher1@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEMy+uuqXtOq4vE0Aj41DA03hSe7suJIqd697JFrmoG0epTPDXCnZALBDeJOJ3DPuhA==', N'72f0496a-daca-442a-9e08-9d703481708a', N'7efe0c64-91a6-48a6-b1c9-71a86904e341', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1efe96d9-6618-4269-a6e3-ae1e3d3eecc4', N'Teacher2', NULL, 3, NULL, N'teacher2@gmail.com', NULL, N'teacher2@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEPsfjAIwkvBuWkO0IYu/7Z12nDZHuTqfoiRthNMGV3y/Jeip+9a6Nudh7OERxgID1A==', N'd4cafa32-9e44-47e0-9b70-9efbf7ca5c4e', N'804f4890-18e9-4cdb-97e6-e527c758bcfc', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2115c7e6-9aae-43cb-a406-d504578498ba', N'Doctor1', NULL, 2, NULL, N'doctor1@gmail.com', NULL, N'doctor1@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEIu84Nw40+FqKPJRJGpwuFqleV2RhelHOoxpzwSmVAk7IShwq8BCpemrFy9fuoHRng==', N'820acea8-dff9-4742-abdc-040c2985c0be', N'1c862e6c-0bb2-4677-a898-77454823501b', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', N'Doctor2', NULL, 3, NULL, N'doctor2@gmail.com', NULL, N'doctor2@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEJe6eEPQp3Z9cfHRXh4yLiBc9HnUP5K+wx1nqIgpd10oIkaACNiM1kiTPKXAuDwsiA==', N'21b3aee4-d826-47bb-a5a0-bdc333616223', N'1694c638-239a-4f7f-b6c3-b785632680da', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Student1', N'3dabf300-50ab-438b-baaa-f6890f2b260c', 2, N'ST00001', N'student1@gmail.com', NULL, N'student1@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEDIUqwsQMCHvx0M1IxN8McrIDD/lrqBo9QnpKA7396gwt21++8flAuXLrVqXQuDhUw==', N'a2007f55-4f9f-4225-b92b-999be744b9c3', N'6178f542-ae41-4d7b-b4b8-a981bd793959', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'Student2', N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 2, N'ST00002', N'student2@gmail.com', NULL, N'student2@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEP8c4tMgWxUrC95Ozq42yA7XhL39GwNpLcuzHG1T8pvL37ai5o/HI46gmyNU0BUmbQ==', N'0ba6c775-55b2-4e4a-9574-2a1eeadd4d09', N'2ad93e8c-a2b1-435a-9d23-a04b330d4b39', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', N'Student3', N'3dabf300-50ab-438b-baaa-f6890f2b260c', 3, N'ST00003', N'student3@gmail.com', NULL, N'student3@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEKaOZCISwWI5luFn3dqMnfKoYp0nOioNrk/Z/yYkCvc/ICTpSXj+LiV5ebjDVOuwqg==', N'd1033ace-8c78-420a-a876-1e709ff440a4', N'771a6572-e44d-4115-99e9-c204c7293c23', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'Guardian1', NULL, 0, NULL, N'guardian1@gmail.com', NULL, N'guardian1@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAECC3IGbxkjNhxCOur6XseDNwOY60IMVlWzx1ixyaXi7kGhojFr0Iw+SynDycQXmXiA==', N'8b552675-4be3-4dee-a59a-bee0f09a04db', N'97f37cbb-35ab-4a59-9a23-cf5af69448f8', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [GuardianId], [CourseCurrentId], [StudentCode], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'Guardian2', NULL, 0, NULL, N'guardian2@gmail.com', NULL, N'guardian2@gmail.com', NULL, 1, N'AQAAAAEAACcQAAAAEDAXOGb1XPSG2Kd5QjkQ+AX0YjEe+A6hPRyCSiDWp4tsjDcXI6KcdSNINdBIzjVt/Q==', N'131e5a66-177c-47e1-ad8d-664847f1243b', N'07f6d86b-b199-4d96-a1f7-b43ffdc1bf18', NULL, 0, 0, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (1, 1, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'StudentComentEvent 1', CAST(N'2020-02-12T13:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (2, 1, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 1', CAST(N'2020-02-12T15:10:20.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (3, 1, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Tính tự lập #Khả năng lập kế hoạch #Có tính kỷ luật - DoctorComentEvent 1', CAST(N'2020-02-12T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (4, 1, N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'GuardianComentEvent 1', CAST(N'2020-02-12T20:15:55.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (5, 2, N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'StudentComentEvent 2', CAST(N'2020-02-15T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (6, 2, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 2', CAST(N'2020-02-15T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (7, 2, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Khả năng làm việc - DoctorComentEvent 2', CAST(N'2020-02-15T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (8, 2, N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'GuardianComentEvent 2', CAST(N'2020-02-15T19:05:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (9, 3, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'StudentComentEvent 3', CAST(N'2020-05-20T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (10, 3, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 3', CAST(N'2020-05-20T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (11, 3, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Khả năng làm việc - DoctorComentEvent 3', CAST(N'2020-05-20T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (12, 3, N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'GuardianComentEvent 3', CAST(N'2020-05-20T19:05:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (13, 4, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'StudentComentEvent 4', CAST(N'2020-06-25T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (14, 4, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 4', CAST(N'2020-06-25T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (15, 4, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Khả năng làm việc - DoctorComentEvent 4', CAST(N'2020-06-25T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (16, 4, N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'GuardianComentEvent 4', CAST(N'2020-06-25T19:05:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (17, 5, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'StudentComentEvent 5', CAST(N'2020-07-12T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (18, 5, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 5', CAST(N'2020-07-12T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (19, 5, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Khả năng lập kế hoạch - DoctorComentEvent 5', CAST(N'2020-07-12T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (20, 5, N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'GuardianComentEvent 5', CAST(N'2020-07-12T19:05:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (21, 6, N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'StudentComentEvent 6', CAST(N'2020-07-20T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (22, 6, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 6', CAST(N'2020-07-20T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (23, 6, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Có tính mềm dẻo, linh hoạt - DoctorComentEvent 6', CAST(N'2020-07-20T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (24, 6, N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'GuardianComentEvent 6', CAST(N'2020-07-20T19:05:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (25, 7, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'StudentComentEvent 7', CAST(N'2021-01-25T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (26, 7, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 7', CAST(N'2021-01-25T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (27, 7, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Khả năng thực hành - Có tính mềm dẻo, linh hoạt - DoctorComentEvent 7', CAST(N'2021-01-25T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (28, 7, N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'GuardianComentEvent 7', CAST(N'2020-07-25T19:05:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (29, 8, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'StudentComentEvent 8', CAST(N'2021-02-02T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (30, 8, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 8', CAST(N'2021-02-02T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (31, 8, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Khả năng chịu được áp lực - DoctorComentEvent 8', CAST(N'2021-02-02T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (32, 8, N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'GuardianComentEvent 8', CAST(N'2020-02-02T19:05:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (33, 9, N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'StudentComentEvent 9', CAST(N'2021-02-10T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (34, 9, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'TeacherComentEvent 9', CAST(N'2021-02-10T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (35, 9, N'2115c7e6-9aae-43cb-a406-d504578498ba', N'#Tính tự lập - DoctorComentEvent 9', CAST(N'2021-02-10T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (36, 9, N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'GuardianComentEvent 9', CAST(N'2021-02-10T19:05:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (37, 10, N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', N'StudentComentEvent 10', CAST(N'2021-03-15T14:15:25.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (38, 10, N'1efe96d9-6618-4269-a6e3-ae1e3d3eecc4', N'TeacherComentEvent 10', CAST(N'2021-03-15T16:20:50.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (39, 10, N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', N'#Khả năng giải quyết vấn đề #Khả năng sáng tạo - DoctorComentEvent 10', CAST(N'2021-03-15T17:30:40.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([CommentId], [EventContentId], [UserId], [Text], [RealTime]) VALUES (40, 10, N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'GuardianComentEvent 10', CAST(N'2020-03-15T19:05:25.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (1, N'Class 1')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (2, N'Class 2')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (3, N'Class 3')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (4, N'Class 4')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (5, N'Class 5')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (6, N'Class 6')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (7, N'Class 7')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (8, N'Class 8')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (9, N'Class 9')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (10, N'Class 10')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (11, N'Class 11')
INSERT [dbo].[Courses] ([CourseId], [CourseName]) VALUES (12, N'Class 12')
SET IDENTITY_INSERT [dbo].[Courses] OFF
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (1, 1)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (9, 1)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (2, 2)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (3, 2)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (4, 2)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (7, 3)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (10, 4)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (1, 5)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (5, 5)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (10, 6)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (6, 9)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (1, 11)
INSERT [dbo].[EventContentAbilities] ([EventContentId], [AbilityId]) VALUES (8, 12)
SET IDENTITY_INSERT [dbo].[EventContents] ON 

INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (1, 1, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Answer 11', N'Answer 12', N'Answer 13', N'Answer 14', N'Answer 15', 1, 3)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (2, 3, N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'Answer 21', N'Answer 22', N'Answer 23', N'Answer 24', N'Answer 25', 1, 3)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (3, 4, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Answer 111', N'Answer 112', N'Answer 113', N'Answer 114', N'Answer 115', 1, 3)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (4, 4, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Answer 1111', N'Answer 1112', N'Answer 1113', N'Answer 1114', N'Answer 1115', 1, 3)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (5, 5, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Answer 11111', N'Answer 11112', N'Answer 11113', N'Answer 11114', N'Answer 11115', 1, 3)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (6, 2, N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'Answer 221', N'Answer 222', N'Answer 223', N'Answer 224', N'Answer 225', 1, 3)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (7, 2, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Answer 111111', N'Answer 111112', N'Answer 111113', N'Answer 111114', N'Answer 111115', 2, 1)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (8, 2, N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Answer 1111111', N'Answer 1111112', N'Answer 1111113', N'Answer 1111114', N'Answer 1111115', 2, 1)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (9, 5, N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'Answer 2221', N'Answer 2222', N'Answer 2223', N'Answer 2224', N'Answer 2225', 2, 1)
INSERT [dbo].[EventContents] ([EventContentId], [EventId], [StudentId], [CommunityAbility], [ActionAbility], [DemonstratedAbility], [SelfDevelopment], [ThinkingAbility], [CourseCurrentId], [StatusId]) VALUES (10, 3, N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', N'Answer 31', N'Answer 32', N'Answer 33', N'Answer 34', N'Answer 35', 2, 1)
SET IDENTITY_INSERT [dbo].[EventContents] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventId], [EventName], [Icon]) VALUES (1, N'Bóng đá', N'fa fa-futbol-o')
INSERT [dbo].[Events] ([EventId], [EventName], [Icon]) VALUES (2, N'Hát', N'las la-microphone-alt')
INSERT [dbo].[Events] ([EventId], [EventName], [Icon]) VALUES (3, N'Bóng chuyền', N'las la-volleyball-ball')
INSERT [dbo].[Events] ([EventId], [EventName], [Icon]) VALUES (4, N'Bóng rổ', N'las la-basketball-ball')
INSERT [dbo].[Events] ([EventId], [EventName], [Icon]) VALUES (5, N'Sách', N'las la-book-reader')
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[UserCourseDetails] ON 

INSERT [dbo].[UserCourseDetails] ([CourseCurrentId], [TeacherId], [DoctorId], [CourseId]) VALUES (1, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'2115c7e6-9aae-43cb-a406-d504578498ba', 1)
INSERT [dbo].[UserCourseDetails] ([CourseCurrentId], [TeacherId], [DoctorId], [CourseId]) VALUES (2, N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'2115c7e6-9aae-43cb-a406-d504578498ba', 2)
INSERT [dbo].[UserCourseDetails] ([CourseCurrentId], [TeacherId], [DoctorId], [CourseId]) VALUES (3, N'1efe96d9-6618-4269-a6e3-ae1e3d3eecc4', N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', 1)
SET IDENTITY_INSERT [dbo].[UserCourseDetails] OFF
INSERT [dbo].[Wikis] ([TableId], [StatusId], [TableName], [StatusName], [IsDeleted]) VALUES (1, 1, N'EventContent', N'Đang xác nhận', 0)
INSERT [dbo].[Wikis] ([TableId], [StatusId], [TableName], [StatusName], [IsDeleted]) VALUES (1, 2, N'EventContent', N'Xác nhận', 0)
INSERT [dbo].[Wikis] ([TableId], [StatusId], [TableName], [StatusName], [IsDeleted]) VALUES (1, 3, N'EventContent', N'Hoàn thành', 0)
INSERT [dbo].[Wikis] ([TableId], [StatusId], [TableName], [StatusName], [IsDeleted]) VALUES (1, 4, N'EventContent', N'Đã xóa', 0)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_EventContentId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_EventContentId] ON [dbo].[Comments]
(
	[EventContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventContentAbilities_AbilityId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventContentAbilities_AbilityId] ON [dbo].[EventContentAbilities]
(
	[AbilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventContents_CourseCurrentId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventContents_CourseCurrentId] ON [dbo].[EventContents]
(
	[CourseCurrentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventContents_EventId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventContents_EventId] ON [dbo].[EventContents]
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EventContents_StudentId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventContents_StudentId] ON [dbo].[EventContents]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationEventContents_EventContentId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationEventContents_EventContentId] ON [dbo].[NotificationEventContents]
(
	[EventContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NotificationEventContents_UserId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationEventContents_UserId] ON [dbo].[NotificationEventContents]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserCourseDetails_CourseId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserCourseDetails_CourseId] ON [dbo].[UserCourseDetails]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserCourseDetails_DoctorId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserCourseDetails_DoctorId] ON [dbo].[UserCourseDetails]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserCourseDetails_TeacherId]    Script Date: 5/21/2021 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserCourseDetails_TeacherId] ON [dbo].[UserCourseDetails]
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_EventContents_EventContentId] FOREIGN KEY([EventContentId])
REFERENCES [dbo].[EventContents] ([EventContentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_EventContents_EventContentId]
GO
ALTER TABLE [dbo].[EventContentAbilities]  WITH CHECK ADD  CONSTRAINT [FK_EventContentAbilities_Abilities_AbilityId] FOREIGN KEY([AbilityId])
REFERENCES [dbo].[Abilities] ([AbilityId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventContentAbilities] CHECK CONSTRAINT [FK_EventContentAbilities_Abilities_AbilityId]
GO
ALTER TABLE [dbo].[EventContentAbilities]  WITH CHECK ADD  CONSTRAINT [FK_EventContentAbilities_EventContents_EventContentId] FOREIGN KEY([EventContentId])
REFERENCES [dbo].[EventContents] ([EventContentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventContentAbilities] CHECK CONSTRAINT [FK_EventContentAbilities_EventContents_EventContentId]
GO
ALTER TABLE [dbo].[EventContents]  WITH CHECK ADD  CONSTRAINT [FK_EventContents_AspNetUsers_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[EventContents] CHECK CONSTRAINT [FK_EventContents_AspNetUsers_StudentId]
GO
ALTER TABLE [dbo].[EventContents]  WITH CHECK ADD  CONSTRAINT [FK_EventContents_Events_EventId] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([EventId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventContents] CHECK CONSTRAINT [FK_EventContents_Events_EventId]
GO
ALTER TABLE [dbo].[EventContents]  WITH CHECK ADD  CONSTRAINT [FK_EventContents_UserCourseDetails_CourseCurrentId] FOREIGN KEY([CourseCurrentId])
REFERENCES [dbo].[UserCourseDetails] ([CourseCurrentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventContents] CHECK CONSTRAINT [FK_EventContents_UserCourseDetails_CourseCurrentId]
GO
ALTER TABLE [dbo].[NotificationEventContents]  WITH CHECK ADD  CONSTRAINT [FK_NotificationEventContents_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[NotificationEventContents] CHECK CONSTRAINT [FK_NotificationEventContents_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[NotificationEventContents]  WITH CHECK ADD  CONSTRAINT [FK_NotificationEventContents_EventContents_EventContentId] FOREIGN KEY([EventContentId])
REFERENCES [dbo].[EventContents] ([EventContentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotificationEventContents] CHECK CONSTRAINT [FK_NotificationEventContents_EventContents_EventContentId]
GO
ALTER TABLE [dbo].[UserCourseDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserCourseDetails_AspNetUsers_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserCourseDetails] CHECK CONSTRAINT [FK_UserCourseDetails_AspNetUsers_DoctorId]
GO
ALTER TABLE [dbo].[UserCourseDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserCourseDetails_AspNetUsers_TeacherId] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserCourseDetails] CHECK CONSTRAINT [FK_UserCourseDetails_AspNetUsers_TeacherId]
GO
ALTER TABLE [dbo].[UserCourseDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserCourseDetails_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserCourseDetails] CHECK CONSTRAINT [FK_UserCourseDetails_Courses_CourseId]
GO
USE [master]
GO
ALTER DATABASE [OJTDb] SET  READ_WRITE 
GO
