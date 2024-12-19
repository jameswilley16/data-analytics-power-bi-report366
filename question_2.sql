SELECT 
    EXTRACT(MONTH FROM CAST(orders_powerbi."Order Date" AS DATE)) AS month,
    SUM(CAST(REGEXP_REPLACE(dim_products.product_price, '[^0-9.]', '', 'g') AS NUMERIC) * orders_powerbi."Product Quantity") AS total_revenue
FROM 
    dim_products
INNER JOIN 
    orders_powerbi ON dim_products.product_code = orders_powerbi.product_code
WHERE 
    orders_powerbi."Order Date" LIKE '2022%'
GROUP BY 
    EXTRACT(MONTH FROM CAST(orders_powerbi."Order Date" AS DATE))
ORDER BY 
    total_revenue DESC;


