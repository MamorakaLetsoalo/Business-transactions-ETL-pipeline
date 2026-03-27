# Business-transactions-ETL-pipeline (SQL Server + SSIS)

Project Overview

This project implements an end-to-end ETL pipeline to consolidate financial transaction data, currency exchange rates, and supplier information into a centralized Transactions Warehouse.

The business requirement was to:

Convert transaction amounts from local currency to USD
Enrich transactions with supplier contact information
Store the final dataset in a structured SQL Server data warehouse

 # Architecture
Source Systems
SQL Server
Financial Transactions (fact data)
CSV Files
Exchange Rates
Supplier Information
Target
SQL Server → transactions_warehouse
 
# ETL Process
1. Control Flow

The pipeline follows this sequence:

Truncate staging tables:
exchange_rates
supplier_info
financial_transactions
Load CSV data into staging:
Exchange Rates
Supplier Info
Execute Data Flow Task

<img width="435" height="425" alt="image" src="https://github.com/user-attachments/assets/2286d2fe-e443-4651-bc40-a815eddd9544" />

2. Data Flow
Step 1: Source
Load financial transactions from SQL Server
Step 2: Exchange Rate Lookup
Join transactions with exchange rates using:
from_currency
to_currency

Outputs:

✅ Match → continues processing
⚠️ No Match → handled separately
Step 3: Handle Missing Exchange Rates
Derived Column:
Assign default or flag missing exchange rate
Step 4: Union All
Combine matched and unmatched records
Step 5: Currency Conversion
Derived Column:
Amount_USD = Amount * Exchange_Rate
Step 6: Supplier Lookup
Join with supplier dataset using:
supplier_id
Step 7: Load to Destination
Final dataset loaded into:
transactions_warehouse.fact_transactions

<img width="495" height="655" alt="image" src="https://github.com/user-attachments/assets/ec12eaee-2b08-4603-b11a-5a344b90b9c0" />

# Data Model
Exchange Rates
Column	Description
from_currency	Source currency
to_currency	Target currency
exchange_rate	Conversion rate
effective_date	Rate validity
Supplier Info
Column	Description
supplier_id	Unique identifier
supplier_name	Supplier name
contact_name	Contact person
phone	Contact number
Transactions (Final Output)
Column	Description
transaction_id	Unique transaction
supplier_id	Supplier reference
amount	Original amount
amount_usd	Converted amount
supplier_name	Enriched field
contact_name	Enriched field
phone	Enriched field

# Tools & Technologies
SQL Server
SSIS (SQL Server Integration Services)
CSV Flat Files
Data Flow Components:
Derived Column
Lookup Transformation
Union All
Multicast
Conditional Split
 
# Key Challenges & Solutions
Missing Exchange Rates
Problem: Some currencies had no matching rates
Solution: Routed via "No Match Output" and handled using derived columns
Data Integration
Combined structured (SQL) + semi-structured (CSV) data seamlessly

#Business Value
Standardized financial reporting in USD
Single source of truth for transactions + supplier data
Improved data quality and traceability
