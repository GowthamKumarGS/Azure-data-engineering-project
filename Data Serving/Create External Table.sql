CREATE DATABASE SCOPED CREDENTIAL cred_gk
WITH    
    IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH 
( 
    LOCATION = 'https://datalakeadventure.blob.core.windows.net/silver', 
    CREDENTIAL = cred_gk
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH 
( 
    LOCATION = 'https://datalakeadventure.blob.core.windows.net/gold', 
    CREDENTIAL = cred_gk
)

CREATE EXTERNAL FILE FORMAT format_parquet 
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)


----------------------------------
-- CREATE EXTERNAL TABLE EXTSALES
----------------------------------

CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.sales

------------------------------------
-- CREATE EXTERNAL TABLE EXTCALENDER
------------------------------------

CREATE EXTERNAL TABLE gold.extcalender
WITH
(
    LOCATION = 'extcalender',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.calender;

--------------------------------------
-- CREATE EXTERNAL TABLE EXTCUSTOMERS
--------------------------------------

CREATE EXTERNAL TABLE gold.extcustomers
WITH
(
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customers;

-------------------------------------
-- CREATE EXTERNAL TABLE EXTPRODUCTS
-------------------------------------

CREATE EXTERNAL TABLE gold.extproducts
WITH
(
    LOCATION = 'extproducts',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.products;

------------------------------------
-- CREATE EXTERNAL TABLE EXTRETURNS
------------------------------------

CREATE EXTERNAL TABLE gold.extreturns
WITH
(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.returns;

-----------------------------------------
-- CREATE EXTERNAL TABLE EXTSUBCATEGORIES
-----------------------------------------

CREATE EXTERNAL TABLE gold.extsubcategories
WITH
(
    LOCATION = 'extsubcategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.subcategories;

----------------------------------------
-- CREATE EXTERNAL TABLE EXT TERRITORIES
----------------------------------------

CREATE EXTERNAL TABLE gold.extterritories
WITH
(
    LOCATION = 'extterritories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.territories;








