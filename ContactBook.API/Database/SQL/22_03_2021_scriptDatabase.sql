USE [master]
GO
/****** Object:  Database [ContactBookDb]    Script Date: 3/22/2021 11:39:34 AM ******/
CREATE DATABASE [ContactBookDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContactBookDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ContactBookDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ContactBookDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ContactBookDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ContactBookDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContactBookDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContactBookDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContactBookDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContactBookDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContactBookDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContactBookDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContactBookDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContactBookDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContactBookDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContactBookDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContactBookDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContactBookDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContactBookDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContactBookDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContactBookDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContactBookDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ContactBookDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContactBookDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContactBookDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContactBookDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContactBookDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContactBookDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContactBookDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContactBookDb] SET RECOVERY FULL 
GO
ALTER DATABASE [ContactBookDb] SET  MULTI_USER 
GO
ALTER DATABASE [ContactBookDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContactBookDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContactBookDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContactBookDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ContactBookDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ContactBookDb', N'ON'
GO
ALTER DATABASE [ContactBookDb] SET QUERY_STORE = OFF
GO
USE [ContactBookDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/22/2021 11:39:34 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/22/2021 11:39:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/22/2021 11:39:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/22/2021 11:39:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/22/2021 11:39:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/22/2021 11:39:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Dob] [datetime2](7) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](100) NOT NULL,
	[AvatarPath] [nvarchar](200) NOT NULL,
	[CourseId] [int] NULL,
	[StatusId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/22/2021 11:39:35 AM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[TeacherId] [nvarchar](450) NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherCourse]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherCourse](
	[AccountId] [nvarchar](450) NOT NULL,
	[CourseId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[CourseId] ASC,
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherSubject](
	[AccountId] [nvarchar](450) NOT NULL,
	[SubjectId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transcript]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transcript](
	[TranscriptId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [nvarchar](450) NULL,
	[SubjectId] [int] NOT NULL,
	[Coefficient] [int] NOT NULL,
	[Score] [float] NOT NULL,
	[GeneratebBy] [nvarchar](450) NOT NULL,
	[GeneratebDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TranscriptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wiki]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wiki](
	[TableId] [int] NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210303070347_InitIdentityTable', N'5.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210303083037_EditColumnUserTable', N'5.0.0')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'291cbc7f-1345-45df-b8c2-96111d13ad60', N'System Admin', N'SYSTEM ADMIN', N'7f1afc1e-eb95-4455-b6b9-301e5fc46ac4')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'947b70ee-4b80-4299-a3e4-b03df15501c1', N'GVCN', N'TEACHERMASTER', N'ead43932-327f-411e-9313-bc399e503d22')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e346ef58-52dd-485d-92a3-25a64144bdfa', N'Học sinh', N'STUDENT', N'b5591e23-dda4-4788-a3b6-1fb3b1f07d04')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f7e3b187-7743-4c11-a73f-398fe418acd1', N'Giáo viên', N'TEACHER', N'5836f016-3405-4b44-b692-44cf861babb0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e695c485-5dda-4377-a407-5f3f2d475257', N'291cbc7f-1345-45df-b8c2-96111d13ad60')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e695c485-5dda-4377-a407-5f3f2d475257', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'06b12f97-bb16-434a-9982-e3d3dc1c5145', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'61aa0de3-9743-47c5-b9b6-759ee51a1d07', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6d1cb520-b8ad-44d9-b641-00f2e93141fa', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7c4ac2b8-4156-4e08-9167-5715d3f7d410', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'814ebb12-4853-46e6-854b-87b5eb32d667', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8919cdee-d42b-4bec-96b6-b748bea915fd', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9f8d058f-e006-476a-b6cc-e684620fb465', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a7f3ca3d-d87a-4b8d-be1f-d3403704084f', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b60a3d4c-4327-47a4-99ee-02ca55f8b8f2', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c71b7a6c-bba2-4fbb-b71c-91381259728b', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ca9bb1f9-2a13-4f7a-ba46-29d12828150a', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd91c232a-13a5-4987-a295-07a97fab9aaa', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f588ba4b-d99d-47b7-8b1a-87ebdaab5190', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c372e079-b530-4682-98fa-87db8d7b09a5', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'06b12f97-bb16-434a-9982-e3d3dc1c5145', N'Lê Tâm', CAST(N'1997-02-01T00:00:00.0000000' AS DateTime2), 0, N'9 Đống Đa', CAST(N'2021-03-10T13:46:39.9147781' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-17T11:53:55.5466667' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'657a0606-389a-4d17-93ba-d43888dc7e4d_Img3.png', 1, 1, N'letam@gmail.com', N'LETAM@GMAIL.COM', N'letam@gmail.com', N'LETAM@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFeK0xdD6W0eTqf0x50qZP9ehc/L+FJ4v2tCreXqgi3AG5UW9Ic5goGx0Au+x36nkw==', N'BTFLOW7SMABRH5NRMC5Z2YUWDKJXXIDF', N'4fa3e31f-53e7-4e42-9e90-6c6094cb85dc', N'0903444555', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Trần Hoàng', CAST(N'1996-05-09T00:00:00.0000000' AS DateTime2), 1, N'3 Le Quy Don', CAST(N'2021-03-04T11:16:46.1900252' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-15T14:58:35.2433333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'tranhoang@gmail.com', N'TRANHOANG@GMAIL.COM', N'tranhoang@gmail.com', N'TRANHOANG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMmp2xyewP67bhU3nIdfocPAw/RqZAW2T2qeib3E4lD9hikhYYzPiHalKO4vNt/+oQ==', N'IIJLNJSINEFA7Q2UEIO4QHTILV5PC5NC', N'0c0822f7-29dc-4906-a023-b2a9cb63d02d', N'0903517777', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', N'Nguyễn Khoa', CAST(N'1994-12-06T00:00:00.0000000' AS DateTime2), 1, N'1 Hùng Vương', CAST(N'2021-03-09T16:50:06.6639290' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-09T16:50:06.6639242' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'203eafdf-d98d-4acb-8722-cc95fda8e343_Img4.png', 2, 1, N'nguyenkhoa@gmail.com', N'NGUYENKHOA@GMAIL.COM', N'nguyenkhoa@gmail.com', N'NGUYENKHOA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEH+ESg+QtUz/DAGxzZu3SMMnft8f5UAKMPiTWrdknivk9kFcB1lWnhSI1omNUB1z5g==', N'UQIIDPCCFLFUGF7YEMM2JGLK7VJMTTHR', N'3d9bcfef-277f-4a82-8cbb-3487e43c08bc', N'0907888888', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'Vũ Nhân', CAST(N'1990-02-11T00:00:00.0000000' AS DateTime2), 1, N'4 Le Quy Don', CAST(N'2021-03-04T11:18:13.0156260' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-11T15:34:15.7700000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'vunhan@gmail.com', N'VUNHAN@GMAIL.COM', N'vunhan@gmail.com', N'VUNHAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEISDYgOuEr5QKTGJOr3T65x6RfgRfMOxGz28ywGksncejHGCffppgoGnRTm7M2QROw==', N'566LUNEJM7KD5A5UD2QK4BMCLJTKEJEZ', N'e2b2acd8-f254-46c0-b649-aa6c26eccdf7', N'0903519999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', N'Trần Tuấn', CAST(N'1997-01-05T00:00:00.0000000' AS DateTime2), 1, N'2 Hùng Vương', CAST(N'2021-03-10T11:40:06.0010770' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:40:33.1666667' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'c6a05831-2b68-4aed-b370-bff9fe826923_Img4.png', 1, 1, N'trantuan@gmail.com', N'TRANTUAN@GMAIL.COM', N'trantuan@gmail.com', N'TRANTUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEH9oR49EecsNoX5BKSTjatbm0WzOk8CRYOnHBQq7pupC9U2UgeLxxRMyEqfP0Dy70w==', N'ZFB4B2QDD2EQ22TXVE62RBO6RN5OM2BL', N'73c69f62-b159-4cd5-823f-ab5381a8f791', N'0903519600', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'61aa0de3-9743-47c5-b9b6-759ee51a1d07', N'Hồ Quang Hiếu', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), 1, N'10 Bà Triệu', CAST(N'2021-03-10T14:56:55.2567620' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T11:25:07.2733333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'fede514c-e152-41be-b62b-5cbe5362483c_Img6.png', 3, 1, N'quanghieu@gmail.com', N'QUANGHIEU@GMAIL.COM', N'quanghieu@gmail.com', N'QUANGHIEU@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOhhZ9ZnW1xvM6rLCXfIyivY1Q7OhMZB4UfU7FtZCGmYr97en173mlRdWqn4eV3xFw==', N'A55EGS74VCLFUKSYDZURUVILWC7P2JQY', N'79c975da-ca59-4761-bc4f-b52da5af3767', N'0909999999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6d1cb520-b8ad-44d9-b641-00f2e93141fa', N'Nguyễn Danh', CAST(N'1992-05-05T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương', CAST(N'2021-03-11T13:53:20.5506219' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-11T13:53:20.5506158' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'60bb5d94-b907-4d49-83ac-9920becfbebb_Img1.png', 3, 1, N'nguyendanh@gmail.com', N'NGUYENDANH@GMAIL.COM', N'nguyendanh@gmail.com', N'NGUYENDANH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJ9d3xVCeL9BoJzBZWnCCurkgEZqUG7gyv9lc0tuamOtB086JWHHZws63sCuZDbIdg==', N'NRZPI6IHUBNAPSMHM5AZK5QUOAWF6GNN', N'c07428c5-b218-45a0-9514-9a8bb6231ac4', N'0909556666', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7c4ac2b8-4156-4e08-9167-5715d3f7d410', N'Phan Long', CAST(N'1997-02-05T00:00:00.0000000' AS DateTime2), 1, N'2 Le Quy Don', CAST(N'2021-03-04T11:15:06.3237620' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T11:48:20.3600000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'd4fad05d-d852-44da-bf8f-c16430f85075_Img1.png', 1, 1, N'phanlong@gmail.com', N'PHANLONG@GMAIL.COM', N'phanlong@gmail.com', N'PHANLONG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDxshQf0REnc3mMeEXCf/uBIBgeV48NP6lQK6gURwUaVmzhHAjpPRKBq1ni3EdBEXQ==', N'SWSPI6ZPK2GLKI25XR2Z3II6TCUZ6HUU', N'9ace1c7f-d6de-4eb8-b78d-829f48775bd6', N'0903518888', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'814ebb12-4853-46e6-854b-87b5eb32d667', N'Nguyễn Minh Anh', CAST(N'1997-02-02T00:00:00.0000000' AS DateTime2), 0, N'1 Nguyễn Trãi', CAST(N'2021-03-10T13:48:55.4528358' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:48:55.4528279' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'a14ecdef-3cac-4233-a2d1-88b82d02c318_Img1.png', 1, 1, N'minhanh@gmail.com', N'MINHANH@GMAIL.COM', N'minhanh@gmail.com', N'MINHANH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEArrxaFsPcIA2int3uORlrhD3Et/xjy5IjzFcoieLkez434/7zAqEReaAtOfuRTZsg==', N'MUV3PTUOIR5DHCRQHYNAC5VASCWLUKTO', N'a1c48c82-10fb-4635-90a5-919193e1fa85', N'0903222444', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8919cdee-d42b-4bec-96b6-b748bea915fd', N'Trần Ngọc Vinh', CAST(N'1994-08-05T00:00:00.0000000' AS DateTime2), 0, N'9 Lê Quý Đôn', CAST(N'2021-03-09T15:43:13.6721818' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:45:14.8066667' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'dbb0cae5-a126-44b3-a0cc-2fd536153241_Img6.png', 2, 1, N'vinhtran@gmail.com', N'VINHTRAN@GMAIL.COM', N'vinhtran@gmail.com', N'VINHTRAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPAaQwbOIWg0ZKpMNSzCCCZez5eIYZUgmXo8DUgmIH9mDKSeGkDSCOXD5iPESsGTxg==', N'QMXTWWNHFB6OH7CQJYHAEX2J7DHEGRQP', N'ed134057-78cc-44a2-92a1-a4dae0529bb8', N'0903888999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9f8d058f-e006-476a-b6cc-e684620fb465', N'Trần Minh Khoa', CAST(N'1997-05-05T00:00:00.0000000' AS DateTime2), 1, N'5 Lê Lợi', CAST(N'2021-03-10T13:50:59.4831020' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:50:59.4830966' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'fa02f227-2edf-4abb-b10d-c955c422ce03_Img5.png', 1, 1, N'minhkhoa@gmail.com', N'MINHKHOA@GMAIL.COM', N'minhkhoa@gmail.com', N'MINHKHOA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEv0c/DXeMc8KlmCEQUR8uVjvQs3b8EA2CEDdFD+GWu6AggTEelFQUgFtlYdq0pi2w==', N'G2B7OGSYDE4JIWTNNCEQ5VC6KDZDDLBH', N'dbeb4ca2-8305-48cf-8c7c-bdebcdb27ee3', N'0903777888', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', N'Lê Lương Long', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-11T13:56:01.4332241' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-11T16:47:36.0100000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'luonglong@gmail.com', N'LUONGLONG@GMAIL.COM', N'luonglong@gmail.com', N'LUONGLONG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEE+RcVAFdaNTJLD5X3ernKRHS4mexerYAlu2pCZdmJAdruWj86JY8JeXmqjRAezeKw==', N'Y3FTUTB4GSRN6Q6BFOA2LVIKIHP23XMW', N'0d85fc5f-9b01-4c14-a518-0da4ac3a221a', N'0909999995', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a7f3ca3d-d87a-4b8d-be1f-d3403704084f', N'Nguyễn Văn Hoàng', CAST(N'1999-02-01T00:00:00.0000000' AS DateTime2), 1, N'6 Bến Nghé', CAST(N'2021-03-10T13:57:01.7670102' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:57:40.4700000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'e25ba5f2-7d6e-4a28-84d0-77c310bdd84b_Img2.png', 1, 1, N'vanhoang@gmail.com', N'VANHOANG@GMAIL.COM', N'vanhoang@gmail.com', N'VANHOANG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKtJ7Z9UOBnq2sFXY2+k3eCnlFIYe626sd0sGtywaL+8KAFLma4H5ml9v9SyxxS07w==', N'HAZZK2YHTFSFOOFC3C6XWKAFSWAUWID3', N'e3d45050-4897-47eb-aefd-789a7b329399', N'0905333333', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b60a3d4c-4327-47a4-99ee-02ca55f8b8f2', N'Hồng Sơn', CAST(N'1993-12-05T00:00:00.0000000' AS DateTime2), 1, N'7 Lê Quý Đôn', CAST(N'2021-03-09T13:34:43.2552688' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:58:14.0000000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'069af999-79a0-4fda-860f-9bc153a23f02_Img1.png', 3, 1, N'hongson@gmail.com', N'HONGSON@GMAIL.COM', N'hongson@gmail.com', N'HONGSON@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBCVxFoHpj4MpykSlZgHh29Hrm57+D7F9abzgwmIYfQSwk1mNADXo1Nv51dDUAMVwg==', N'J2IC4L7QEGE73TJVHKUT3XBOVUXTLZDE', N'87fcc3be-64bb-4069-a402-5de50abd4ad6', N'0707777777', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c372e079-b530-4682-98fa-87db8d7b09a5', N'Trần Trung Quân', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-11T13:58:19.6422228' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-11T16:47:47.6933333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'trungquan@gmail.com', N'TRUNGQUAN@GMAIL.COM', N'trungquan@gmail.com', N'TRUNGQUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAED6OyiJhXl5ZeD3L8DXUSctQxrO05M7YuaNpPZBn0xuJznwhnrnXY+QkBfyPk5V/qg==', N'I3IECRJRFMOQ4GMPP57JAGC2OV6BJUUW', N'8bc833ea-9590-4572-971a-25e44890ca11', N'0909999944', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', N'Nguyễn Hữu Anh Khoa', CAST(N'1990-05-05T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương', CAST(N'2021-03-11T14:07:53.8224345' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-15T13:45:56.0333333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'872a5718-baa8-4e85-bfd0-75da80830b3e_Img6.png', 0, 1, N'anhkhoa@gmail.com', N'ANHKHOA@GMAIL.COM', N'anhkhoa@gmail.com', N'ANHKHOA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENcKfSgv3BGSlaYQOTcgEfcwXVSuPiJ5x3TVPXh3uBEOg/zpVOdS2ELOCzbdBqmJiA==', N'H2QXSOAUAXZEXYSJPSGC3PWA4V3CVUWY', N'0064884c-b5dd-4ded-a8d2-4a9756cab4dd', N'0909999999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c71b7a6c-bba2-4fbb-b71c-91381259728b', N'Minh Tân', CAST(N'1998-12-15T00:00:00.0000000' AS DateTime2), 1, N'11 Lê Quý Đôn', CAST(N'2021-03-09T16:38:24.1467631' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T15:10:14.2333333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'c497a526-61ca-4545-9097-ba590a6d8c1c_Img2.png', 3, 1, N'minhtan@gmail.com', N'MINHTAN@GMAIL.COM', N'minhtan@gmail.com', N'MINHTAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEL8DArOPXET0zkFm4SR0M9H/1tQn5yUuS56X3aCwoCEChRMC4zyeIvfb/uPP86hH5A==', N'T6E6RVNH4GDT5XXGEKJOC6QMXKQRTEPR', N'9f646c72-bc3d-4c0e-b47c-54034bf1beab', N'0907455555', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ca9bb1f9-2a13-4f7a-ba46-29d12828150a', N'Nguyễn Mỹ', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), 1, N'5 Lê Quý Đôn - TP Huế', CAST(N'2021-03-09T13:00:00.9182896' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-09T13:00:00.9174132' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'c8234168-0e3a-4068-9941-55746f4a5187_Img2.png', 1, 1, N'nguyenmy@gmail.com', N'NGUYENMY@GMAIL.COM', N'nguyenmy@gmail.com', N'NGUYENMY@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMXq75rzNT1fo1lCyBinmVEx6rvqbg3noPuz5dezbt4K4in3kPN84gJMt9ZCy0PUVg==', N'6A2PIIRERPMFFMHZFXRLOPYYPWBMEJIA', N'd334c677-7a9f-4354-b389-b1eec0337ae3', N'0903518645', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd91c232a-13a5-4987-a295-07a97fab9aaa', N'Huy Hiệu', CAST(N'1996-05-01T00:00:00.0000000' AS DateTime2), 1, N'6 Lê Quý Đôn', CAST(N'2021-03-09T13:27:56.1637372' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-15T14:15:26.0133333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'0a61dd06-eb6f-44af-b870-0daee3d67da0_Img2.png', 2, 1, N'huyhieu@gmail.com', N'HUYHIEU@GMAIL.COM', N'huyhieu@gmail.com', N'HUYHIEU@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJ57QC/ZhgHuZ78SnCXF8wUFdcjr2IyKXvKnLYtCgfxFcIAe7kFP/Rid/oAKQSuyGw==', N'2756M2QKIU7R5OEPKKR6WSM2MWPBMNCY', N'b48da056-7609-4b21-82cd-4a9ca1339665', N'0903519612', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', N'Văn Vui', CAST(N'1995-10-06T00:00:00.0000000' AS DateTime2), 1, N'8 Lê Quý Đôn', CAST(N'2021-03-09T15:40:58.8824180' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-09T15:40:58.8821220' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'4e794afe-fefe-4c95-bcb9-5723c4e018b1_Img3.png', 2, 1, N'vanvui@gmail.com', N'VANVUI@GMAIL.COM', N'vanvui@gmail.com', N'VANVUI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOrhgRW7QBosSF6Uot78N6yJRlhe4hCGo2DT4iIjft15BAZxqHtZpiP/4IVift7Dxg==', N'HL5TCQWQY3ZZG5CWUK4JNLP2LGAXJMHK', N'444b7688-488b-4b8c-bf91-bdf4970787e5', N'0903511111', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e695c485-5dda-4377-a407-5f3f2d475257', N'Nguyễn Tùng', CAST(N'1995-10-19T00:00:00.0000000' AS DateTime2), 1, N'1 Le Quy Don', CAST(N'2021-03-04T11:05:28.7942853' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-04T11:05:28.7936683' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'superadmin@gmail.com', N'SUPERADMIN@GMAIL.COM', N'superadmin@gmail.com', N'SUPERADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIJqOcw60T9t6xd6YAcmvIbVQcux6YtvCXi61o4hWjDIZKsWAMFYNu8rPZ3wE43u5Q==', N'OPHYFG642T5JDZXE2JKTM6W5D255K6JC', N'ee7119b4-61ba-4c58-88b5-61e594966a5e', N'0903518999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f588ba4b-d99d-47b7-8b1a-87ebdaab5190', N'Đỗ Mỹ Linh', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), 0, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-09T13:42:55.7173097' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T10:38:50.6366667' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 3, 1, N'mylinh@gmail.com', N'MYLINH@GMAIL.COM', N'mylinh@gmail.com', N'MYLINH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEoMnNEIH17Y4ntWKSMbGAjohY1vk/t19dHFgc60v3WgQgCqO+VSdQZ+b2O0R08RWA==', N'6GCUARWO7VIVSBO2BICDWN52XPAWAVLL', N'1e62efd9-13b2-4e97-9aca-b30934389206', N'0903518655', 0, 0, NULL, 1, 0)
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (1, N'C01', N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5')
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (2, N'C02', N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8')
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (3, N'C03', N'e695c485-5dda-4377-a407-5f3f2d475257')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (1, N'Toán')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (2, N'Ngữ Văn')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (3, N'Tiếng Anh')
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', 1, 2)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 2, 2)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 3, 3)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', 2, 3)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'c372e079-b530-4682-98fa-87db8d7b09a5', 3, 2)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 1, 1)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 1, 3)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 2, 1)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', 1)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', 2)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 2)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 3)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', 1)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', 3)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c372e079-b530-4682-98fa-87db8d7b09a5', 2)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 1)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 2)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 3)
SET IDENTITY_INSERT [dbo].[Transcript] ON 

INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (1, N'8919cdee-d42b-4bec-96b6-b748bea915fd', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (3, N'8919cdee-d42b-4bec-96b6-b748bea915fd', 1, 2, 10, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (4, N'8919cdee-d42b-4bec-96b6-b748bea915fd', 1, 2, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (5, N'8919cdee-d42b-4bec-96b6-b748bea915fd', 1, 3, 10, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (6, N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', 1, 1, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:12:04.197' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (7, N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:12:41.423' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (8, N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:24:40.223' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (10, N'a7f3ca3d-d87a-4b8d-be1f-d3403704084f', 1, 1, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:45:14.200' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (11, N'a7f3ca3d-d87a-4b8d-be1f-d3403704084f', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:45:14.200' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (12, N'a7f3ca3d-d87a-4b8d-be1f-d3403704084f', 1, 1, 10, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:45:14.200' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (39, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 1, 1, 6.9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-17T08:11:39.997' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (40, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 1, 1, 8.7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-17T08:11:39.997' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (41, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 1, 1, 9.1, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-17T08:11:39.997' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (44, N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', 2, 1, 5, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T08:07:00.740' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (45, N'7c4ac2b8-4156-4e08-9167-5715d3f7d410', 2, 2, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T08:07:13.643' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (46, N'9f8d058f-e006-476a-b6cc-e684620fb465', 3, 1, 5.5, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T08:08:21.797' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (47, N'9f8d058f-e006-476a-b6cc-e684620fb465', 3, 3, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T08:08:34.723' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (49, N'7c4ac2b8-4156-4e08-9167-5715d3f7d410', 1, 1, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:14:53.520' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (52, N'9f8d058f-e006-476a-b6cc-e684620fb465', 1, 2, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:26:01.287' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (57, N'814ebb12-4853-46e6-854b-87b5eb32d667', 1, 1, 7.7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:29:51.733' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (58, N'814ebb12-4853-46e6-854b-87b5eb32d667', 1, 1, 8.9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:29:51.733' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (60, N'ca9bb1f9-2a13-4f7a-ba46-29d12828150a', 1, 1, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:40:00.223' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (61, N'ca9bb1f9-2a13-4f7a-ba46-29d12828150a', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:40:00.223' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (62, N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:40:59.767' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (63, N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', 1, 2, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:41:18.830' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (64, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 2, 2, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-19T16:36:54.373' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (65, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 3, 1, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-19T16:37:05.633' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (67, N'814ebb12-4853-46e6-854b-87b5eb32d667', 1, 2, 7.5, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T10:58:02.720' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (68, N'd91c232a-13a5-4987-a295-07a97fab9aaa', 1, 2, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T11:26:21.453' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (69, N'd91c232a-13a5-4987-a295-07a97fab9aaa', 1, 1, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T11:26:29.627' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transcript] OFF
INSERT [dbo].[Wiki] ([TableId], [TableName], [StatusId], [StatusName], [IsDeleted]) VALUES (1, N'User', 1, N'Bình thường', 0)
INSERT [dbo].[Wiki] ([TableId], [TableName], [StatusId], [StatusName], [IsDeleted]) VALUES (1, N'User', 2, N'Khóa', 0)
INSERT [dbo].[Wiki] ([TableId], [TableName], [StatusId], [StatusName], [IsDeleted]) VALUES (1, N'User', 4, N'Xóa', 0)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3/22/2021 11:39:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/22/2021 11:39:35 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3/22/2021 11:39:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3/22/2021 11:39:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3/22/2021 11:39:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/22/2021 11:39:35 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/22/2021 11:39:35 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [AvatarPath]
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
ALTER TABLE [dbo].[TeacherCourse]  WITH CHECK ADD  CONSTRAINT [FK_TeacherCourse_AspNetUsers] FOREIGN KEY([AccountId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TeacherCourse] CHECK CONSTRAINT [FK_TeacherCourse_AspNetUsers]
GO
ALTER TABLE [dbo].[TeacherCourse]  WITH CHECK ADD  CONSTRAINT [FK_TeacherCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[TeacherCourse] CHECK CONSTRAINT [FK_TeacherCourse_Course]
GO
ALTER TABLE [dbo].[TeacherCourse]  WITH CHECK ADD  CONSTRAINT [FK_TeacherCourse_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[TeacherCourse] CHECK CONSTRAINT [FK_TeacherCourse_Subject]
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Transcript]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Transcript]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeStatusUser]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 10/03/2021
-- Description:	Change status user: 1-Active, 2-Block, 3-Pending, 4-Deleted
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChangeStatusUser] 
	@AccountId NVARCHAR(450),
	@StatusId INT,
	@ModifiedBy NVARCHAR(100)
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Thao tác thay đổi trạng thái không thành công, vui lòng thử lại sau'
	DECLARE @Check INT = 0
	IF(EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Id = @AccountId AND StatusId <> 4))
	BEGIN
		IF(EXISTS(SELECT StatusId FROM Wiki WHERE TableId = 1 AND @StatusId = StatusId AND IsDeleted = 0))
		BEGIN
			IF(EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Id = @ModifiedBy AND StatusId = 1))
			BEGIN
				IF(@StatusId = 4 AND ((EXISTS(SELECT * FROM [dbo].[Course] WHERE TeacherId = @AccountId))
				OR(EXISTS(SELECT * FROM [dbo].[TeacherCourse] AS TC WHERE TC.AccountId = @AccountId))))
				BEGIN
					SET @Message = N'KHÔNG THỂ XÓA (Thông tin tài khoản vẫn còn được lưu thông tin trong trong lớp học)'
				END
				ELSE
				BEGIN
					DECLARE @StatusName NVARCHAR(50) = (SELECT TOP(1) StatusName FROM Wiki WHERE TableId = 1 AND StatusId = @StatusId)
					DECLARE @Email NVARCHAR(256) = (SELECT TOP(1) Email FROM [dbo].[AspNetUsers] WHERE Id = @AccountId)
					UPDATE [dbo].[AspNetUsers]
					   SET [ModifiedBy] = @ModifiedBy
						  ,[ModifiedDate] = GETDATE()
						  ,[StatusId] = @StatusId
					 WHERE Id = @AccountId
					 IF(@StatusId = 4)
					 BEGIN
						SET @Message = N'Xóa tài khoản: ' + @Email + ' thành công'
					 END
					 ELSE
					 BEGIN
						SET @Message = N'Thay đổi trạng thái tài khoản: ' + @Email + ' qua ' + @StatusName + ' thành công'
					 END
					 SET @Check = 1
				END
			END
			ELSE
			BEGIN
				SET @Message = N'Tài khoản người cập nhật không hợp lệ'
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Trạng thái muốn thay đổi không tồn tại'
		END
	END
	ELSE
	BEGIN
		SET @Message = N'Tài khoản không tồn tại hoặc đã bị xóa'
	END
	IF(@Check = 0)
	BEGIN
		SET @AccountId = NULL
	END
	SELECT @Message AS [Message] , @AccountId AS AccountId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckLoginUser]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 18/03/2021
-- Description:	Check login user
-- =============================================
CREATE PROCEDURE [dbo].[sp_CheckLoginUser]    
	@Email NVARCHAR(256)
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	IF(EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Email = @Email))
	BEGIN
		IF(EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Email = @Email AND StatusId = 1))
		BEGIN
			SET @Message = N'Tài khoản đang ở trạng thái hoạt động bình thường'
		END
		ELSE
		BEGIN
			SET @Message = N'Tài khoản đã bị vô hiệu'
			SET @Email = NULL
		END
	END
	ELSE
	BEGIN
		SET @Message = N'Tài khoản không tồn tại'
		SET @Email = NULL
	END
		
	SELECT @Message AS [Message], @Email AS Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckSaveUser]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 08/03/2021
-- Description:	Check validity request user
-- =============================================
CREATE PROCEDURE [dbo].[sp_CheckSaveUser]  
	@AccountId NVARCHAR(450),
	@Email NVARCHAR(256),
	@FullName NVARCHAR(100),
	@PhoneNumber NVARCHAR(100),
	@Dob DATE,
	@Address NVARCHAR(200),
	@AvatarPath NVARCHAR(200),
	@ModifiedBy NVARCHAR(100),
	@CourseId INT = NULL,
	@RoleId NVARCHAR(450),
	@Subjects NVARCHAR(200) = NULL
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	DECLARE @Check BIT = 0

	

----Check course and subjects
	IF(ISNULL(@Email,'0') <> '0' OR @Email <> '')
	BEGIN
		IF(ISNULL(@FullName,'0') <> '0' OR @FullName <> '')
		BEGIN
			IF(ISNULL(@PhoneNumber,'0') <> '0' OR @PhoneNumber <> '')
			BEGIN
				IF(DATEDIFF(YEAR, CONVERT(DATE,@Dob), GETDATE()) >= 5)
				BEGIN
					IF(ISNULL(@Address,'0') <> '0' OR @Address <> '')
					BEGIN
						IF(ISNULL(@AvatarPath,'0') <> '0' OR @AvatarPath <> '')
						BEGIN
							IF(EXISTS(SELECT * FROM [dbo].[AspNetRoles] WHERE Id = @RoleId AND Id != '291cbc7f-1345-45df-b8c2-96111d13ad60'))
							BEGIN

-------------------------------------
	--Check Course valid
	DECLARE @MessageCheck NVARCHAR(200)
	DECLARE @CheckCourse BIT = 0
	IF(ISNULL(@CourseId, 0) <> 0 AND (EXISTS(SELECT CourseId FROM Course WHERE CourseId = @CourseId)))
	BEGIN
		SET @CheckCourse = 1
	END
	ELSE IF(ISNULL(@CourseId, 0) = 0)
	BEGIN
		SET @CheckCourse = 1
	END
	ELSE
	BEGIN
		SET @MessageCheck = N'Mã lớp không hợp lệ'
	END
	--Check Subjects valid
	DECLARE @CheckSubjects BIT = 0
	DECLARE @tbSubjectId TABLE(SubjectId INT)
	DECLARE @SubjectId INT
	INSERT INTO @tbSubjectId SELECT value FROM STRING_SPLIT (@Subjects , ',' ) 
	WHILE(EXISTS(SELECT * FROM @tbSubjectId))
	BEGIN
		SET @SubjectId = CONVERT(INT,(SELECT TOP(1) SubjectId FROM @tbSubjectId))
		IF(NOT EXISTS (SELECT SubjectId FROM [Subject] WHERE @SubjectId = SubjectId))
		BEGIN
			SET @CheckSubjects = 0
			BREAK  
		END
		ELSE
		BEGIN
			SET @CheckSubjects = 1
		END
		DELETE FROM @tbSubjectId WHERE SubjectId = @SubjectId
	END

	IF((ISNULL(@Subjects, '0') <> '0' OR @Subjects = '') AND @CheckSubjects = 1)
	BEGIN
		SET @CheckSubjects = 1
	END
	ELSE IF(ISNULL(@Subjects, '0') = '0')
	BEGIN
		SET @CheckSubjects = 1
	END
	ELSE
	BEGIN
		SET @MessageCheck += N'Danh sách môn dạy không hợp lệ'
	END
--------------------------------------------
IF(@CheckCourse = 1 AND @CheckSubjects = 1)
BEGIN

								IF(ISNULL(@AccountId,'0') = '0' OR @AccountId = '')
								BEGIN
								--CHECK CREATE USER
										IF(NOT EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Email = @Email))
										BEGIN
											IF(ISNULL(@ModifiedBy,'0') <> '0' OR @ModifiedBy <> '')
											BEGIN
												SET @Message = N'Thao tác tạo mới Tài khoản có thể bắt đầu'
												SET @Check = 1
											END
											ELSE
											BEGIN
												SET @Message = N'Mã ID người tạo không được để trống'
											END
										END
										ELSE
										BEGIN
											SET @Message = N'Email đã tồn tại'
										END
									END
									ELSE
								--CHECK UPDATE USER
									BEGIN
										IF(EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Id = @AccountId))
										BEGIN
											IF(NOT EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Email = @Email AND Id <> @AccountId))
											BEGIN
												IF(ISNULL(@ModifiedBy,'0') <> '0' OR @ModifiedBy <> '')
												BEGIN
													SET @Check = 1
												END
												ELSE
												BEGIN
													SET @Message = N'Mã ID người sửa không được để trống'
												END
											END
											ELSE
											BEGIN
												SET @Message = N'Email đã tồn tại'
											END
										END
										ELSE
										BEGIN
											SET @Message = N'Mã ID của tài khoản không tồn tại'
										END
									END
END
ELSE
BEGIN
	SET @Message = @MessageCheck
END

							END
							ELSE
							BEGIN
								SET @Message = N'Mã ID Role không tồn tại'
							END
						END
						ELSE
						BEGIN
							SET @Message = N'File ảnh đại diện không được để trống'
						END
					END
					ELSE
					BEGIN
						SET @Message = N'Thông tin Địa chỉ không được để trống'
					END
				END
				ELSE
				BEGIN
					SET @Message = N'Ngày sinh không hợp lệ (số tuổi phải lớn hơn bằng 5 )'
				END
			END
			ELSE
			BEGIN
				SET @Message = N'Số điện thoại không được để trống'
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Họ và tên không được để trống'
		END
	END
	ELSE
	BEGIN
		SET @Message = N'Email không được để trống'
	END

	IF(@Check = 0)
	BEGIN
		SET @Email = NULL
	END

	SELECT @Message AS [Message], @Email AS Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllTeachers]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 10/03/2021
-- Description:	Get all teacher 
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllTeachers]
AS
BEGIN
	SELECT * FROM						 
		(SELECT ANU.[Id] AS AccountId
				,ANU.[UserName]
				,ANU.[Email]
				,ANU.[PhoneNumber]
				,ANU.[FullName]
				,ANU.[Gender]
				,ANU.[Dob]
				,FORMAT(ANU.[Dob],'dd-MM-yyyy') AS DobStr
				,ANU.[Address]
				,ANU.[StatusId]
				,(SELECT TOP(1) W.StatusName FROM Wiki AS W WHERE W.TableId = 1 AND W.StatusId = ANU.[StatusId]) AS StatusName
				,ANU.[AvatarPath]
				,ANU.[CreatedDate]
				,FORMAT(ANU.[CreatedDate],'dd-MM-yyyy hh:mm tt') AS CreatedDateStr
				,ANU.[CreatedBy]
				,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[CreatedBy]) AS CreatedByName
				,ANU.[ModifiedBy]
				,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[ModifiedBy]) AS ModifiedByName
				,ANU.[ModifiedDate]
				,FORMAT(ANU.[ModifiedDate],'dd-MM-yyyy hh:mm tt') AS ModifiedDateStr
				,(SELECT TOP(1) UR.RoleId FROM [dbo].[AspNetUserRoles] AS UR WHERE UR.UserId = ANU.[Id]) AS RoleId
				,(SELECT TOP(1) R.[Name] FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
																	WHERE UR.UserId = ANU.Id) AS RoleName
				,(SELECT TOP(1) TeacherSubject.SubjectName FROM
						(SELECT	U.Id,
							STRING_AGG(S.SubjectName, ', ') WITHIN GROUP(ORDER BY SubjectName) AS SubjectName
							FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
															INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
							GROUP BY U.Id
							HAVING U.Id = ANU.Id) AS TeacherSubject) AS SubjectsStr
				,(SELECT TOP(1) TeacherSubject.SubjectId FROM
						(SELECT	U.Id,
							STRING_AGG(S.SubjectId, ',') WITHIN GROUP(ORDER BY SubjectName) AS SubjectId
							FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
															INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
							GROUP BY U.Id
							HAVING U.Id = ANU.Id) AS TeacherSubject) AS SubjectIds
				,(SELECT TOP(1) TeacherCourse.CourseName FROM
						(SELECT	U.Id,
							STRING_AGG(C.CourseName, ', ') WITHIN GROUP(ORDER BY CourseName) AS CourseName
							FROM [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId
															INNER JOIN [dbo].[AspNetUsers] AS U ON TC.AccountId = U.Id
							GROUP BY U.Id
							HAVING U.Id = ANU.Id) AS TeacherCourse) AS Courses
				 ,(SELECT TOP(1) C.CourseName FROM [dbo].[Course] AS C WHERE C.TeacherId = ANU.Id) AS Responsible
			FROM [dbo].[AspNetUsers] AS ANU
			WHERE ANU.StatusId <> 4 AND ANU.Id <> 'e695c485-5dda-4377-a407-5f3f2d475257' AND (ANU.CourseId IS NULL OR ANU.CourseId = 0)) AS Teacher
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCourse]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tung Nguyen
-- Create date: 12/03/2021
-- Description:	Get course by courseId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCourse] 
	@CourseId INT
AS
BEGIN
	SELECT [CourseId]
		  ,[CourseName]
		  ,(SELECT TOP(1) U.FullName FROM [dbo].[AspNetUsers] AS U WHERE U.Id = C.TeacherId) AS TeacherName
		  ,(SELECT COUNT(U.Id) FROM [dbo].[AspNetUsers] AS U WHERE C.CourseId = U.CourseId) AS Member
	  FROM [dbo].[Course] AS C
	  WHERE C.CourseId = @CourseId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCourseControlTeacher]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tung Nguyen
-- Create date: 18/03/2021
-- Description:	Get courses by accountId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCourseControlTeacher]
	@TeacherId NVARCHAR(450),
	@SubjectId INT = NULL
AS
BEGIN
	IF(EXISTS(SELECT * FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
						WHERE UR.UserId = @TeacherId AND R.[Name] = 'System Admin'))
	BEGIN
		SELECT [CourseId]
			  ,[CourseName]
			  --,(SELECT TOP(1) U.FullName FROM [dbo].[AspNetUsers] AS U WHERE U.Id = C.TeacherId) AS TeacherName
			  --,(SELECT COUNT(U.Id) FROM [dbo].[AspNetUsers] AS U WHERE C.CourseId = U.CourseId) AS Member
		  FROM [dbo].[Course] AS C
	END
	ELSE
	BEGIN
		SELECT	 C.[CourseId]
				,C.[CourseName]
				--,(SELECT TOP(1) U.FullName FROM [dbo].[AspNetUsers] AS U WHERE U.Id = C.TeacherId) AS TeacherName
				--,(SELECT COUNT(U.Id) FROM [dbo].[AspNetUsers] AS U WHERE C.CourseId = U.CourseId) AS Member
		FROM	[dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId
		WHERE	TC.SubjectId = @SubjectId AND TC.AccountId = @TeacherId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCourses]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tung Nguyen
-- Create date: 04/03/2021
-- Description:	Get all course
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCourses] 
AS
BEGIN
	SELECT [CourseId]
		  ,[CourseName]
		  ,(SELECT TOP(1) U.FullName FROM [dbo].[AspNetUsers] AS U WHERE U.Id = C.TeacherId) AS TeacherName
		  ,(SELECT COUNT(U.Id) FROM [dbo].[AspNetUsers] AS U WHERE C.CourseId = U.CourseId) AS Member
	  FROM [dbo].[Course] AS C
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCoursesTeaching]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tung Nguyen
-- Create date: 22/03/2021
-- Description:	Get courses teaching by accountId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCoursesTeaching]
	@TeacherId NVARCHAR(450)
AS
BEGIN
	IF(EXISTS(SELECT * FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
						WHERE UR.UserId = @TeacherId AND R.[Name] = 'System Admin'))
	BEGIN
		SELECT [CourseId]
			  ,[CourseName]
			  ,(SELECT TOP(1) U.FullName FROM [dbo].[AspNetUsers] AS U WHERE U.Id = C.TeacherId) AS TeacherName
			  ,(SELECT COUNT(U.Id) FROM [dbo].[AspNetUsers] AS U WHERE C.CourseId = U.CourseId) AS Member
		  FROM [dbo].[Course] AS C
	END
	ELSE
	BEGIN
		SELECT	DISTINCT C.[CourseId]
				,C.[CourseName]
				,(SELECT TOP(1) U.FullName FROM [dbo].[AspNetUsers] AS U WHERE U.Id = C.TeacherId) AS TeacherName
				,(SELECT COUNT(U.Id) FROM [dbo].[AspNetUsers] AS U WHERE C.CourseId = U.CourseId) AS Member
		FROM	[dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId
		WHERE	TC.AccountId = @TeacherId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCourseTeacherSubject]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 12/03/2021
-- Description:	Get all teacher + subject in course by courseId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCourseTeacherSubject]
	@CourseId INT
AS
BEGIN
	SELECT S.SubjectId
		  ,S.SubjectName 
		  ,TCS.TeacherId
		  ,TCS.TeacherName
		  ,TCS.Email
		  ,TCS.PhoneNumber
		  ,TCS.AvatarPath 
	FROM [Subject] AS S LEFT JOIN 
		(SELECT  ANU.Id AS TeacherId
				,ANU.FullName AS TeacherName
				,ANU.Email
				,ANU.PhoneNumber
				,ANU.AvatarPath 
				,TC.CourseId
				,TC.SubjectId
		 FROM  [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[AspNetUsers] AS ANU ON TC.AccountId = ANU.Id 
				WHERE TC.CourseId = @CourseId) AS TCS ON S.SubjectId = TCS.SubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDetailsStudentPoint]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 22/03/2021
-- Description:	Get all student point by studentId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetDetailsStudentPoint] 
	@StudentId NVARCHAR(450)
AS
BEGIN
	DECLARE @CourseId INT = (SELECT TOP 1 CourseId FROM [dbo].[AspNetUsers] WHERE Id = @StudentId)
	SELECT S.SubjectId
		  ,S.SubjectName
		  ,(SELECT STRING_AGG(TT.Score, ', ') 
		  FROM [dbo].[Transcript] AS TT 
		  WHERE TT.Coefficient = 1 AND TT.SubjectId = S.SubjectId AND TT.AccountId = @StudentId
		  GROUP BY TT.SubjectId) AS Coefficient1
		  ,(SELECT STRING_AGG(TT.Score, ', ') 
		  FROM [dbo].[Transcript] AS TT 
		  WHERE TT.Coefficient = 2 AND TT.SubjectId = S.SubjectId AND TT.AccountId = @StudentId
		  GROUP BY TT.SubjectId) AS Coefficient2
		  ,(SELECT STRING_AGG(TT.Score, ', ') 
		  FROM [dbo].[Transcript] AS TT 
		  WHERE TT.Coefficient = 3 AND TT.SubjectId = S.SubjectId AND TT.AccountId = @StudentId
		  GROUP BY TT.SubjectId) AS Coefficient3
		  ,(SELECT ANU.FullName FROM [dbo].[TeacherCourse] AS TC 
											INNER JOIN [dbo].[AspNetUsers] AS ANU ON ANU.Id = TC.AccountId
									WHERE TC.CourseId = @CourseId AND TC.SubjectId = S.SubjectId) AS TeacherName
	FROM [dbo].[Subject] AS S LEFT JOIN [dbo].[Transcript] AS T ON S.SubjectId = T.SubjectId
	GROUP BY S.SubjectId, S.SubjectName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRoleId]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 10/03/2021
-- Description:	Get roleId by RoleName
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRoleId] 
	@RoleName NVARCHAR(200)
AS
BEGIN
	DECLARE @RoleId NVARCHAR(400) = (SELECT TOP(1) Id FROM [dbo].[AspNetRoles] WHERE [Name] = @RoleName AND [Name] <> 'System Admin') 
	SELECT @RoleId AS [RoleId]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRoles]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tung Nguyen
-- Create date: 04/03/2021
-- Description:	Get all role
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRoles] 
AS
BEGIN
	SELECT [Id] AS RoleId
		  ,[Name] AS RoleName
	  FROM [dbo].[AspNetRoles] AS R
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentPoint]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 17/03/2021
-- Description:	Get student point by studentId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetStudentPoint] 
	@StudentId NVARCHAR(450),
	@SubjectId INT
AS
BEGIN
	SELECT ANU.[Id] AS AccountId
			,ANU.[Email]
			,ANU.[FullName]
			,ANU.[Gender]
			,ANU.[Dob]
			,FORMAT(ANU.[Dob],'dd-MM-yyyy') AS DobStr
			,ANU.AvatarPath
			,ANU.PhoneNumber
			,(SELECT STRING_AGG(T.Score, ', ')
			FROM [dbo].[Transcript] AS T INNER JOIN [dbo].[AspNetUsers] AS U ON T.AccountId = U.Id
										INNER JOIN [dbo].[Subject] AS S ON T.SubjectId = S.SubjectId
			WHERE T.Coefficient = 1 AND T.SubjectId = @SubjectId
			GROUP BY U.Id
			HAVING U.Id = ANU.Id) AS Coefficient1	
			,(SELECT STRING_AGG(T.Score, ', ')
			FROM [dbo].[Transcript] AS T INNER JOIN [dbo].[AspNetUsers] AS U ON T.AccountId = U.Id
										INNER JOIN [dbo].[Subject] AS S ON T.SubjectId = S.SubjectId
			WHERE T.Coefficient = 2 AND T.SubjectId = @SubjectId
			GROUP BY U.Id
			HAVING U.Id = ANU.Id) AS Coefficient2
			,(SELECT STRING_AGG(T.Score, ', ')
			FROM [dbo].[Transcript] AS T INNER JOIN [dbo].[AspNetUsers] AS U ON T.AccountId = U.Id
										INNER JOIN [dbo].[Subject] AS S ON T.SubjectId = S.SubjectId
			WHERE T.Coefficient = 3 AND T.SubjectId = @SubjectId
			GROUP BY U.Id
			HAVING U.Id = ANU.Id) AS Coefficient3	
	  FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = @StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudents]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 10/03/2021
-- Description:	Get all student by courseId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetStudents]  
	@CourseId INT
AS
BEGIN
	BEGIN
		SELECT ANU.[Id] AS AccountId
		  ,ANU.[Email]
		  ,ANU.[PhoneNumber]
		  ,ANU.[FullName]
		  ,ANU.[Gender]
		  ,ANU.[Dob]
		  ,FORMAT(ANU.[Dob],'dd-MM-yyyy') AS DobStr
		  ,ANU.[Address]
		  ,ANU.[CourseId]
		  ,ANU.[StatusId]
		  ,(SELECT TOP(1) W.StatusName FROM Wiki AS W WHERE W.TableId = 1 AND W.StatusId = ANU.[StatusId]) AS StatusName
		  ,ANU.[AvatarPath]
		  ,ANU.[CreatedDate]
		  ,FORMAT(ANU.[CreatedDate],'dd-MM-yyyy hh:mm tt') AS CreatedDateStr
		  ,ANU.[CreatedBy]
		  ,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[CreatedBy]) AS CreatedByName
		  ,ANU.[ModifiedBy]
		  ,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[ModifiedBy]) AS ModifiedByName
		  ,ANU.[ModifiedDate]
		  ,FORMAT(ANU.[ModifiedDate],'dd-MM-yyyy hh:mm tt') AS ModifiedDateStr
		  ,(SELECT TOP(1) UR.RoleId FROM [dbo].[AspNetUserRoles] AS UR WHERE UR.UserId = ANU.[Id]) AS RoleId
		  ,(SELECT TOP(1) R.[Name] FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
																WHERE UR.UserId = ANU.Id) AS RoleName
	  FROM [dbo].[AspNetUsers] AS ANU
	  WHERE ANU.StatusId <> 4 AND ANU.CourseId = @CourseId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentsPointInCourse]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 16/03/2021
-- Description:	Get all student point in course by courseId + subjectId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetStudentsPointInCourse]   
	@CourseId INT,
	@SubjectId INT
AS
BEGIN
	SELECT ANU.[Id] AS AccountId
			,ANU.[Email]
			,ANU.[FullName]
			,ANU.[Gender]
			,ANU.[Dob]
			,FORMAT(ANU.[Dob],'dd-MM-yyyy') AS DobStr
			,(SELECT STRING_AGG(T.Score, ', ')
			FROM [dbo].[Transcript] AS T INNER JOIN [dbo].[AspNetUsers] AS U ON T.AccountId = U.Id
										INNER JOIN [dbo].[Subject] AS S ON T.SubjectId = S.SubjectId
			WHERE T.Coefficient = 1 AND T.SubjectId = @SubjectId
			GROUP BY U.Id
			HAVING U.Id = ANU.Id) AS Coefficient1	
			,(SELECT STRING_AGG(T.Score, ', ')
			FROM [dbo].[Transcript] AS T INNER JOIN [dbo].[AspNetUsers] AS U ON T.AccountId = U.Id
										INNER JOIN [dbo].[Subject] AS S ON T.SubjectId = S.SubjectId
			WHERE T.Coefficient = 2 AND T.SubjectId = @SubjectId
			GROUP BY U.Id
			HAVING U.Id = ANU.Id) AS Coefficient2
			,(SELECT STRING_AGG(T.Score, ', ')
			FROM [dbo].[Transcript] AS T INNER JOIN [dbo].[AspNetUsers] AS U ON T.AccountId = U.Id
										INNER JOIN [dbo].[Subject] AS S ON T.SubjectId = S.SubjectId
			WHERE T.Coefficient = 3 AND T.SubjectId = @SubjectId
			GROUP BY U.Id
			HAVING U.Id = ANU.Id) AS Coefficient3	
	  FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.CourseId = @CourseId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjects]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 11/03/2021
-- Description:	Get all subject
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSubjects]  
AS
BEGIN
	SELECT [SubjectId]
		  ,[SubjectName]
	  FROM [dbo].[Subject]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectTeachingInCourse]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tung Nguyen
-- Create date: 22/03/2021
-- Description:	Get subject teaching in course by accountId + courseId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSubjectTeachingInCourse]
	@TeacherId NVARCHAR(450),
	@CourseId INT
AS
BEGIN
	IF(EXISTS(SELECT * FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
						WHERE UR.UserId = @TeacherId AND R.[Name] = 'System Admin'))
	BEGIN
		SELECT [SubjectId]
			  ,[SubjectName]
		  FROM [dbo].[Subject]	
	END
	ELSE
	BEGIN
		SELECT S.[SubjectId]
			  ,S.[SubjectName]
		  FROM [dbo].[Subject] AS S INNER JOIN [dbo].[TeacherCourse] AS TC ON S.SubjectId = TC.SubjectId
		  WHERE TC.CourseId = @CourseId AND TC.AccountId = @TeacherId
	END
END



GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeacher]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 10/03/2021
-- Description:	Get teacher by accountId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTeacher]
	@AccountId NVARCHAR(450)
AS
BEGIN
	SELECT ANU.[Id] AS AccountId
				,ANU.[UserName]
				,ANU.[Email]
				,ANU.[PhoneNumber]
				,ANU.[FullName]
				,ANU.[Gender]
				,ANU.[Dob]
				,FORMAT(ANU.[Dob],'dd-MM-yyyy') AS DobStr
				,ANU.[Address]
				,ANU.[StatusId]
				,(SELECT TOP(1) W.StatusName FROM Wiki AS W WHERE W.TableId = 1 AND W.StatusId = ANU.[StatusId]) AS StatusName
				,ANU.[AvatarPath]
				,ANU.[CreatedDate]
				,FORMAT(ANU.[CreatedDate],'dd-MM-yyyy hh:mm tt') AS CreatedDateStr
				,ANU.[CreatedBy]
				,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[CreatedBy]) AS CreatedByName
				,ANU.[ModifiedBy]
				,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[ModifiedBy]) AS ModifiedByName
				,ANU.[ModifiedDate]
				,FORMAT(ANU.[ModifiedDate],'dd-MM-yyyy hh:mm tt') AS ModifiedDateStr
				,(SELECT TOP(1) UR.RoleId FROM [dbo].[AspNetUserRoles] AS UR WHERE UR.UserId = ANU.[Id]) AS RoleId
				,(SELECT TOP(1) R.[Name] FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
																	WHERE UR.UserId = ANU.Id) AS RoleName
				,(SELECT TOP(1) TeacherSubject.SubjectName FROM
						(SELECT	U.Id,
							STRING_AGG(S.SubjectName, ', ') WITHIN GROUP(ORDER BY SubjectName) AS SubjectName
							FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
															INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
							GROUP BY U.Id
							HAVING U.Id = ANU.Id) AS TeacherSubject) AS SubjectsStr
				,(SELECT TOP(1) TeacherSubject.SubjectId FROM
						(SELECT	U.Id,
							STRING_AGG(S.SubjectId, ',') WITHIN GROUP(ORDER BY SubjectName) AS SubjectId
							FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
															INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
							GROUP BY U.Id
							HAVING U.Id = ANU.Id) AS TeacherSubject) AS SubjectIds
				,(SELECT TOP(1) TeacherCourse.CourseName FROM
						(SELECT	U.Id,
							STRING_AGG(C.CourseName, ', ') WITHIN GROUP(ORDER BY CourseName) AS CourseName
							FROM [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId
															INNER JOIN [dbo].[AspNetUsers] AS U ON TC.AccountId = U.Id
							GROUP BY U.Id
							HAVING U.Id = ANU.Id) AS TeacherCourse) AS Courses
				,(SELECT TOP(1) C.CourseName FROM [dbo].[Course] AS C WHERE C.TeacherId = ANU.Id) AS Responsible
			FROM [dbo].[AspNetUsers] AS ANU
			WHERE ANU.Id = @AccountId AND ANU.StatusId <> 4 AND ANU.Id <> 'e695c485-5dda-4377-a407-5f3f2d475257' AND (ANU.CourseId IS NULL OR ANU.CourseId = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeacherMaster]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 05/03/2021
-- Description:	Get info user by Id
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTeacherMaster] 
	@CourseId INT
AS
BEGIN
	SELECT	U.FullName
		   ,U.PhoneNumber
		   ,U.Email
		   ,C.CourseName AS Courses
	FROM Course AS C INNER JOIN AspNetUsers AS U ON C.TeacherId = U.Id
	WHERE C.CourseId = @CourseId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeachersInCourse]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 10/03/2021
-- Description:	Get all teacher in course by courseId 
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTeachersInCourse]
	@CourseId INT
AS
BEGIN
	SELECT * FROM						 
		(SELECT ANU.[Id] AS AccountId
				,ANU.[UserName]
				,ANU.[Email]
				,ANU.[PhoneNumber]
				,ANU.[FullName]
				,ANU.[Gender]
				,ANU.[Dob]
				,FORMAT(ANU.[Dob],'dd-MM-yyyy') AS DobStr
				,ANU.[Address]
				,ANU.[StatusId]
				,(SELECT TOP(1) W.StatusName FROM Wiki AS W WHERE W.TableId = 1 AND W.StatusId = ANU.[StatusId]) AS StatusName
				,ANU.[AvatarPath]
				,ANU.[CreatedDate]
				,FORMAT(ANU.[CreatedDate],'dd-MM-yyyy hh:mm tt') AS CreatedDateStr
				,ANU.[CreatedBy]
				,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[CreatedBy]) AS CreatedByName
				,ANU.[ModifiedBy]
				,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[ModifiedBy]) AS ModifiedByName
				,ANU.[ModifiedDate]
				,FORMAT(ANU.[ModifiedDate],'dd-MM-yyyy hh:mm tt') AS ModifiedDateStr
				,(SELECT TOP(1) UR.RoleId FROM [dbo].[AspNetUserRoles] AS UR WHERE UR.UserId = ANU.[Id]) AS RoleId
				,(SELECT TOP(1) R.[Name] FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
																	WHERE UR.UserId = ANU.Id) AS RoleName
				,(SELECT TOP(1) TeacherSubject.SubjectName FROM
						(SELECT	U.Id,
							STRING_AGG(S.SubjectName, ', ') WITHIN GROUP(ORDER BY SubjectName) AS SubjectName
							FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
															INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
							GROUP BY U.Id
							HAVING U.Id = ANU.Id) AS TeacherSubject) Subjects
				,(SELECT TOP(1) TeacherCourse.CourseName FROM
						(SELECT	U.Id,
							STRING_AGG(C.CourseName, ', ') WITHIN GROUP(ORDER BY CourseName) AS CourseName
							FROM [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId
															INNER JOIN [dbo].[AspNetUsers] AS U ON TC.AccountId = U.Id
							GROUP BY U.Id
							HAVING U.Id = ANU.Id) AS TeacherCourse) AS Courses
			FROM [dbo].[AspNetUsers] AS ANU
			WHERE ANU.StatusId <> 3 AND ANU.Id <> 'e695c485-5dda-4377-a407-5f3f2d475257' AND ANU.CourseId IS NULL) AS Teacher
			INNER JOIN [dbo].[TeacherCourse] AS TC ON Teacher.AccountId = TC.AccountId
			WHERE TC.CourseId = @CourseId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeachersSubject]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 12/03/2021
-- Description:	Get all teacher by subjectId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTeachersSubject]
	@SubjectId INT
AS
BEGIN
	SELECT	 ANU.Id AS TeacherId
			,ANU.FullName AS TeacherName
	 FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[AspNetUsers] AS ANU
					ON TS.AccountId = ANU.Id
					WHERE TS.SubjectId = @SubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeacherSubjects]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 18/03/2021
-- Description:	Get subjects by accountId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTeacherSubjects]
	@TeacherId NVARCHAR(450)
AS
BEGIN
	IF(EXISTS(SELECT * FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
						WHERE UR.UserId = @TeacherId AND R.[Name] = 'System Admin'))
	BEGIN
		SELECT [SubjectId]
			  ,[SubjectName]
		  FROM [dbo].[Subject]
	END
	ELSE
	BEGIN
		SELECT	S.SubjectId
			   ,S.SubjectName
		 FROM	[dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
		WHERE	TS.AccountId = @TeacherId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 05/03/2021
-- Description:	Get info user by Id
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUser] 
	@AccountId NVARCHAR(450)
AS
BEGIN
	SELECT U.[Id] AS AccountId
		  ,U.[UserName]
		  ,U.[Email]
		  ,U.[PhoneNumber]
		  ,U.[FullName]
		  ,U.[Gender]
		  ,U.[Dob]
		  ,FORMAT(U.[Dob],'dd-MM-yyyy') AS DobStr
		  ,U.[Address]
		  ,U.[StatusId]
		  ,(SELECT TOP(1) W.StatusName FROM Wiki AS W WHERE W.TableId = 1 AND W.StatusId = U.[StatusId]) AS StatusName
		  ,U.[AvatarPath]
		  ,U.[CourseId]
		  ,(SELECT TOP(1) C.CourseName FROM Course AS C WHERE U.CourseId = C.CourseId) AS Courses
		  ,U.[CreatedDate]
		  ,FORMAT(U.[CreatedDate],'dd-MM-yyyy hh:mm tt') AS CreatedDateStr
		  ,U.[CreatedBy]
		  ,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = U.[CreatedBy]) AS CreatedByName
		  ,U.[ModifiedBy]
		  ,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = U.[ModifiedBy]) AS ModifiedByName
		  ,U.[ModifiedDate]
		  ,FORMAT(U.[ModifiedDate],'dd-MM-yyyy hh:mm tt') AS ModifiedDateStr
		  ,(SELECT TOP(1) UR.RoleId FROM [dbo].[AspNetUserRoles] AS UR WHERE UR.UserId = U.[Id]) AS RoleId
		  ,(SELECT  STRING_AGG(R.[Name], ', ') AS RoleName
				FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
													INNER JOIN [dbo].[AspNetUsers] AS ANU ON U.Id = UR.UserId
				GROUP BY ANU.Id
				HAVING ANU.Id = U.Id) AS RoleName
		  ,(SELECT TOP(1) TeacherSubject.SubjectName FROM
					(SELECT	U.Id,
					 STRING_AGG(S.SubjectName, ', ') WITHIN GROUP(ORDER BY SubjectName) AS SubjectName
				     FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
													   INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
					 GROUP BY U.Id
					 HAVING U.Id = @AccountId) AS TeacherSubject) SubjectsStr
		 ,(SELECT TOP(1) TeacherCourse.CourseName FROM
					(SELECT	U.Id,
					 STRING_AGG(C.CourseName, ', ') WITHIN GROUP(ORDER BY CourseName) AS CourseName
					 FROM [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId
													 INNER JOIN [dbo].[AspNetUsers] AS U ON TC.AccountId = U.Id
					 GROUP BY U.Id
					 HAVING U.Id = @AccountId) AS TeacherCourse) AS Courses
		,(SELECT TOP(1) C.CourseName FROM [dbo].[Course] AS C WHERE C.TeacherId = U.Id) AS Responsible
	  FROM [dbo].[AspNetUsers] AS U
	  WHERE U.StatusId <> 3 AND U.Id = @AccountId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsersInCourse]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 05/03/2021
-- Description:	Get all user by role name 
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUsersInCourse] 
	@CourseId INT,
	@RoleName NVARCHAR(200)
AS
BEGIN
	IF(@RoleName = 'Student')
	-- Get all student by courseId
	BEGIN
		SELECT ANU.[Id] AS AccountId
		  ,ANU.[UserName]
		  ,ANU.[Email]
		  ,ANU.[PhoneNumber]
		  ,ANU.[FullName]
		  ,ANU.[Gender]
		  ,ANU.[Dob]
		  ,FORMAT(ANU.[Dob],'dd-MM-yyyy') AS DobStr
		  ,ANU.[Address]
		  ,ANU.[StatusId]
		  ,(SELECT TOP(1) W.StatusName FROM Wiki AS W WHERE W.TableId = 1 AND W.StatusId = ANU.[StatusId]) AS StatusName
		  ,ANU.[AvatarPath]
		  ,ANU.[CreatedDate]
		  ,FORMAT(ANU.[CreatedDate],'dd-MM-yyyy hh:mm tt') AS CreatedDateStr
		  ,ANU.[CreatedBy]
		  ,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[CreatedBy]) AS CreatedByName
		  ,ANU.[ModifiedBy]
		  ,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[ModifiedBy]) AS ModifiedByName
		  ,ANU.[ModifiedDate]
		  ,FORMAT(ANU.[ModifiedDate],'dd-MM-yyyy hh:mm tt') AS ModifiedDateStr
		  ,(SELECT TOP(1) UR.RoleId FROM [dbo].[AspNetUserRoles] AS UR WHERE UR.UserId = ANU.[Id]) AS RoleId
		  ,(SELECT TOP(1) R.[Name] FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
																WHERE UR.UserId = ANU.Id) AS RoleName
	  FROM [dbo].[AspNetUsers] AS ANU
	  WHERE ANU.StatusId <> 3 AND ANU.CourseId = @CourseId
	END
	ELSE IF(@RoleName = 'Teacher')
	-- Get all teacher by courseId
	BEGIN 
		SELECT * FROM						 
			(SELECT ANU.[Id] AS AccountId
				  ,ANU.[UserName]
				  ,ANU.[Email]
				  ,ANU.[PhoneNumber]
				  ,ANU.[FullName]
				  ,ANU.[Gender]
				  ,ANU.[Dob]
				  ,FORMAT(ANU.[Dob],'dd-MM-yyyy') AS DobStr
				  ,ANU.[Address]
				  ,ANU.[StatusId]
				  ,(SELECT TOP(1) W.StatusName FROM Wiki AS W WHERE W.TableId = 1 AND W.StatusId = ANU.[StatusId]) AS StatusName
				  ,ANU.[AvatarPath]
				  ,ANU.[CreatedDate]
				  ,FORMAT(ANU.[CreatedDate],'dd-MM-yyyy hh:mm tt') AS CreatedDateStr
				  ,ANU.[CreatedBy]
				  ,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[CreatedBy]) AS CreatedByName
				  ,ANU.[ModifiedBy]
				  ,(SELECT TOP(1) ANU.UserName FROM [dbo].[AspNetUsers] AS ANU WHERE ANU.Id = ANU.[ModifiedBy]) AS ModifiedByName
				  ,ANU.[ModifiedDate]
				  ,FORMAT(ANU.[ModifiedDate],'dd-MM-yyyy hh:mm tt') AS ModifiedDateStr
				  ,(SELECT TOP(1) UR.RoleId FROM [dbo].[AspNetUserRoles] AS UR WHERE UR.UserId = ANU.[Id]) AS RoleId
				  ,(SELECT TOP(1) R.[Name] FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
																		WHERE UR.UserId = ANU.Id) AS RoleName
				  ,(SELECT TOP(1) TeacherSubject.SubjectName FROM
							(SELECT	U.Id,
							 STRING_AGG(S.SubjectName, ', ') WITHIN GROUP(ORDER BY SubjectName) AS SubjectName
							 FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
															   INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
							 GROUP BY U.Id
							 HAVING U.Id = ANU.Id) AS TeacherSubject) Subjects
				 ,(SELECT TOP(1) TeacherCourse.CourseName FROM
							(SELECT	U.Id,
							 STRING_AGG(C.CourseName, ', ') WITHIN GROUP(ORDER BY CourseName) AS CourseName
							 FROM [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId
															 INNER JOIN [dbo].[AspNetUsers] AS U ON TC.AccountId = U.Id
							 GROUP BY U.Id
							 HAVING U.Id = ANU.Id) AS TeacherCourse) AS Courses
			  FROM [dbo].[AspNetUsers] AS ANU
			  WHERE ANU.StatusId <> 3 AND ANU.Id <> 'e695c485-5dda-4377-a407-5f3f2d475257' AND ANU.CourseId IS NULL) AS Teacher
			  INNER JOIN [dbo].[TeacherCourse] AS TC ON Teacher.AccountId = TC.AccountId
			  WHERE TC.CourseId = @CourseId
	  END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MappingDataTeacherSubject]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 09/03/2021
-- Description:	Insert data maping Teacher and Subject
-- =============================================
CREATE PROCEDURE [dbo].[sp_MappingDataTeacherSubject]  
	@TeacherId NVARCHAR(450),
	@Subjects NVARCHAR(200)
AS
BEGIN
	DECLARE @tbSubjectId TABLE(SubjectId INT)
	DECLARE @SubjectId INT
	INSERT INTO @tbSubjectId SELECT value FROM STRING_SPLIT (@Subjects , ',' ) 
	WHILE(EXISTS(SELECT * FROM @tbSubjectId))
	BEGIN
		SET @SubjectId = (SELECT TOP(1) SubjectId FROM @tbSubjectId)

		INSERT INTO [dbo].[TeacherSubject]
			   ([AccountId]
			   ,[SubjectId])
		 VALUES
			   (@TeacherId
			   ,@SubjectId)
		DELETE FROM @tbSubjectId WHERE SubjectId = @SubjectId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveStudentPoint]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 16/03/2021
-- Description:	Save student point
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveStudentPoint]
	@IsUpdate BIT,
	@StudentId NVARCHAR(450),
	@SubjectId INT,
	@Coefficient INT,
	@Score FLOAT,
	@Scores NVARCHAR(100),
	@GeneratebBy NVARCHAR(450)
AS
BEGIN
	DECLARE @TranscriptId INT
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	DECLARE @CheckUpdateSocres BIT = 1
	DECLARE @CheckUpdate BIT = 0
	IF(EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Id = @StudentId AND StatusId <> 4))
	BEGIN
		IF(EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectId = @SubjectId))
		BEGIN
			IF(@Coefficient IN (1,2,3))
			BEGIN
				IF(EXISTS(SELECT ANU.Id FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[AspNetUsers] AS ANU ON TS.AccountId = ANU.Id
										INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
										WHERE S.SubjectId = @SubjectId AND 
											(ANU.Id = @GeneratebBy OR @GeneratebBy = 'e695c485-5dda-4377-a407-5f3f2d475257')))
				BEGIN
					IF(@IsUpdate = 0)
					BEGIN
						--CREATE
						IF(@Score >= 0 AND @Score <= 10)
						BEGIN
							INSERT INTO [dbo].[Transcript]
									   ([AccountId]
									   ,[SubjectId]
									   ,[Coefficient]
									   ,[Score]
									   ,[GeneratebBy]
									   ,[GeneratebDate])
								 VALUES
									   (@StudentId
									   ,@SubjectId
									   ,@Coefficient
									   ,@Score
									   ,@GeneratebBy
									   ,GETDATE())
							SET @Message = N'Thêm điểm môn học thành công'
							SET @TranscriptId = SCOPE_IDENTITY()
							SET @CheckUpdate = 1
						END
						ELSE
						BEGIN
							SET @Message = N'Điểm môn học không hợp lệ'
						END
					END
					ELSE
					BEGIN
						--UPDATE
					--IF(ISNUMERIC(@Scores) = 1)
					--BEGIN
							IF(CHARINDEX(',', @Scores) > 0)
							BEGIN
-- CHECK SCORE VALIDATE
DECLARE @valueScore FLOAT
DECLARE @tempdata INT = 1
DECLARE @begin INT = 1
DECLARE @end INT = 1
DECLARE @count INT = 1
DECLARE @length INT = LEN(@Scores)

WHILE(@begin <= @length)
BEGIN
	SET @end = CHARINDEX(',',@Scores,@begin) - 1
	IF(@end = -1)
	BEGIN
		SET @valueScore = CONVERT(FLOAT, SUBSTRING(@Scores, @begin, @length - @tempdata))
		IF(@valueScore <= 0 OR @valueScore > 10)
		BEGIN
			SET @CheckUpdateSocres = 0
			BREAK
		END
		BREAK
	END
	SET @count = @end - @begin + 1
	SET @valueScore = CONVERT(FLOAT, SUBSTRING(@Scores, @begin, @count))
	IF(@valueScore <= 0 OR @valueScore > 10)
	BEGIN
		SET @CheckUpdateSocres = 0
		BREAK
	END
	SET @begin = @end + 2
	SET @tempdata = @end
END
-------------------------------
IF(@CheckUpdateSocres = 1)
BEGIN
	--DELETE DATA OLD
	DELETE FROM [dbo].[Transcript]
	WHERE AccountId = @StudentId AND Coefficient = @Coefficient
	--UPDATE DATA NEW
	SET @begin = 1
	SET @end = 1
	WHILE(@begin <= @length)
	BEGIN
		SET @end = CHARINDEX(',',@Scores,@begin) - 1
		IF(@end = -1)
		BEGIN
			SET @valueScore = CONVERT(FLOAT, SUBSTRING(@Scores, @begin, @length - @tempdata))
			---------
			INSERT INTO [dbo].[Transcript]
						([AccountId]
						,[SubjectId]
						,[Coefficient]
						,[Score]
						,[GeneratebBy]
						,[GeneratebDate])
					VALUES
						(@StudentId
						,@SubjectId
						,@Coefficient
						,@valueScore
						,@GeneratebBy
						,GETDATE())
			--------
			SET @CheckUpdate = 1
			SET @TranscriptId = 1
			BREAK
		END
		SET @count = @end - @begin + 1
		SET @valueScore = CONVERT(FLOAT, SUBSTRING(@Scores, @begin, @count))
		SET @begin = @end + 2
		SET @tempdata = @end
		---------
			INSERT INTO [dbo].[Transcript]
						([AccountId]
						,[SubjectId]
						,[Coefficient]
						,[Score]
						,[GeneratebBy]
						,[GeneratebDate])
					VALUES
						(@StudentId
						,@SubjectId
						,@Coefficient
						,@valueScore
						,@GeneratebBy
						,GETDATE())
		--------
	END
	SET @Message = N'Cập nhật điểm môn học thành công'
	SET @CheckUpdate = 1
END
ELSE
BEGIN
	SET @Message = N'Điểm số nhập vào không hợp lệ'
END
							END
							ELSE IF(CONVERT(FLOAT, @Scores) >= 0 AND CONVERT(FLOAT, @Scores) <= 10)
							BEGIN
							--DELETE DATA OLD
								DELETE FROM [dbo].[Transcript]
										WHERE AccountId = @StudentId AND Coefficient = @Coefficient
							--UPDATE DATA NEW	
								SET @valueScore = CONVERT(FLOAT, @Scores)
							---------
							INSERT INTO [dbo].[Transcript]
										([AccountId]
										,[SubjectId]
										,[Coefficient]
										,[Score]
										,[GeneratebBy]
										,[GeneratebDate])
									VALUES
										(@StudentId
										,@SubjectId
										,@Coefficient
										,@valueScore
										,@GeneratebBy
										,GETDATE())
								--------
								SET @Message = N'Cập nhật điểm môn học thành công'
								SET @TranscriptId = 1
								SET @CheckUpdate = 1
							END
							ELSE
							BEGIN
								SET @Message = N'Điểm số nhập vào không hợp lệ'
							END
					--END
					--ELSE
					--BEGIN
					--	SET @Message = N'Dãy điểm số nhập vào không hợp lệ'
					--END
					END
				END
				ELSE
				BEGIN
					SET @Message = N'Mã ID người cập nhật điểm không hợp lệ'
				END
			END
			ELSE
			BEGIN
				SET @Message = N'Hệ số điểm không tồn tại hoặc đã bị xóa'
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Mã ID môn học không tồn tại hoặc đã bị xóa'
		END
	END
	ELSE
	BEGIN
		SET @Message = N'Mã ID học sinh không tồn tại hoặc đã bị xóa'
	END
	IF(@CheckUpdate = 0)
	BEGIN
		SET @TranscriptId = 0
	END
	SELECT @Message AS [Message], @TranscriptId AS [TranscriptId], @StudentId AS [StudentId]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCourseTeacherSubject]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 12/03/2021
-- Description:	Update teacher + subject in course by courseId
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateCourseTeacherSubject]
	@CourseId INT,
	@TeacherId NVARCHAR(400),
	@SubjectId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	IF(EXISTS(SELECT * FROM [dbo].[Course] WHERE CourseId = @CourseId))
	BEGIN
		IF(EXISTS(SELECT * FROM [dbo].[TeacherSubject] WHERE AccountId = @TeacherId AND SubjectId = @SubjectId))
		BEGIN
			IF(EXISTS(SELECT * FROM [dbo].[Subject] WHERE SubjectId = @SubjectId))
			BEGIN
				IF(EXISTS(SELECT * FROM [dbo].[TeacherCourse] AS TC 
							WHERE(TC.CourseId = @CourseId AND TC.SubjectId = @SubjectId))) 
				BEGIN
					DELETE FROM [dbo].[TeacherCourse] WHERE(CourseId = @CourseId AND SubjectId = @SubjectId );
					BEGIN
						INSERT INTO [dbo].[TeacherCourse]
								   ([AccountId]
								   ,[CourseId]
								   ,[SubjectId])
						 VALUES
								   (@TeacherId
								   ,@CourseId
								   ,@SubjectId)
					END
				END
				ELSE
				BEGIN
					INSERT INTO [dbo].[TeacherCourse]
							   ([AccountId]
							   ,[CourseId]
							   ,[SubjectId])
					 VALUES
							   (@TeacherId
							   ,@CourseId
							   ,@SubjectId)
				END
				SET @Message = N'Cập nhật giáo viên bộ môn thành công'
			END
			ELSE
			BEGIN
				SET @Message = N'Mã ID giáo viên không hợp lệ'
				SET @TeacherId = NULL
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Mã ID giáo viên không tồn tại'
			SET @TeacherId = NULL
		END
	END
	ELSE
	BEGIN
		SET @Message = N'Mã ID lớp học không tồn tại'
		SET @TeacherId = NULL
	END
	
	SELECT @Message AS [Message], @TeacherId AS TeacherId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 3/22/2021 11:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 09/03/2021
-- Description:	Update user
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateUser]
	@AccountId NVARCHAR(450),
	@Email NVARCHAR(256),
	@FullName NVARCHAR(100),
	@Gender BIT,
	@PhoneNumber NVARCHAR(300),
	@Dob DATE,
	@Address NVARCHAR(200),
	@AvatarPath NVARCHAR(200),
	@ModifiedBy NVARCHAR(100),
	@CourseId INT = NULL,
	@Subjects NVARCHAR(200) = NULL
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	DECLARE @Check INT = 0
	IF(EXISTS(SELECT Id FROM [dbo].[AspNetUsers] WHERE Id = @ModifiedBy AND StatusId <> 4))
	BEGIN
		UPDATE [dbo].[AspNetUsers]
			SET [UserName] = @Email
				,[NormalizedUserName] = UPPER(@Email)
				,[Email] = @Email
				,[NormalizedEmail] = UPPER(@Email)
				,[PhoneNumber] = @PhoneNumber
				,[FullName] = @FullName
				,[Gender] = @Gender
				,[Dob] = @Dob
				,[Address] = @Address
				,[CourseId] = @CourseId
				,[AvatarPath] = @AvatarPath
				,[ModifiedBy] = @ModifiedBy
				,[ModifiedDate] = GETDATE()
			WHERE Id = @AccountId
IF(ISNULL(@Subjects,'0') <> '0' AND @Subjects <> '')
BEGIN
		DECLARE @tbSubjectId TABLE(SubjectId INT)
		DECLARE @SubjectId INT

		--Deleted old data
		DELETE FROM [dbo].[TeacherSubject] WHERE AccountId = @AccountId

		--Update new data
		INSERT INTO @tbSubjectId SELECT value FROM STRING_SPLIT (@Subjects , ',' ) 
		WHILE(EXISTS(SELECT * FROM @tbSubjectId))
		BEGIN
			SET @SubjectId = CONVERT(INT,(SELECT TOP(1) SubjectId FROM @tbSubjectId))
			INSERT INTO [dbo].[TeacherSubject]
						([AccountId]
						,[SubjectId])
					VALUES
						(@AccountId
						,@SubjectId)
			DELETE FROM @tbSubjectId WHERE SubjectId = @SubjectId
		END
		END
		ELSE
		BEGIN
			DELETE FROM [dbo].[TeacherSubject]
					WHERE AccountId = @AccountId
		END

			SET @Message = N'Cập nhật tài khoản: ' + @Email + N' thành công'
			SET @Check = 1
	END
	ELSE
	BEGIN
		SET @Message = N'Mã ID người cập nhật không tồn tại hoặc đã bị xóa'
	END
	IF(@Check = 0)
	BEGIN
		SET @Email = NULL
	END
	 SELECT @Message AS [Message], @Email AS Email
END





GO
USE [master]
GO
ALTER DATABASE [ContactBookDb] SET  READ_WRITE 
GO
