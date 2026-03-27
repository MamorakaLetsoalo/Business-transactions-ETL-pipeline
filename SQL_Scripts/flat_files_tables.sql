USE financial_data_warehouse
--Create tables to store flat files

CREATE TABLE [dbo].[exchange_rate]
(
to_currency VARCHAR(10),
exchange_rate FLOAT,	
effective_date DATE
)

CREATE TABLE [dbo].[supplier_info]
(
supplier_id int,
supplier_name varchar(100),
contact_name varchar(100),
phone varchar(10)
)

select * from dbo.financial_transactions
select * from dbo.exchange_rate
select * from dbo.supplier_info

--Alter table to add additinal information

alter table dbo.financial_transactions
add amoun_USD float

alter table dbo.financial_transactions
add supplier_contact_name varchar(100),
Supplier_phone varchar(25)