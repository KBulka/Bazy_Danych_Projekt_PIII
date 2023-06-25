USE [Bazy_Danych]
GO
/****** Object:  Table [dbo].[Uczen]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uczen](
	[ID_ucznia] [int] NOT NULL,
	[Id_grupy] [int] NOT NULL,
	[Imie] [nvarchar](50) NOT NULL,
	[Nazwisko] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ucznia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Lista_Uczen]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Lista_Uczen] AS
SELECT * FROM Uczen


GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25.06.2023 02:34:30 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupa]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupa](
	[Id_grupy] [int] NOT NULL,
	[ID_prowadzoncego] [int] NOT NULL,
	[Rok] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_grupy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupy]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupy](
	[Id_Grupa] [int] IDENTITY(1,1) NOT NULL,
	[Rok] [int] NOT NULL,
	[Id_Prowadzoncy] [int] NOT NULL,
 CONSTRAINT [PK_Grupy] PRIMARY KEY CLUSTERED 
(
	[Id_Grupa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Praca]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Praca](
	[Id_pracy] [int] NOT NULL,
	[Id_projekt] [int] NOT NULL,
	[nr_etapu] [int] NOT NULL,
	[Ocena] [float] NOT NULL,
	[Zawartosc_pracy] [varbinary](max) NOT NULL,
	[Czy_Ukonczony] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_pracy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracy]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracy](
	[Id_pracy] [int] IDENTITY(1,1) NOT NULL,
	[nr_etapu] [int] NOT NULL,
	[Ocena] [int] NOT NULL,
	[Zawartosc_pracy] [bit] NOT NULL,
	[Czy_Ukonczony] [bit] NOT NULL,
	[Id_projektu] [int] NOT NULL,
 CONSTRAINT [PK_Pracy] PRIMARY KEY CLUSTERED 
(
	[Id_pracy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projekt]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projekt](
	[Id_projektu] [int] NOT NULL,
	[Id_ucznia] [int] NOT NULL,
	[Liczba_etapow] [int] NOT NULL,
	[Liczba_ukonczonych_etapow] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_projektu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projekty]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projekty](
	[Id_projektu] [int] IDENTITY(1,1) NOT NULL,
	[Liczba_etapow] [int] NOT NULL,
	[Liczba_ukonczonych_etapow] [int] NOT NULL,
	[Id_Uczen] [int] NOT NULL,
	[PracaId_pracy] [int] NULL,
 CONSTRAINT [PK_Projekty] PRIMARY KEY CLUSTERED 
(
	[Id_projektu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prowadzancy]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prowadzancy](
	[ID_prowadzoncego] [int] NOT NULL,
	[Imie] [nvarchar](50) NOT NULL,
	[Nazwisko] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_prowadzoncego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prowadzancyy]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prowadzancyy](
	[Id_prowadzoncego] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](max) NOT NULL,
	[Nazwisko] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Prowadzancyy] PRIMARY KEY CLUSTERED 
(
	[Id_prowadzoncego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ucznowie]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ucznowie](
	[Id_ucznia] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](max) NOT NULL,
	[Nazwisko] [nvarchar](max) NOT NULL,
	[Id_grupy] [int] NOT NULL,
 CONSTRAINT [PK_Ucznowie] PRIMARY KEY CLUSTERED 
(
	[Id_ucznia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Grupa]  WITH CHECK ADD FOREIGN KEY([ID_prowadzoncego])
REFERENCES [dbo].[Prowadzancy] ([ID_prowadzoncego])
GO
ALTER TABLE [dbo].[Grupy]  WITH CHECK ADD  CONSTRAINT [FK_Grupy_Prowadzancyy_Id_Prowadzoncy] FOREIGN KEY([Id_Prowadzoncy])
REFERENCES [dbo].[Prowadzancyy] ([Id_prowadzoncego])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grupy] CHECK CONSTRAINT [FK_Grupy_Prowadzancyy_Id_Prowadzoncy]
GO
ALTER TABLE [dbo].[Praca]  WITH CHECK ADD FOREIGN KEY([Id_projekt])
REFERENCES [dbo].[Projekt] ([Id_projektu])
GO
ALTER TABLE [dbo].[Pracy]  WITH CHECK ADD  CONSTRAINT [FK_Pracy_Projekty_Id_projektu] FOREIGN KEY([Id_projektu])
REFERENCES [dbo].[Projekty] ([Id_projektu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pracy] CHECK CONSTRAINT [FK_Pracy_Projekty_Id_projektu]
GO
ALTER TABLE [dbo].[Projekt]  WITH CHECK ADD FOREIGN KEY([Id_ucznia])
REFERENCES [dbo].[Uczen] ([ID_ucznia])
GO
ALTER TABLE [dbo].[Projekty]  WITH CHECK ADD  CONSTRAINT [FK_Projekty_Pracy_PracaId_pracy] FOREIGN KEY([PracaId_pracy])
REFERENCES [dbo].[Pracy] ([Id_pracy])
GO
ALTER TABLE [dbo].[Projekty] CHECK CONSTRAINT [FK_Projekty_Pracy_PracaId_pracy]
GO
ALTER TABLE [dbo].[Projekty]  WITH CHECK ADD  CONSTRAINT [FK_Projekty_Ucznowie_Id_Uczen] FOREIGN KEY([Id_Uczen])
REFERENCES [dbo].[Ucznowie] ([Id_ucznia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Projekty] CHECK CONSTRAINT [FK_Projekty_Ucznowie_Id_Uczen]
GO
ALTER TABLE [dbo].[Prowadzancy]  WITH CHECK ADD FOREIGN KEY([ID_prowadzoncego])
REFERENCES [dbo].[Prowadzancy] ([ID_prowadzoncego])
GO
ALTER TABLE [dbo].[Uczen]  WITH CHECK ADD FOREIGN KEY([Id_grupy])
REFERENCES [dbo].[Grupa] ([Id_grupy])
GO
ALTER TABLE [dbo].[Ucznowie]  WITH CHECK ADD  CONSTRAINT [FK_Ucznowie_Grupy_Id_grupy] FOREIGN KEY([Id_grupy])
REFERENCES [dbo].[Grupy] ([Id_Grupa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ucznowie] CHECK CONSTRAINT [FK_Ucznowie_Grupy_Id_grupy]
GO
ALTER TABLE [dbo].[Uczen]  WITH CHECK ADD  CONSTRAINT [Imie] CHECK  ((NOT [Imie] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[Uczen] CHECK CONSTRAINT [Imie]
GO
/****** Object:  StoredProcedure [dbo].[Dodaj_Grupa]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Dodaj_Grupa]
(
	@Id int,
	@Id_Prowadzoncego int,
	@Rok int
) AS 
INSERT INTO Grupa(Id_Grupy,Id_Prowadzoncego,Rok) VALUES 
(
	@Id ,
	@Id_Prowadzoncego,
	@Rok 
)
GO
/****** Object:  StoredProcedure [dbo].[Dodaj_Pojekt]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Dodaj_Pojekt]
(
	@Id int,
	@Id_ucznia int,
	@Liczba_etapow int,
	@Liczba_ukonczonych_etapow int
) AS 
INSERT INTO Projekt VALUES
(	
	@Id,
	@Id_ucznia ,
	@Liczba_etapow ,
	@Liczba_ukonczonych_etapow 
)

GO
/****** Object:  StoredProcedure [dbo].[Dodaj_Praca]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Dodaj_Praca]
(
	@Id int,
	@Id_projekt int,
	@nr_etapu int,
	@Ocena int,
	@Zawartosc_pracy varbinary(MAX),
	@Czy_Ukonczony bit
) AS 
INSERT INTO Praca VALUES
(	
	@Id,
	@Id_projekt,
	@nr_etapu,
	@Ocena,
	@Zawartosc_pracy,
	@Czy_Ukonczony
)

GO
/****** Object:  StoredProcedure [dbo].[Dodaj_Prace]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Dodaj_Prace]
(
	@Id int,
	@Id_projekt int,
	@nr_etapu int,
	@Ocena int,
	@Zawartosc_pracy varbinary(max),
	@Czy_ukonczony bit
) AS 
INSERT INTO Praca VALUES
(	
	@Id,
	@Id_projekt ,
	@nr_etapu,
	@Ocena ,
	@Zawartosc_pracy,
	@Czy_ukonczony
)

GO
/****** Object:  StoredProcedure [dbo].[Dodaj_Projekt]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Dodaj_Projekt]
(
	@Id int,
	@Id_ucznia int,
	@Liczba_etapow int,
	@Liczba_ukonczonych_etapow int
) AS 
INSERT INTO Projekt VALUES
(	
	@Id,
	@Id_ucznia ,
	@Liczba_etapow ,
	@Liczba_ukonczonych_etapow 
)

GO
/****** Object:  StoredProcedure [dbo].[Dodaj_Prowadzacy]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Dodaj_Prowadzacy]
(
	@Id int,
	@Imie nvarchar(50),
	@Nazwisko nvarchar(50),
	@email nvarchar(50) 
) AS 
INSERT INTO Prowadzancy(Id_Prowadzoncego,Imie,Nazwisko,Email) VALUES 
(
	@Id,
	@Imie,
	@Nazwisko,
	@email
)
GO
/****** Object:  StoredProcedure [dbo].[Dodaj_Ucznia]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Dodaj_Ucznia]
(
	@Id int,
	@Id_grupy int,
	@Imie nvarchar(50),
	@Nazwisko nvarchar(50)
) AS 
INSERT INTO Uczen(ID_ucznia, Id_grupy, Imie, Nazwisko) VALUES
(	
	@Id,
	@Id_grupy,
	@Imie,
	@Nazwisko
)

GO
/****** Object:  StoredProcedure [dbo].[Usun_Praca]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Usun_Praca] @id int
AS 
DELETE FROM Praca WHERE @id = Id_pracy

GO
/****** Object:  StoredProcedure [dbo].[Usun_Prowadzacy]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Usun_Prowadzacy] @id int
AS 
DELETE FROM Prowadzancy WHERE @id = ID_prowadzoncego

GO
/****** Object:  StoredProcedure [dbo].[Usun_Uczen]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------
CREATE   PROC [dbo].[Usun_Uczen] @id int
AS
DELETE FROM Uczen WHERE @id = ID_ucznia;
------------------------
GO
/****** Object:  StoredProcedure [dbo].[Usun_Ucznia]    Script Date: 25.06.2023 02:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Usun_Ucznia] @id int
AS
DELETE FROM Uczen 
WHERE @id = Id_ucznia

GO
