/*
===============================================================
Create Database & Schemas
===============================================================

This script creates a new database named "DataWarehouse" and three schemas within it: "bronze", "silver", and "gold".

Warning: Running this script will drop the existing "DataWarehouse" database if it exists, which will result in the loss of all data and objects within that database. Make sure to back up any important data before executing this script.
*/

USE master;
GO

--Drop & recreate the database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')	
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--Create the Database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

--Create the Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
