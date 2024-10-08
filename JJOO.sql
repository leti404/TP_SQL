USE [master]
GO
/****** Object:  Database [JJOO]    Script Date: 19/8/2024 09:58:46 ******/
CREATE DATABASE [JJOO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JJOO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JJOO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JJOO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JJOO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JJOO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JJOO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JJOO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JJOO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JJOO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JJOO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JJOO] SET ARITHABORT OFF 
GO
ALTER DATABASE [JJOO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JJOO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JJOO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JJOO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JJOO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JJOO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JJOO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JJOO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JJOO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JJOO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JJOO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JJOO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JJOO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JJOO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JJOO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JJOO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JJOO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JJOO] SET RECOVERY FULL 
GO
ALTER DATABASE [JJOO] SET  MULTI_USER 
GO
ALTER DATABASE [JJOO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JJOO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JJOO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JJOO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JJOO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JJOO', N'ON'
GO
ALTER DATABASE [JJOO] SET QUERY_STORE = OFF
GO
USE [JJOO]
GO
/****** Object:  User [alumno]    Script Date: 19/8/2024 09:58:46 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Deportes]    Script Date: 19/8/2024 09:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportes](
	[IdDeporte] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Foto] [text] NOT NULL,
 CONSTRAINT [PK_Deportes] PRIMARY KEY CLUSTERED 
(
	[IdDeporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deportistas]    Script Date: 19/8/2024 09:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportistas](
	[IdDeportista] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](200) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [text] NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdDeporte] [int] NOT NULL,
 CONSTRAINT [PK_Deportistas] PRIMARY KEY CLUSTERED 
(
	[IdDeportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 19/8/2024 09:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Bandera] [text] NOT NULL,
	[FechaFundacion] [date] NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Deportes] ON 

INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (1, N'Gimnasia Artistica', N'https://concepto.de/wp-content/uploads/2022/04/gimnasia-artistica-caracteristicas-e1649649250982.jpg')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (2, N'Atletismo', N'https://img.olympics.com/images/image/private/t_s_pog_staticContent_hero_md_2x/f_auto/primary/i1nuxhqjwgut8kl2wqey')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (3, N'Arquería', N'https://i0.wp.com/deporteargentinoplus.com.ar/wp-content/uploads/2023/04/arqueria-tiro-con-arco-florencia-lethold-plaza-panamericana.jpg?fit=690%2C460&ssl=1')
SET IDENTITY_INSERT [dbo].[Deportes] OFF
GO
SET IDENTITY_INSERT [dbo].[Deportistas] ON 

INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (1, N'Biles', N'Simone', CAST(N'1997-03-14' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/959/medium/1959861.png', 1, 1)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (2, N'Su', N'Weide', CAST(N'2000-03-19' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/918/medium/1918858.png', 4, 1)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (3, N'Xia', N'Yuyu', CAST(N'1998-03-01' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/919/medium/1919129.png', 4, 2)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (5, N'Davis-Woodhall', N'Tara', CAST(N'1999-05-20' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/960/medium/1960711.png', 1, 2)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (6, N'Gomez', N'Joaquin', CAST(N'1996-10-14' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/537/medium/1537531.png', 2, 2)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (7, N'Duplantis', N'Armand', CAST(N'1999-11-10' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/569/medium/1569203.png', 3, 2)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (8, N'Mucino', N'Jennifer', CAST(N'2002-12-18' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/955/medium/1955608.png', 1, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (9, N'Jajarabilla', N'Mario', CAST(N'1999-01-10' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/911/medium/1911041.png', 2, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (10, N'Yang', N'Xiaolei', CAST(N'2000-06-18' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/913/medium/1913380.png', 4, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (11, N'Lee', N'Sunisa', CAST(N'2003-03-09' AS Date), N'https://olympics.com/OG2024/pic/OG2024/001/959/medium/1959866.png', 1, 1)
SET IDENTITY_INSERT [dbo].[Deportistas] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (1, N'Estados Unidos', N'https://img.freepik.com/fotos-premium/bandera-ee-uu_934577-54.jpg', CAST(N'1776-07-04' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (2, N'Argentina', N'https://upload.wikimedia.org/wikipedia/commons/1/1a/Flag_of_Argentina.svg', CAST(N'1816-07-09' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (3, N'Suecia', N'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Sweden.svg/800px-Flag_of_Sweden.svg.png', CAST(N'1523-06-06' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (4, N'China', N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/1024px-Flag_of_the_People%27s_Republic_of_China.svg.png', CAST(N'1949-10-01' AS Date))
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
ALTER TABLE [dbo].[Deportistas]  WITH CHECK ADD  CONSTRAINT [FK_Deportistas_Deportes] FOREIGN KEY([IdDeporte])
REFERENCES [dbo].[Deportes] ([IdDeporte])
GO
ALTER TABLE [dbo].[Deportistas] CHECK CONSTRAINT [FK_Deportistas_Deportes]
GO
ALTER TABLE [dbo].[Deportistas]  WITH CHECK ADD  CONSTRAINT [FK_Deportistas_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([IdPais])
GO
ALTER TABLE [dbo].[Deportistas] CHECK CONSTRAINT [FK_Deportistas_Paises]
GO
USE [master]
GO
ALTER DATABASE [JJOO] SET  READ_WRITE 
GO
