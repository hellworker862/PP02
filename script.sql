USE [pp02Bd]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 24.03.2023 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (106, N'Оскар', N'Васильев', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'1971-01-30T00:00:00.000' AS DateTime), N'miturria@verizon.net', N'7(585)801-94-29', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (107, N'Алексей', N'Лазарев', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'1977-03-10T00:00:00.000' AS DateTime), N'claesjac@me.com', N'7(0055)737-37-48', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (108, N'Дмитрий', N'Казаков', N'Русланович', CAST(N'1978-12-15' AS Date), CAST(N'1978-12-15T00:00:00.000' AS DateTime), N'ozawa@verizon.net', N'7(51)682-19-40', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (109, N'Харита', N'Попова', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'1997-12-16T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (110, N'Георгина', N'Турова', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'1974-05-28T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (111, N'Станислав', N'Андреев', N'Максович', CAST(N'1975-10-10' AS Date), CAST(N'1975-10-10T00:00:00.000' AS DateTime), N'budinger@mac.com', N'7(02)993-91-28', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (112, N'Влада', N'Орлова', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'1990-06-26T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (113, N'Любава', N'Костина', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'1972-07-13T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (114, N'Станислав', N'Александров', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'1981-07-04T00:00:00.000' AS DateTime), N'bigmauler@aol.com', N'7(18)164-05-12', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (115, N'Анэля', N'Корнилова', N'Михайловна', CAST(N'1973-04-02' AS Date), CAST(N'1973-04-02T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (116, N'Наум', N'Морозов', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'1985-07-04T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (117, N'Эльмира', N'Баранова', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'1977-01-15T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (118, N'Амелия', N'Степанова', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'1970-06-06T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (119, N'Давид', N'Горбачёв', N'Тимурович', CAST(N'1983-05-22' AS Date), CAST(N'1983-05-22T00:00:00.000' AS DateTime), N'hedwig@att.net', N'7(53)602-85-41', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (120, N'Людвиг', N'Волков', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'1977-12-27T00:00:00.000' AS DateTime), N'jrkorson@msn.com', N'7(8459)592-05-58', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (121, N'Амалия', N'Комиссарова', N'Робертовна', CAST(N'1971-08-18' AS Date), CAST(N'1971-08-18T00:00:00.000' AS DateTime), N'jorgb@msn.com', N'7(22)647-46-32', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (122, N'Вадим', N'Большаков', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'1970-05-15T00:00:00.000' AS DateTime), N'uncle@gmail.com', N'7(386)641-13-37', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (123, N'Станислав', N'Абрамов', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'1989-05-18T00:00:00.000' AS DateTime), N'solomon@att.net', N'7(6545)478-87-79', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (124, N'Леонтий', N'Журавлёв', N'Яковлевич', CAST(N'2000-03-02' AS Date), CAST(N'2000-03-02T00:00:00.000' AS DateTime), N'cmdrgravy@me.com', N'7(4403)308-56-96', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (125, N'Глеб', N'Селиверстов', N'Максимович', CAST(N'1999-06-20' AS Date), CAST(N'1999-06-20T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (126, N'Устин', N'Киселёв', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'1985-01-08T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (127, N'Матвей', N'Зуев', N'Иванович', CAST(N'1981-03-28' AS Date), CAST(N'1981-03-28T00:00:00.000' AS DateTime), N'brickbat@verizon.net', N'7(5383)893-04-66', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (128, N'Глеб', N'Ершов', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'1970-06-14T00:00:00.000' AS DateTime), N'sjava@aol.com', N'7(2608)298-40-82', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (129, N'Георгий', N'Бобылёв', N'Витальевич', CAST(N'1983-12-19' AS Date), CAST(N'1983-12-19T00:00:00.000' AS DateTime), N'csilvers@mac.com', N'7(88)685-13-51', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (130, N'Витольд', N'Ефремов', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'1975-12-02T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (131, N'Патрисия', N'Андреева', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'1993-11-18T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (132, N'Магда', N'Ефимова', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'1995-08-16T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (133, N'Иосиф', N'Голубев', N'Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'1982-05-06T00:00:00.000' AS DateTime), N'smcnabb@att.net', N'7(78)972-73-11', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (134, N'Макар', N'Евсеев', N'Васильевич', CAST(N'1977-09-13' AS Date), CAST(N'1977-09-13T00:00:00.000' AS DateTime), N'parsimony@sbcglobal.net', N'7(2141)077-85-70', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (135, N'Агафон', N'Бобров', N'Лаврентьевич', CAST(N'1995-07-29' AS Date), CAST(N'1995-07-29T00:00:00.000' AS DateTime), N'petersen@comcast.net', N'7(2159)507-39-57', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (136, N'Захар', N'Игнатов', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'1998-10-07T00:00:00.000' AS DateTime), N'dieman@icloud.com', N'7(578)574-73-36', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (137, N'Янита', N'Гущина', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'1999-03-02T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (138, N'Артур', N'Калашников', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'1972-12-13T00:00:00.000' AS DateTime), N'oevans@aol.com', N'7(147)947-47-21', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (139, N'Элина', N'Дмитриева', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'1988-12-10T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (140, N'Сандра', N'Федотова', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'1985-03-29T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (141, N'Дэнна', N'Кузьмина', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'1993-08-24T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (142, N'Злата', N'Колобова', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'1994-08-25T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (143, N'Варлам', N'Некрасов', N'Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2000-11-12T00:00:00.000' AS DateTime), N'dogdude@verizon.net', N'7(019)258-06-35', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (144, N'Орест', N'Колобов', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2001-07-14T00:00:00.000' AS DateTime), N'parkes@verizon.net', N'7(1680)508-58-26', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (145, N'Пантелеймон', N'Блохин', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'1978-03-06T00:00:00.000' AS DateTime), N'balchen@comcast.net', N'7(9524)556-48-98', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (146, N'Петр', N'Калинин', N'Иванович', CAST(N'1993-09-08' AS Date), CAST(N'1993-09-08T00:00:00.000' AS DateTime), N'aschmitz@hotmail.com', N'7(90)316-07-17', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (147, N'Сабрина', N'Беляева', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'1972-07-26T00:00:00.000' AS DateTime), N'agapow@gmail.com', N'7(6580)534-32-58', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (148, N'Юстиниан', N'Агафонов', N'Олегович', CAST(N'1997-02-02' AS Date), CAST(N'1997-02-02T00:00:00.000' AS DateTime), N'staffelb@sbcglobal.net', N'7(303)810-28-78', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (149, N'Марфа', N'Мамонтова', N'Мироновна', CAST(N'1984-10-19' AS Date), CAST(N'1984-10-19T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (150, N'Евгений', N'Блинов', N'Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'1994-01-05T00:00:00.000' AS DateTime), N'moxfulder@outlook.com', N'7(0852)321-82-64', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (151, N'Изабелла', N'Воронова', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'1999-09-24T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (152, N'Святослав', N'Медведев', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'1972-10-04T00:00:00.000' AS DateTime), N'hllam@comcast.net', N'7(3520)435-21-20', N'm', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (153, N'Эвелина', N'Куликова', N'Вячеславовна', CAST(N'1997-11-14' AS Date), CAST(N'1997-11-14T00:00:00.000' AS DateTime), N'ilikered@hotmail.com', N'7(0236)682-42-78', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (154, N'Божена', N'Суворова', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'1981-03-09T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57', N'w', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (155, N'Амалия', N'Егорова', N'Дамировна', CAST(N'1999-09-28' AS Date), CAST(N'1999-09-28T00:00:00.000' AS DateTime), N'drezet@yahoo.com', N'7(7486)408-12-26', N'w', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (113, 154, 10, CAST(N'2023-11-16T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (114, 142, 41, CAST(N'2023-01-11T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (115, 142, 19, CAST(N'2023-12-01T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (116, 142, 28, CAST(N'2023-02-11T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (117, 125, 30, CAST(N'2023-09-10T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (118, 153, 26, CAST(N'2023-02-12T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (119, 129, 92, CAST(N'2023-04-04T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (120, 126, 20, CAST(N'2023-05-15T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (121, 121, 52, CAST(N'2023-01-16T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (122, 135, 34, CAST(N'2023-01-16T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (123, 108, 52, CAST(N'2023-03-15T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (124, 131, 41, CAST(N'2023-03-31T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (125, 111, 64, CAST(N'2023-03-19T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (126, 138, 32, CAST(N'2023-01-10T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (127, 140, 52, CAST(N'2023-04-29T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (128, 148, 80, CAST(N'2023-10-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (129, 153, 48, CAST(N'2023-02-13T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (130, 138, 64, CAST(N'2023-02-01T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (131, 135, 63, CAST(N'2023-11-12T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (132, 122, 83, CAST(N'2023-01-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (133, 114, 50, CAST(N'2023-03-23T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (134, 148, 12, CAST(N'2023-06-23T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (135, 143, 18, CAST(N'2023-03-25T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (136, 122, 67, CAST(N'2023-02-18T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (137, 140, 13, CAST(N'2023-07-17T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (138, 140, 92, CAST(N'2023-08-06T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (139, 106, 77, CAST(N'2023-12-14T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (140, 127, 76, CAST(N'2023-06-28T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (141, 153, 97, CAST(N'2023-06-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (142, 129, 50, CAST(N'2023-06-07T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (143, 151, 23, CAST(N'2023-04-30T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (144, 111, 83, CAST(N'2023-08-30T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (145, 130, 20, CAST(N'2023-05-08T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (146, 147, 66, CAST(N'2023-10-27T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (147, 135, 13, CAST(N'2023-01-05T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (148, 127, 27, CAST(N'2023-03-04T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (149, 155, 69, CAST(N'2023-03-24T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (150, 132, 3, CAST(N'2023-03-23T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (151, 135, 64, CAST(N'2023-03-25T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (152, 137, 29, CAST(N'2023-11-15T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (153, 117, 9, CAST(N'2023-07-04T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (154, 126, 41, CAST(N'2023-08-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (155, 140, 80, CAST(N'2023-11-09T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (156, 129, 62, CAST(N'2023-02-16T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (157, 128, 69, CAST(N'2023-03-03T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (158, 118, 23, CAST(N'2023-05-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (159, 141, 10, CAST(N'2023-07-31T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (160, 121, 27, CAST(N'2023-08-29T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (161, 126, 13, CAST(N'2023-10-02T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (162, 113, 41, CAST(N'2023-03-16T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (163, 148, 29, CAST(N'2023-08-27T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (164, 123, 66, CAST(N'2023-06-13T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (165, 109, 80, CAST(N'2023-08-18T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (166, 119, 34, CAST(N'2023-12-26T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (167, 116, 7, CAST(N'2023-11-27T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (168, 152, 13, CAST(N'2023-09-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (169, 151, 98, CAST(N'2023-09-24T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (170, 137, 89, CAST(N'2023-03-01T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (171, 110, 7, CAST(N'2023-09-28T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (172, 120, 92, CAST(N'2023-03-20T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (173, 115, 80, CAST(N'2023-11-27T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (174, 108, 60, CAST(N'2023-01-23T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (175, 132, 27, CAST(N'2023-10-21T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (176, 133, 92, CAST(N'2023-08-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (177, 112, 13, CAST(N'2023-01-03T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (178, 138, 64, CAST(N'2023-12-31T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (179, 146, 20, CAST(N'2023-08-29T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (180, 118, 19, CAST(N'2023-01-03T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (181, 119, 30, CAST(N'2023-04-09T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (182, 132, 12, CAST(N'2023-12-31T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (183, 107, 19, CAST(N'2023-10-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (184, 151, 69, CAST(N'2023-05-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (185, 116, 14, CAST(N'2023-11-23T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (186, 115, 83, CAST(N'2023-07-10T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (187, 142, 40, CAST(N'2023-06-09T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (188, 128, 69, CAST(N'2023-01-09T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (189, 107, 60, CAST(N'2023-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (190, 134, 83, CAST(N'2023-07-15T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (191, 126, 14, CAST(N'2023-12-31T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (192, 137, 7, CAST(N'2023-12-22T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (193, 119, 51, CAST(N'2023-12-28T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (194, 138, 69, CAST(N'2023-06-26T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (195, 115, 10, CAST(N'2023-04-29T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (196, 153, 10, CAST(N'2023-04-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (197, 128, 48, CAST(N'2023-01-05T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (198, 110, 40, CAST(N'2023-03-25T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (199, 134, 18, CAST(N'2023-11-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (200, 136, 41, CAST(N'2023-04-07T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (201, 154, 67, CAST(N'2023-11-11T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (202, 139, 13, CAST(N'2023-01-06T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (203, 109, 48, CAST(N'2023-08-20T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (204, 150, 48, CAST(N'2023-04-16T13:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (205, 132, 52, CAST(N'2023-12-22T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (206, 145, 83, CAST(N'2023-01-22T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (207, 113, 18, CAST(N'2023-09-04T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (208, 146, 77, CAST(N'2023-01-01T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (209, 140, 14, CAST(N'2023-01-29T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (210, 145, 49, CAST(N'2023-07-06T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (211, 133, 98, CAST(N'2023-12-05T10:20:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (212, 125, 48, CAST(N'2023-04-05T13:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (213, 106, 39, CAST(N'2023-03-25T08:09:28.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (214, 106, 5, CAST(N'2023-03-25T09:09:47.900' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (215, 106, 91, CAST(N'2023-03-25T09:11:13.343' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'm', N'мужской')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'w', N'женский')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Занятие с репетитором-носителем китайского языка', 1950.0000, 7200, NULL, 0, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Индивидуальный урок немецкого языка с преподавателем-носителем языка', 1340.0000, 6600, NULL, 0, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Киноклуб китайского языка для студентов', 1990.0000, 6000, NULL, 0, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Индивидуальный онлайн-урок японского языка по Skype', 1000.0000, 4800, NULL, 0, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Киноклуб испанского языка для студентов', 1050.0000, 2400, NULL, 0.1, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Занятие с русскоязычным репетитором испанского языка', 1450.0000, 3000, NULL, 0.15, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Урок в группе итальянского языка для взрослых', 1290.0000, 2400, NULL, 0, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Интенсивный онлайн-курс французского языка для компаний по Skype', 1180.0000, 2400, NULL, 0.1, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Индивидуальный урок французского языка с преподавателем-носителем языка', 1410.0000, 2400, NULL, 0.2, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Урок в группе французского языка для школьников', 1970.0000, 6000, NULL, 0, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Занятие с репетитором-носителем английского языка', 910.0000, 6600, NULL, 0, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Киноклуб французского языка для взрослых', 1770.0000, 5400, NULL, 0.1, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Киноклуб немецкого языка для взрослых', 1560.0000, 6000, NULL, 0.1, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Урок в группе японского языка для школьников', 1300.0000, 4800, NULL, 0.05, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Индивидуальный урок испанского языка с русскоязычным преподавателем', 1790.0000, 3600, NULL, 0.15, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Интенсивный онлайн-курс итальянского языка для компаний по Skype', 1230.0000, 4200, NULL, 0.1, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Урок в группе японского языка для студентов', 1860.0000, 3000, NULL, 0, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', 1670.0000, 6600, NULL, 0.1, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Киноклуб итальянского языка для студентов', 1760.0000, 1800, NULL, 0, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Урок в группе испанского языка для взрослых', 1730.0000, 1800, NULL, 0.05, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Урок в группе испанского языка для студентов', 1310.0000, 6000, NULL, 0.2, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Интенсивный онлайн-курс испанского языка для компаний по Skype', 1510.0000, 7200, NULL, 0, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Урок в группе английского языка для школьников', 900.0000, 6600, NULL, 0, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Занятие с репетитором-носителем испанского языка', 1090.0000, 3000, NULL, 0.05, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Интенсивный курс с преподавателем-носителем итальянского языка для компаний', 1190.0000, 2400, NULL, 0.2, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Урок в группе китайского языка для студентов', 2000.0000, 2400, NULL, 0.2, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', 1200.0000, 5400, NULL, 0.1, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', 1610.0000, 4200, NULL, 0.05, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Подготовка к экзамену ACT', 1440.0000, 3000, NULL, 0, N' Услуги школы\Подготовка к экзамену ACT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Урок в группе китайского языка для взрослых', 1730.0000, 4200, NULL, 0.25, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Интенсивный онлайн-курс английского языка для компаний по Skype', 1160.0000, 3000, NULL, 0, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Подготовка к экзамену TOEFL', 1070.0000, 6000, NULL, 0.05, N' Услуги школы\Подготовка к экзамену TOEFL.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Занятие с репетитором-носителем итальянского языка', 1370.0000, 7200, NULL, 0.05, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Урок в группе английского языка для взрослых', 1010.0000, 3000, NULL, 0.25, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Киноклуб английского языка для взрослых', 1250.0000, 4200, NULL, 0.05, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Интенсивный курс с преподавателем-носителем французского языка для компаний', 1630.0000, 4200, NULL, 0.15, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Урок в группе испанского языка для школьников', 1910.0000, 7200, NULL, 0, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Подготовка к экзамену GRE', 1300.0000, 4800, NULL, 0.2, N' Услуги школы\Подготовка к экзамену GRE.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Урок в группе английского языка для студентов', 960.0000, 4800, NULL, 0.25, N'Услуги школы\00d2bea3-151c-438d-b491-03581fd7bd4c.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Занятие с русскоязычным репетитором японского языка', 1260.0000, 2400, NULL, 0.1, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Индивидуальный онлайн-урок немецкого языка по Skype', 970.0000, 5400, NULL, 0, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Интенсивный курс японского языка с русскоязычным преподавателем для компаний', 1500.0000, 4800, NULL, 0, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Киноклуб китайского языка для взрослых', 1800.0000, 4200, NULL, 0.25, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Индивидуальный урок китайского языка с русскоязычным преподавателем', 1860.0000, 7200, NULL, 0.1, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Подготовка к экзамену GMAT', 1150.0000, 4200, NULL, 0.05, N' Услуги школы\Подготовка к экзамену GMAT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Подготовка к экзамену IELTS', 1730.0000, 7200, NULL, 0, N' Услуги школы\Подготовка к экзамену IELTS.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Подготовка к экзамену SAT', 1560.0000, 2400, NULL, 0, N' Услуги школы\Подготовка к экзамену SAT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Урок в группе китайского языка для школьников', 1180.0000, 3000, NULL, 0.15, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Киноклуб английского языка для студентов', 980.0000, 4800, NULL, 0, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Киноклуб португальского языка для студентов', 1170.0000, 1800, NULL, 0.15, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Киноклуб китайского языка для детей', 1120.0000, 6000, NULL, 0.1, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Урок в группе немецкого языка для школьников', 1570.0000, 1800, NULL, 0.15, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Индивидуальный онлайн-урок испанского языка по Skype', 1780.0000, 4200, NULL, 0.05, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Урок в группе немецкого языка для взрослых', 930.0000, 3600, NULL, 0.05, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Индивидуальный урок китайского языка с преподавателем-носителем языка', 1480.0000, 5400, NULL, 0.2, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Занятие с русскоязычным репетитором португальского языка', 1970.0000, 3000, NULL, 0.1, N' Услуги школы\Португальский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Интенсивный курс китайского языка с русскоязычным преподавателем для компаний', 1470.0000, 6600, NULL, 0, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Занятие с русскоязычным репетитором немецкого языка', 1420.0000, 1800, NULL, 0, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Киноклуб английского языка для детей', 1280.0000, 2400, NULL, 0.05, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Занятие с репетитором-носителем немецкого языка', 1120.0000, 7200, NULL, 0, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Индивидуальный онлайн-урок китайского языка по Skype', 1410.0000, 4200, NULL, 0, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Индивидуальный урок английского языка с преподавателем-носителем языка', 1300.0000, 7200, NULL, 0, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', 1180.0000, 7200, NULL, 0.2, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', 1840.0000, 4200, NULL, 0.1, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Урок в группе итальянского языка для школьников', 1410.0000, 6000, NULL, 0.15, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', 1330.0000, 1800, NULL, 0.2, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', 1760.0000, 7200, NULL, 0.15, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Занятие с русскоязычным репетитором французского языка', 1870.0000, 6000, NULL, 0.2, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', 990.0000, 1800, NULL, 0.05, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Индивидуальный онлайн-урок английского языка по Skype', 1880.0000, 6000, NULL, 0, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Индивидуальный урок французского языка с русскоязычным преподавателем', 1390.0000, 4200, NULL, 0, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Интенсивный курс португальского языка с русскоязычным преподавателем для компаний', 2010.0000, 3600, NULL, 0.25, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Индивидуальный онлайн-урок французского языка по Skype', 2010.0000, 7200, NULL, 0, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Интенсивный курс английского языка с русскоязычным преподавателем для компаний', 1210.0000, 4800, NULL, 0, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Подготовка к экзамену IELTS Speaking Club', 1430.0000, 5400, NULL, 0.2, N' Услуги школы\Подготовка к экзамену IELTS.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Киноклуб итальянского языка для детей', 1480.0000, 4200, NULL, 0, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Урок в группе итальянского языка для студентов', 1020.0000, 6600, NULL, 0, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Индивидуальный урок итальянского языка с преподавателем-носителем языка', 1690.0000, 4800, NULL, 0, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Киноклуб немецкого языка для детей', 1670.0000, 7200, NULL, 0.05, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Киноклуб итальянского языка для взрослых', 1760.0000, 6600, NULL, 0, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Киноклуб португальского языка для взрослых', 950.0000, 1800, NULL, 0.05, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Киноклуб португальского языка для детей', 1710.0000, 5400, NULL, 0.15, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Киноклуб французского языка для детей', 1600.0000, 5400, NULL, 0.1, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Урок в группе японского языка для взрослых', 1420.0000, 4800, NULL, 0.05, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Интенсивный курс французского языка с русскоязычным преподавателем для компаний', 1940.0000, 2400, NULL, 0, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Занятие с русскоязычным репетитором итальянского языка', 1620.0000, 4200, NULL, 0.2, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Индивидуальный урок английского языка с русскоязычным преподавателем', 1910.0000, 1800, NULL, 0.1, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 1580.0000, 1800, NULL, 0, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Интенсивный курс испанского языка с русскоязычным преподавателем для компаний', 1000.0000, 5400, NULL, 0.25, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Киноклуб немецкого языка для студентов', 1140.0000, 3000, NULL, 0.15, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'Занятие с репетитором-носителем французского языка', 2040.0000, 3000, NULL, 0, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'Урок в группе немецкого языка для студентов', 1240.0000, 4200, NULL, 0, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Занятие с русскоязычным репетитором китайского языка', 940.0000, 6600, NULL, 0.15, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Занятие с репетитором-носителем японского языка', 1100.0000, 3000, NULL, 0.25, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Урок в группе французского языка для студентов', 1910.0000, 1800, NULL, 0, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', 900.0000, 6600, NULL, 0, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Занятие с русскоязычным репетитором английского языка', 1950.0000, 5400, NULL, 0.15, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Интенсивный курс с преподавателем-носителем испанского языка для компаний', 1660.0000, 5400, NULL, 0, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Интенсивный курс с преподавателем-носителем японского языка для компаний', 1380.0000, 4200, NULL, 0.2, N' Услуги школы\for company.jpg')
GO
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
