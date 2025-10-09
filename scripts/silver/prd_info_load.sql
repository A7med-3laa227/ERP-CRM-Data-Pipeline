-- Insert cleaned and transformed product information into the silver layer
INSERT INTO silver.crm_prd_info(
    prd_id,           -- Product ID
    prd_key,          -- Product business key
    cat_id,           -- Category ID (extracted from product key)
    prd_nm,           -- Product name
    prd_cost,         -- Product cost
    prd_line,         -- Product line (standardized)
    prd_start_dt,     -- Product start date
    prd_end_dt        -- Product end date
)
SELECT 
    prd_id,
    -- Extract product key portion (starting at position 7)
    SUBSTRING(prd_key, 7, LEN(prd_key)) AS prd_key,
    -- Extract category ID from first 5 characters of product key and replace hyphens with underscores
    REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') AS cat_id,
    prd_nm,
    -- Replace null costs with 0
    ISNULL(prd_cost, 0) AS prd_cost,
    -- Standardize product line codes to full descriptions
    CASE UPPER(TRIM(prd_line))
        WHEN 'R' THEN 'Road'           -- R = Road bikes
        WHEN 'M' THEN 'Mountain'       -- M = Mountain bikes
        WHEN 'S' THEN 'Other Sales'    -- S = Other Sales
        WHEN 'T' THEN 'Touring'        -- T = Touring bikes
        ELSE 'n/a'                     -- Handle unknown/null values
    END AS prd_line,
    prd_start_dt,
    CAST(DATEADD(DAY, -1, LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)) AS DATE) AS prd_end_dt   -- Calculate end date as the start date of the next product version minus 1 day (SCD Type 2 pattern)
FROM bronze.crm_prd_info;


SELECT * FROM silver.crm_prd_info