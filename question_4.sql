CREATE VIEW sales_summary AS
SELECT
    dim_stores.store_type,
    COUNT(orders_powerbi."User ID") AS total_orders,
    SUM(CAST(REGEXP_REPLACE(dim_products.product_price, '[^0-9.]', '', 'g') AS NUMERIC) * orders_powerbi."Product Quantity") AS total_sales,
    (
        SUM(CAST(REGEXP_REPLACE(dim_products.product_price, '[^0-9.]', '', 'g') AS NUMERIC) * orders_powerbi."Product Quantity") /
        (SELECT SUM(CAST(REGEXP_REPLACE(dim_products.product_price, '[^0-9.]', '', 'g') AS NUMERIC) * orders_powerbi."Product Quantity")
         FROM orders_powerbi
         JOIN dim_products ON dim_products.product_code = orders_powerbi.product_code) 
    ) * 100 AS "Percentage_of_Sales"
FROM 
    dim_stores
INNER JOIN 
    orders_powerbi ON dim_stores."store code" = orders_powerbi."Store Code"
INNER JOIN 
    dim_products ON dim_products.product_code = orders_powerbi.product_code
GROUP BY 
    dim_stores.store_type;
