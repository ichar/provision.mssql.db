USE [master]
GO
/****** Object:  Database [ProvisionDB]    Script Date: 01.08.2019 17:34:13 ******/
CREATE DATABASE [ProvisionDB] ON  PRIMARY 
( NAME = N'ProvisionDB', FILENAME = N'Z:\MSSQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProvisionDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProvisionDB_log', FILENAME = N'Z:\MSSQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProvisionDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProvisionDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProvisionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProvisionDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProvisionDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProvisionDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProvisionDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProvisionDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProvisionDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProvisionDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProvisionDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProvisionDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProvisionDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProvisionDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProvisionDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProvisionDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProvisionDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProvisionDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProvisionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProvisionDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProvisionDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProvisionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProvisionDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProvisionDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProvisionDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProvisionDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProvisionDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProvisionDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProvisionDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProvisionDB] SET  READ_WRITE 
GO