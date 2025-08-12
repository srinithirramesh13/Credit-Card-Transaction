use credit_card;
-- Create SQL Tables
create table CreditCardTransaction(
transaction_id INT primary KEY,
city varchar (100),
transaction_date Date,
card_type varchar(50),
exp_type varchar(50),
gender varchar(1),
amount decimal(10,2)
);

-- Key SQL Queries for Analysis
SELECT city, SUM(amount) AS total_spent
FROM credit_card_transcations
GROUP BY city
ORDER BY total_spent DESC;

-- Monthly Spend Trend
SELECT 
  DATE_FORMAT(transaction_date, '%Y-%m') AS month,
  SUM(amount) AS total_amount
FROM credit_card_transcations
WHERE transaction_date IS NOT NULL
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY month;


-- Expense Type Distribution
SELECT 
  exp_type, 
  COUNT(*) AS txn_count, 
  SUM(amount) AS total_spend
FROM credit_card_transcations
GROUP BY exp_type
ORDER BY total_spend DESC;

-- Gender-wise Spending
select
  gender, 
  COUNT(*) AS txn_count, 
  SUM(amount) AS total_spend,
  avg(amount) AS avg_spend_per_txn
from credit_card_transcations
group by gender;


-- Card Type Performance
SELECT 
  card_type, 
  COUNT(*) AS txn_count, 
  AVG(amount) AS avg_spend
FROM credit_card_transcations
GROUP BY card_type;