USE [ContactBookDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/25/2021 4:42:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/25/2021 4:42:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/25/2021 4:42:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/25/2021 4:42:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/25/2021 4:42:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/25/2021 4:42:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/25/2021 4:42:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/25/2021 4:42:46 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 3/25/2021 4:42:46 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 3/25/2021 4:42:46 PM ******/
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
/****** Object:  Table [dbo].[TeacherCourse]    Script Date: 3/25/2021 4:42:46 PM ******/
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
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 3/25/2021 4:42:46 PM ******/
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
/****** Object:  Table [dbo].[Transcript]    Script Date: 3/25/2021 4:42:46 PM ******/
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
/****** Object:  Table [dbo].[Wiki]    Script Date: 3/25/2021 4:42:46 PM ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'947b70ee-4b80-4299-a3e4-b03df15501c1', N'GVCN', N'GVCN', N'ead43932-327f-411e-9313-bc399e503d22')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e346ef58-52dd-485d-92a3-25a64144bdfa', N'Học sinh', N'HỌC SINH', N'b5591e23-dda4-4788-a3b6-1fb3b1f07d04')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f7e3b187-7743-4c11-a73f-398fe418acd1', N'Giáo viên', N'GIÁO VIÊN', N'5836f016-3405-4b44-b692-44cf861babb0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e695c485-5dda-4377-a407-5f3f2d475257', N'291cbc7f-1345-45df-b8c2-96111d13ad60')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e695c485-5dda-4377-a407-5f3f2d475257', N'947b70ee-4b80-4299-a3e4-b03df15501c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'06b12f97-bb16-434a-9982-e3d3dc1c5145', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1efe96d9-6618-4269-a6e3-ae1e3d3eecc4', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2115c7e6-9aae-43cb-a406-d504578498ba', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
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
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f168939f-b7d4-46fa-9480-0bebb7397460', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f588ba4b-d99d-47b7-8b1a-87ebdaab5190', N'e346ef58-52dd-485d-92a3-25a64144bdfa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c372e079-b530-4682-98fa-87db8d7b09a5', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', N'f7e3b187-7743-4c11-a73f-398fe418acd1')
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'06b12f97-bb16-434a-9982-e3d3dc1c5145', N'Lê Tâm', CAST(N'2015-05-01T00:00:00.0000000' AS DateTime2), 0, N'9 Đống Đa', CAST(N'2021-03-10T13:46:39.9147781' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-24T08:52:47.0700000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'657a0606-389a-4d17-93ba-d43888dc7e4d_Img3.png', 1, 1, N'letam@gmail.com', N'LETAM@GMAIL.COM', N'letam@gmail.com', N'LETAM@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFeK0xdD6W0eTqf0x50qZP9ehc/L+FJ4v2tCreXqgi3AG5UW9Ic5goGx0Au+x36nkw==', N'BTFLOW7SMABRH5NRMC5Z2YUWDKJXXIDF', N'4fa3e31f-53e7-4e42-9e90-6c6094cb85dc', N'0903444555', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'16a69b03-3b90-49a2-9cac-4b940c91514c', N'Nguyễn Minh Tuấn', CAST(N'1995-04-04T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-23T12:59:26.5968799' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', CAST(N'2021-03-23T12:59:26.5968724' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'none_avatar.png', 2, 1, N'minhtuan@gmail.com', N'MINHTUAN@GMAIL.COM', N'minhtuan@gmail.com', N'MINHTUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGFy8knC+2km1aOlnnpFzBNXMvlWnbD8ei9DpzXZGs8yw882bXrtjXM7F1i38XQQuw==', N'S52UY7KSJITSPC3LSQHH4KWKLC4EB6JG', N'2fff76dc-a1bc-4488-92fc-8a16936d570a', N'0903519611', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1efe96d9-6618-4269-a6e3-ae1e3d3eecc4', N'Nguyễn Minh Nghĩa', CAST(N'1995-04-22T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-23T13:02:24.5633162' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', CAST(N'2021-03-23T16:27:50.6900000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 2, 1, N'minhnghia@gmail.com', N'MINHNGHIA@GMAIL.COM', N'minhnghia@gmail.com', N'MINHNGHIA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEM8r1eOPGMN/dpmLUzDA/Acsbr2Ni9Mim1PqMbdlgL8xtzJZwpuXknqwc2an7mblWQ==', N'JOFQE2M4IOXF7NK2VUB5VQI5AOIINPHO', N'04d65b6c-d364-4de8-93b7-7330131f9139', N'0903519611', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2115c7e6-9aae-43cb-a406-d504578498ba', N'Văn Thuận', CAST(N'1997-05-05T00:00:00.0000000' AS DateTime2), 1, N'5 Lê Quý Đôn - TP Huế', CAST(N'2021-03-23T11:51:37.3790484' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', CAST(N'2021-03-23T11:51:37.3790411' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'none_avatar.png', 2, 1, N'vanthuan@gmail.com', N'VANTHUAN@GMAIL.COM', N'vanthuan@gmail.com', N'VANTHUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHnvcvaXRMYVCSTCguERLCB8Zy+6AMi1qUkzSatidISX6cyB4B2PS3XF17sE9gjbsA==', N'XHKCUFTX6NKVWBRAZCCH5DVMUBGPSGUG', N'e3cf86b3-788d-44b2-9121-777d40b4588d', N'0903519966', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', N'Lê Minh Toàn', CAST(N'1998-05-05T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-23T13:09:29.0262211' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T13:09:29.0262134' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'149ac774-d729-49ea-b643-7bee97df31f0_Img1.png', 3, 1, N'minhtoan@gmail.com', N'MINHTOAN@GMAIL.COM', N'minhtoan@gmail.com', N'MINHTOAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJFZX2QexslmZvdcpptk8lJO4S8uD4OpMh/TD+CNyvGkcWhG1tgpyxXAcwmD/RH6CQ==', N'H6PA3EJSECB5JH2BNHERTQ3GM7RSOOMJ', N'afe10e36-fe15-4fab-ab9d-29ab426a5e7d', N'0903518555', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'Trần Hoàng', CAST(N'1996-05-09T00:00:00.0000000' AS DateTime2), 1, N'3 Le Quy Don', CAST(N'2021-03-04T11:16:46.1900252' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T13:34:32.4700000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'386a0396-17f4-4a2f-a4c1-02ef34a84fed_Img2.png', 0, 1, N'tranhoang@gmail.com', N'TRANHOANG@GMAIL.COM', N'tranhoang@gmail.com', N'TRANHOANG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMmp2xyewP67bhU3nIdfocPAw/RqZAW2T2qeib3E4lD9hikhYYzPiHalKO4vNt/+oQ==', N'IIJLNJSINEFA7Q2UEIO4QHTILV5PC5NC', N'0c0822f7-29dc-4906-a023-b2a9cb63d02d', N'0903517777', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2f67c183-6ebf-4920-9cca-7d1a7a2b173c', N'Nguyễn Thuận', CAST(N'1997-05-05T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-23T11:55:14.4046615' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', CAST(N'2021-03-23T11:55:14.4046374' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'none_avatar.png', 2, 1, N'nguyenthuan@gmail.com', N'NGUYENTHUAN@GMAIL.COM', N'nguyenthuan@gmail.com', N'NGUYENTHUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECrLttlvZWKAImaFZv1vewQO6x+1auC8Hl7AqeyzGlC5A4b/JfPpTGWMixdPK4/X3Q==', N'SMPSHJ5MAQTXA6BZNVBHQDMFJNM3WGZL', N'4e859852-c322-4a27-873f-d4ed37f67bd2', N'0909994477', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', N'Nguyễn Khoa', CAST(N'1995-12-06T00:00:00.0000000' AS DateTime2), 1, N'1 Hùng Vương', CAST(N'2021-03-09T16:50:06.6639290' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T11:15:31.9566667' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'203eafdf-d98d-4acb-8722-cc95fda8e343_Img4.png', 2, 1, N'nguyenkhoa@gmail.com', N'NGUYENKHOA@GMAIL.COM', N'nguyenkhoa@gmail.com', N'NGUYENKHOA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEH+ESg+QtUz/DAGxzZu3SMMnft8f5UAKMPiTWrdknivk9kFcB1lWnhSI1omNUB1z5g==', N'UQIIDPCCFLFUGF7YEMM2JGLK7VJMTTHR', N'3d9bcfef-277f-4a82-8cbb-3487e43c08bc', N'0907888889', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3dabf300-50ab-438b-baaa-f6890f2b260c', N'Phan Tiến Long', CAST(N'1997-08-04T00:00:00.0000000' AS DateTime2), 1, N'5 Lê Quý Đôn - TP Huế', CAST(N'2021-03-23T14:11:30.0944892' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T14:16:48.9700000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'4a7b004b-a5c4-4e29-b9ac-b8a83343a316_Img3.png', 0, 1, N'tienlong@gmail.com', N'TIENLONG@GMAIL.COM', N'tienlong@gmail.com', N'TIENLONG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFKc24JV5aaV7jGxfcCN/RoJ5t3tjklGz9t1XuPJelbuBHBncmNgsyGudMCefoaFKw==', N'VT6E2KXLMZUOFOEVLXCVJFCE4XK3E52N', N'3d1bfd03-fe4e-42d1-a468-96bfc113239a', N'0903511111', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', N'Vũ Nhân', CAST(N'1990-02-11T00:00:00.0000000' AS DateTime2), 1, N'4 Le Quy Don', CAST(N'2021-03-04T11:18:13.0156260' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-11T15:34:15.7700000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'vunhan@gmail.com', N'VUNHAN@GMAIL.COM', N'vunhan@gmail.com', N'VUNHAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEISDYgOuEr5QKTGJOr3T65x6RfgRfMOxGz28ywGksncejHGCffppgoGnRTm7M2QROw==', N'566LUNEJM7KD5A5UD2QK4BMCLJTKEJEZ', N'e2b2acd8-f254-46c0-b649-aa6c26eccdf7', N'0903519999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', N'Trần Tuấn', CAST(N'1997-01-05T00:00:00.0000000' AS DateTime2), 1, N'2 Hùng Vương', CAST(N'2021-03-10T11:40:06.0010770' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:40:33.1666667' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'c6a05831-2b68-4aed-b370-bff9fe826923_Img4.png', 1, 1, N'trantuan@gmail.com', N'TRANTUAN@GMAIL.COM', N'trantuan@gmail.com', N'TRANTUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEH9oR49EecsNoX5BKSTjatbm0WzOk8CRYOnHBQq7pupC9U2UgeLxxRMyEqfP0Dy70w==', N'ZFB4B2QDD2EQ22TXVE62RBO6RN5OM2BL', N'73c69f62-b159-4cd5-823f-ab5381a8f791', N'0903519600', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'61aa0de3-9743-47c5-b9b6-759ee51a1d07', N'Hồ Quang Hiếu', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), 1, N'10 Bà Triệu', CAST(N'2021-03-10T14:56:55.2567620' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T11:25:07.2733333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'fede514c-e152-41be-b62b-5cbe5362483c_Img6.png', 3, 1, N'quanghieu@gmail.com', N'QUANGHIEU@GMAIL.COM', N'quanghieu@gmail.com', N'QUANGHIEU@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOhhZ9ZnW1xvM6rLCXfIyivY1Q7OhMZB4UfU7FtZCGmYr97en173mlRdWqn4eV3xFw==', N'A55EGS74VCLFUKSYDZURUVILWC7P2JQY', N'79c975da-ca59-4761-bc4f-b52da5af3767', N'0909999999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6d1cb520-b8ad-44d9-b641-00f2e93141fa', N'Nguyễn Danh', CAST(N'1992-05-05T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương', CAST(N'2021-03-11T13:53:20.5506219' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-11T13:53:20.5506158' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'60bb5d94-b907-4d49-83ac-9920becfbebb_Img1.png', 3, 1, N'nguyendanh@gmail.com', N'NGUYENDANH@GMAIL.COM', N'nguyendanh@gmail.com', N'NGUYENDANH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJ9d3xVCeL9BoJzBZWnCCurkgEZqUG7gyv9lc0tuamOtB086JWHHZws63sCuZDbIdg==', N'NRZPI6IHUBNAPSMHM5AZK5QUOAWF6GNN', N'c07428c5-b218-45a0-9514-9a8bb6231ac4', N'0909556666', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7c4ac2b8-4156-4e08-9167-5715d3f7d410', N'Phan Long', CAST(N'1997-02-05T00:00:00.0000000' AS DateTime2), 1, N'2 Le Quy Don', CAST(N'2021-03-04T11:15:06.3237620' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T11:48:20.3600000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'd4fad05d-d852-44da-bf8f-c16430f85075_Img1.png', 1, 1, N'phanlong@gmail.com', N'PHANLONG@GMAIL.COM', N'phanlong@gmail.com', N'PHANLONG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDxshQf0REnc3mMeEXCf/uBIBgeV48NP6lQK6gURwUaVmzhHAjpPRKBq1ni3EdBEXQ==', N'SWSPI6ZPK2GLKI25XR2Z3II6TCUZ6HUU', N'9ace1c7f-d6de-4eb8-b78d-829f48775bd6', N'0903518888', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'814ebb12-4853-46e6-854b-87b5eb32d667', N'Nguyễn Minh Anh', CAST(N'1997-02-02T00:00:00.0000000' AS DateTime2), 0, N'1 Nguyễn Trãi', CAST(N'2021-03-10T13:48:55.4528358' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:48:55.4528279' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'a14ecdef-3cac-4233-a2d1-88b82d02c318_Img1.png', 1, 1, N'minhanh@gmail.com', N'MINHANH@GMAIL.COM', N'minhanh@gmail.com', N'MINHANH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEArrxaFsPcIA2int3uORlrhD3Et/xjy5IjzFcoieLkez434/7zAqEReaAtOfuRTZsg==', N'MUV3PTUOIR5DHCRQHYNAC5VASCWLUKTO', N'a1c48c82-10fb-4635-90a5-919193e1fa85', N'0903222444', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8919cdee-d42b-4bec-96b6-b748bea915fd', N'Trần Ngọc Vinh', CAST(N'1994-08-05T00:00:00.0000000' AS DateTime2), 0, N'9 Lê Quý Đôn', CAST(N'2021-03-09T15:43:13.6721818' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T11:04:57.0333333' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'dbb0cae5-a126-44b3-a0cc-2fd536153241_Img6.png', 2, 1, N'vinhtran@gmail.com', N'VINHTRAN@GMAIL.COM', N'vinhtran@gmail.com', N'VINHTRAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPAaQwbOIWg0ZKpMNSzCCCZez5eIYZUgmXo8DUgmIH9mDKSeGkDSCOXD5iPESsGTxg==', N'QMXTWWNHFB6OH7CQJYHAEX2J7DHEGRQP', N'ed134057-78cc-44a2-92a1-a4dae0529bb8', N'0903888999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9bb0abac-7bba-4efb-adae-08d942296662', N'Nguyễn Hữu Anh', CAST(N'1994-04-04T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-23T12:54:32.1275213' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', CAST(N'2021-03-23T12:54:32.1005719' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'none_avatar.png', 2, 1, N'huuanh@gmail.com', N'HUUANH@GMAIL.COM', N'huuanh@gmail.com', N'HUUANH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOPWR8KT/BdaRUaQ9HAW1AUv7Nvh7ObNF/dtZZ7+DTo7ez5UfHpHVlgQ0G7wsGey+w==', N'AWSIBJHWLZDHFDL22MBE5V755RACRJBN', N'ecf9fe51-ac3e-4f26-aaab-18e010d86fd6', N'0903519611', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9f8d058f-e006-476a-b6cc-e684620fb465', N'Trần Minh Khoa', CAST(N'1997-05-05T00:00:00.0000000' AS DateTime2), 1, N'5 Lê Lợi', CAST(N'2021-03-10T13:50:59.4831020' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:50:59.4830966' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'fa02f227-2edf-4abb-b10d-c955c422ce03_Img5.png', 1, 1, N'minhkhoa@gmail.com', N'MINHKHOA@GMAIL.COM', N'minhkhoa@gmail.com', N'MINHKHOA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEv0c/DXeMc8KlmCEQUR8uVjvQs3b8EA2CEDdFD+GWu6AggTEelFQUgFtlYdq0pi2w==', N'G2B7OGSYDE4JIWTNNCEQ5VC6KDZDDLBH', N'dbeb4ca2-8305-48cf-8c7c-bdebcdb27ee3', N'0903777888', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', N'Lê Lương Long', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-11T13:56:01.4332241' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-11T16:47:36.0100000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'luonglong@gmail.com', N'LUONGLONG@GMAIL.COM', N'luonglong@gmail.com', N'LUONGLONG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEE+RcVAFdaNTJLD5X3ernKRHS4mexerYAlu2pCZdmJAdruWj86JY8JeXmqjRAezeKw==', N'Y3FTUTB4GSRN6Q6BFOA2LVIKIHP23XMW', N'0d85fc5f-9b01-4c14-a518-0da4ac3a221a', N'0909999995', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a7f3ca3d-d87a-4b8d-be1f-d3403704084f', N'Nguyễn Văn Hoàng', CAST(N'1999-02-01T00:00:00.0000000' AS DateTime2), 1, N'6 Bến Nghé', CAST(N'2021-03-10T13:57:01.7670102' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:57:40.4700000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'e25ba5f2-7d6e-4a28-84d0-77c310bdd84b_Img2.png', 1, 1, N'vanhoang@gmail.com', N'VANHOANG@GMAIL.COM', N'vanhoang@gmail.com', N'VANHOANG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKtJ7Z9UOBnq2sFXY2+k3eCnlFIYe626sd0sGtywaL+8KAFLma4H5ml9v9SyxxS07w==', N'HAZZK2YHTFSFOOFC3C6XWKAFSWAUWID3', N'e3d45050-4897-47eb-aefd-789a7b329399', N'0905333333', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b60a3d4c-4327-47a4-99ee-02ca55f8b8f2', N'Hồng Sơn', CAST(N'1993-12-05T00:00:00.0000000' AS DateTime2), 1, N'7 Lê Quý Đôn', CAST(N'2021-03-09T13:34:43.2552688' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T13:58:14.0000000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'069af999-79a0-4fda-860f-9bc153a23f02_Img1.png', 3, 1, N'hongson@gmail.com', N'HONGSON@GMAIL.COM', N'hongson@gmail.com', N'HONGSON@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBCVxFoHpj4MpykSlZgHh29Hrm57+D7F9abzgwmIYfQSwk1mNADXo1Nv51dDUAMVwg==', N'J2IC4L7QEGE73TJVHKUT3XBOVUXTLZDE', N'87fcc3be-64bb-4069-a402-5de50abd4ad6', N'0707777777', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b8a59dd2-53a4-4f64-850b-43eb806f7a0d', N'Nguyễn Hữu Tuấn', CAST(N'1995-04-04T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-23T12:56:33.6101648' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', CAST(N'2021-03-23T12:56:33.6101535' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'none_avatar.png', 2, 1, N'huutuan@gmail.com', N'HUUTUAN@GMAIL.COM', N'huutuan@gmail.com', N'HUUTUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIk9u1B+lPnoUnhf72c5OuN5K5foYNey6Y29Kt+9tpqvwZaUCTb9l6nN/W946zbjNg==', N'IN2FAT7CXIZUZ6D67HYRJYMZ2O3TIFRJ', N'aa561f6e-bf56-4b8e-baf1-08e960b7d68d', N'0903519611', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c372e079-b530-4682-98fa-87db8d7b09a5', N'Trần Trung Quân', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-11T13:58:19.6422228' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-11T16:47:47.6933333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'trungquan@gmail.com', N'TRUNGQUAN@GMAIL.COM', N'trungquan@gmail.com', N'TRUNGQUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAED6OyiJhXl5ZeD3L8DXUSctQxrO05M7YuaNpPZBn0xuJznwhnrnXY+QkBfyPk5V/qg==', N'I3IECRJRFMOQ4GMPP57JAGC2OV6BJUUW', N'8bc833ea-9590-4572-971a-25e44890ca11', N'0909999944', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', N'Nguyễn Hữu Anh Khoa', CAST(N'1990-05-05T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương', CAST(N'2021-03-11T14:07:53.8224345' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-24T10:32:11.2000000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'872a5718-baa8-4e85-bfd0-75da80830b3e_Img6.png', 0, 1, N'anhkhoa@gmail.com', N'ANHKHOA@GMAIL.COM', N'anhkhoa@gmail.com', N'ANHKHOA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENcKfSgv3BGSlaYQOTcgEfcwXVSuPiJ5x3TVPXh3uBEOg/zpVOdS2ELOCzbdBqmJiA==', N'H2QXSOAUAXZEXYSJPSGC3PWA4V3CVUWY', N'0064884c-b5dd-4ded-a8d2-4a9756cab4dd', N'0909999999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c71b7a6c-bba2-4fbb-b71c-91381259728b', N'Minh Tân', CAST(N'1998-12-15T00:00:00.0000000' AS DateTime2), 1, N'11 Lê Quý Đôn', CAST(N'2021-03-09T16:38:24.1467631' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-10T15:10:14.2333333' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'c497a526-61ca-4545-9097-ba590a6d8c1c_Img2.png', 3, 1, N'minhtan@gmail.com', N'MINHTAN@GMAIL.COM', N'minhtan@gmail.com', N'MINHTAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEL8DArOPXET0zkFm4SR0M9H/1tQn5yUuS56X3aCwoCEChRMC4zyeIvfb/uPP86hH5A==', N'T6E6RVNH4GDT5XXGEKJOC6QMXKQRTEPR', N'9f646c72-bc3d-4c0e-b47c-54034bf1beab', N'0907455555', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ca9bb1f9-2a13-4f7a-ba46-29d12828150a', N'Nguyễn Mỹ', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), 1, N'5 Lê Quý Đôn - TP Huế', CAST(N'2021-03-09T13:00:00.9182896' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-09T13:00:00.9174132' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'c8234168-0e3a-4068-9941-55746f4a5187_Img2.png', 1, 1, N'nguyenmy@gmail.com', N'NGUYENMY@GMAIL.COM', N'nguyenmy@gmail.com', N'NGUYENMY@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMXq75rzNT1fo1lCyBinmVEx6rvqbg3noPuz5dezbt4K4in3kPN84gJMt9ZCy0PUVg==', N'6A2PIIRERPMFFMHZFXRLOPYYPWBMEJIA', N'd334c677-7a9f-4354-b389-b1eec0337ae3', N'0903518645', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd91c232a-13a5-4987-a295-07a97fab9aaa', N'Huy Hiệu', CAST(N'1996-05-01T00:00:00.0000000' AS DateTime2), 1, N'6 Lê Quý Đôn', CAST(N'2021-03-09T13:27:56.1637372' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T11:14:09.5166667' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', N'0a61dd06-eb6f-44af-b870-0daee3d67da0_Img2.png', 2, 1, N'huyhieu@gmail.com', N'HUYHIEU@GMAIL.COM', N'huyhieu@gmail.com', N'HUYHIEU@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJ57QC/ZhgHuZ78SnCXF8wUFdcjr2IyKXvKnLYtCgfxFcIAe7kFP/Rid/oAKQSuyGw==', N'2756M2QKIU7R5OEPKKR6WSM2MWPBMNCY', N'b48da056-7609-4b21-82cd-4a9ca1339665', N'0903519612', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', N'Văn Vui', CAST(N'1995-10-06T00:00:00.0000000' AS DateTime2), 1, N'8 Lê Quý Đôn', CAST(N'2021-03-09T15:40:58.8824180' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-09T15:40:58.8821220' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'4e794afe-fefe-4c95-bcb9-5723c4e018b1_Img3.png', 2, 1, N'vanvui@gmail.com', N'VANVUI@GMAIL.COM', N'vanvui@gmail.com', N'VANVUI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOrhgRW7QBosSF6Uot78N6yJRlhe4hCGo2DT4iIjft15BAZxqHtZpiP/4IVift7Dxg==', N'HL5TCQWQY3ZZG5CWUK4JNLP2LGAXJMHK', N'444b7688-488b-4b8c-bf91-bdf4970787e5', N'0903511111', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e695c485-5dda-4377-a407-5f3f2d475257', N'Nguyễn Tùng', CAST(N'1995-10-19T00:00:00.0000000' AS DateTime2), 1, N'1 Le Quy Don', CAST(N'2021-03-04T11:05:28.7942853' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-04T11:05:28.7936683' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 0, 1, N'superadmin@gmail.com', N'SUPERADMIN@GMAIL.COM', N'superadmin@gmail.com', N'SUPERADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIJqOcw60T9t6xd6YAcmvIbVQcux6YtvCXi61o4hWjDIZKsWAMFYNu8rPZ3wE43u5Q==', N'OPHYFG642T5JDZXE2JKTM6W5D255K6JC', N'ee7119b4-61ba-4c58-88b5-61e594966a5e', N'0903518999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f168939f-b7d4-46fa-9480-0bebb7397460', N'Nguyễn Văn Thuận', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), 1, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-25T11:58:33.6383000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-25T11:58:33.6360794' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'20a06c13-7620-4110-bd48-5ee1fe68e88a_Img5.png', 1, 1, N'thuan@gmail.com', N'THUAN@GMAIL.COM', N'thuan@gmail.com', N'THUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKzYkVJKo0EFHzyUhsuzIVSOO5oT268j/tSE53bdnr/KGVcoqS6VZNi+Zqkh9iGGKA==', N'U6LN4BGTUK3VL4PK3FLDORNAAPBZOPCB', N'52e13935-cc37-4243-8dab-383d9b94af5f', N'0903515555', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f588ba4b-d99d-47b7-8b1a-87ebdaab5190', N'Đỗ Mỹ Linh', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), 0, N'28 Nguyễn Tri Phương - TP Huế', CAST(N'2021-03-09T13:42:55.7173097' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T10:38:50.6366667' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 3, 1, N'mylinh@gmail.com', N'MYLINH@GMAIL.COM', N'mylinh@gmail.com', N'MYLINH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEoMnNEIH17Y4ntWKSMbGAjohY1vk/t19dHFgc60v3WgQgCqO+VSdQZ+b2O0R08RWA==', N'6GCUARWO7VIVSBO2BICDWN52XPAWAVLL', N'1e62efd9-13b2-4e97-9aca-b30934389206', N'0903518655', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [Gender], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [AvatarPath], [CourseId], [StatusId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f63e8777-abae-4abd-badf-86ca152fb1b2', N'Lý Hoàng', CAST(N'1996-06-02T00:00:00.0000000' AS DateTime2), 1, N'5 Lê Quý Đôn - TP Huế', CAST(N'2021-03-23T11:57:41.3010031' AS DateTime2), N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', CAST(N'2021-03-23T14:19:03.4300000' AS DateTime2), N'e695c485-5dda-4377-a407-5f3f2d475257', N'none_avatar.png', 2, 1, N'lyhoang@gmail.com', N'LYHOANG@GMAIL.COM', N'lyhoang@gmail.com', N'LYHOANG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENvF/17cAXZFQleTrcQ5FCBwsvv/iqTP2GEr3TcLX0UH+jOz9qljgLKXPC+n37awDg==', N'4DNKHUUFAM3GKDAVRGJTOSP62VUQXCQC', N'414a2c6d-ebe8-467d-a6d3-b61ba29e730e', N'0903515555', 0, 0, NULL, 1, 0)
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (1, N'C01', N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5')
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (2, N'C02', N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8')
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (3, N'C03', N'e695c485-5dda-4377-a407-5f3f2d475257')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (1, N'Toán')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (2, N'Ngữ Văn')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (3, N'Tiếng Anh')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (4, N'Vật lý')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (5, N'Hóa học')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (6, N'Sinh học')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (7, N'Địa lý')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (8, N'Lịch sử')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (9, N'Tin học')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (10, N'Công nghệ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (11, N'Thể dục')
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', 1, 2)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', 3, 2)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'3dabf300-50ab-438b-baaa-f6890f2b260c', 1, 3)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 2, 2)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 3, 3)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', 2, 3)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 1, 1)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 1, 9)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 2, 1)
INSERT [dbo].[TeacherCourse] ([AccountId], [CourseId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 3, 1)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', 1)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'2f3baf7f-a5b4-4627-abcb-0e42e2fb33a8', 2)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'3dabf300-50ab-438b-baaa-f6890f2b260c', 3)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 2)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'560b9a81-71e6-4987-a6c2-ecf72ecd36b5', 3)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', 1)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'a32b24c3-969c-41a5-ae25-41bae2309c67', 3)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c372e079-b530-4682-98fa-87db8d7b09a5', 2)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 1)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 3)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 4)
INSERT [dbo].[TeacherSubject] ([AccountId], [SubjectId]) VALUES (N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', 9)
SET IDENTITY_INSERT [dbo].[Transcript] ON 

INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (1, N'8919cdee-d42b-4bec-96b6-b748bea915fd', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (5, N'8919cdee-d42b-4bec-96b6-b748bea915fd', 1, 3, 10, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (6, N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', 1, 1, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:12:04.197' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (7, N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:12:41.423' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (8, N'e3e34cb6-75cc-4dbf-b56c-18277bd2d046', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-16T16:24:40.223' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (44, N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', 2, 1, 5, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T08:07:00.740' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (45, N'7c4ac2b8-4156-4e08-9167-5715d3f7d410', 2, 2, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T08:07:13.643' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (46, N'9f8d058f-e006-476a-b6cc-e684620fb465', 3, 1, 5.5, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T08:08:21.797' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (47, N'9f8d058f-e006-476a-b6cc-e684620fb465', 3, 3, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T08:08:34.723' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (49, N'7c4ac2b8-4156-4e08-9167-5715d3f7d410', 1, 1, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:14:53.520' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (52, N'9f8d058f-e006-476a-b6cc-e684620fb465', 1, 2, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:26:01.287' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (57, N'814ebb12-4853-46e6-854b-87b5eb32d667', 1, 1, 7.7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:29:51.733' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (58, N'814ebb12-4853-46e6-854b-87b5eb32d667', 1, 1, 8.9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:29:51.733' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (62, N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:40:59.767' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (63, N'5afbcc5e-955a-4614-a3a3-ebcb5283c77c', 1, 2, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-18T09:41:18.830' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (68, N'd91c232a-13a5-4987-a295-07a97fab9aaa', 1, 2, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T11:26:21.453' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (69, N'd91c232a-13a5-4987-a295-07a97fab9aaa', 1, 1, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T11:26:29.627' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (70, N'd91c232a-13a5-4987-a295-07a97fab9aaa', 1, 3, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T14:57:52.253' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (71, N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', 1, 1, 7.7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T15:00:49.153' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (72, N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', 1, 1, 8.6, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T15:00:49.153' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (73, N'814ebb12-4853-46e6-854b-87b5eb32d667', 3, 1, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T15:02:34.250' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (80, N'a7f3ca3d-d87a-4b8d-be1f-d3403704084f', 1, 1, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T15:09:28.190' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (81, N'7c4ac2b8-4156-4e08-9167-5715d3f7d410', 1, 2, 10, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T15:09:41.903' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (84, N'8919cdee-d42b-4bec-96b6-b748bea915fd', 1, 2, 10, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T15:16:48.670' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (85, N'8919cdee-d42b-4bec-96b6-b748bea915fd', 1, 2, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-22T15:16:48.670' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (90, N'61aa0de3-9743-47c5-b9b6-759ee51a1d07', 1, 1, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:10:18.647' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (91, N'd91c232a-13a5-4987-a295-07a97fab9aaa', 2, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:26:54.233' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (92, N'3c592e96-f3ad-4e8b-9cbe-afb7ea745362', 3, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:29:01.837' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (93, N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', 2, 1, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:30:29.480' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (94, N'c71b7a6c-bba2-4fbb-b71c-91381259728b', 2, 2, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:30:51.680' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (95, N'c71b7a6c-bba2-4fbb-b71c-91381259728b', 2, 2, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:30:51.683' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (96, N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', 2, 2, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:31:04.613' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (97, N'29a908b8-3ac4-45ea-a8a1-1cf9946079c7', 2, 2, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:31:04.613' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (101, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 1, 1, 6.9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:37:39.860' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (102, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 1, 1, 8.8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:37:39.863' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (107, N'ca9bb1f9-2a13-4f7a-ba46-29d12828150a', 2, 1, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:42:06.270' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (108, N'ca9bb1f9-2a13-4f7a-ba46-29d12828150a', 2, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:42:06.270' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (109, N'814ebb12-4853-46e6-854b-87b5eb32d667', 1, 2, 7.5, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:55:43.440' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (110, N'814ebb12-4853-46e6-854b-87b5eb32d667', 1, 2, 8, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:55:43.440' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (114, N'ca9bb1f9-2a13-4f7a-ba46-29d12828150a', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T15:58:52.937' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (115, N'a7f3ca3d-d87a-4b8d-be1f-d3403704084f', 1, 1, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T16:00:02.787' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (116, N'814ebb12-4853-46e6-854b-87b5eb32d667', 1, 3, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-23T16:04:23.997' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (117, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 3, 1, 4, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-24T08:36:28.190' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (119, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 3, 3, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-24T08:36:49.390' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (120, N'b60a3d4c-4327-47a4-99ee-02ca55f8b8f2', 3, 1, 6, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-24T08:37:04.117' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (121, N'b60a3d4c-4327-47a4-99ee-02ca55f8b8f2', 3, 2, 7, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-24T08:37:09.060' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (123, N'b60a3d4c-4327-47a4-99ee-02ca55f8b8f2', 3, 3, 9, N'e695c485-5dda-4377-a407-5f3f2d475257', CAST(N'2021-03-24T08:37:25.553' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (124, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 9, 1, 8.8000001907348633, N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', CAST(N'2021-03-25T13:30:48.557' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (130, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 9, 2, 8.6, N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', CAST(N'2021-03-25T13:48:56.653' AS DateTime))
INSERT [dbo].[Transcript] ([TranscriptId], [AccountId], [SubjectId], [Coefficient], [Score], [GeneratebBy], [GeneratebDate]) VALUES (131, N'06b12f97-bb16-434a-9982-e3d3dc1c5145', 9, 2, 7, N'c4d8ec24-1fc9-487e-a55a-d9171ee9d266', CAST(N'2021-03-25T13:48:56.653' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transcript] OFF
INSERT [dbo].[Wiki] ([TableId], [TableName], [StatusId], [StatusName], [IsDeleted]) VALUES (1, N'User', 1, N'Bình thường', 0)
INSERT [dbo].[Wiki] ([TableId], [TableName], [StatusId], [StatusName], [IsDeleted]) VALUES (1, N'User', 2, N'Khóa', 0)
INSERT [dbo].[Wiki] ([TableId], [TableName], [StatusId], [StatusName], [IsDeleted]) VALUES (1, N'User', 4, N'Xóa', 0)
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
