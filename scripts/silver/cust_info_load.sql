-- Insert cleaned and deduplicated customer information into the silver layer
INSERT INTO silver.crm_cust_info (
    cst_id,                 -- Customer ID
    cst_key,                -- Customer business key
    cst_firstname,          -- Customer first name
    cst_lastname,           -- Customer last name
    cst_marital_status,     -- Customer marital status (standardized)
    cst_gender,             -- Customer gender (standardized)
    cst_create_date         -- Customer record creation date
)
SELECT 
    cst_id,
    cst_key,
    -- Trim whitespace from first name
    TRIM(cst_firstname) AS cst_first_name,
    -- Trim whitespace from last name
    TRIM(cst_lastname) AS cst_lastname,
    -- Standardize marital status codes to full descriptions
    CASE
        WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'   -- S = Single
        WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'  -- M = Married
        ELSE 'n/a'                                                   -- Handle unknown/null values
    END AS cst_marital_status,
    -- Standardize gender codes to full descriptions
    CASE
        WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'  -- F = Female
        WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'    -- M = Male
        ELSE 'n/a'                                       -- Handle unknown/null values
    END AS cst_gender,
    cst_create_date
FROM (
    -- Subquery to identify the most recent record for each customer
    SELECT *, 
    -- Assign row numbers partitioned by customer ID, ordered by creation date (newest first)
    ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
    FROM [bronze].[crm_cust_info]
    -- Exclude records with null customer IDs
    WHERE cst_id IS NOT NULL
) t
-- Filter to keep only the most recent record per customer (flag_last = 1)
WHERE flag_last = 1;
