USE [master]
GO
/****** Object:  Database [CarDealerDB]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[Brands]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[CarOptions]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[CarsInventory]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[CarTypes]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[Clients]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[Colors]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[Deals]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 4/3/2019 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[position] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engines]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[Models]    Script Date: 4/3/2019 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nchar](10) NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[Options]    Script Date: 4/3/2019 3:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[option] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[Reports]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[ServiceInterventions]    Script Date: 4/3/2019 3:16:16 PM ******/
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
/****** Object:  Table [dbo].[TestDrives]    Script Date: 4/3/2019 3:16:16 PM ******/
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
ON UPDATE CASCADE
ON DELETE CASCADE
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
