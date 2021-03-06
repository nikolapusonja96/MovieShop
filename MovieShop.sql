USE [master]
GO
/****** Object:  Database [MovieShop]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE DATABASE [MovieShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MovieShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MovieShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MovieShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieShop] SET  MULTI_USER 
GO
ALTER DATABASE [MovieShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieShop] SET QUERY_STORE = OFF
GO
USE [MovieShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/1/2020 4:23:25 PM ******/
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
/****** Object:  Table [dbo].[ActorMovie]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActorMovie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActorId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[ActorCharachterName] [nvarchar](max) NULL,
 CONSTRAINT [PK_ActorMovie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Birth] [datetime2](7) NOT NULL,
	[BirthPlace] [nvarchar](30) NOT NULL,
	[Age] [int] NOT NULL,
	[Oscars] [int] NULL,
	[FirstAndLastName] [nvarchar](70) NOT NULL,
	[MoviesNumber] [int] NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectorMovie]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectorMovie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DirectorId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
 CONSTRAINT [PK_DirectorMovie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Oscars] [int] NULL,
	[MovieNumber] [int] NOT NULL,
	[Fullname] [nvarchar](max) NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Budget] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Year] [int] NOT NULL,
	[Oscars] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OrderId] [int] NOT NULL,
	[MovieId] [int] NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](16) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Fullname] [nvarchar](max) NULL,
	[Email] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WriterMovie]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WriterMovie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WriterId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
 CONSTRAINT [PK_WriterMovie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 7/1/2020 4:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Oscars] [int] NULL,
	[MovieNumber] [int] NOT NULL,
	[Fullname] [nvarchar](max) NULL,
 CONSTRAINT [PK_Writers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622191518_added_UsersAndRoles', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622204134_MovieAndGenre_added', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622220609_added_MovieActorRelationship', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622221754_added_DirectorMovieRelationship', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622223015_added_WriterMovieRelationship', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622224901_added_OrderAndOrderLine', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622233544_FixedBaseEntity', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623000122_movedCharachterNameActorToActorMovie', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623000310_ChangeNameOfColumnInActorMovie', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623000829_AddedBaseManyToManyEntity', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200624065858_addColumnsInActor', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625025619_addedMovieNumberToWriterAndDirector', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625040649_addedWriterFullName', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200626054511_addedDirectorFullname', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627093630_UserFullname', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627105239_changeColumnNameOrderLine', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200628064025_added UserUseCases', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200628123530_UseCaseLogs', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200628161902_UniqueEmail', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630083156_FixedMovieDescriptionLength', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630085023_FixedDescriptionLength', N'3.1.5')
SET IDENTITY_INSERT [dbo].[ActorMovie] ON 

INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (30, 3, 3, N'John')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (31, 3, 12, N'Bobby')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (32, 4, 8, N'Lucca')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (34, 3, 4, N'Charles')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (35, 3, 7, N'Leo')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (36, 4, 10, N'Sir Dorian')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (37, 3, 10, N'Howard')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (38, 3, 6, N'Dwight')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (39, 6, 4, N'Niccolo')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (40, 4, 9, N'Fabio')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (41, 4, 5, N'Roger')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (43, 4, 11, N'Roberts')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (44, 4, 12, N'Nicholas ')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (47, 9, 3, N'Lynn')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (48, 9, 8, N'Li Yu')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (49, 9, 7, N'Jackie')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (50, 6, 10, N'Jack')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (51, 6, 7, N'John')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (52, 6, 9, N'Bill')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (53, 6, 12, N'Walt')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (54, 6, 6, N'Walter')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (55, 8, 4, N'Uncle Joe')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (56, 8, 6, N'John')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (57, 8, 8, N'Isaiah')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (58, 7, 4, N'Thomas')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (59, 7, 9, N'Matt')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (60, 7, 11, N'Bryan')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (61, 7, 3, N'Sergio')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (62, 7, 6, N'Raquel')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (64, 11, 3, N'dzoni')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (65, 11, 12, N'dzonika')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (66, 11, 6, N'dzonile')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (67, 4, 15, N'createtest1')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (68, 7, 15, N'createtest1')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (69, 4, 16, N'createtestadmin')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (70, 7, 16, N'createadmintest')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (71, 12, 3, N'dzoni')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (72, 12, 12, N'dzonika')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (73, 12, 6, N'dzonile')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (74, 10, 5, N'Caraggher')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (75, 10, 7, N'Lenox')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (76, 13, 26, N'Jap')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (77, 13, 21, N'Kop')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (82, 16, 17, N'Opk')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (83, 16, 18, N'Poiy')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (84, 17, 19, N'Qwerty')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (85, 17, 20, N'Oprrah')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (86, 18, 21, N'Oyt')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (87, 18, 20, N'Kow')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (88, 19, 11, N'Ytqw')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (89, 19, 7, N'Ret')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (90, 20, 25, N'John')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (91, 20, 26, N'Johnson')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (92, 21, 21, N'Oki')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (93, 21, 11, N'Sem')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (94, 22, 21, N'Kuk')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (95, 22, 11, N'Oker')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (96, 23, 7, N'Sam')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (97, 23, 9, N'Mark')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (98, 24, 25, N'Mujd')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (99, 24, 4, N'Oker')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (100, 25, 4, N'Sum')
INSERT [dbo].[ActorMovie] ([Id], [ActorId], [MovieId], [ActorCharachterName]) VALUES (101, 25, 26, N'Ker')
SET IDENTITY_INSERT [dbo].[ActorMovie] OFF
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (3, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Leonardo', N'Di Caprio', CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), N'NY', 42, 1, N'Leonardo Di Caprio', 6)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (4, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Al', N'Pacino', CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), N'LA', 83, 2, N'Al Pacino', 6)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (6, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Robert', N'De Niro', CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), N'NY', 81, 4, N'Robert De Niro', 6)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (7, CAST(N'2020-06-24T14:07:35.4517847' AS DateTime2), NULL, CAST(N'2020-06-26T13:55:15.0292707' AS DateTime2), 0, 1, N'Colin', N'Farrell', CAST(N'1996-06-06T00:00:00.0000000' AS DateTime2), N'Dublin', 35, 3, N'Colin Farrell', 5)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (8, CAST(N'2020-06-24T14:23:47.5151493' AS DateTime2), NULL, CAST(N'2020-06-25T02:38:40.7035517' AS DateTime2), 0, 1, N'Joe', N'Pesci', CAST(N'1996-06-06T00:00:00.0000000' AS DateTime2), N'Sicily', 76, 2, N'Joe Pesci', 3)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (9, CAST(N'2020-06-24T14:26:02.7286717' AS DateTime2), NULL, CAST(N'2020-06-26T14:09:37.3597561' AS DateTime2), 0, 1, N'Stefan', N'Nikolic', CAST(N'1996-06-06T00:00:00.0000000' AS DateTime2), N'Belgrade', 21, 0, N'Stefan Nikolic', 3)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (10, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-06-30T17:00:13.6785920' AS DateTime2), 0, 1, N'Nicholas', N'Cage', CAST(N'1993-01-01T00:00:00.0000000' AS DateTime2), N'Montana', 51, 4, N'Nicholas Cage', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (11, CAST(N'2020-06-30T16:34:40.1160763' AS DateTime2), CAST(N'2020-06-30T16:43:17.8182847' AS DateTime2), CAST(N'2020-06-30T16:43:17.8184572' AS DateTime2), 1, 0, N'Nikola', N'Nikolic', CAST(N'1960-06-06T00:00:00.0000000' AS DateTime2), N'Belgrade', 56, 2, N'Nikola Nikolic', 3)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (12, CAST(N'2020-07-01T12:19:51.2035088' AS DateTime2), NULL, CAST(N'2020-07-01T12:22:52.2350753' AS DateTime2), 0, 1, N'Nina', N'Markovic', CAST(N'1960-06-06T00:00:00.0000000' AS DateTime2), N'Podgorica', 60, 12, N'Nina Markovic', 3)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (13, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Jankec', N'Johnson', CAST(N'1954-03-02T00:00:00.0000000' AS DateTime2), N'London', 66, 1, N'Jankec Johnson', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (16, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Danijela', N'Zlaticanin', CAST(N'1993-09-08T00:00:00.0000000' AS DateTime2), N'Podgorica', 27, 2, N'Danijela Zlaticanin', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (17, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Ares', N'Mores', CAST(N'1996-10-11T00:00:00.0000000' AS DateTime2), N'Dubai', 24, 7, N'Ares Mores', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (18, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Donald', N'Young', CAST(N'1983-12-12T00:00:00.0000000' AS DateTime2), N'Chicago', 37, 7, N'Donald Yound', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (19, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Nikola', N'Kojo', CAST(N'1980-12-12T00:00:00.0000000' AS DateTime2), N'Belgrade', 40, 0, N'Nikola Kojo', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (20, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Jesse', N'Pinkman', CAST(N'1985-07-09T00:00:00.0000000' AS DateTime2), N'NY', 35, 2, N'Jesse Pinkman', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (21, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Walter', N'White', CAST(N'1970-03-03T00:00:00.0000000' AS DateTime2), N'LA', 50, 3, N'Walter White', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (22, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Robert', N'Baggio', CAST(N'2000-03-03T00:00:00.0000000' AS DateTime2), N'LA', 20, 1, N'Robert Baggio', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (23, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Tony', N'Soprano', CAST(N'1990-03-02T00:00:00.0000000' AS DateTime2), N'LA', 30, 1, N'Tony Soprano', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (24, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Carmela', N'Meli', CAST(N'1999-03-01T00:00:00.0000000' AS DateTime2), N'NY', 21, 0, N'Carmela Meli', 2)
INSERT [dbo].[Actors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Birth], [BirthPlace], [Age], [Oscars], [FirstAndLastName], [MoviesNumber]) VALUES (25, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Sony', N'Michel', CAST(N'1995-05-04T00:00:00.0000000' AS DateTime2), N'LA', 25, 2, N'Sony Michel', 2)
SET IDENTITY_INSERT [dbo].[Actors] OFF
SET IDENTITY_INSERT [dbo].[DirectorMovie] ON 

INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (1, 1, 3)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (2, 1, 4)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (3, 1, 5)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (4, 1, 9)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (5, 2, 3)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (6, 3, 3)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (7, 3, 7)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (8, 3, 6)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (9, 4, 8)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (10, 2, 8)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (11, 2, 6)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (12, 4, 8)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (13, 5, 4)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (14, 5, 8)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (15, 6, 4)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (16, 6, 8)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (17, 7, 4)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (18, 7, 8)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (19, 3, 10)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (20, 6, 10)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (21, 3, 11)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (22, 6, 11)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (23, 1, 12)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (24, 5, 12)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (25, 1, 14)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (26, 5, 14)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (27, 8, 9)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (28, 8, 11)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (29, 1, 15)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (30, 5, 15)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (31, 1, 16)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (32, 5, 16)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (33, 9, 6)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (34, 9, 4)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (35, 9, 10)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (36, 9, 5)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (37, 9, 7)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (38, 10, 26)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (40, 17, 25)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (41, 17, 21)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (42, 17, 17)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (43, 17, 4)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (44, 10, 18)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (45, 11, 19)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (46, 11, 10)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (47, 18, 21)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (48, 18, 25)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (49, 18, 26)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (50, 12, 11)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (51, 12, 18)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (52, 13, 19)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (53, 13, 21)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (54, 14, 7)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (55, 14, 8)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (56, 15, 9)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (57, 15, 11)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (58, 16, 16)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (59, 16, 17)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (60, 17, 21)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (61, 17, 4)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (62, 18, 21)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (63, 18, 4)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (64, 19, 19)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (65, 13, 26)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (66, 20, 9)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (67, 20, 10)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (68, 21, 21)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (69, 21, 7)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (71, 17, 8)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (72, 17, 9)
INSERT [dbo].[DirectorMovie] ([Id], [DirectorId], [MovieId]) VALUES (73, 18, 5)
SET IDENTITY_INSERT [dbo].[DirectorMovie] OFF
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (1, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Marko', N'Peric', 0, 6, N'Marko Peric')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (2, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Luka', N'Lukic', 1, 3, N'Luka Lukic')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (3, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Pera', N'Peric', 2, 5, N'Pera Peric')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (4, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, CAST(N'2020-06-26T13:55:48.2117596' AS DateTime2), 0, 1, N'Mika', N'Mikic', 9, 2, N'Mika Mikic')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (5, CAST(N'2020-06-26T08:58:59.6568267' AS DateTime2), NULL, CAST(N'2020-06-26T14:06:43.1756926' AS DateTime2), 0, 1, N'sofija', N'zdravkovic', 0, 4, N'sofija zdravkovic')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (6, CAST(N'2020-06-26T09:00:48.0245695' AS DateTime2), NULL, CAST(N'2020-06-26T14:12:56.3639734' AS DateTime2), 0, 1, N'stevan', N'nikolic', 10, 4, N'stevan nikolic')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (7, CAST(N'2020-06-26T09:12:23.0466977' AS DateTime2), NULL, CAST(N'2020-06-30T17:23:16.2015570' AS DateTime2), 0, 1, N'Predrag', N'Pedovic', 4, 2, N'Predrag Pedovic')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (8, CAST(N'2020-06-30T16:31:48.4368745' AS DateTime2), CAST(N'2020-06-30T16:44:05.9317153' AS DateTime2), CAST(N'2020-06-30T16:44:05.9318681' AS DateTime2), 1, 0, N'Marko', N'Janjic', 12, 2, N'Marko Janjic')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (9, CAST(N'2020-07-01T12:29:20.8753115' AS DateTime2), NULL, CAST(N'2020-07-01T12:30:50.8922594' AS DateTime2), 0, 1, N'Jelena', N'Ivanovic', 23, 5, N'Jelena Ivanovic')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (10, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Tom', N'Brady', 9, 2, N'Tom Brady')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (11, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Rob', N'Robert', 2, 2, N'Rob Robert')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (12, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Sim', N'Simmons', 0, 2, N'Sim Simmons')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (13, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Simone', N'Biles', 3, 3, N'Simone Biles')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (14, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Rat', N'Rak', 9, 2, N'Rat Rak')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (15, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Pera', N'Periiman', 7, 2, N'Pera Periiman')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (16, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Loman', N'Lomansky', 2, 2, N'Loman Lomansky')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (17, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Pat', N'Riley', 4, 4, N'Pat Riley')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (18, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Okar', N'Oper', 2, 3, N'Okar Oper')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (19, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Iyan', N'Arm', 2, 1, N'Iyan Arm')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (20, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Star', N'Starsky', 2, 2, N'Star Starsky')
INSERT [dbo].[Directors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (21, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Oleg', N'Olegs', 3, 2, N'Oleg Olegs')
SET IDENTITY_INSERT [dbo].[Directors] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-23T02:43:04.4596447' AS DateTime2), NULL, NULL, 0, 1, N'sci-fi')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-23T02:44:27.2333559' AS DateTime2), NULL, NULL, 0, 1, N'comedy')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-23T02:44:35.6298111' AS DateTime2), NULL, NULL, 0, 1, N'thriller')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-23T02:44:43.1920518' AS DateTime2), NULL, NULL, 0, 1, N'action')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'horror')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (6, CAST(N'2020-06-23T04:42:10.5052039' AS DateTime2), NULL, NULL, 0, 1, N'Novokreirani zanr')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (27, CAST(N'2020-06-30T15:07:07.8279519' AS DateTime2), CAST(N'2020-06-30T15:08:43.4808661' AS DateTime2), CAST(N'2020-06-30T15:08:43.4812856' AS DateTime2), 1, 0, N'update test1')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (28, CAST(N'2020-07-01T12:00:30.0877485' AS DateTime2), CAST(N'2020-07-01T12:01:57.7540038' AS DateTime2), CAST(N'2020-07-01T12:01:57.7542488' AS DateTime2), 1, 0, N'updateadmintest')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (3, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Valide', CAST(12.00 AS Decimal(18, 2)), N'A talented young rapper, supported by his two childhood friends, finds himself overnight "validated" by one of the stars of the industry, who soon becomes a rival.', 1999, 9, CAST(40.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (4, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Aviator', CAST(45.00 AS Decimal(18, 2)), N'A biopic depicting the early years of legendary Director and aviator Howard Hughes'' career from the late 1920s to the mid 1940s.', 2000, 7, CAST(12.00 AS Decimal(18, 2)), 1, 4)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (5, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, CAST(N'2020-06-30T15:44:05.0272213' AS DateTime2), 0, 1, N'Inception', CAST(11.00 AS Decimal(18, 2)), N'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 2010, 0, CAST(455.00 AS Decimal(18, 2)), 43, 4)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (6, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'The Recruit ', CAST(688.00 AS Decimal(18, 2)), N'A brilliant young CIA trainee is asked by his mentor to help find a mole in the Agency.', 2014, 4, CAST(66.00 AS Decimal(18, 2)), 68, 5)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (7, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'The Shawshank Redemption ', CAST(12432.00 AS Decimal(18, 2)), N'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 1994, 1, CAST(12.00 AS Decimal(18, 2)), 12, 2)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (8, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, CAST(N'2020-07-01T12:16:25.0645589' AS DateTime2), 0, 1, N'Luca Mortis', CAST(78.00 AS Decimal(18, 2)), N'A writer takes a sabbatical to visit the city of Lucca.', 1978, 0, CAST(69.00 AS Decimal(18, 2)), 789, 3)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (9, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'The Godfather', CAST(8.00 AS Decimal(18, 2)), N'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 1993, 5, CAST(5.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (10, CAST(N'2020-06-27T06:28:27.1339443' AS DateTime2), NULL, CAST(N'2020-06-27T12:56:30.8488405' AS DateTime2), 0, 1, N'The Lord of the Rings', CAST(22.00 AS Decimal(18, 2)), N'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 2002, 8, CAST(40.00 AS Decimal(18, 2)), 18, 1)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (11, CAST(N'2020-06-27T06:48:29.0234106' AS DateTime2), NULL, NULL, 0, 1, N'The Matrix', CAST(22.00 AS Decimal(18, 2)), N'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 2001, 8, CAST(40.00 AS Decimal(18, 2)), 22, 1)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (12, CAST(N'2020-06-27T07:01:19.7947363' AS DateTime2), NULL, CAST(N'2020-07-01T12:16:25.0645596' AS DateTime2), 0, 1, N'Interstellar', CAST(22.00 AS Decimal(18, 2)), N'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', 2000, 9, CAST(18.00 AS Decimal(18, 2)), 99, 1)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (14, CAST(N'2020-06-27T07:04:53.9088513' AS DateTime2), NULL, CAST(N'2020-07-01T11:26:33.3141176' AS DateTime2), 0, 1, N'Joker1', CAST(300.00 AS Decimal(18, 2)), N'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime', 2019, 6, CAST(21.00 AS Decimal(18, 2)), 20, 1)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (15, CAST(N'2020-06-30T16:38:48.9031771' AS DateTime2), CAST(N'2020-06-30T16:42:48.0534027' AS DateTime2), CAST(N'2020-06-30T16:42:48.0535720' AS DateTime2), 1, 0, N'CreateTest1', CAST(22.00 AS Decimal(18, 2)), N'create movie test1', 2000, 8, CAST(40.00 AS Decimal(18, 2)), 22, 2)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (16, CAST(N'2020-07-01T12:09:27.1158841' AS DateTime2), CAST(N'2020-07-01T12:12:36.6498172' AS DateTime2), CAST(N'2020-07-01T12:12:36.6500603' AS DateTime2), 1, 0, N'UpdateAdmintest', CAST(22.00 AS Decimal(18, 2)), N'update movie admin test', 2013, 8, CAST(20.00 AS Decimal(18, 2)), 222, 4)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (17, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'The little things', CAST(43.00 AS Decimal(18, 2)), N'Two cops track down a serial killer.', 2014, 2, CAST(12.00 AS Decimal(18, 2)), 23, 3)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (18, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Matt', CAST(93.00 AS Decimal(18, 2)), N'A working-class African-American father tries to raise his family in the 1950s, while coming to terms with the events of his life.', 2015, 2, CAST(45.00 AS Decimal(18, 2)), 45, 1)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (19, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Slack', CAST(94.00 AS Decimal(18, 2)), N'Slacking some slack', 1980, 4, CAST(95.00 AS Decimal(18, 2)), 93, 2)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (20, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Fences', CAST(93.00 AS Decimal(18, 2)), N'Young boy tries to escape the family', 1999, 2, CAST(19.00 AS Decimal(18, 2)), 190, 2)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (21, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Feel the Beat ', CAST(25.00 AS Decimal(18, 2)), N'about beat', 2015, 9, CAST(24.00 AS Decimal(18, 2)), 25, 2)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (25, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'365 days', CAST(90.00 AS Decimal(18, 2)), N'every day is a pleassure', 2001, 4, CAST(88.00 AS Decimal(18, 2)), 88, 4)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Budget], [Description], [Year], [Oscars], [Price], [Quantity], [GenreId]) VALUES (26, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Milk', CAST(159.00 AS Decimal(18, 2)), N'Mistery around Minnesota', 2013, 5, CAST(56.00 AS Decimal(18, 2)), 56, 4)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[OrderLine] ON 

INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (1, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), NULL, NULL, 0, 1, 2, CAST(12.00 AS Decimal(18, 2)), 1, 5, N'Inception')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (2, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), NULL, NULL, 0, 1, 3, CAST(12.00 AS Decimal(18, 2)), 2, 7, N'The Shawshank Redemption')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (3, CAST(N'2020-06-27T12:54:41.9598067' AS DateTime2), NULL, NULL, 0, 1, 2, CAST(40.00 AS Decimal(18, 2)), 5, 10, N'The Lord of the Rings')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (4, CAST(N'2020-06-27T12:56:30.8488380' AS DateTime2), NULL, NULL, 0, 1, 2, CAST(40.00 AS Decimal(18, 2)), 6, 10, N'The Lord of the Rings')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (5, CAST(N'2020-06-27T12:56:30.8488392' AS DateTime2), NULL, NULL, 0, 1, 99, CAST(69.00 AS Decimal(18, 2)), 6, 8, N'Luca Mortis')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (6, CAST(N'2020-06-29T10:46:26.1722603' AS DateTime2), NULL, NULL, 0, 1, 100, CAST(69.00 AS Decimal(18, 2)), 7, 8, N'Luca Mortis')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (7, CAST(N'2020-06-29T10:46:26.1722622' AS DateTime2), NULL, NULL, 0, 1, 9, CAST(18.00 AS Decimal(18, 2)), 7, 12, N'Interstellar')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (8, CAST(N'2020-06-30T15:42:12.7850935' AS DateTime2), NULL, NULL, 0, 1, 2, CAST(69.00 AS Decimal(18, 2)), 9, 8, N'Luca Mortis')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (9, CAST(N'2020-06-30T15:44:05.0272140' AS DateTime2), NULL, NULL, 0, 1, 2, CAST(69.00 AS Decimal(18, 2)), 10, 8, N'Luca Mortis')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (10, CAST(N'2020-06-30T15:44:05.0272152' AS DateTime2), NULL, NULL, 0, 1, 2, CAST(455.00 AS Decimal(18, 2)), 10, 5, N'Inception')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (11, CAST(N'2020-07-01T11:26:33.3141141' AS DateTime2), NULL, NULL, 0, 1, 6, CAST(69.00 AS Decimal(18, 2)), 11, 8, N'Luca Mortis')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (12, CAST(N'2020-07-01T11:26:33.3141147' AS DateTime2), NULL, NULL, 0, 1, 1, CAST(21.00 AS Decimal(18, 2)), 11, 14, N'Joker1')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (13, CAST(N'2020-07-01T12:16:25.0645578' AS DateTime2), NULL, NULL, 0, 1, 1, CAST(69.00 AS Decimal(18, 2)), 12, 8, N'Luca Mortis')
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Quantity], [Price], [OrderId], [MovieId], [Title]) VALUES (14, CAST(N'2020-07-01T12:16:25.0645583' AS DateTime2), NULL, NULL, 0, 1, 1, CAST(18.00 AS Decimal(18, 2)), 12, 12, N'Interstellar')
SET IDENTITY_INSERT [dbo].[OrderLine] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (1, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), N'Ustanicka', 1)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (2, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), N'Udrs1', 1)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (3, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), N'Kods1', 2)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (5, CAST(N'2020-06-27T12:54:41.9592273' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-06-29T00:00:00.0000000' AS DateTime2), N'nova adresa', 2)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (6, CAST(N'2020-06-27T12:56:30.8488249' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-06-29T00:00:00.0000000' AS DateTime2), N'nova adresa', 2)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (7, CAST(N'2020-06-29T10:46:26.1718916' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-06-30T00:00:00.0000000' AS DateTime2), N'Adresa usera 7', 7)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (9, CAST(N'2020-06-30T15:42:12.7845055' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-03T00:00:00.0000000' AS DateTime2), N'zdravkacelara16', 7)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (10, CAST(N'2020-06-30T15:44:05.0272029' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-03T00:00:00.0000000' AS DateTime2), N'zdravkacelara16', 7)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (11, CAST(N'2020-07-01T11:26:33.3141060' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), N'Angel Adresa', 11)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [Address], [UserId]) VALUES (12, CAST(N'2020-07-01T12:16:25.0645328' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-02T00:00:00.0000000' AS DateTime2), N'Adresa admina', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), NULL, NULL, 0, 1, N'administrator')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-23T02:47:16.2024128' AS DateTime2), NULL, NULL, 0, 1, N'user')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-24T05:18:00.5715864' AS DateTime2), NULL, NULL, 0, 1, N'nova uloga')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-24T05:22:12.3209588' AS DateTime2), CAST(N'2020-06-24T05:29:38.5991214' AS DateTime2), CAST(N'2020-06-24T05:29:38.6382429' AS DateTime2), 1, 0, N'uloga1')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-24T06:11:22.2848981' AS DateTime2), CAST(N'2020-06-30T15:13:25.1054187' AS DateTime2), CAST(N'2020-06-30T15:13:25.1139205' AS DateTime2), 1, 0, N'BlaBladkok')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (6, CAST(N'2020-06-30T15:21:41.8532493' AS DateTime2), NULL, CAST(N'2020-06-30T15:22:08.5569619' AS DateTime2), 0, 1, N'update role test1')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (7, CAST(N'2020-07-01T12:00:21.8513003' AS DateTime2), CAST(N'2020-07-01T12:03:45.6694915' AS DateTime2), CAST(N'2020-07-01T12:03:45.6705404' AS DateTime2), 1, 0, N'admintest')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-06-28T15:08:31.0660201' AS DateTime2), N'User Registration', N'{"FirstName":"Petar","LastName":"Peric","Username":"pera123","Password":"sifra1","Email":"pera@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-06-28T15:44:21.4891778' AS DateTime2), N'User Registration', N'{"FirstName":"Nikola","LastName":"Pusonja","Username":"puske123","Password":"sifra1","Email":"nikola.pusonja.9.15@ict.edu.rs"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-06-28T15:46:49.4078587' AS DateTime2), N'User Registration', N'{"FirstName":"Nikola","LastName":"Pusonja","Username":"puske123","Password":"sifra1","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-06-28T15:47:36.2885294' AS DateTime2), N'User Registration', N'{"FirstName":"Nikola","LastName":"Pusonja","Username":"nikola123","Password":"sifra1","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-06-25T00:00:00.0000000' AS DateTime2), N'User Registration', N'{"FirstName":"Rajko","LastName":"Rajkovic","Username":"rajko123","Password":"sifra1","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-06-24T00:00:00.0000000' AS DateTime2), N'User Registration', N'{"FirstName":"Rajko","LastName":"Rajkovic","Username":"rajko123","Password":"sifra1","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-06-23T00:00:00.0000000' AS DateTime2), N'User Registration', N'{"FirstName":"Rajko","LastName":"Rajkovic","Username":"rajko123","Password":"sifra1","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-06-29T00:33:13.5961612' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"uploadASP.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"uploadASP.jpg\""],"Content-Type":["image/jpeg"]},"Length":35954,"Name":"Image","FileName":"uploadASP.jpg"}}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-06-29T00:34:25.5729435' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"uploadASP.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"uploadASP.jpg\""],"Content-Type":["image/jpeg"]},"Length":35954,"Name":"Image","FileName":"uploadASP.jpg"}}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-06-29T00:37:32.3372782' AS DateTime2), N'Upload File', N'{"Image":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2020-06-29T00:41:23.5720867' AS DateTime2), N'Upload File', N'{"Image":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2020-06-29T00:41:40.0486992' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"uploadASP.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"uploadASP.jpg\""],"Content-Type":["image/jpeg"]},"Length":35954,"Name":"Image","FileName":"uploadASP.jpg"}}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2019-05-05T00:00:00.0000000' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2020-06-29T03:23:05.6196259' AS DateTime2), N'Get Actors', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2020-06-29T03:24:47.4797174' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2020-06-29T04:21:50.1885270' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2020-06-29T04:21:56.1009433' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2020-06-29T04:22:24.3505498' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2020-06-29T04:29:00.6840324' AS DateTime2), N'Get single User', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2020-06-29T04:31:21.8163496' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2020-06-29T04:31:26.3192347' AS DateTime2), N'Get single User', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2013-01-02T00:00:00.0000000' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2020-06-29T04:36:11.6568695' AS DateTime2), N'Get single User', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2020-06-29T04:39:41.9879223' AS DateTime2), N'Get single User', N'2', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2020-06-29T04:40:12.4979249' AS DateTime2), N'Get single User', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2020-06-29T04:43:31.0539248' AS DateTime2), N'Get single User', N'1', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2020-06-29T04:54:11.9155609' AS DateTime2), N'Get single User', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2020-06-29T05:44:54.0348862' AS DateTime2), N'Delete User', N'7', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2020-06-29T06:38:19.9859807' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nemanja","LastName":"Nedic","Username":"dicn123","Password":"sifra123","Email":"neda@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2020-06-29T06:39:38.4353826' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nemanja","LastName":"Nedic","Username":"dicn123","Password":"sifra123","Email":"neda@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2020-06-29T06:41:48.6826580' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nemanja","LastName":"Nedic","Username":null,"Password":"sifra123","Email":"neda@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2020-06-29T06:42:55.2723216' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nemanja","LastName":"Nedic","Username":null,"Password":"sifra123","Email":"luka@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2020-06-29T06:43:33.2684900' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Pusonja","Username":null,"Password":"sifra123","Email":"111@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2020-06-29T06:48:38.1164009' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Pusonja","Username":null,"Password":"sifra123","Email":"111@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2020-06-29T06:59:57.0724488' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"AnaMarija","LastName":"Antic","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2020-06-29T07:02:54.2403727' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"AnaMarija","LastName":"Antic","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2020-06-29T07:03:34.6968955' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Sofija","LastName":"Antic","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2020-06-29T07:03:59.4927817' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Sofija","LastName":"Antic","Username":null,"Password":"sifra123","Email":"pera@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2020-06-29T07:04:11.4258315' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Antic","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2020-06-29T07:04:25.7745753' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Pusonja","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2020-06-29T07:04:40.2614204' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Petar","LastName":"Peric","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2020-06-29T07:04:55.9756421' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Anamarija","LastName":"Antic","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2020-06-29T07:06:03.6131701' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Pusonja","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2020-06-29T07:15:59.9925919' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Pusonja","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":"NikolaPusonja"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2020-06-29T07:20:05.1663355' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Pusonja","Username":null,"Password":"sifra123","Email":"moj@ict.edu.rs","Fullname":"Nikola Pusonja"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2020-06-29T07:21:00.3931994' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Anamarija","LastName":"Pusonja","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":"Anamarija Pusonja"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2020-06-29T07:21:26.6131380' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Pusonja","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":"Nikola Pusonja"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2020-06-29T07:21:43.8475674' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Anamarija","LastName":"Antic","Username":null,"Password":"sifra123","Email":"anamarija@gmail.com","Fullname":"Anamarija Antic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2020-06-29T07:22:25.8629266' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Anamarija","LastName":"Antic","Username":"Sivonja","Password":"sifra123","Email":"anamarija@gmail.com","Fullname":"Anamarija Antic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2020-06-29T07:23:40.9738038' AS DateTime2), N'Update User', N'{"Id":1,"FirstName":"Anamarija","LastName":"Antic","Username":"Sivonja","Password":"sifra123","Email":"anamarija@gmail.com","Fullname":"Anamarija Antic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2020-06-29T07:27:32.8699191' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Anamarija","LastName":"Antic","Username":"Sivonja","Password":"sifra123","Email":"pera@gmail.com","Fullname":"Anamarija Antic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2020-06-29T07:28:47.2888819' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Anamarija","LastName":"Antic","Username":"Sivonja","Password":"sifra123","Email":"pera@gmail.com","Fullname":"Anamarija Antic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2020-06-29T07:29:57.6841814' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Sonja","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Sonja "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2020-06-29T07:42:41.5054703' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Sonja","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Sonja "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2020-06-29T07:45:55.6170097' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Sonja","LastName":null,"Username":null,"Password":null,"Email":"pera@gmail.com","Fullname":"Sonja "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2020-06-29T07:46:27.0896702' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Nikola","LastName":"Pusonja","Username":null,"Password":null,"Email":"psdak@gmail.com","Fullname":"Nikola Pusonja"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2020-06-29T07:47:32.2644236' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Danijela","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Danijela "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2020-06-29T08:11:42.1006300' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Danijela","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Danijela "}', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2020-06-29T08:14:15.9557415' AS DateTime2), N'Get single User', N'7', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2020-06-29T08:15:39.3656248' AS DateTime2), N'Get single User', N'7', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2020-06-29T08:15:52.9510687' AS DateTime2), N'Get single User', N'1', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2020-06-29T08:17:33.3074197' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Luka","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Luka "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2020-06-29T08:18:09.1260473' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Luka","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Luka "}', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2020-06-29T08:18:37.9232220' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Luka","LastName":"Gledic","Username":null,"Password":null,"Email":null,"Fullname":"Luka Gledic"}', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2020-06-29T08:19:11.4917613' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Luka","LastName":"Antic","Username":null,"Password":null,"Email":"lukaantic@gmail.com","Fullname":"Luka Antic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2020-06-29T08:19:53.2172462' AS DateTime2), N'Update User', N'{"Id":7,"FirstName":"Luka","LastName":"Antic","Username":null,"Password":null,"Email":"lukaantic@gmail.com","Fullname":"Luka Antic"}', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2020-06-29T08:20:10.7627065' AS DateTime2), N'Update User', N'{"Id":5,"FirstName":"Luka","LastName":"Antic","Username":null,"Password":null,"Email":"lukaantic@gmail.com","Fullname":"Luka Antic"}', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2020-06-29T08:20:18.9682993' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":"Luka","LastName":"Antic","Username":null,"Password":null,"Email":"lukaantic@gmail.com","Fullname":"Luka Antic"}', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2020-06-29T08:45:17.5968419' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-06-29T00:00:00","Address":"Adresa usera 7","UserId":0,"Items":[{"MovieId":8,"Quantity":100},{"MovieId":12,"Quantity":9}]}', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2020-06-29T08:46:25.7684964' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-06-30T00:00:00","Address":"Adresa usera 7","UserId":0,"Items":[{"MovieId":8,"Quantity":100},{"MovieId":12,"Quantity":9}]}', N'anta123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2020-06-29T11:43:13.1073189' AS DateTime2), N'Get Logs', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2020-06-29T11:43:59.2419095' AS DateTime2), N'Get Logs', N'{"Name":"create","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2020-06-29T11:45:58.8390723' AS DateTime2), N'Get Logs', N'{"Name":"create","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2020-06-29T12:31:37.7301114' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":"user","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2020-06-29T12:31:49.9120182' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2020-06-29T12:31:59.9878179' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":"anta","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2020-06-29T12:53:01.4480590' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"0001-01-01T00:00:00","MaxDate":"0001-01-01T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2020-06-29T12:54:38.7881859' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"0001-01-01T00:00:00","MaxDate":"0001-01-01T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2020-06-29T12:55:51.7189995' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"0001-01-01T00:00:00","MaxDate":"0001-01-01T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2020-06-29T12:58:02.3351147' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"0001-01-01T00:00:00","MaxDate":"0001-01-01T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2020-06-29T13:03:13.0309255' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"0001-01-01T00:00:00","MaxDate":"0001-01-01T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2020-06-29T13:03:33.5864833' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"0001-01-01T00:00:00","MaxDate":"2020-06-25T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2020-06-29T13:04:19.8269359' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"2020-06-24T00:00:00","MaxDate":"2020-06-25T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2020-06-29T13:08:21.6454023' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"0001-01-01T00:00:00","MaxDate":"0001-01-01T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2020-06-29T13:08:49.0592973' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"0001-01-01T00:00:00","MaxDate":"0001-01-01T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2020-06-29T13:11:33.7224742' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2020-06-29T13:12:12.2282645' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"2020-06-24T00:00:00","MaxDate":null,"Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'2020-06-29T13:12:38.0363134' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"2020-06-24T00:00:00","MaxDate":null,"Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'2020-06-29T13:13:34.3461230' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":"2020-06-24T00:00:00","MaxDate":"2020-06-25T00:00:00","Year":"0001-01-01T00:00:00","Month":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'2020-06-29T23:10:44.9096984' AS DateTime2), N'Get Single Order', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'2020-06-29T23:11:15.4904926' AS DateTime2), N'Get Single Order', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'2020-06-29T23:13:52.9380131' AS DateTime2), N'Get Single Order', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'2020-06-29T23:14:32.9630965' AS DateTime2), N'Get Single Order', N'2', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'2020-06-29T23:17:01.2439817' AS DateTime2), N'Get Single Order', N'3', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'2020-06-29T23:36:21.8225417' AS DateTime2), N'Get Single Order', N'4', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'2020-06-29T23:37:19.2243512' AS DateTime2), N'Get Single Order', N'5', N'user1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'2020-06-30T13:05:24.9018195' AS DateTime2), N'Get Genres', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'2020-06-30T13:05:41.8114738' AS DateTime2), N'Get Single Genre', N'6', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'2020-06-30T13:05:43.7177318' AS DateTime2), N'Get Single Genre', N'4', N'Anonymus user')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'2020-06-30T13:05:46.2236709' AS DateTime2), N'Get Single Genre', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'2020-06-30T13:05:49.3762089' AS DateTime2), N'Get Single Genre', N'8', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'2020-06-30T13:07:07.7603341' AS DateTime2), N'Create new Genre', N'{"Id":0,"Name":"test1"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'2020-06-30T13:07:55.2958607' AS DateTime2), N'Get Single Genre', N'27', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'2020-06-30T13:07:58.7629078' AS DateTime2), N'Get Genres', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'2020-06-30T13:08:25.2780195' AS DateTime2), N'Update Genre', N'{"Id":27,"Name":"update test1"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'2020-06-30T13:08:43.4618730' AS DateTime2), N'Delete Genre', N'27', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'2020-06-30T13:09:02.6781325' AS DateTime2), N'Get Genres', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'2020-06-30T13:11:52.3927644' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'2020-06-30T13:12:22.1843193' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":2,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'2020-06-30T13:12:35.1213962' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":2,"Page":2}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'2020-06-30T13:12:45.5398642' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'2020-06-30T13:12:48.4906628' AS DateTime2), N'Get One Role', N'1', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'2020-06-30T13:12:53.2509126' AS DateTime2), N'Get One Role', N'5', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'2020-06-30T13:13:25.0858017' AS DateTime2), N'Delete Role', N'5', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'2020-06-30T13:13:32.8661098' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'2020-06-30T13:21:41.8246466' AS DateTime2), N'Create Role', N'{"Id":0,"Name":"create role test1"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'2020-06-30T13:22:08.5380700' AS DateTime2), N'Update Role', N'{"Id":6,"Name":"update role test1"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'2020-06-30T13:23:05.7823136' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'2020-06-30T13:23:10.0669619' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'2020-06-30T13:25:06.9530405' AS DateTime2), N'Get single User', N'1', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'2020-06-30T13:25:11.0637653' AS DateTime2), N'Get single User', N'2', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'2020-06-30T13:25:18.5873843' AS DateTime2), N'Get single User', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'2020-06-30T13:25:20.5275158' AS DateTime2), N'Get single User', N'4', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'2020-06-30T13:25:26.5639055' AS DateTime2), N'Get single User', N'7', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'2020-06-30T13:25:49.7308266' AS DateTime2), N'Delete User', N'4', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (126, CAST(N'2020-06-30T13:26:09.0728550' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (127, CAST(N'2020-06-30T13:27:33.4540597' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":"update userid2 test1","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"update userid2 test1 "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (128, CAST(N'2020-06-30T13:27:59.8886126' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":null,"LastName":"update ln test1","Username":null,"Password":null,"Email":null,"Fullname":" update ln test1"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (129, CAST(N'2020-06-30T13:28:29.1317361' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":null,"LastName":"update ln test1","Username":null,"Password":"sifra123","Email":null,"Fullname":" update ln test1"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (130, CAST(N'2020-06-30T13:29:15.1148108' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":"Luka","LastName":"Gledic","Username":null,"Password":"sifra123","Email":"lukagledic@gmail.com","Fullname":"Luka Gledic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (131, CAST(N'2020-06-30T13:29:56.2797586' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":"Stefan","LastName":"Stefanovic","Username":null,"Password":null,"Email":null,"Fullname":"Stefan Stefanovic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (132, CAST(N'2020-06-30T13:30:19.1294119' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":"Stefan","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Stefan "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (133, CAST(N'2020-06-30T13:30:37.2820100' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":null,"LastName":"Stefanovic","Username":null,"Password":null,"Email":null,"Fullname":" Stefanovic"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (134, CAST(N'2020-06-30T13:30:52.3335161' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":"Luka","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Luka "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (135, CAST(N'2020-06-30T13:31:09.9269284' AS DateTime2), N'Update User', N'{"Id":2,"FirstName":"Luka","LastName":null,"Username":null,"Password":null,"Email":"stefan@gmail.com","Fullname":"Luka "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (136, CAST(N'2020-06-30T13:32:53.1258794' AS DateTime2), N'Get Orders', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (137, CAST(N'2020-06-30T13:35:48.2970263' AS DateTime2), N'Get Single Order', N'6', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (138, CAST(N'2020-06-30T13:35:52.3638516' AS DateTime2), N'Get Single Order', N'5', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (139, CAST(N'2020-06-30T13:35:56.8493659' AS DateTime2), N'Get Single Order', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (140, CAST(N'2020-06-30T13:36:12.9194895' AS DateTime2), N'Get Single Order', N'6', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (141, CAST(N'2020-06-30T13:40:52.9426984' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"zdravkacelara16","UserId":0,"Items":[{"MovieId":8,"Quantity":2}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (142, CAST(N'2020-06-30T13:42:10.3434571' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"zdravkacelara16","UserId":0,"Items":[{"MovieId":8,"Quantity":2}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (143, CAST(N'2020-06-30T13:42:49.1052548' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"zdravkacelara16","UserId":0,"Items":[{"MovieId":8,"Quantity":2},{"MovieId":3218,"Quantity":2}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (144, CAST(N'2020-06-30T13:42:58.7750543' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"zdravkacelara16","UserId":0,"Items":[{"MovieId":8,"Quantity":2},{"MovieId":8,"Quantity":2}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (145, CAST(N'2020-06-30T13:43:13.7575774' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"zdravkacelara16","UserId":0,"Items":[{"MovieId":8,"Quantity":2},{"MovieId":4,"Quantity":2}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (146, CAST(N'2020-06-30T13:44:04.9960132' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"zdravkacelara16","UserId":0,"Items":[{"MovieId":8,"Quantity":2},{"MovieId":5,"Quantity":2}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (147, CAST(N'2020-06-30T13:46:51.4749001' AS DateTime2), N'Get Movies', N'{"Title":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (148, CAST(N'2020-06-30T13:47:36.3031593' AS DateTime2), N'Get single movie', N'14', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (149, CAST(N'2020-06-30T13:48:25.8897106' AS DateTime2), N'Get single movie', N'13', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (150, CAST(N'2020-06-30T13:48:56.1984702' AS DateTime2), N'Get Actors', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (151, CAST(N'2020-06-30T13:50:25.6208184' AS DateTime2), N'Get Single Actor', N'6', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (152, CAST(N'2020-06-30T13:51:06.1930672' AS DateTime2), N'Get Directors', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (153, CAST(N'2020-06-30T13:51:59.2865609' AS DateTime2), N'Get Single director', N'7', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (154, CAST(N'2020-06-30T13:52:18.4039717' AS DateTime2), N'Get Writers', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (155, CAST(N'2020-06-30T13:52:45.1169712' AS DateTime2), N'Get Single Writer', N'4', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (156, CAST(N'2020-06-30T13:52:50.5072361' AS DateTime2), N'Get Single Writer', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (157, CAST(N'2020-06-30T13:53:03.6428725' AS DateTime2), N'Get Single Writer', N'11', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (158, CAST(N'2020-06-30T14:23:43.5211075' AS DateTime2), N'Create Writer', N'{"Id":0,"FirstName":"Milos","LastName":"Bikovic","Fullname":"Milos Bikovic","Oscars":2,"MovieNumber":2,"WriterMovies":[{"MovieId":8,"MovieTitle":null},{"MovieId":6,"MovieTitle":null}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (159, CAST(N'2020-06-30T14:25:32.7268098' AS DateTime2), N'Create Writer', N'{"Id":0,"FirstName":"Milos","LastName":"Bikovic","Fullname":"Milos Bikovic","Oscars":2,"MovieNumber":2,"WriterMovies":[{"MovieId":8,"MovieTitle":"Titanic"},{"MovieId":6,"MovieTitle":"Jablan"}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (160, CAST(N'2020-06-30T14:31:48.3878251' AS DateTime2), N'Create Director', N'{"Id":0,"FirstName":"Marko","LastName":"Janjic","Fullname":"Marko Janjic","Oscars":12,"MovieNumber":2,"DirectorMovies":[{"MovieId":9,"MovieTitle":"Titanic"},{"MovieId":11,"MovieTitle":"Jablan"}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (161, CAST(N'2020-06-30T14:32:01.1948285' AS DateTime2), N'Create Director', N'{"Id":0,"FirstName":"Marko","LastName":"Janjic","Fullname":"Marko Janjic","Oscars":12,"MovieNumber":2,"DirectorMovies":[{"MovieId":9,"MovieTitle":"Titanic"},{"MovieId":11,"MovieTitle":"Jablan"}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (162, CAST(N'2020-06-30T14:32:22.5423130' AS DateTime2), N'Create Director', N'{"Id":0,"FirstName":"Marko","LastName":"Jankovic","Fullname":"Marko Jankovic","Oscars":12,"MovieNumber":2,"DirectorMovies":[{"MovieId":9,"MovieTitle":null},{"MovieId":11,"MovieTitle":null}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (163, CAST(N'2020-06-30T14:34:40.0720073' AS DateTime2), N'Create Actor', N'{"Id":0,"FirstName":"Nikola","LastName":"Nikolic","Birth":"1960-06-06T00:00:00","FullName":"Nikola Nikolic","BirthPlace":"beograd","Age":60,"Oscars":2,"MovieNumber":3,"ActorMovies":[{"MovieId":3,"ActorCharacterName":"dzoni"},{"MovieId":12,"ActorCharacterName":"dzonika"},{"MovieId":6,"ActorCharacterName":"dzonile"}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (164, CAST(N'2020-06-30T14:35:15.0280765' AS DateTime2), N'Create Actor', N'{"Id":0,"FirstName":"Nikola","LastName":"Nikolic","Birth":"1960-06-06T00:00:00","FullName":"Nikola Nikolic","BirthPlace":"beograd","Age":60,"Oscars":2,"MovieNumber":3,"ActorMovies":[{"MovieId":3,"ActorCharacterName":"dzoni"},{"MovieId":122,"ActorCharacterName":"dzonika"},{"MovieId":6,"ActorCharacterName":"dzonile"}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (165, CAST(N'2020-06-30T14:38:22.8206793' AS DateTime2), N'Create Movie', N'{"Id":0,"Title":"CreateTest1","Budget":22.00,"Description":"create movie test1","Year":3000,"Oscars":8,"Price":40.00,"Quantity":22,"GenreId":2,"MovieActors":[{"ActorId":4,"ActorCharacterName":"createtest1"},{"ActorId":7,"ActorCharacterName":"createtest1"}],"MovieDirectors":[{"DirectorId":1},{"DirectorId":5}],"MovieWriters":[{"WriterId":7,"WriterName":null},{"WriterId":8,"WriterName":null}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (166, CAST(N'2020-06-30T14:38:48.8779527' AS DateTime2), N'Create Movie', N'{"Id":0,"Title":"CreateTest1","Budget":22.00,"Description":"create movie test1","Year":2000,"Oscars":8,"Price":40.00,"Quantity":22,"GenreId":2,"MovieActors":[{"ActorId":4,"ActorCharacterName":"createtest1"},{"ActorId":7,"ActorCharacterName":"createtest1"}],"MovieDirectors":[{"DirectorId":1},{"DirectorId":5}],"MovieWriters":[{"WriterId":7,"WriterName":null},{"WriterId":8,"WriterName":null}]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (167, CAST(N'2020-06-30T14:42:48.0434970' AS DateTime2), N'Delete Movie', N'15', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (168, CAST(N'2020-06-30T14:43:17.7959301' AS DateTime2), N'Delete Actor', N'11', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (169, CAST(N'2020-06-30T14:43:36.2954960' AS DateTime2), N'Delete Writer', N'12', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (170, CAST(N'2020-06-30T14:44:05.9187538' AS DateTime2), N'Delete Director', N'8', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (171, CAST(N'2020-06-30T14:45:23.4440504' AS DateTime2), N'Update Director', N'{"Id":6,"FirstName":"laza","LastName":null,"FullName":"laza ","Oscars":0}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (172, CAST(N'2020-06-30T14:53:05.8470802' AS DateTime2), N'Update Actor', N'{"Id":10,"FirstName":"laza","LastName":null,"FullName":"laza ","Oscars":null,"BirthPlace":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (173, CAST(N'2020-06-30T14:55:46.0859887' AS DateTime2), N'Update Actor', N'{"Id":10,"FirstName":null,"LastName":null,"FullName":" ","Oscars":11,"BirthPlace":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (174, CAST(N'2020-06-30T14:59:03.1002277' AS DateTime2), N'Update Actor', N'{"Id":10,"FirstName":"Leonardo","LastName":"Di Caprio","FullName":"Leonardo Di Caprio","Oscars":null,"BirthPlace":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (175, CAST(N'2020-06-30T14:59:14.6169490' AS DateTime2), N'Update Actor', N'{"Id":10,"FirstName":"leonardo","LastName":"Di Caprio","FullName":"leonardo Di Caprio","Oscars":null,"BirthPlace":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (176, CAST(N'2020-06-30T15:00:07.4196275' AS DateTime2), N'Update Actor', N'{"Id":10,"FirstName":"Nicholas","LastName":"Cage","FullName":"Nicholas Cage","Oscars":4,"BirthPlace":"Montana"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (177, CAST(N'2020-06-30T15:20:28.7764368' AS DateTime2), N'Update Writer', N'{"Id":10,"FirstName":"dobrica","LastName":null,"FullName":"dobrica ","Oscars":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (178, CAST(N'2020-06-30T15:20:48.1395009' AS DateTime2), N'Update Writer', N'{"Id":10,"FirstName":null,"LastName":"dobrica1","FullName":" dobrica1","Oscars":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (179, CAST(N'2020-06-30T15:21:06.8668052' AS DateTime2), N'Update Writer', N'{"Id":10,"FirstName":"janko","LastName":"jankovic","FullName":"janko jankovic","Oscars":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (180, CAST(N'2020-06-30T15:21:42.1466019' AS DateTime2), N'Update Writer', N'{"Id":10,"FirstName":"Stevan","LastName":"Jaksic","FullName":"Stevan Jaksic","Oscars":2}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (181, CAST(N'2020-06-30T15:22:41.9710084' AS DateTime2), N'Update Director', N'{"Id":7,"FirstName":"Stevan","LastName":"Jaksic","FullName":"Stevan Jaksic","Oscars":2}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (182, CAST(N'2020-06-30T15:23:11.3746820' AS DateTime2), N'Update Director', N'{"Id":7,"FirstName":"Predrag","LastName":"Pedovic","FullName":"Predrag Pedovic","Oscars":2}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (183, CAST(N'2020-06-30T15:23:16.1826844' AS DateTime2), N'Update Director', N'{"Id":7,"FirstName":"Predrag","LastName":"Pedovic","FullName":"Predrag Pedovic","Oscars":4}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (184, CAST(N'2020-06-30T15:28:53.7255478' AS DateTime2), N'Update Movie', N'{"Id":14,"Price":null,"Quantity":null,"Title":null,"Description":null,"Budget":1.0,"Oscars":null,"Year":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (185, CAST(N'2020-06-30T15:29:26.1840323' AS DateTime2), N'Update Movie', N'{"Id":14,"Price":null,"Quantity":21,"Title":null,"Description":null,"Budget":null,"Oscars":null,"Year":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (186, CAST(N'2020-06-30T15:29:40.1729611' AS DateTime2), N'Update Movie', N'{"Id":14,"Price":21.0,"Quantity":null,"Title":null,"Description":null,"Budget":null,"Oscars":null,"Year":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (187, CAST(N'2020-06-30T15:30:51.4238261' AS DateTime2), N'Update Movie', N'{"Id":14,"Price":21.0,"Quantity":null,"Title":"Joker1","Description":null,"Budget":300.0,"Oscars":6,"Year":2019}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (188, CAST(N'2020-06-30T15:31:26.2190535' AS DateTime2), N'Update Movie', N'{"Id":14,"Price":21.0,"Quantity":null,"Title":"Valide","Description":null,"Budget":300.0,"Oscars":6,"Year":2019}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (189, CAST(N'2020-06-30T15:50:56.1879506' AS DateTime2), N'Get Actors', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (190, CAST(N'2020-06-30T15:55:12.7977983' AS DateTime2), N'Get Actors', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (191, CAST(N'2020-07-01T02:56:30.3386142' AS DateTime2), N'Get Orders', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (192, CAST(N'2020-07-01T03:54:55.4832956' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (193, CAST(N'2020-07-01T04:48:33.5338032' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (194, CAST(N'2020-07-01T04:48:45.4833816' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":2019,"Month":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (195, CAST(N'2020-07-01T04:48:53.7562060' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":5,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (196, CAST(N'2020-07-01T04:48:57.6574173' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":4,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (197, CAST(N'2020-07-01T04:49:00.4420027' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":5,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (198, CAST(N'2020-07-01T04:50:49.3359391' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":5,"Day":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (199, CAST(N'2020-07-01T04:50:53.6559689' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":1,"Day":null,"PerPage":10,"Page":1}', N'Anonymus user')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (200, CAST(N'2020-07-01T04:51:01.6515908' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":null,"Day":2,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (201, CAST(N'2020-07-01T05:21:31.1307453' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (202, CAST(N'2020-07-01T05:22:06.4648217' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":"2020-06-23T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (203, CAST(N'2020-07-01T05:22:20.3044081' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":"2020-06-23T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (204, CAST(N'2020-07-01T05:22:25.0110068' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":"2020-06-23T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (205, CAST(N'2020-07-01T05:22:39.4128318' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":2,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (206, CAST(N'2020-07-01T05:22:43.2308844' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":3,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (207, CAST(N'2020-07-01T05:22:45.4015080' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":2,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (208, CAST(N'2020-07-01T05:22:51.0680237' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":1,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (209, CAST(N'2020-07-01T05:23:32.9553933' AS DateTime2), N'Get Orders', N'{"Date":"2020-07-03T00:00:00","MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (210, CAST(N'2020-07-01T05:25:03.2944603' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":20,"MinPrice":null,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (211, CAST(N'2020-07-01T05:25:05.7145283' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":200,"MinPrice":null,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (212, CAST(N'2020-07-01T05:25:15.3282986' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":2000,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (213, CAST(N'2020-07-01T05:25:28.7945268' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":7000,"userId":null,"CreatedAt":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (214, CAST(N'2020-07-01T05:25:41.6900417' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":null,"CreatedAt":"2020-06-30T00:00:00","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (215, CAST(N'2020-07-01T05:27:12.2650164' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":1,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (216, CAST(N'2020-07-01T05:27:33.7342763' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":32,"userId":1,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (217, CAST(N'2020-07-01T05:50:51.6865636' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (218, CAST(N'2020-07-01T05:52:35.8493148' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":"interstellar","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (219, CAST(N'2020-07-01T05:53:41.4723246' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":20,"Movie":"interstellar","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (220, CAST(N'2020-07-01T05:53:57.2682748' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":42,"MinAge":null,"MaxAge":null,"Movie":"interstellar","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (221, CAST(N'2020-07-01T05:55:09.4734772' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":42,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (222, CAST(N'2020-07-01T05:55:28.5408009' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":19,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (223, CAST(N'2020-07-01T05:55:37.7488730' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":19,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (224, CAST(N'2020-07-01T05:56:20.3458291' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":19,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (225, CAST(N'2020-07-01T05:56:39.7041981' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":60,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (226, CAST(N'2020-07-01T05:56:46.8624824' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":59,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (227, CAST(N'2020-07-01T05:56:53.5966800' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":60,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (228, CAST(N'2020-07-01T05:58:20.5795957' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":60,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (229, CAST(N'2020-07-01T05:58:29.4302891' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":60,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (230, CAST(N'2020-07-01T05:58:41.7008892' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":83,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (231, CAST(N'2020-07-01T06:14:16.1368462' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (232, CAST(N'2020-07-01T06:14:31.0875704' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":2,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (233, CAST(N'2020-07-01T06:14:47.4867756' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":5,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (234, CAST(N'2020-07-01T06:15:08.0315485' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":5,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (235, CAST(N'2020-07-01T06:15:17.9041854' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":5,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (236, CAST(N'2020-07-01T06:15:20.3695117' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (237, CAST(N'2020-07-01T06:15:30.1690523' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (238, CAST(N'2020-07-01T06:15:44.6351846' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (239, CAST(N'2020-07-01T06:15:48.4722790' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (240, CAST(N'2020-07-01T06:16:02.6787119' AS DateTime2), N'Get Writers', N'{"FirstName":"stevan","LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (241, CAST(N'2020-07-01T06:16:15.5958991' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":"z","Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (242, CAST(N'2020-07-01T06:16:20.7932743' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":"zdravkovic","Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (243, CAST(N'2020-07-01T06:17:06.7071898' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":4,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (244, CAST(N'2020-07-01T06:17:20.7457274' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":6,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (245, CAST(N'2020-07-01T06:17:26.8078011' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":5,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (246, CAST(N'2020-07-01T06:17:32.0035729' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":5,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (247, CAST(N'2020-07-01T06:17:34.3650184' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":6,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (248, CAST(N'2020-07-01T06:17:52.8787332' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"newyork","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (249, CAST(N'2020-07-01T06:18:00.3814628' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"new york","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (250, CAST(N'2020-07-01T06:19:46.3535997' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"newyork","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (251, CAST(N'2020-07-01T06:19:54.3538224' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"new york","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (252, CAST(N'2020-07-01T06:20:00.6923058' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"new%york","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (253, CAST(N'2020-07-01T06:20:02.2576824' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"newyork","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (254, CAST(N'2020-07-01T06:20:26.2010492' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"newyork","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (255, CAST(N'2020-07-01T06:20:34.6247836' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"NewYork","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (256, CAST(N'2020-07-01T06:21:19.3610119' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":"NewYork","Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (257, CAST(N'2020-07-01T06:25:27.7253063' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":1,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (258, CAST(N'2020-07-01T06:28:11.9237650' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":9,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (259, CAST(N'2020-07-01T06:28:14.9846988' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":3,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (260, CAST(N'2020-07-01T06:28:30.4886910' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":4,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (261, CAST(N'2020-07-01T06:29:00.9121607' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":4,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (262, CAST(N'2020-07-01T06:29:09.7516030' AS DateTime2), N'Get Directors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":4,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (263, CAST(N'2020-07-01T06:45:38.7359390' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":null,"Role":null,"MinOrders":2,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (264, CAST(N'2020-07-01T06:46:24.8340826' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":null,"Role":null,"MinOrders":3,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (265, CAST(N'2020-07-01T06:46:33.1993678' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":"1","Role":null,"MinOrders":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (266, CAST(N'2020-07-01T06:46:38.1447471' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":"a","Role":null,"MinOrders":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (267, CAST(N'2020-07-01T06:46:44.4741464' AS DateTime2), N'Get Users', N'{"FirstName":"stefan","LastName":null,"Username":null,"Role":null,"MinOrders":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (268, CAST(N'2020-07-01T06:46:47.1303118' AS DateTime2), N'Get Users', N'{"FirstName":"a","LastName":null,"Username":null,"Role":null,"MinOrders":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (269, CAST(N'2020-07-01T06:48:00.4123899' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":null,"Role":"admin","MinOrders":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (270, CAST(N'2020-07-01T06:48:08.3692771' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":null,"Role":"user","MinOrders":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (271, CAST(N'2020-07-01T07:43:47.1006874' AS DateTime2), N'User Registration', N'{"FirstName":"Darko","LastName":"Kukic","Username":"kuka123","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (272, CAST(N'2020-07-01T07:44:40.8781979' AS DateTime2), N'User Registration', N'{"FirstName":"Darko","LastName":"Kukic","Username":"kuka123","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (273, CAST(N'2020-07-01T07:47:05.7411020' AS DateTime2), N'User Registration', N'{"FirstName":"Darko","LastName":"Kukic","Username":"kuka123","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (274, CAST(N'2020-07-01T07:49:10.9893279' AS DateTime2), N'User Registration', N'{"Id":0,"FirstName":"Darko","LastName":"Kukic","Username":"kuka123","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (275, CAST(N'2020-07-01T07:51:48.2877191' AS DateTime2), N'User Registration', N'{"Id":0,"FirstName":"Darko","LastName":"Kukic","Username":"kuka123","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (276, CAST(N'2020-07-01T07:53:51.8379964' AS DateTime2), N'User Registration', N'{"Id":0,"FirstName":"ares","LastName":"ddsa","Username":"kuka1dd23","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (277, CAST(N'2020-07-01T07:55:57.1173536' AS DateTime2), N'User Registration', N'{"Id":0,"FirstName":"ares","LastName":"ddsa","Username":"kuka1dd23","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (278, CAST(N'2020-07-01T07:57:04.3818083' AS DateTime2), N'User Registration', N'{"Id":0,"FirstName":"ares","LastName":"ddsa","Username":"kuka1dd23","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (279, CAST(N'2020-07-01T08:04:11.1994513' AS DateTime2), N'User Registration', N'{"Id":0,"FirstName":"ares","LastName":"ddsa","Username":"kuka1dd23","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (280, CAST(N'2020-07-01T08:15:01.6124486' AS DateTime2), N'User Registration', N'{"FirstName":"ares","LastName":"ddsa","Username":"kuka1dd23","Password":"sifra123","Email":"n.pule96@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (281, CAST(N'2020-07-01T08:59:20.6826137' AS DateTime2), N'Get Genres', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (282, CAST(N'2020-07-01T08:59:47.6754611' AS DateTime2), N'Get Single Genre', N'5', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (283, CAST(N'2020-07-01T09:00:10.7189193' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (284, CAST(N'2020-07-01T09:00:20.2665121' AS DateTime2), N'Get One Role', N'2', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (285, CAST(N'2020-07-01T09:01:08.1745936' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (286, CAST(N'2020-07-01T09:02:03.6409791' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":5,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (287, CAST(N'2020-07-01T09:02:16.1716828' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":7,"Page":2}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (288, CAST(N'2020-07-01T09:02:40.2452268' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":2,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (289, CAST(N'2020-07-01T09:02:49.9835230' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":5,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (290, CAST(N'2020-07-01T09:02:59.4660630' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":1,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (291, CAST(N'2020-07-01T09:03:51.6422045' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":0,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (292, CAST(N'2020-07-01T09:04:56.8280086' AS DateTime2), N'Get Single Writer', N'1', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (293, CAST(N'2020-07-01T09:05:11.5061011' AS DateTime2), N'Get Single Writer', N'2', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (294, CAST(N'2020-07-01T09:05:36.7887876' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (295, CAST(N'2020-07-01T09:05:56.7772585' AS DateTime2), N'Get Single Actor', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (296, CAST(N'2020-07-01T09:05:58.8072617' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (297, CAST(N'2020-07-01T09:07:37.5269184' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (298, CAST(N'2020-07-01T09:07:45.1800307' AS DateTime2), N'Get Single Actor', N'4', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (299, CAST(N'2020-07-01T09:08:17.2866034' AS DateTime2), N'Get Directors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (300, CAST(N'2020-07-01T09:08:35.5383846' AS DateTime2), N'Get Directors', N'{"FirstName":null,"LastName":null,"Oscars":0,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (301, CAST(N'2020-07-01T09:08:52.2356720' AS DateTime2), N'Get Single director', N'1', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (302, CAST(N'2020-07-01T09:09:06.4933694' AS DateTime2), N'Get Movies', N'{"Title":null,"Genre":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Price":null,"MinPrice":null,"MaxPrice":null,"Year":null,"MinYear":null,"MaxYear":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (303, CAST(N'2020-07-01T09:09:20.8454641' AS DateTime2), N'Get single movie', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (304, CAST(N'2020-07-01T09:09:23.8329538' AS DateTime2), N'Get single movie', N'6', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (305, CAST(N'2020-07-01T09:10:50.1309588' AS DateTime2), N'User Registration', N'{"FirstName":"andjela","LastName":"pusonja","Username":"angel23","Password":"sifra123","Email":"pusonja.andjela@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (306, CAST(N'2020-07-01T09:23:04.5099046' AS DateTime2), N'Get Genres', N'{"Name":null,"PerPage":10,"Page":1}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (307, CAST(N'2020-07-01T09:23:09.1952756' AS DateTime2), N'Get Single Genre', N'1', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (308, CAST(N'2020-07-01T09:23:15.5462798' AS DateTime2), N'Get single User', N'11', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (309, CAST(N'2020-07-01T09:23:18.6583184' AS DateTime2), N'Get single User', N'1', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (310, CAST(N'2020-07-01T09:23:33.8557187' AS DateTime2), N'Get Movies', N'{"Title":null,"Genre":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Price":null,"MinPrice":null,"MaxPrice":null,"Year":null,"MinYear":null,"MaxYear":null,"PerPage":10,"Page":1}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (311, CAST(N'2020-07-01T09:23:37.9676799' AS DateTime2), N'Get single movie', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (312, CAST(N'2020-07-01T09:23:42.9680693' AS DateTime2), N'Get Directors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (313, CAST(N'2020-07-01T09:23:45.4918235' AS DateTime2), N'Get Single director', N'6', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (314, CAST(N'2020-07-01T09:23:50.4646538' AS DateTime2), N'Get Single Writer', N'11', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (315, CAST(N'2020-07-01T09:23:52.7570489' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (316, CAST(N'2020-07-01T09:26:33.2115861' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-06T00:00:00","Address":"Angel Adresa","UserId":0,"Items":[{"MovieId":8,"Quantity":6},{"MovieId":14,"Quantity":1}]}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (317, CAST(N'2020-07-01T09:28:06.4258173' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":null,"PerPage":10,"Page":1}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (318, CAST(N'2020-07-01T09:28:12.5782277' AS DateTime2), N'Get Single Order', N'11', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (319, CAST(N'2020-07-01T09:28:15.8414126' AS DateTime2), N'Get Single Order', N'5', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (320, CAST(N'2020-07-01T09:29:32.8501000' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":null,"Role":null,"MinOrders":null,"PerPage":10,"Page":1}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (321, CAST(N'2020-07-01T09:29:52.4995062' AS DateTime2), N'Get single User', N'11', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (322, CAST(N'2020-07-01T09:30:55.2391783' AS DateTime2), N'Update User', N'{"Id":11,"FirstName":"Andjela","LastName":null,"Username":null,"Password":null,"Email":null,"Fullname":"Andjela "}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (323, CAST(N'2020-07-01T09:31:15.6348199' AS DateTime2), N'Update User', N'{"Id":11,"FirstName":null,"LastName":"Andjela","Username":null,"Password":null,"Email":null,"Fullname":" Andjela"}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (324, CAST(N'2020-07-01T09:32:18.9614345' AS DateTime2), N'Update User', N'{"Id":11,"FirstName":"Andjela","LastName":"Pusonja","Username":null,"Password":null,"Email":null,"Fullname":"Andjela Pusonja"}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (325, CAST(N'2020-07-01T09:32:35.1217652' AS DateTime2), N'Update User', N'{"Id":11,"FirstName":"Andjela","LastName":"Pusonja","Username":null,"Password":null,"Email":null,"Fullname":"Andjela Pusonja"}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (326, CAST(N'2020-07-01T09:32:36.2735963' AS DateTime2), N'Update User', N'{"Id":11,"FirstName":"Andjela","LastName":"Pusonja","Username":null,"Password":null,"Email":null,"Fullname":"Andjela Pusonja"}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (327, CAST(N'2020-07-01T09:32:54.0066281' AS DateTime2), N'Update User', N'{"Id":11,"FirstName":"Andjela","LastName":"Pusonja","Username":null,"Password":"angel123","Email":null,"Fullname":"Andjela Pusonja"}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (328, CAST(N'2020-07-01T09:33:36.1004606' AS DateTime2), N'Update User', N'{"Id":1,"FirstName":"Andjela","LastName":"Pusonja","Username":null,"Password":"angel123","Email":null,"Fullname":"Andjela Pusonja"}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (329, CAST(N'2020-07-01T09:34:25.5102530' AS DateTime2), N'User Registration', N'{"FirstName":"Andjela","LastName":"Pusonja","Username":"jako","Password":"angel123","Email":null}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (330, CAST(N'2020-07-01T09:34:43.6348754' AS DateTime2), N'User Registration', N'{"FirstName":"Andjela","LastName":"Pusonja","Username":"jako","Password":"angel123","Email":"sdadas@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (331, CAST(N'2020-07-01T09:36:37.5139870' AS DateTime2), N'User Registration', N'{"FirstName":"Andjela","LastName":"Pusonja","Username":"jako","Password":"angel123","Email":"sdadas@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (332, CAST(N'2020-07-01T09:37:32.9836933' AS DateTime2), N'User Registration', N'{"FirstName":"Andjela","LastName":"Pusonja","Username":"jako","Password":"angel123","Email":"sdadsadadas@gmail.com"}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (333, CAST(N'2020-07-01T09:50:05.2978917' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-06-30T00:00:00","Address":"Adresa usera 7","UserId":0,"Items":[{"MovieId":8,"Quantity":100},{"MovieId":12,"Quantity":9}]}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (334, CAST(N'2020-07-01T09:50:43.4832096' AS DateTime2), N'Upload File', N'{"Image":null}', N'angel23')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (335, CAST(N'2020-07-01T09:54:16.7979260' AS DateTime2), N'Upload File', N'{"Image":null}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (336, CAST(N'2020-07-01T09:54:34.5591486' AS DateTime2), N'Upload File', N'{"Image":null}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (337, CAST(N'2020-07-01T09:55:15.6446388' AS DateTime2), N'Upload File', N'{"Image":null}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (338, CAST(N'2020-07-01T09:56:44.8637593' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"uploadASP.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"uploadASP.jpg\""],"Content-Type":["image/jpeg"]},"Length":35954,"Name":"Image","FileName":"uploadASP.jpg"}}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (339, CAST(N'2020-07-01T09:58:06.6978174' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (340, CAST(N'2020-07-01T09:58:13.2119266' AS DateTime2), N'Get One Role', N'1', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (341, CAST(N'2020-07-01T09:58:16.0989445' AS DateTime2), N'Get One Role', N'2', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (342, CAST(N'2020-07-01T09:58:21.0324044' AS DateTime2), N'Get Genres', N'{"Name":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (343, CAST(N'2020-07-01T09:58:24.1269732' AS DateTime2), N'Get Single Genre', N'1', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (344, CAST(N'2020-07-01T09:58:28.2662421' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (345, CAST(N'2020-07-01T09:58:30.9971831' AS DateTime2), N'Get Single Actor', N'3', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (346, CAST(N'2020-07-01T09:58:36.3836823' AS DateTime2), N'Get Writers', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (347, CAST(N'2020-07-01T09:58:38.3218310' AS DateTime2), N'Get Single Writer', N'11', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (348, CAST(N'2020-07-01T09:58:42.3423698' AS DateTime2), N'Get Directors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (349, CAST(N'2020-07-01T09:58:45.2379898' AS DateTime2), N'Get Single director', N'1', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (350, CAST(N'2020-07-01T09:59:05.8360950' AS DateTime2), N'Get Single director', N'1', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (351, CAST(N'2020-07-01T09:59:11.0305959' AS DateTime2), N'Get Movies', N'{"Title":null,"Genre":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Price":null,"MinPrice":null,"MaxPrice":null,"Year":null,"MinYear":null,"MaxYear":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (352, CAST(N'2020-07-01T09:59:15.0249075' AS DateTime2), N'Get single movie', N'3', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (353, CAST(N'2020-07-01T09:59:17.1207689' AS DateTime2), N'Get single movie', N'9', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (354, CAST(N'2020-07-01T10:00:21.7825689' AS DateTime2), N'Create Role', N'{"Id":0,"Name":"admintest"}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (355, CAST(N'2020-07-01T10:00:30.0545251' AS DateTime2), N'Create new Genre', N'{"Id":0,"Name":"admintest"}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (356, CAST(N'2020-07-01T10:01:24.0602191' AS DateTime2), N'Update Genre', N'{"Id":28,"Name":"updateadmintest"}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (357, CAST(N'2020-07-01T10:01:57.7406933' AS DateTime2), N'Delete Genre', N'28', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (358, CAST(N'2020-07-01T10:02:33.3193696' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (359, CAST(N'2020-07-01T10:02:49.5127638' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (360, CAST(N'2020-07-01T10:03:45.6490988' AS DateTime2), N'Delete Role', N'7', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (361, CAST(N'2020-07-01T10:03:57.6701628' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (362, CAST(N'2020-07-01T10:09:27.0210199' AS DateTime2), N'Create Movie', N'{"Id":0,"Title":"CreateAdminTest","Budget":22.00,"Description":"create movie admin test","Year":2000,"Oscars":8,"Price":40.00,"Quantity":22,"GenreId":4,"MovieActors":[{"ActorId":4,"ActorCharacterName":"createtestadmin"},{"ActorId":7,"ActorCharacterName":"createadmintest"}],"MovieDirectors":[{"DirectorId":1},{"DirectorId":5}],"MovieWriters":[{"WriterId":7,"WriterName":null},{"WriterId":8,"WriterName":null}]}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (363, CAST(N'2020-07-01T10:12:13.7390630' AS DateTime2), N'Update Movie', N'{"Id":16,"Price":20.00,"Quantity":222,"Title":"UpdateAdmintest","Description":"update movie admin test","Budget":22.00,"Oscars":8,"Year":2013}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (364, CAST(N'2020-07-01T10:12:36.6409376' AS DateTime2), N'Delete Movie', N'16', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (365, CAST(N'2020-07-01T10:13:40.9003755' AS DateTime2), N'Get Orders', N'{"Date":null,"MinOrderLines":null,"MaxPrice":null,"MinPrice":null,"userId":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (366, CAST(N'2020-07-01T10:13:51.0228637' AS DateTime2), N'Get Single Order', N'11', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (367, CAST(N'2020-07-01T10:14:36.6373246' AS DateTime2), N'Get Single Order', N'1', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (368, CAST(N'2020-07-01T10:14:41.1007257' AS DateTime2), N'Get Single Order', N'2', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (369, CAST(N'2020-07-01T10:14:42.9105970' AS DateTime2), N'Get Single Order', N'3', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (370, CAST(N'2020-07-01T10:16:04.3847774' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-02T00:00:00","Address":"Adresa admina","UserId":0,"Items":[{"MovieId":8,"Quantity":1},{"MovieId":16,"Quantity":22}]}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (371, CAST(N'2020-07-01T10:16:25.0279616' AS DateTime2), N'Create Order', N'{"OrderDate":"2020-07-02T00:00:00","Address":"Adresa admina","UserId":0,"Items":[{"MovieId":8,"Quantity":1},{"MovieId":12,"Quantity":1}]}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (372, CAST(N'2020-07-01T10:17:26.6212162' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":null,"Role":null,"MinOrders":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (373, CAST(N'2020-07-01T10:17:30.6135468' AS DateTime2), N'Get single User', N'1', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (374, CAST(N'2020-07-01T10:17:32.0513883' AS DateTime2), N'Get single User', N'11', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (375, CAST(N'2020-07-01T10:17:52.8712089' AS DateTime2), N'Get Single Order', N'11', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (376, CAST(N'2020-07-01T10:18:20.9973068' AS DateTime2), N'Get Single Order', N'11', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (377, CAST(N'2020-07-01T10:18:57.6925511' AS DateTime2), N'Get Actors', N'{"FirstName":null,"LastName":null,"Oscars":null,"MinOscars":null,"MaxOscars":null,"Movies":null,"MinMovies":null,"MaxMovies":null,"BirthPlace":null,"Age":null,"MinAge":null,"MaxAge":null,"Movie":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (378, CAST(N'2020-07-01T10:19:01.0915336' AS DateTime2), N'Get Single Actor', N'3', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (379, CAST(N'2020-07-01T10:19:51.1469907' AS DateTime2), N'Create Actor', N'{"Id":0,"FirstName":"Lea","LastName":"Nikolic","Birth":"1960-06-06T00:00:00","FullName":"Lea Nikolic","BirthPlace":"beograd","Age":60,"Oscars":2,"MovieNumber":3,"ActorMovies":[{"MovieId":3,"ActorCharacterName":"dzoni"},{"MovieId":12,"ActorCharacterName":"dzonika"},{"MovieId":6,"ActorCharacterName":"dzonile"}]}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (380, CAST(N'2020-07-01T10:19:56.0963905' AS DateTime2), N'Create Writer', N'{"Id":0,"FirstName":"Lea","LastName":"Nikolic","Fullname":"Lea Nikolic","Oscars":2,"MovieNumber":0,"WriterMovies":[]}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (381, CAST(N'2020-07-01T10:20:42.5988255' AS DateTime2), N'Delete Actor', N'12', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (382, CAST(N'2020-07-01T10:22:52.2147977' AS DateTime2), N'Update Actor', N'{"Id":12,"FirstName":"Nina","LastName":"Markovic","FullName":"Nina Markovic","Oscars":12,"BirthPlace":"Podgorica"}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (383, CAST(N'2020-07-01T10:24:48.7617938' AS DateTime2), N'Create Writer', N'{"Id":0,"FirstName":"Milos","LastName":"Bikovic","Fullname":"Milos Bikovic","Oscars":2,"MovieNumber":2,"WriterMovies":[{"MovieId":8,"MovieTitle":"Titanic"},{"MovieId":6,"MovieTitle":"Jablan"}]}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (384, CAST(N'2020-07-01T10:25:42.0379290' AS DateTime2), N'Create Writer', N'{"Id":0,"FirstName":"Dana","LastName":"Bikovic","Fullname":"Dana Bikovic","Oscars":4,"MovieNumber":2,"WriterMovies":[{"MovieId":9,"MovieTitle":null},{"MovieId":6,"MovieTitle":null}]}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (385, CAST(N'2020-07-01T10:26:39.4886967' AS DateTime2), N'Update Writer', N'{"Id":13,"FirstName":"Slavko","LastName":"Jovic","FullName":"Slavko Jovic","Oscars":null}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (386, CAST(N'2020-07-01T10:26:56.9774533' AS DateTime2), N'Delete Writer', N'13', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (387, CAST(N'2020-07-01T10:29:20.8441177' AS DateTime2), N'Create Director', N'{"Id":0,"FirstName":"Jelena","LastName":"Ivanovic","Fullname":"Jelena Ivanovic","Oscars":1,"MovieNumber":5,"DirectorMovies":[{"MovieId":6},{"MovieId":4},{"MovieId":10},{"MovieId":5},{"MovieId":7}]}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (388, CAST(N'2020-07-01T10:30:43.7184948' AS DateTime2), N'Update Director', N'{"Id":9,"FirstName":null,"LastName":null,"FullName":" ","Oscars":23}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (389, CAST(N'2020-07-01T10:30:50.8847190' AS DateTime2), N'Delete Director', N'9', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (390, CAST(N'2020-07-01T10:33:48.1991958' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":null,"Day":null,"PerPage":10,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (391, CAST(N'2020-07-01T10:34:12.3368198' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":null,"Day":null,"PerPage":300,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (392, CAST(N'2020-07-01T10:34:20.3030718' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":null,"Day":null,"PerPage":5,"Page":1}', N'admin1')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (393, CAST(N'2020-07-01T10:35:36.2354658' AS DateTime2), N'Get Logs', N'{"Name":null,"ActorName":null,"MinDate":null,"MaxDate":null,"Year":null,"Month":null,"Day":null,"PerPage":5,"Page":79}', N'admin1')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Fullname], [Email]) VALUES (1, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), NULL, NULL, 0, 1, N'Stefan', N'Stefanovic', N'admin1', N'sifra123', 1, N'Stefan Stefanovic', N'stefan@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Fullname], [Email]) VALUES (2, CAST(N'2020-06-23T02:47:10.6398565' AS DateTime2), NULL, CAST(N'2020-06-30T15:30:52.3557935' AS DateTime2), 0, 1, N'Luka', N'Gledic', N'user1', N'sifra123', 2, N'Luka Gledic', N'lukagledic@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Fullname], [Email]) VALUES (3, CAST(N'2020-06-28T17:08:33.3240362' AS DateTime2), NULL, NULL, 0, 1, N'Petar', N'Peric', N'pera123', N'sifra123', 2, N'Petar Peric', N'pera@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Fullname], [Email]) VALUES (4, CAST(N'2020-06-28T17:44:23.7032831' AS DateTime2), CAST(N'2020-06-30T15:25:49.7536730' AS DateTime2), CAST(N'2020-06-30T15:25:49.7655336' AS DateTime2), 1, 0, N'Nikola', N'Pusonja', N'puske123', N'sifra123', 2, N'Nikola Pusonja', N'nikola.pusonja.9.15@ict.edu.rs')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Fullname], [Email]) VALUES (7, CAST(N'2020-06-28T18:11:42.5338501' AS DateTime2), NULL, CAST(N'2020-06-29T10:19:53.2369929' AS DateTime2), 0, 1, N'Luka', N'Antic', N'anta123', N'sifra123', 2, N'Luka Antic', N'lukaantic@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Fullname], [Email]) VALUES (8, CAST(N'2020-07-01T09:52:01.3212929' AS DateTime2), NULL, NULL, 0, 1, N'Darko', N'Kukic', N'kuka123', N'sifra123', 2, N'Darko Kukic', N'dare@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Fullname], [Email]) VALUES (10, CAST(N'2020-07-01T10:15:08.9654816' AS DateTime2), NULL, NULL, 0, 1, N'ares', N'ddsa', N'kuka1dd23', N'sifra123', 2, N'ares ddsa', N'n.pule96@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Fullname], [Email]) VALUES (11, CAST(N'2020-07-01T11:10:50.2536912' AS DateTime2), NULL, CAST(N'2020-07-01T11:32:54.0269678' AS DateTime2), 0, 1, N'Andjela', N'Pusonja', N'angel23', N'angel123', 2, N'Andjela Pusonja', N'pusonja.andjela@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1, 1, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2, 1, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (3, 1, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (4, 1, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (5, 1, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (6, 1, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (7, 1, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (8, 1, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (9, 1, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (10, 1, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (11, 1, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (13, 1, 13)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (14, 1, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (15, 1, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (18, 1, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (21, 1, 17)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (22, 1, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (23, 1, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (24, 1, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (25, 1, 21)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (27, 1, 22)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (28, 1, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (29, 1, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (30, 1, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (31, 1, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (32, 1, 27)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (34, 1, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (35, 1, 29)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (36, 1, 30)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (37, 1, 31)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (38, 1, 32)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (39, 1, 32)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (40, 1, 33)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (41, 1, 34)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (42, 1, 36)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (43, 1, 37)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (44, 1, 38)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (45, 1, 40)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (46, 2, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (47, 2, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (48, 2, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (49, 2, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (50, 2, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (51, 2, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (52, 2, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (53, 2, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (54, 2, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (55, 2, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (56, 2, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (58, 2, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (59, 2, 35)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (60, 2, 37)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (64, 1, 35)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (65, 11, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (66, 11, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (67, 11, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (68, 11, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (69, 11, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (70, 11, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (71, 11, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (72, 11, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (73, 11, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (74, 11, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (75, 11, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (77, 11, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (78, 11, 35)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (79, 11, 37)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (95, 1, 12)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
SET IDENTITY_INSERT [dbo].[WriterMovie] ON 

INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (4, 2, 3)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (5, 3, 4)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (6, 4, 5)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (7, 5, 6)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (8, 6, 7)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (9, 2, 7)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (10, 3, 7)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (11, 2, 8)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (12, 4, 5)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (13, 3, 3)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (14, 6, 8)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (15, 7, 4)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (16, 8, 4)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (17, 9, 4)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (18, 10, 4)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (19, 11, 4)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (20, 11, 8)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (21, 10, 7)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (22, 8, 3)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (23, 9, 6)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (24, 3, 10)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (25, 6, 10)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (26, 3, 11)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (27, 6, 11)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (28, 7, 12)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (29, 8, 12)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (30, 7, 14)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (31, 8, 14)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (32, 12, 8)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (33, 12, 6)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (34, 7, 15)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (35, 8, 15)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (36, 7, 16)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (37, 8, 16)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (38, 13, 8)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (39, 13, 6)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (40, 14, 9)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (41, 14, 6)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (42, 15, 21)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (43, 16, 17)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (44, 17, 18)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (45, 18, 20)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (46, 19, 20)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (47, 20, 19)
INSERT [dbo].[WriterMovie] ([Id], [WriterId], [MovieId]) VALUES (48, 21, 19)
SET IDENTITY_INSERT [dbo].[WriterMovie] OFF
SET IDENTITY_INSERT [dbo].[Writers] ON 

INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (2, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Jelena', N'Aleksic', 2, 3, N'Jelena Aleksic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (3, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Milica', N'Lazic', 1, 5, N'Milica Lazic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (4, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Jelica', N'Dabovic', 3, 2, N'Jelica Dabovic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (5, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Snezana', N'Snezic', 1, 1, N'Snezana Snezic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (6, CAST(N'2020-06-23T02:45:12.2930904' AS DateTime2), NULL, NULL, 0, 1, N'Nikola', N'Vulovic', 1, 4, N'Nikola Vulovic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (7, CAST(N'2020-06-25T05:56:26.4322804' AS DateTime2), NULL, NULL, 0, 1, N'stevan', N'zdravkovic', 0, 3, N'stevan zdravkovic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (8, CAST(N'2020-06-25T05:57:49.4689805' AS DateTime2), NULL, NULL, 0, 1, N'stevan', N'babic', 0, 4, N'stevan babic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (9, CAST(N'2020-06-25T06:11:13.5183373' AS DateTime2), NULL, CAST(N'2020-06-25T07:06:41.4871336' AS DateTime2), 0, 1, N'janko', N'jankovic', 0, 2, N'janko jankovic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (10, CAST(N'2020-06-25T06:14:58.9002672' AS DateTime2), NULL, CAST(N'2020-06-30T17:21:42.1653840' AS DateTime2), 0, 1, N'Stevan', N'Jaksic', 2, 2, N'Stevan Jaksic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (11, CAST(N'2020-06-25T06:18:37.7410930' AS DateTime2), NULL, CAST(N'2020-06-26T13:54:21.1693996' AS DateTime2), 0, 1, N'julija', N'djordjevic', 5, 2, N'julija djordjevic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (12, CAST(N'2020-06-30T16:25:32.7626620' AS DateTime2), NULL, CAST(N'2020-06-30T16:43:36.3078663' AS DateTime2), 0, 1, N'Milos', N'Bikovic', 2, 2, N'Milos Bikovic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (13, CAST(N'2020-07-01T12:24:48.8032661' AS DateTime2), NULL, CAST(N'2020-07-01T12:26:56.9886134' AS DateTime2), 0, 1, N'Slavko', N'Jovic', 2, 2, N'Slavko Jovic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (14, CAST(N'2020-07-01T12:25:42.0551765' AS DateTime2), NULL, NULL, 0, 1, N'Dana', N'Bikovic', 4, 2, N'Dana Bikovic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (15, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Dajana', N'Butulija', 2, 1, N'Dajana Butulija')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (16, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Slavko', N'Vranes', 2, 1, N'Slavko Vranes')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (17, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Mirko', N'Vujicic', 3, 1, N'Mirko Vujicic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (18, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Jasmin', N'Jasminkovic', 2, 1, N'Jasmin Jasminkovic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (19, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Osman', N'Karabatic', 2, 1, N'Osman Karabatic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (20, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Kima', N'Kimic', 3, 1, N'Kima Kimic')
INSERT [dbo].[Writers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Oscars], [MovieNumber], [Fullname]) VALUES (21, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Li', N'Le', 2, 1, N'Li Le')
SET IDENTITY_INSERT [dbo].[Writers] OFF
/****** Object:  Index [IX_ActorMovie_ActorId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActorMovie_ActorId] ON [dbo].[ActorMovie]
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActorMovie_MovieId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_ActorMovie_MovieId] ON [dbo].[ActorMovie]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DirectorMovie_DirectorId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_DirectorMovie_DirectorId] ON [dbo].[DirectorMovie]
(
	[DirectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DirectorMovie_MovieId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_DirectorMovie_MovieId] ON [dbo].[DirectorMovie]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genres_Name]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Genres_Name] ON [dbo].[Genres]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_GenreId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Movies_GenreId] ON [dbo].[Movies]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movies_Title]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Movies_Title] ON [dbo].[Movies]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLine_MovieId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLine_MovieId] ON [dbo].[OrderLine]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLine_OrderId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLine_OrderId] ON [dbo].[OrderLine]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_Name]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_Name] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Users_Username]    Script Date: 7/1/2020 4:23:25 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [AK_Users_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WriterMovie_MovieId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_WriterMovie_MovieId] ON [dbo].[WriterMovie]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WriterMovie_WriterId]    Script Date: 7/1/2020 4:23:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_WriterMovie_WriterId] ON [dbo].[WriterMovie]
(
	[WriterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actors] ADD  DEFAULT ((0)) FOR [MoviesNumber]
GO
ALTER TABLE [dbo].[Directors] ADD  DEFAULT ((0)) FOR [MovieNumber]
GO
ALTER TABLE [dbo].[Writers] ADD  DEFAULT ((0)) FOR [MovieNumber]
GO
ALTER TABLE [dbo].[ActorMovie]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovie_Actors_ActorId] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
GO
ALTER TABLE [dbo].[ActorMovie] CHECK CONSTRAINT [FK_ActorMovie_Actors_ActorId]
GO
ALTER TABLE [dbo].[ActorMovie]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovie_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[ActorMovie] CHECK CONSTRAINT [FK_ActorMovie_Movies_MovieId]
GO
ALTER TABLE [dbo].[DirectorMovie]  WITH CHECK ADD  CONSTRAINT [FK_DirectorMovie_Directors_DirectorId] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[DirectorMovie] CHECK CONSTRAINT [FK_DirectorMovie_Directors_DirectorId]
GO
ALTER TABLE [dbo].[DirectorMovie]  WITH CHECK ADD  CONSTRAINT [FK_DirectorMovie_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[DirectorMovie] CHECK CONSTRAINT [FK_DirectorMovie_Movies_MovieId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Genres_GenreId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Movies_MovieId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
ALTER TABLE [dbo].[WriterMovie]  WITH CHECK ADD  CONSTRAINT [FK_WriterMovie_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[WriterMovie] CHECK CONSTRAINT [FK_WriterMovie_Movies_MovieId]
GO
ALTER TABLE [dbo].[WriterMovie]  WITH CHECK ADD  CONSTRAINT [FK_WriterMovie_Writers_WriterId] FOREIGN KEY([WriterId])
REFERENCES [dbo].[Writers] ([Id])
GO
ALTER TABLE [dbo].[WriterMovie] CHECK CONSTRAINT [FK_WriterMovie_Writers_WriterId]
GO
USE [master]
GO
ALTER DATABASE [MovieShop] SET  READ_WRITE 
GO
