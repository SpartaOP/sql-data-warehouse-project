/*
	This script performs data quality checks on the gold layer of the data warehouse.
*/

-- ===========================
-- Checking gold.fact_sales
-- ===========================
-- Check data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c ON f.customer_key = c.customer_key
LEFT JOIN gold.dim_products p ON f.product_key = p.product_key
WHERE c.customer_key IS NULL OR p.product_key IS NULL;

-- ===========================
-- Checking gold.dim_customers
-- ===========================
-- Check for duplicates of primary key
SELECT customer_key, COUNT(*) FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*)>1;

-- ===========================
-- Checking gold.dim_products
-- ===========================
-- Check for duplicates of primary key
SELECT product_key, COUNT(*) FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*)>1;
