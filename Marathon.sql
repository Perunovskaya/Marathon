USE [master]
GO
/****** Object:  Database [Marathn]    Script Date: 28.05.2020 19:04:08 ******/
CREATE DATABASE [Marathn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'01.06', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\01.06.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'01.06_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\01.06_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Marathn] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Marathn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Marathn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Marathn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Marathn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Marathn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Marathn] SET ARITHABORT OFF 
GO
ALTER DATABASE [Marathn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Marathn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Marathn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Marathn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Marathn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Marathn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Marathn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Marathn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Marathn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Marathn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Marathn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Marathn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Marathn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Marathn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Marathn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Marathn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Marathn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Marathn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Marathn] SET  MULTI_USER 
GO
ALTER DATABASE [Marathn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Marathn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Marathn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Marathn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Marathn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Marathn] SET QUERY_STORE = OFF
GO
USE [Marathn]
GO
/****** Object:  Table [dbo].[Charity]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charity](
	[ID_Charity] [int] NOT NULL,
	[CharityName] [varchar](100) NOT NULL,
	[CharityDescription] [varchar](2000) NULL,
	[CharityLogo] [varchar](50) NULL,
 CONSTRAINT [PK_Charity] PRIMARY KEY CLUSTERED 
(
	[ID_Charity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [char](3) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[CountryFlag] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID_Event] [char](6) NOT NULL,
	[EventName] [varchar](50) NOT NULL,
	[ID_EventType] [char](2) NOT NULL,
	[ID_Marathon] [tinyint] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[Cost] [decimal](10, 2) NULL,
	[MaxParticipants] [smallint] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID_Event] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventType]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventType](
	[ID_EventType] [char](2) NOT NULL,
	[EventTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EventType] PRIMARY KEY CLUSTERED 
(
	[ID_EventType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marathon]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marathon](
	[ID_Marathon] [tinyint] NOT NULL,
	[MarathonName] [varchar](80) NOT NULL,
	[CityName] [varchar](80) NULL,
	[CountryCode] [char](3) NOT NULL,
	[YearHeld] [smallint] NULL,
 CONSTRAINT [PK_Marathon] PRIMARY KEY CLUSTERED 
(
	[ID_Marathon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[ID_Position] [smallint] NOT NULL,
	[PositionName] [varchar](50) NOT NULL,
	[PositionDescription] [varchar](1000) NULL,
	[PayPeriod] [varchar](10) NOT NULL,
	[Payrate] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID_Position] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaceKitOption]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaceKitOption](
	[ID_RaceKitOption] [char](1) NOT NULL,
	[RaceKitOption] [varchar](80) NOT NULL,
	[RaceKitCost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_RaceKitOption] PRIMARY KEY CLUSTERED 
(
	[ID_RaceKitOption] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[ID_Registration] [int] NOT NULL,
	[ID_Runner] [int] NOT NULL,
	[RegistrationDataTime] [datetime] NOT NULL,
	[ID_RaceKitOption] [char](1) NOT NULL,
	[ID_RegistrationStatus] [tinyint] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[ID_Charity] [int] NOT NULL,
	[SponsorshipTarget] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[ID_Registration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationEvent]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationEvent](
	[ID_RegistrationEvent] [int] NOT NULL,
	[ID_Registration] [int] NOT NULL,
	[ID_Event] [char](6) NOT NULL,
	[BibNumber] [smallint] NULL,
	[RaceTime] [int] NULL,
 CONSTRAINT [PK_RegistrationEvent] PRIMARY KEY CLUSTERED 
(
	[ID_RegistrationEvent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationStatus]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationStatus](
	[ID_RegistrationStatus] [tinyint] NOT NULL,
	[RegistrationStatus] [varchar](80) NOT NULL,
 CONSTRAINT [PK_RegistrationStatus] PRIMARY KEY CLUSTERED 
(
	[ID_RegistrationStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [char](1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Runner]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Runner](
	[ID_Runner] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Gender] [varchar](100) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[CountryCode] [char](3) NOT NULL,
 CONSTRAINT [PK_Runner] PRIMARY KEY CLUSTERED 
(
	[ID_Runner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsorship]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsorship](
	[ID_Sponsorship] [int] NOT NULL,
	[SponsorshipName] [varchar](150) NOT NULL,
	[ID_Registration] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Sponsorship] PRIMARY KEY CLUSTERED 
(
	[ID_Sponsorship] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID_Staff] [int] NOT NULL,
	[FistName] [varchar](80) NOT NULL,
	[LastName] [varchar](80) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[ID_Position] [smallint] NOT NULL,
	[Comments] [varchar](2000) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID_Staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[ID_Timesheet] [int] NOT NULL,
	[ID_Staff] [int] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[PayAmount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Timesheet] PRIMARY KEY CLUSTERED 
(
	[ID_Timesheet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
	[ID_Role] [char](1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 28.05.2020 19:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[ID_Volunteer] [int] NOT NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
	[CountryCode] [char](3) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Volunteer] PRIMARY KEY CLUSTERED 
(
	[ID_Volunteer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_EventType] FOREIGN KEY([ID_EventType])
REFERENCES [dbo].[EventType] ([ID_EventType])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_EventType]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Marathon] FOREIGN KEY([ID_Marathon])
REFERENCES [dbo].[Marathon] ([ID_Marathon])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Marathon]
GO
ALTER TABLE [dbo].[Marathon]  WITH CHECK ADD  CONSTRAINT [FK_Marathon_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Marathon] CHECK CONSTRAINT [FK_Marathon_Country]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Charity] FOREIGN KEY([ID_Charity])
REFERENCES [dbo].[Charity] ([ID_Charity])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Charity]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_RaceKitOption] FOREIGN KEY([ID_RaceKitOption])
REFERENCES [dbo].[RaceKitOption] ([ID_RaceKitOption])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_RaceKitOption]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_RegistrationStatus] FOREIGN KEY([ID_RegistrationStatus])
REFERENCES [dbo].[RegistrationStatus] ([ID_RegistrationStatus])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_RegistrationStatus]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Runner] FOREIGN KEY([ID_Runner])
REFERENCES [dbo].[Runner] ([ID_Runner])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Runner]
GO
ALTER TABLE [dbo].[RegistrationEvent]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationEvent_Event] FOREIGN KEY([ID_Event])
REFERENCES [dbo].[Event] ([ID_Event])
GO
ALTER TABLE [dbo].[RegistrationEvent] CHECK CONSTRAINT [FK_RegistrationEvent_Event]
GO
ALTER TABLE [dbo].[RegistrationEvent]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationEvent_Registration] FOREIGN KEY([ID_Registration])
REFERENCES [dbo].[Registration] ([ID_Registration])
GO
ALTER TABLE [dbo].[RegistrationEvent] CHECK CONSTRAINT [FK_RegistrationEvent_Registration]
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD  CONSTRAINT [FK_Runner_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Runner] CHECK CONSTRAINT [FK_Runner_Country]
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD  CONSTRAINT [FK_Runner_User] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Runner] CHECK CONSTRAINT [FK_Runner_User]
GO
ALTER TABLE [dbo].[Sponsorship]  WITH CHECK ADD  CONSTRAINT [FK_Sponsorship_Registration] FOREIGN KEY([ID_Registration])
REFERENCES [dbo].[Registration] ([ID_Registration])
GO
ALTER TABLE [dbo].[Sponsorship] CHECK CONSTRAINT [FK_Sponsorship_Registration]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Position] FOREIGN KEY([ID_Position])
REFERENCES [dbo].[Position] ([ID_Position])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Position]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Staff] FOREIGN KEY([ID_Staff])
REFERENCES [dbo].[Staff] ([ID_Staff])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Staff]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_Country]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([Gender])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_Gender]
GO
USE [master]
GO
ALTER DATABASE [Marathn] SET  READ_WRITE 
GO
