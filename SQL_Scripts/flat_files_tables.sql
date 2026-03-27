USE financial_data_warehouse
--Create tables to store flat files

CREATE TABLE [dbo].[exchange_rate]
(
to_currency VARCHAR(10),
exchange_rate FLOAT,	
effective_date DATE
)