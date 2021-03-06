USE [master]
GO
/****** Object:  Database [ContactBookDb]    Script Date: 3/12/2021 4:49:07 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/12/2021 4:49:07 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[TeacherCourse]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  Table [dbo].[Transcript]    Script Date: 3/12/2021 4:49:08 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[TranscriptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wiki]    Script Date: 3/12/2021 4:49:08 PM ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3/12/2021 4:49:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/12/2021 4:49:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3/12/2021 4:49:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3/12/2021 4:49:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3/12/2021 4:49:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/12/2021 4:49:08 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ChangeStatusUser]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CheckSaveUser]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllTeachers]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCourse]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCourses]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCourseTeacherSubject]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetRoleId]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetRoles]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetStudents]    Script Date: 3/12/2021 4:49:08 PM ******/
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
		  ,ANU.[UserName]
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
/****** Object:  StoredProcedure [dbo].[sp_GetSubjects]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTeacher]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTeacherMaster]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTeachersInCourse]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTeachersSubject]    Script Date: 3/12/2021 4:49:08 PM ******/
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
	SELECT	 ANU.Id
			,ANU.FullName
	 FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[AspNetUsers] AS ANU
					ON TS.AccountId = ANU.Id
					WHERE TS.SubjectId = @SubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 3/12/2021 4:49:08 PM ******/
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
		  ,(SELECT TOP(1) R.[Name] FROM [dbo].[AspNetUserRoles] AS UR INNER JOIN [dbo].[AspNetRoles] AS R ON UR.RoleId = R.Id
																WHERE UR.UserId = U.Id) AS RoleName
		  ,(SELECT TOP(1) TeacherSubject.SubjectName FROM
					(SELECT	U.Id,
					 STRING_AGG(S.SubjectName, ', ') WITHIN GROUP(ORDER BY SubjectName) AS SubjectName
				     FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
													   INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
					 GROUP BY U.Id
					 HAVING U.Id = @AccountId) AS TeacherSubject) Subjects
		 ,(SELECT TOP(1) TeacherCourse.CourseName FROM
					(SELECT	U.Id,
					 STRING_AGG(C.CourseName, ', ') WITHIN GROUP(ORDER BY CourseName) AS CourseName
					 FROM [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId
													 INNER JOIN [dbo].[AspNetUsers] AS U ON TC.AccountId = U.Id
					 GROUP BY U.Id
					 HAVING U.Id = @AccountId) AS TeacherCourse) AS Courses
	  FROM [dbo].[AspNetUsers] AS U
	  WHERE U.StatusId <> 3 AND U.Id = @AccountId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsersInCourse]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MappingDataTeacherSubject]    Script Date: 3/12/2021 4:49:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCourseTeacherSubject]    Script Date: 3/12/2021 4:49:08 PM ******/
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
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Mã ID giáo viên không tồn tại'
		END
	END
	ELSE
	BEGIN
		SET @Message = N'Mã ID lớp học không tồn tại'
	END
	
	SELECT @Message AS [Message], @CourseId AS CourseId, @TeacherId AS TeacherId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 3/12/2021 4:49:08 PM ******/
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
