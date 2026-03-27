CREATE DATABASE financial_data_warehouse;

--Create financial trans table
CREATE TABLE financial_transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    supplier_name VARCHAR(50),
    transaction_date DATE,
    amount DECIMAL(10, 2),
    currency VARCHAR(10)
);

-- create additional data source
SELECT 
    t.*, 
    c.customer_name,
    c.email AS customer_email,
    c.phone AS customer_phone
FROM dbo.financial_transactions t
INNER JOIN dbo.customer_details c 
    ON t.customer_id = c.customer_id;
