
SELECT
      dim_products.category,
      SUM(CAST(REGEXP_REPLACE(dim_products.product_price, '[^0-9.]', '', 'g') AS NUMERIC) * orders_powerbi."Product Quantity") AS total_revenue
FROM 
    dim_products
INNER JOIN 
    orders_powerbi ON dim_products.product_code = orders_powerbi.product_code
INNER JOIN
    dim_stores ON orders_powerbi."Store Code" = dim_stores."store code"
WHERE 
    orders_powerbi."Order Date" LIKE '2021%'
    AND
    dim_stores.country_code = 'GB'
    AND
    dim_stores.country_region = 'Wiltshire'
GROUP BY 
    dim_products.category
ORDER BY 
    total_revenue DESC;