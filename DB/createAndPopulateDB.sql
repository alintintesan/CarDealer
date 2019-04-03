USE [master]
GO
/****** Object:  Database [CarDealerDB]    Script Date: 4/3/2019 11:20:10 PM ******/
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
/****** Object:  Table [dbo].[Brands]    Script Date: 4/3/2019 11:20:10 PM ******/
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
/****** Object:  Table [dbo].[CarOptions]    Script Date: 4/3/2019 11:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carId] [int] NOT NULL,
	[optionId] [int] NOT NULL,
 CONSTRAINT [PK_CarOptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarsInventory]    Script Date: 4/3/2019 11:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarsInventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brandId] [int] NOT NULL,
	[modelId] [int] NOT NULL,
	[engineId] [int] NOT NULL,
	[colorId] [int] NOT NULL,
	[carTypeId] [int] NOT NULL,
	[buildDate] [date] NOT NULL,
	[mileage] [int] NOT NULL,
	[initialPrice] [float] NOT NULL,
	[finalPrice] [int] NOT NULL,
 CONSTRAINT [PK_CarsInventory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarTypes]    Script Date: 4/3/2019 11:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CarTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 4/3/2019 11:20:11 PM ******/
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
/****** Object:  Table [dbo].[Colors]    Script Date: 4/3/2019 11:20:11 PM ******/
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
/****** Object:  Table [dbo].[Deals]    Script Date: 4/3/2019 11:20:11 PM ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 4/3/2019 11:20:11 PM ******/
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
/****** Object:  Table [dbo].[Engines]    Script Date: 4/3/2019 11:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fuelType] [varchar](50) NOT NULL,
	[power] [int] NOT NULL,
	[torque] [int] NOT NULL,
	[capacity] [int] NOT NULL,
 CONSTRAINT [PK_Engines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 4/3/2019 11:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [varchar](50) NOT NULL,
	[brandId] [int] NOT NULL,
	[basePrice] [float] NOT NULL,
	[level] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 4/3/2019 11:20:11 PM ******/
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
/****** Object:  Table [dbo].[Options]    Script Date: 4/3/2019 11:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[option] [varchar](100) NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 4/3/2019 11:20:11 PM ******/
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
/****** Object:  Table [dbo].[Reports]    Script Date: 4/3/2019 11:20:11 PM ******/
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
	[details] [varchar](1000) NOT NULL,
	[typeOfTransaction] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceInterventions]    Script Date: 4/3/2019 11:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceInterventions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[operationId] [int] NOT NULL,
	[date] [date] NOT NULL,
	[cost] [float] NOT NULL,
 CONSTRAINT [PK_ServiceInterventions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestDrives]    Script Date: 4/3/2019 11:20:11 PM ******/
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
SET IDENTITY_INSERT [dbo].[CarTypes] ON 

INSERT [dbo].[CarTypes] ([id], [type]) VALUES (1, N'SUV')
INSERT [dbo].[CarTypes] ([id], [type]) VALUES (2, N'Sedan')
INSERT [dbo].[CarTypes] ([id], [type]) VALUES (3, N'Hatchback')
INSERT [dbo].[CarTypes] ([id], [type]) VALUES (4, N'Cabriolet')
INSERT [dbo].[CarTypes] ([id], [type]) VALUES (5, N'Wagon')
INSERT [dbo].[CarTypes] ([id], [type]) VALUES (6, N'Coupe')
SET IDENTITY_INSERT [dbo].[CarTypes] OFF
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
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (1, N'A3        ', 1, 30000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (2, N'A4        ', 1, 40000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (3, N'A5        ', 1, 50000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (4, N'A6        ', 1, 60000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (5, N'A7        ', 1, 70000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (6, N'A8        ', 1, 80000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (7, N'R8        ', 1, 120000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (8, N'S6        ', 1, 72000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (9, N'S7        ', 1, 80000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (10, N'S8        ', 1, 100000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (11, N'e-Tron    ', 1, 75000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (12, N'Q7        ', 1, 60000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (13, N'Q8        ', 1, 75000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (14, N'3 Series  ', 2, 40000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (16, N'5 Series  ', 2, 60000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (17, N'6 Series  ', 2, 85000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (18, N'7 Series  ', 2, 130000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (19, N'M3        ', 2, 80000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (20, N'M5        ', 2, 100000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (21, N'M6        ', 2, 120000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (22, N'X5        ', 2, 65000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (23, N'X6        ', 2, 80000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (24, N'i8        ', 2, 130000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (25, N'A Class   ', 3, 30000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (26, N'C Class   ', 3, 40000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (27, N'E Class   ', 3, 70000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (28, N'G Class   ', 3, 120000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (29, N'GLE Class ', 3, 70000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (30, N'S Class   ', 3, 150000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (31, N'C Class AMG', 3, 120000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (32, N'E Class AMG', 3, 140000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (33, N'S Class AMG', 3, 160000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (34, N'Golf', 4, 20000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (35, N'Jetta', 4, 20000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (36, N'Passat', 4, 30000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (37, N'Touareg', 4, 40000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (38, N'Tiguan', 4, 25000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (39, N'LaFerrari', 5, 1500000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (40, N'F12 Berlinetta', 5, 400000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (41, N'F50 GT', 5, 1500000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (42, N'FF', 5, 180000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (43, N'458 Italia', 5, 280000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (44, N'California T', 5, 200000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (45, N'Focus', 6, 18000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (46, N'Mustang', 6, 45000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (47, N'F150', 6, 40000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (48, N'Fiesta', 6, 14000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (49, N'GT', 6, 100000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (50, N'Accord', 7, 25000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (51, N'Civic', 7, 20000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (52, N'XF', 8, 50000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (53, N'XJ', 8, 75000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (54, N'Discovery', 9, 40000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (55, N'Range Rover', 9, 90000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (56, N'Qashqai', 10, 25000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (57, N'GT-R', 10, 100000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (58, N'Logan', 11, 7500, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (59, N'Sandero', 11, 7500, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (60, N'Duster', 11, 13000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (61, N'Model S', 12, 80000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (62, N'Model X', 12, 90000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (63, N'Model 3', 12, 35000, N'premium')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (64, N'Prius', 13, 20000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (65, N'Corolla', 13, 25000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (66, N'Ibiza', 14, 10000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (67, N'Leon', 14, 20000, N'entry')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (68, N'Carrera GT', 15, 900000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (69, N'918', 15, 1300000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (70, N'Panamera', 15, 90000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (71, N'Cayenne', 15, 75000, N'luxury')
INSERT [dbo].[Models] ([id], [model], [brandId], [basePrice], [level]) VALUES (72, N'911', 15, 100000, N'luxury')
SET IDENTITY_INSERT [dbo].[Models] OFF
SET IDENTITY_INSERT [dbo].[Options] ON 

INSERT [dbo].[Options] ([id], [option], [price]) VALUES (1, N'LED Headlights', 700)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (2, N'LED Taillights', 500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (3, N'Head-up Display', 400)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (4, N'Touchscreen Navigation', 500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (5, N'Keyless Entry', 500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (6, N'Keyless Go', 500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (7, N'Parking Sensors', 400)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (8, N'Parking Camera', 500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (9, N'Parking Assist', 400)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (10, N'Self Parking', 500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (11, N'Auto Pilot', 1000)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (12, N'Leather Interior', 2500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (13, N'Safety Sistems', 5000)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (14, N'AWD', 10000)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (15, N'Air Suspension', 10000)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (16, N'Sport Seats', 2000)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (17, N'Heated Seats', 500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (18, N'Cooled Seats', 750)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (19, N'Premium Sound System', 2500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (20, N'Ceramic Brakes', 3000)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (21, N'Massaging Seats', 2500)
INSERT [dbo].[Options] ([id], [option], [price]) VALUES (22, N'Sport Exhaust', 2000)
SET IDENTITY_INSERT [dbo].[Options] OFF
ALTER TABLE [dbo].[CarOptions]  WITH CHECK ADD  CONSTRAINT [FK_CarOptions_CarsInventory] FOREIGN KEY([carId])
REFERENCES [dbo].[CarsInventory] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarOptions] CHECK CONSTRAINT [FK_CarOptions_CarsInventory]
GO
ALTER TABLE [dbo].[CarOptions]  WITH CHECK ADD  CONSTRAINT [FK_CarOptions_Options] FOREIGN KEY([optionId])
REFERENCES [dbo].[Options] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarOptions] CHECK CONSTRAINT [FK_CarOptions_Options]
GO
ALTER TABLE [dbo].[CarsInventory]  WITH CHECK ADD  CONSTRAINT [FK_CarsInventory_Brands] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarsInventory] CHECK CONSTRAINT [FK_CarsInventory_Brands]
GO
ALTER TABLE [dbo].[CarsInventory]  WITH CHECK ADD  CONSTRAINT [FK_CarsInventory_CarTypes] FOREIGN KEY([carTypeId])
REFERENCES [dbo].[CarTypes] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarsInventory] CHECK CONSTRAINT [FK_CarsInventory_CarTypes]
GO
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
