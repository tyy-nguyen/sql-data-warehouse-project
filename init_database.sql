/*
==============================================================
Create Database and Schemas
==============================================================
Script Purpose: 
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
  within the database: 'bronze', 'silver', and 'gold'

WARNING:
  Running this script will drop the entire 'DataWarehouse' database if it already exists.
  All data in the database will be permanently deleted. Proceed with caution
  and ensure you have proper backups before running this script.
*/

USE master;
GO

-- For if the 'DataWarehouse' database exists
IF EXISTS (SELECT 1 from sys.database WHERE name = 'DataWarehouse')
BEGIN  
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse

GO
 --refresh the Databases folder
  
USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

