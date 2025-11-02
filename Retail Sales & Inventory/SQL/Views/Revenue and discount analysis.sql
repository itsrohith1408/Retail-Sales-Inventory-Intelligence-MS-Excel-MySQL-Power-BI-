-- Revenue and discount analysis 

SELECT 
    c.category_name,
    ROUND(SUM(oi.final_price), 2) AS total_revenue,
    ROUND(SUM(oi.discount_Amount), 2) AS total_discount
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;
