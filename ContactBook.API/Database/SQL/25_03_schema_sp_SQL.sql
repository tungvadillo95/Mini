USE [ContactBookDb]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeStatusUser]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CheckLoginUser]    Script Date: 3/25/2021 4:44:42 PM ******/
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
			SET @Message = N'Tài khoản đã bị vô hiệu hoặc đã xóa'
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
/****** Object:  StoredProcedure [dbo].[sp_CheckSaveUser]    Script Date: 3/25/2021 4:44:42 PM ******/
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
							--IF(EXISTS(SELECT * FROM [dbo].[AspNetRoles] WHERE Id = @RoleId AND Id != '291cbc7f-1345-45df-b8c2-96111d13ad60'))
							--BEGIN

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
									IF(EXISTS(SELECT * FROM [dbo].[AspNetRoles] WHERE Id = @RoleId AND Id != '291cbc7f-1345-45df-b8c2-96111d13ad60'))
									BEGIN
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
									BEGIN
										SET @Message = N'Mã ID Role không tồn tại'
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
DECLARE @SubId INT
DECLARE @subjectActive TABLE(SubId INT) 
DECLARE @SubOldStr NVARCHAR(200) = (SELECT STRING_AGG(TC.SubjectId,',') AS Subjects
FROM [dbo].[TeacherCourse] AS TC WHERE TC.AccountId = @AccountId)
INSERT INTO @subjectActive SELECT value FROM STRING_SPLIT (@SubOldStr , ',' )
DECLARE @subjectNew TABLE(SubId INT)
INSERT INTO @subjectNew SELECT value FROM STRING_SPLIT (@Subjects , ',' )
WHILE(EXISTS(SELECT * FROM @subjectNew))
BEGIN
	SET @SubId = CONVERT(INT,(SELECT TOP(1) SubId FROM @subjectNew))
	IF(EXISTS(SELECT SubId FROM @subjectActive WHERE SubId = @SubId))
	BEGIN
		DELETE FROM @subjectActive WHERE SubId = @SubId
	END
	DELETE FROM @subjectNew WHERE SubId = @SubId
END
IF(NOT EXISTS(SELECT SubId FROM @subjectActive))
BEGIN
	SET @Check = 1
END
ELSE
BEGIN
	SET @Message = N'Có môn học Giáo viên hiện vẫn đang đảm nhiệm dạy không thể hủy'
END
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

							--END
							--ELSE
							--BEGIN
							--	SET @Message = N'Mã ID Role không tồn tại'
							--END
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllTeachers]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCourse]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCourseControlTeacher]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCourseIdByTeacherMasterId]    Script Date: 3/25/2021 4:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 Tùng Nguyễn
-- Create date: 22/03/2021
-- Description:	Get courseId by teacherMasterId
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCourseIdByTeacherMasterId] 
	@TeacherId NVARCHAR(450)
AS
BEGIN
	SELECT  C.CourseId
		   ,C.CourseName
	FROM [dbo].[Course] AS C WHERE C.TeacherId = @TeacherId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetCourses]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCoursesTeaching]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCourseTeacherSubject]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetDetailsStudentPoint]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetRoleId]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetRoles]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetStudentPoint]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetStudents]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetStudentsPointInCourse]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetSubjects]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectTeachingInCourse]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTeacher]    Script Date: 3/25/2021 4:44:42 PM ******/
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
				,(SELECT  STRING_AGG(TCS.CourseName, ', ') AS CourseName
					FROM (SELECT DISTINCT C.CourseName
							FROM [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId 
							WHERE TC.AccountId = @AccountId) AS TCS) AS Courses
				,(SELECT TOP(1) C.CourseName FROM [dbo].[Course] AS C WHERE C.TeacherId = ANU.Id) AS Responsible
			FROM [dbo].[AspNetUsers] AS ANU
			WHERE ANU.Id = @AccountId AND ANU.StatusId <> 4 AND ANU.Id <> 'e695c485-5dda-4377-a407-5f3f2d475257' AND (ANU.CourseId IS NULL OR ANU.CourseId = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeacherMaster]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTeachersInCourse]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTeachersSubject]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTeacherSubjects]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 3/25/2021 4:44:42 PM ******/
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
					 STRING_AGG(S.SubjectName, ', ') AS SubjectName
				     FROM [dbo].[TeacherSubject] AS TS INNER JOIN [dbo].[Subject] AS S ON TS.SubjectId = S.SubjectId
													   INNER JOIN [dbo].[AspNetUsers] AS U ON TS.AccountId = U.Id
					 GROUP BY U.Id
					 HAVING U.Id = @AccountId) AS TeacherSubject) SubjectsStr
		 ,(SELECT  STRING_AGG(TCS.CourseName, ', ') AS CourseName
			FROM (SELECT DISTINCT C.CourseName
					FROM [dbo].[TeacherCourse] AS TC INNER JOIN [dbo].[Course] AS C ON TC.CourseId = C.CourseId 
					WHERE TC.AccountId = @AccountId) AS TCS) AS Courses
		,(SELECT TOP(1) C.CourseName FROM [dbo].[Course] AS C WHERE C.TeacherId = U.Id) AS Responsible
		,(SELECT TOP(1) C.CourseId FROM [dbo].[Course] AS C WHERE C.TeacherId = U.Id) AS ResponsibleId
	  FROM [dbo].[AspNetUsers] AS U
	  WHERE U.StatusId <> 3 AND U.Id = @AccountId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsersInCourse]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MappingDataTeacherSubject]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SaveStudentPoint]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCourseTeacherSubject]    Script Date: 3/25/2021 4:44:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 3/25/2021 4:44:42 PM ******/
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
