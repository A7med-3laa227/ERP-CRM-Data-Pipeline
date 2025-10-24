IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

CREATE VIEW gold.dim_products AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY cpi.prd_start_dt,cpi.prd_id) AS product_key, -- Surrogate key
	cpi.prd_id AS product_id,
	cpi.prd_key AS product_number,
	cpi.prd_nm AS product_name,
	cpi.prd_line AS product_line,
	cpi.cat_id AS category_id,
	epcg.cat AS category,
	epcg.subcat AS subcategory,
	cpi.prd_cost AS cost,
	cpi.prd_start_dt AS product_start_date,
	epcg.maintenance

FROM silver.crm_prd_info cpi
LEFT JOIN silver.erp_px_cat_g1v2 epcg
ON cpi.cat_id = epcg.id
WHERE prd_end_dt IS NULL;  -- Filter out all historical data