USE [master]
GO
/****** Object:  Database [Demo]    Script Date: 5/21/2021 4:36:26 PM ******/
CREATE DATABASE [Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Demo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo] SET RECOVERY FULL 
GO
ALTER DATABASE [Demo] SET  MULTI_USER 
GO
ALTER DATABASE [Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Demo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demo', N'ON'
GO
ALTER DATABASE [Demo] SET QUERY_STORE = OFF
GO
USE [Demo]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](100) NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Dob] [date] NOT NULL,
	[AvatarPath] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherSubject](
	[TeacherId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC,
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [IsDeleted]) VALUES (1, N'Toán', NULL)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [IsDeleted]) VALUES (2, N'Văn', NULL)
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [IsDeleted]) VALUES (3, N'Anh', NULL)
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (1, N'Vũ Nhân', N'nhanvu@gmail.com', N'0909987654', 1, CAST(N'1990-05-05' AS Date), N'521ea184-529b-4692-87e2-270239eb5c3f_Img6.png', 0, N'28 Nguyễn Tri Phương - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (2, N'Tiến Long ', N'tienlong@gmail.com', N'0905432100', 1, CAST(N'1999-02-02' AS Date), N'4babf857-90f7-4350-9ac0-0f5c53f1b14c_Img2.png', 0, N'28 Nguyễn Tri Phương - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (3, N'Trần Hoàng', N'tranhoang@gmail.com', N'0901234566', 0, CAST(N'1995-10-01' AS Date), N'336e3574-ed09-4cb8-a92d-a275b04914c3_Img3.png', 0, N'28 Nguyễn Tri Phương - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (4, N'Phạm Phong', N'phamphong@gmail.com', N'0907899654', 1, CAST(N'1995-01-01' AS Date), N'c11e2da1-2b96-4ae1-ae0d-d5d81a420805_Img4.png', 0, N'28 Nguyễn Tri Phương - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (5, N'Lê Trang', N'letrang@gmail.com', N'0901234567', 0, CAST(N'1995-01-01' AS Date), N'2e764929-27e3-4357-97fd-f5be82263b4b_Img5.png', 0, N'2 Lê Quý Đôn - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (6, N'Trần Thuận', N'tranthuan@gmail.com', N'0903216549', 1, CAST(N'1995-05-05' AS Date), N'0e2c3ad4-2b9b-4c99-849d-b819a31f85bd_Img6.png', 0, N'5 Lê Quý Đôn - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (7, N'Nguyễn Quang', N'nguyenquang@gmail.com', N'0909444888', 1, CAST(N'1994-02-02' AS Date), N'e0b08424-afe6-4af7-b86e-687edd3c0fc2_Img2.png', 0, N'10 Lê Quý Đôn - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (8, N'Trần Vinh', N'tranvinh@gmail.com', N'0901111444', 1, CAST(N'1998-01-01' AS Date), N'079df817-dd7f-40c0-8ca8-26ff5bec5667_Img3.png', 0, N'5 Lê Quý Đôn - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (9, N'Lê Tường', N'letuong@gmail.com', N'0903216547', 0, CAST(N'1995-01-01' AS Date), N'a0193001-03ea-49c6-abc0-945888d13dc1_Img4.png', 0, N'9 Lê Quý Đôn - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (10, N'Nguyễn Tiến', N'nguyentien@gmail.com', N'0905123123', 1, CAST(N'1996-10-05' AS Date), N'44e94979-0b87-41ee-b791-096ff7b5a84f_Img5.png', 0, N'8 Lê Quý Đôn - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (11, N'Hồ Hiếuu', N'hohieu@gmail.com', N'0901233217', 1, CAST(N'1990-10-08' AS Date), N'42786ee4-5579-4e45-aa11-0cb50cd6471b_Img2.png', 0, N'2 Lê Quý Đôn - TP Huế')
INSERT [dbo].[Teacher] ([TeacherId], [FullName], [Email], [PhoneNumber], [Gender], [Dob], [AvatarPath], [IsDeleted], [Address]) VALUES (12, N'Nguyễn A', N'nguyentienn@gmail.com', N'0909555555', 1, CAST(N'1995-01-01' AS Date), N'260fbc4e-1d34-4d0c-8a82-47604cd1dd32_Img3.png', 1, N'4 NTP')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (1, 2)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (1, 3)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (2, 1)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (2, 2)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (2, 3)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (3, 2)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (4, 1)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (5, 3)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (6, 3)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (7, 3)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (8, 1)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (9, 3)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (10, 3)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (11, 2)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (12, 1)
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (12, 3)
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD  CONSTRAINT [FK_TeacherSubject_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[TeacherSubject] CHECK CONSTRAINT [FK_TeacherSubject_Subject]
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD  CONSTRAINT [FK_TeacherSubject_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[TeacherSubject] CHECK CONSTRAINT [FK_TeacherSubject_Teacher]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletedSubject]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeletedSubject]
@SubjectId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	IF(EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectId = @SubjectId AND IsDeleted <> 1))
		BEGIN
			DECLARE @SubjectName NVARCHAR(100) = (SELECT TOP(1) SubjectName FROM [dbo].[Subject] WHERE SubjectId = @SubjectId)
			UPDATE [dbo].[Subject]
				   SET [IsDeleted] = 1
				 WHERE SubjectId = @SubjectId
				 SET @Message = N'Xóa Môn học: '+ @SubjectName + N' thành công.'
		END
		ELSE
		BEGIN
			SET @SubjectId = 0
			SET @Message = N'Mã ID Môn học không tồn tại hoặc đã bị xóa.'
		END
	SELECT @SubjectId AS SubjectId, @Message AS [Message]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletedTeacher]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 29/03/2021
-- Description:	Deleted teacher by teacherId
CREATE PROCEDURE [dbo].[sp_DeletedTeacher] 
 @TeacherId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	IF(EXISTS(SELECT * FROM [dbo].[Teacher] WHERE TeacherId = @TeacherId))
	BEGIN
		UPDATE	[dbo].[Teacher]
			SET [IsDeleted] = 1
			WHERE TeacherId = @TeacherId
		SET @Message = N'Xóa Giáo viên thành công'
	END
	ELSE
	BEGIN
		SET @Message = N'Mã Id Giáo viên không tồn tại'
	END

	SELECT @Message AS [Message], @TeacherId AS TeacherId
END



GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubject]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSubject]
@SubjectId INT
AS
BEGIN
	SELECT [SubjectId]
		  ,[SubjectName]
  FROM [dbo].[Subject] WHERE SubjectId = @SubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjects]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 29/03/2021
-- Description:	Get all subjects 
CREATE PROCEDURE [dbo].[sp_GetSubjects]
AS
BEGIN
	SELECT [SubjectId]
		  ,[SubjectName]
	  FROM [dbo].[Subject] 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectsByTeacherId]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 29/03/2021
-- Description:	Get all subjects by teacherId
CREATE PROCEDURE [dbo].[sp_GetSubjectsByTeacherId]
	@TeacherId INT 
AS
BEGIN
	SELECT	S.SubjectId
		   ,S.SubjectName 	
	FROM  [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
	WHERE TS.TeacherId = @TeacherId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeacher]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 29/03/2021
-- Description:	Get teacher by teacher Id
CREATE PROCEDURE [dbo].[sp_GetTeacher] 
 @TeacherId INT
AS
BEGIN
	SELECT T.[TeacherId]
		  ,T.[FullName]
		  ,T.[Email]
		  ,T.[PhoneNumber]
		  ,T.[Gender]
		  ,T.[Dob]
		  ,FORMAT(T.[Dob],'dd-MM-yyyy') AS DobStr
		  ,FORMAT(T.[Dob],'yyyy-MM-dd') AS DobVal
		  ,T.[AvatarPath] AS AvatarName
		  ,T.[Address]
		  ,T.[IsDeleted]
		  ,(SELECT STRING_AGG(S.SubjectName,', ') 
			FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S
													ON TS.SubjectId = S.SubjectId
													WHERE TS.TeacherId = T.TeacherId) AS SubjectsName
	  FROM [dbo].[Teacher] AS T WHERE T.[TeacherId] = @TeacherId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeachers]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 29/03/2021
-- Description:	Get all teacher
CREATE PROCEDURE [dbo].[sp_GetTeachers] 
AS
BEGIN
	SELECT T.[TeacherId]
		  ,T.[FullName]
		  ,T.[Email]
		  ,T.[PhoneNumber]
		  ,T.[Gender]
		  ,T.[Dob]
		  ,FORMAT(T.[Dob],'dd-MM-yyyy') AS DobStr
		  ,T.[AvatarPath] AS AvatarName
		  ,T.[Address]
		  ,T.[IsDeleted]
		  ,(SELECT STRING_AGG(S.SubjectName,', ') 
			FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S
													ON TS.SubjectId = S.SubjectId
													WHERE TS.TeacherId = T.TeacherId) AS SubjectsName
	  FROM [dbo].[Teacher] AS T WHERE T.IsDeleted = 0
	  ORDER BY T.[TeacherId] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveSubject]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveSubject]
@SubjectId INT,
@SubjectName nvarchar(100)
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	IF(@SubjectId > 0)
	BEGIN
		--UPDATE
		IF(EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectId = @SubjectId AND IsDeleted <> 1))
		BEGIN
			IF(NOT EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectName = @SubjectName AND SubjectId <> @SubjectId))
			BEGIN
				UPDATE [dbo].[Subject]
				   SET [SubjectName] = @SubjectName
				 WHERE SubjectId = @SubjectId
				 SET @Message = N'Cập nhật Môn học thành công.'
			END
			ELSE
			BEGIN
				SET @Message = N'Tên Môn học đã tồn tại.'
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Mã ID Môn học không tồn tại hoặc đã bị xóa.'
		END
	END
	ELSE
	BEGIN
		--CREATE
		IF(NOT EXISTS(SELECT SubjectId FROM [dbo].[Subject] WHERE SubjectName = @SubjectName))
		BEGIN
			INSERT INTO [dbo].[Subject]
					   ([SubjectName]
					   ,[IsDeleted])
				 VALUES
					   (@SubjectName
					   ,0)
			SET @SubjectId = SCOPE_IDENTITY()
			SET @Message = N'Thêm mới Môn học: ' + @SubjectName + ' thành công.'
		END
		ELSE
		BEGIN
			SET @Message = N'Tên Môn học đã tồn tại.'
		END
	END
	SELECT @SubjectId AS SubjectId, @Message AS [Message]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveTeacher]    Script Date: 5/21/2021 4:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 29/03/2021
-- Description:	Save teacher
CREATE PROCEDURE [dbo].[sp_SaveTeacher] 
 @TeacherId INT,
 @FullName NVARCHAR(100),
 @Email NVARCHAR(100),
 @PhoneNumber NVARCHAR(100),
 @Gender BIT,
 @Dob DATE,
 @AvatarName NVARCHAR(200),
 @SubjectIds NVARCHAR(100),
 @Address NVARCHAR(200)
AS
BEGIN
	DECLARE @Message NVARCHAR(100) = N'Đã xảy ra lỗi, xin vui lòng liên hệ Admin'
	DECLARE @OldAvatarName  NVARCHAR(200) = NULL
	DECLARE @Check BIT = 0
	IF(ISNULL(@Email,'0') <> '0' AND @Email <> '')
	BEGIN
		IF(ISNULL(@FullName,'0') <> '0' AND @FullName <> '')
		BEGIN
			IF(ISNULL(@PhoneNumber,'0') <> '0' AND @PhoneNumber <> '')
			BEGIN
				IF(@Dob <> '')
				BEGIN
					IF(DATEDIFF(YEAR, CONVERT(DATE,@Dob), GETDATE()) > = 20 OR DATEDIFF(YEAR, CONVERT(DATE,@Dob), GETDATE()) <= 60)
					BEGIN
						IF(ISNULL(@Address,'0') <> '0' AND @Address <> '')
						BEGIN
							IF(ISNULL(@AvatarName,'0') <> '0' AND @AvatarName <> '')
							BEGIN
								IF(ISNULL(@SubjectIds,'0') <> '0' AND @SubjectIds <> '')
								BEGIN
-------------------------------------
	--Check Subjects valid
	DECLARE @CheckSubjects BIT = 0
	DECLARE @tbSubjectId TABLE(SubjectId INT)
	DECLARE @SubjectId INT
	INSERT INTO @tbSubjectId SELECT value FROM STRING_SPLIT (@SubjectIds , ',' ) 
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
--------------------------------------------
IF(@CheckSubjects = 1)
BEGIN
	IF(ISNULL(@TeacherId, 0) = 0 AND @TeacherId <= 0)
	BEGIN
		--CREATE TEACHER
		IF(NOT EXISTS(SELECT TeacherId FROM [dbo].[Teacher] WHERE Email = @Email))
		BEGIN
			IF(NOT EXISTS(SELECT TeacherId FROM [dbo].[Teacher] WHERE PhoneNumber = @PhoneNumber))
			BEGIN
				--DATA INFO
				INSERT INTO [dbo].[Teacher]
						   ([FullName]
						   ,[Email]
						   ,[PhoneNumber]
						   ,[Gender]
						   ,[Dob]
						   ,[AvatarPath]
						   ,[Address]
						   ,[IsDeleted])
					 VALUES
						   (@FullName
						   ,@Email
						   ,@PhoneNumber
						   ,@Gender
						   ,@Dob
						   ,@AvatarName
						   ,@Address
						   ,0)
				SET @TeacherId = SCOPE_IDENTITY()
				--DATA SUBJECT
				INSERT INTO @tbSubjectId SELECT value FROM STRING_SPLIT (@SubjectIds , ',' ) 
				WHILE(EXISTS(SELECT * FROM @tbSubjectId))
				BEGIN
					SET @SubjectId = CONVERT(INT,(SELECT TOP(1) SubjectId FROM @tbSubjectId))
					INSERT INTO [dbo].[TeacherSubject]
							   ([TeacherId]
							   ,[SubjectId])
						 VALUES
							   (@TeacherId
							   ,@SubjectId)
					DELETE FROM @tbSubjectId WHERE SubjectId = @SubjectId
				END
				SET @Check = 1
				SET @Message = N'Tạo mới Giáo viên thành công.'
			END
			ELSE
			BEGIN
				SET @Message = N'Số điện thoại đã tồn tại.'
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Email đã tồn tại.'
		END
	END
	ELSE
	BEGIN
		--UPDATE USER
		IF(EXISTS(SELECT TeacherId FROM  [dbo].[Teacher] WHERE TeacherId = @TeacherId))
		BEGIN
			IF(NOT EXISTS(SELECT TeacherId FROM [dbo].[Teacher] WHERE Email = @Email AND TeacherId <> @TeacherId))
			BEGIN
				IF(NOT EXISTS(SELECT TeacherId FROM [dbo].[Teacher] WHERE PhoneNumber = @PhoneNumber AND TeacherId <> @TeacherId))
				BEGIN	
					--UPDATE DATA TEACHER
					SET @OldAvatarName = (SELECT TOP(1) AvatarPath FROM [dbo].[Teacher] WHERE TeacherId = @TeacherId)
					UPDATE [dbo].[Teacher]
						SET [FullName] = @FullName
							,[Email] = @Email
							,[PhoneNumber] = @PhoneNumber
							,[Gender] = @Gender
							,[Dob] = @Dob
							,[AvatarPath] = @AvatarName
							,[Address] = @Address
						WHERE TeacherId = @TeacherId

					--DELETED OLD DATA SUBJECT
					DELETE FROM [dbo].[TeacherSubject] WHERE TeacherId = @TeacherId

					--UPDATE DATA SUBJECT
					INSERT INTO @tbSubjectId SELECT value FROM STRING_SPLIT (@SubjectIds , ',' ) 
					WHILE(EXISTS(SELECT * FROM @tbSubjectId))
					BEGIN
						SET @SubjectId = CONVERT(INT,(SELECT TOP(1) SubjectId FROM @tbSubjectId))
						INSERT INTO [dbo].[TeacherSubject]
									([TeacherId]
									,[SubjectId])
								VALUES
									(@TeacherId
									,@SubjectId)
						DELETE FROM @tbSubjectId WHERE SubjectId = @SubjectId
					END
					SET @Check = 1
					SET @Message = N'Cập nhật Giáo viên thành công.'
				END
				ELSE
				BEGIN
					SET @Message = N'Số điện thoại đã tồn tại.'
				END
			END
			ELSE
			BEGIN
				SET @Message = N'Email đã tồn tại.'
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Mã ID Giáo viên không tồn tại.'
		END
	END
END
ELSE
BEGIN
	SET @Message = N'Danh sách môn dạy không hợp lệ.'
END
								END
								ELSE
								BEGIN
									SET @Message = N'Môn dạy không được để trống.'
								END
							END
							ELSE
							BEGIN
								SET @Message = N'File ảnh đại diện không được để trống.'
							END
						END
						ELSE
						BEGIN
							SET @Message = N'Thông tin Địa chỉ không được để trống.'
						END
					END
					ELSE
					BEGIN
						SET @Message = N'Số tuổi tối thiểu là 20 và tối đa là 60 tuổi.'
					END
					END
				ELSE
				BEGIN
					SET @Message = N'Ngày sinh không được để trống.'
				END
			END
			ELSE
			BEGIN
				SET @Message = N'Số điện thoại không được để trống.'
			END
		END
		ELSE
		BEGIN
			SET @Message = N'Họ tên không được để trống.'
		END
	END
	ELSE
	BEGIN
		SET @Message = N'Email không được để trống.'
	END
	IF(@Check = 0)
	BEGIN
		SET @TeacherId = 0
	END
	SELECT   @Message AS [Message] 
			,@TeacherId AS TeacherId 
			,@AvatarName AS AvatarName
			,@OldAvatarName AS OldAvatarName
END
GO
USE [master]
GO
ALTER DATABASE [Demo] SET  READ_WRITE 
GO
