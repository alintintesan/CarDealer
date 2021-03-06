USE [master]
GO
/****** Object:  Database [CarDealerDB]    Script Date: 4/14/2019 6:28:59 PM ******/
CREATE DATABASE [CarDealerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarDealerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CarDealerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarDealerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CarDealerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarDealerDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarDealerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarDealerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarDealerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarDealerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarDealerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarDealerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarDealerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarDealerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarDealerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarDealerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarDealerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarDealerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarDealerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarDealerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarDealerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarDealerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarDealerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarDealerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarDealerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarDealerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarDealerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarDealerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarDealerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarDealerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarDealerDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarDealerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarDealerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarDealerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarDealerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarDealerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarDealerDB] SET QUERY_STORE = OFF
GO
USE [CarDealerDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CarDealerDB]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarsInventory]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarsInventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[modelId] [int] NOT NULL,
	[colorId] [int] NOT NULL,
	[buildDate] [date] NOT NULL,
	[mileage] [int] NOT NULL,
	[initialPrice] [float] NOT NULL,
	[finalPrice] [int] NOT NULL,
	[engineId] [int] NOT NULL,
	[optionsLevel] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CarsInventory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[creditCardNo] [varchar](16) NOT NULL,
	[balance] [float] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[color] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deals]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carId] [int] NOT NULL,
	[discountedPrice] [float] NOT NULL,
 CONSTRAINT [PK_Deals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[position] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engines]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fuelType] [varchar](50) NOT NULL,
	[power] [int] NOT NULL,
	[capacity] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Engines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelEngines]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelEngines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[modelId] [int] NOT NULL,
	[engineId] [int] NOT NULL,
 CONSTRAINT [PK_ModelEngines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [varchar](50) NOT NULL,
	[brandId] [int] NOT NULL,
	[basePrice] [float] NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[operation] [varchar](200) NULL,
	[cost] [float] NOT NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[option] [varchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[level] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carId] [int] NOT NULL,
	[clientId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[daysRented] [int] NOT NULL,
	[totalCost] [float] NOT NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[price] [float] NOT NULL,
	[details] [varchar](5000) NOT NULL,
	[typeOfTransaction] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceInterventions]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceInterventions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[operationId] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[cost] [float] NOT NULL,
 CONSTRAINT [PK_ServiceInterventions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestDrives]    Script Date: 4/14/2019 6:28:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestDrives](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carId] [int] NOT NULL,
	[clientId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[distanceDriven] [int] NOT NULL,
 CONSTRAINT [PK_TestDrives] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([id], [brand]) VALUES (1, N'Audi')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (2, N'BMW')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (3, N'Mercedes-Benz')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (4, N'Volkswagen')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (5, N'Ferrari')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (6, N'Ford')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (7, N'Honda')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (8, N'Jaguar')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (9, N'Land-Rover')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (10, N'Nissan')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (11, N'Dacia')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (12, N'Tesla')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (13, N'Toyota')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (14, N'Seat')
INSERT [dbo].[Brands] ([id], [brand]) VALUES (15, N'Porsche')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[CarsInventory] ON 

INSERT [dbo].[CarsInventory] ([id], [modelId], [colorId], [buildDate], [mileage], [initialPrice], [finalPrice], [engineId], [optionsLevel]) VALUES (1, 6, 1, CAST(N'2019-01-01' AS Date), 0, 80000, 110000, 14, N'Luxury')
INSERT [dbo].[CarsInventory] ([id], [modelId], [colorId], [buildDate], [mileage], [initialPrice], [finalPrice], [engineId], [optionsLevel]) VALUES (2, 22, 3, CAST(N'2018-05-01' AS Date), 30, 65000, 85500, 6, N'Premium')
INSERT [dbo].[CarsInventory] ([id], [modelId], [colorId], [buildDate], [mileage], [initialPrice], [finalPrice], [engineId], [optionsLevel]) VALUES (3, 61, 4, CAST(N'2018-06-01' AS Date), 0, 80000, 100500, 19, N'Premium')
SET IDENTITY_INSERT [dbo].[CarsInventory] OFF
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([id], [username], [password], [firstName], [lastName], [creditCardNo], [balance]) VALUES (1, N'alin28', N'alin28', N'Alin', N'Tintesan', N'12345678', 85300)
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([id], [color]) VALUES (1, N'Red')
INSERT [dbo].[Colors] ([id], [color]) VALUES (2, N'White')
INSERT [dbo].[Colors] ([id], [color]) VALUES (3, N'Black')
INSERT [dbo].[Colors] ([id], [color]) VALUES (4, N'Grey')
INSERT [dbo].[Colors] ([id], [color]) VALUES (5, N'Orange')
INSERT [dbo].[Colors] ([id], [color]) VALUES (6, N'Yellow')
INSERT [dbo].[Colors] ([id], [color]) VALUES (7, N'Green')
INSERT [dbo].[Colors] ([id], [color]) VALUES (8, N'Blue')
INSERT [dbo].[Colors] ([id], [color]) VALUES (9, N'Purple')
INSERT [dbo].[Colors] ([id], [color]) VALUES (10, N'Pink')
INSERT [dbo].[Colors] ([id], [color]) VALUES (11, N'Brown')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (1, N'John', N'Smith', N'Sales Representative')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (2, N'Jack', N'May', N'Sales Representative')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (3, N'Anne', N'Sosa', N'Sales Representative')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (4, N'Amber', N'Heard', N'Sales Representative')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (5, N'Jason', N'Nickerson', N'Mechanic')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (6, N'Wayne', N'Johnson', N'Mechanic')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (7, N'Kyle', N'Reese', N'Mechanic')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (8, N'Riley', N'Pitt', N'Rental Agent')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (9, N'Robert', N'Downey', N'Rental Agent')
INSERT [dbo].[Employees] ([id], [firstName], [lastName], [position]) VALUES (10, N'Sam', N'Jones', N'Rental Agent')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Engines] ON 

INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (2, N'Diesel', 90, N'1500')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (3, N'Diesel', 130, N'1900')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (4, N'Diesel', 175, N'2000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (5, N'Diesel', 240, N'2500')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (6, N'Diesel', 260, N'3000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (7, N'Diesel', 350, N'4000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (8, N'Diesel', 450, N'5000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (9, N'Gasoline', 80, N'1400')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (10, N'Gasoline', 115, N'1600')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (11, N'Gasoline', 140, N'1800')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (12, N'Gasoline', 190, N'2000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (13, N'Gasoline', 280, N'2500')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (14, N'Gasoline', 400, N'3000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (15, N'Gasoline', 550, N'3500')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (16, N'Gasoline', 600, N'4000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (17, N'Gasoline', 800, N'5000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (18, N'Gasoline', 950, N'7000')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (19, N'Electric', 600, N'n/a')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (20, N'Electric', 780, N'n/a')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (21, N'Hybrid', 150, N'1800')
INSERT [dbo].[Engines] ([id], [fuelType], [power], [capacity]) VALUES (22, N'Hybrid', 200, N'2200')
SET IDENTITY_INSERT [dbo].[Engines] OFF
SET IDENTITY_INSERT [dbo].[ModelEngines] ON 

INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (1, 1, 2)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (2, 1, 9)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (3, 2, 3)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (4, 2, 11)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (5, 3, 3)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (6, 3, 11)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (7, 4, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (8, 4, 13)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (9, 5, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (10, 5, 13)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (11, 6, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (12, 6, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (13, 7, 8)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (14, 7, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (15, 8, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (16, 9, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (17, 10, 16)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (18, 11, 19)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (19, 12, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (20, 12, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (21, 13, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (22, 13, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (23, 14, 3)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (25, 14, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (26, 14, 4)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (27, 14, 13)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (28, 16, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (29, 16, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (30, 17, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (31, 17, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (32, 18, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (33, 18, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (34, 19, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (35, 20, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (36, 21, 16)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (37, 22, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (38, 22, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (39, 23, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (40, 23, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (41, 24, 22)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (42, 25, 3)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (43, 25, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (44, 26, 4)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (45, 26, 13)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (46, 27, 5)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (47, 27, 13)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (48, 28, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (49, 28, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (50, 29, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (51, 29, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (52, 30, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (53, 30, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (54, 31, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (55, 32, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (56, 33, 16)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (57, 34, 3)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (58, 34, 11)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (59, 35, 3)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (60, 35, 11)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (61, 36, 4)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (62, 36, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (63, 37, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (64, 37, 13)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (65, 38, 5)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (66, 38, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (67, 39, 18)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (68, 40, 17)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (69, 41, 17)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (70, 42, 16)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (71, 43, 16)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (72, 44, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (73, 45, 4)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (74, 45, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (75, 46, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (76, 46, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (77, 47, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (78, 47, 16)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (79, 48, 2)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (80, 48, 9)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (81, 49, 16)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (82, 50, 4)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (83, 50, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (84, 51, 4)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (85, 51, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (86, 52, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (87, 52, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (88, 53, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (89, 53, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (90, 54, 6)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (91, 54, 14)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (92, 55, 7)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (93, 55, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (94, 56, 5)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (95, 56, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (96, 57, 16)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (97, 58, 3)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (98, 58, 10)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (99, 59, 3)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (100, 59, 10)
GO
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (101, 60, 5)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (102, 60, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (103, 61, 19)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (105, 62, 20)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (106, 63, 19)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (107, 64, 21)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (108, 65, 4)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (109, 65, 12)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (110, 66, 2)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (111, 66, 9)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (112, 67, 2)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (113, 67, 9)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (114, 68, 17)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (115, 70, 8)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (116, 70, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (117, 71, 8)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (118, 71, 15)
INSERT [dbo].[ModelEngines] ([id], [modelId], [engineId]) VALUES (119, 72, 16)
SET IDENTITY_INSERT [dbo].[ModelEngines] OFF
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (1, N'A3        ', 1, 30000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (2, N'A4        ', 1, 40000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (3, N'A5        ', 1, 50000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (4, N'A6        ', 1, 60000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (5, N'A7        ', 1, 70000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (6, N'A8        ', 1, 80000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (7, N'R8        ', 1, 120000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (8, N'S6        ', 1, 72000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (9, N'S7        ', 1, 80000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (10, N'S8        ', 1, 100000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (11, N'e-Tron    ', 1, 75000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (12, N'Q7        ', 1, 60000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (13, N'Q8        ', 1, 75000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (14, N'3 Series  ', 2, 40000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (16, N'5 Series  ', 2, 60000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (17, N'6 Series  ', 2, 85000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (18, N'7 Series  ', 2, 130000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (19, N'M3        ', 2, 80000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (20, N'M5        ', 2, 100000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (21, N'M6        ', 2, 120000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (22, N'X5        ', 2, 65000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (23, N'X6        ', 2, 80000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (24, N'i8        ', 2, 130000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (25, N'A Class   ', 3, 30000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (26, N'C Class   ', 3, 40000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (27, N'E Class   ', 3, 70000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (28, N'G Class   ', 3, 120000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (29, N'GLE Class ', 3, 70000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (30, N'S Class   ', 3, 150000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (31, N'C Class AMG', 3, 120000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (32, N'E Class AMG', 3, 140000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (33, N'S Class AMG', 3, 160000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (34, N'Golf', 4, 20000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (35, N'Jetta', 4, 20000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (36, N'Passat', 4, 30000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (37, N'Touareg', 4, 40000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (38, N'Tiguan', 4, 25000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (39, N'LaFerrari', 5, 1500000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (40, N'F12 Berlinetta', 5, 400000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (41, N'F50 GT', 5, 1500000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (42, N'FF', 5, 180000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (43, N'458 Italia', 5, 280000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (44, N'California T', 5, 200000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (45, N'Focus', 6, 18000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (46, N'Mustang', 6, 45000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (47, N'F150', 6, 40000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (48, N'Fiesta', 6, 14000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (49, N'GT', 6, 100000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (50, N'Accord', 7, 25000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (51, N'Civic', 7, 20000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (52, N'XF', 8, 50000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (53, N'XJ', 8, 75000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (54, N'Discovery', 9, 40000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (55, N'Range Rover', 9, 90000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (56, N'Qashqai', 10, 25000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (57, N'GT-R', 10, 100000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (58, N'Logan', 11, 7500)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (59, N'Sandero', 11, 7500)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (60, N'Duster', 11, 13000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (61, N'Model S', 12, 80000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (62, N'Model X', 12, 90000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (63, N'Model 3', 12, 35000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (64, N'Prius', 13, 20000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (65, N'Corolla', 13, 25000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (66, N'Ibiza', 14, 10000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (67, N'Leon', 14, 20000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (68, N'Carrera GT', 15, 900000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (69, N'918', 15, 1300000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (70, N'Panamera', 15, 90000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (71, N'Cayenne', 15, 75000)
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice]) VALUES (72, N'911', 15, 100000)
SET IDENTITY_INSERT [dbo].[Models] OFF
SET IDENTITY_INSERT [dbo].[Operations] ON 

INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (1, N'Oil change', 200)
INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (2, N'Tehnical Inspection', 150)
INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (3, N'Tire change', 200)
INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (4, N'A/C Freon change', 100)
INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (5, N'Engine repair', 500)
INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (6, N'Transmission repair', 500)
INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (7, N'Windshield repair', 250)
INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (8, N'Repaint', 400)
INSERT [dbo].[Operations] ([id], [operation], [cost]) VALUES (9, N'Brakes change', 300)
SET IDENTITY_INSERT [dbo].[Operations] OFF
SET IDENTITY_INSERT [dbo].[Options] ON 

INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (1, N'LED Headlights', 700, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (2, N'LED Taillights', 500, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (3, N'Head-up Display', 400, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (4, N'Touchscreen Navigation', 500, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (5, N'Keyless Entry', 500, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (6, N'Keyless Go', 500, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (7, N'Parking Sensors', 400, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (8, N'Parking Camera', 500, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (9, N'Parking Assist', 400, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (10, N'Self Parking', 500, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (11, N'Auto Pilot', 1000, N'Premium')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (12, N'Leather Interior', 2500, N'Premium')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (13, N'Safety Sistems', 5000, N'Premium')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (14, N'AWD', 10000, N'Luxury')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (15, N'Air Suspension', 10000, N'Luxury')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (16, N'Sport Seats', 2000, N'Premium')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (17, N'Heated Seats', 500, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (18, N'Cooled Seats', 750, N'Entry')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (19, N'Premium Sound System', 2500, N'Premium')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (20, N'Ceramic Brakes', 3000, N'Premium')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (21, N'Massaging Seats', 2500, N'Premium')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (22, N'Sport Exhaust', 2000, N'Premium')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (23, N'Carbon Fiber Parts', 10000, N'Luxury')
INSERT [dbo].[Options] ([id], [option], [price], [level]) VALUES (24, N'No Options', 0, N'basic')
SET IDENTITY_INSERT [dbo].[Options] OFF
ALTER TABLE [dbo].[CarsInventory]  WITH CHECK ADD  CONSTRAINT [FK_CarsInventory_Colors] FOREIGN KEY([colorId])
REFERENCES [dbo].[Colors] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarsInventory] CHECK CONSTRAINT [FK_CarsInventory_Colors]
GO
ALTER TABLE [dbo].[CarsInventory]  WITH CHECK ADD  CONSTRAINT [FK_CarsInventory_Engines] FOREIGN KEY([engineId])
REFERENCES [dbo].[Engines] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarsInventory] CHECK CONSTRAINT [FK_CarsInventory_Engines]
GO
ALTER TABLE [dbo].[CarsInventory]  WITH CHECK ADD  CONSTRAINT [FK_CarsInventory_Models] FOREIGN KEY([modelId])
REFERENCES [dbo].[Models] ([id])
GO
ALTER TABLE [dbo].[CarsInventory] CHECK CONSTRAINT [FK_CarsInventory_Models]
GO
ALTER TABLE [dbo].[Deals]  WITH NOCHECK ADD  CONSTRAINT [FK_Deals_CarsInventory] FOREIGN KEY([carId])
REFERENCES [dbo].[CarsInventory] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Deals] CHECK CONSTRAINT [FK_Deals_CarsInventory]
GO
ALTER TABLE [dbo].[ModelEngines]  WITH CHECK ADD  CONSTRAINT [FK_ModelEngines_Engines] FOREIGN KEY([engineId])
REFERENCES [dbo].[Engines] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModelEngines] CHECK CONSTRAINT [FK_ModelEngines_Engines]
GO
ALTER TABLE [dbo].[ModelEngines]  WITH CHECK ADD  CONSTRAINT [FK_ModelEngines_Models] FOREIGN KEY([modelId])
REFERENCES [dbo].[Models] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModelEngines] CHECK CONSTRAINT [FK_ModelEngines_Models]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Brands] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Brands]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_CarsInventory] FOREIGN KEY([carId])
REFERENCES [dbo].[CarsInventory] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_CarsInventory]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Clients] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Clients]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Employees]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Clients] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Clients]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Employees]
GO
ALTER TABLE [dbo].[ServiceInterventions]  WITH CHECK ADD  CONSTRAINT [FK_ServiceInterventions_Clients] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceInterventions] CHECK CONSTRAINT [FK_ServiceInterventions_Clients]
GO
ALTER TABLE [dbo].[ServiceInterventions]  WITH CHECK ADD  CONSTRAINT [FK_ServiceInterventions_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceInterventions] CHECK CONSTRAINT [FK_ServiceInterventions_Employees]
GO
ALTER TABLE [dbo].[ServiceInterventions]  WITH CHECK ADD  CONSTRAINT [FK_ServiceInterventions_Operations] FOREIGN KEY([operationId])
REFERENCES [dbo].[Operations] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceInterventions] CHECK CONSTRAINT [FK_ServiceInterventions_Operations]
GO
ALTER TABLE [dbo].[TestDrives]  WITH CHECK ADD  CONSTRAINT [FK_TestDrives_CarsInventory] FOREIGN KEY([carId])
REFERENCES [dbo].[CarsInventory] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TestDrives] CHECK CONSTRAINT [FK_TestDrives_CarsInventory]
GO
ALTER TABLE [dbo].[TestDrives]  WITH CHECK ADD  CONSTRAINT [FK_TestDrives_Clients] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TestDrives] CHECK CONSTRAINT [FK_TestDrives_Clients]
GO
ALTER TABLE [dbo].[TestDrives]  WITH CHECK ADD  CONSTRAINT [FK_TestDrives_Employees] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TestDrives] CHECK CONSTRAINT [FK_TestDrives_Employees]
GO
USE [master]
GO
ALTER DATABASE [CarDealerDB] SET  READ_WRITE 
GO
