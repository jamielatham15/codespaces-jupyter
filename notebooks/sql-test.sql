/*markdown
# SQL Challenge 
Description:
- You have data about an e-commerce site
- The 'sales_target' table contains the monthly target for each product category
- The 'orders' table contains data about each order
- The 'order_details' table contains details about the order such as purchased items, amounts, and price.
Run the queries below to see a sample of each dataset
*/

SELECT * from sales_target LIMIT 10;

SELECT * from orders LIMIT 10;

SELECT * from order_details LIMIT 10;

/*markdown
### Write a query to find customers who have made consecutive purchases. 
### For each such customer, provide their name, the order dates of the consecutive purchases, and the number of days between these orders.
*/

/* EXPECTED OUTPUT
customer_name	order_date	next_order_date	days_between
Shikhar	        2019-01-04	2019-01-05	       1
Shreya	        2019-01-17	2019-01-18	       1
*/

WITH consecutive_orders AS (
    SELECT 
        o.customer_name,
        o.order_date::date AS order_date,
        LEAD(o.order_date::date) OVER (PARTITION BY o.customer_name ORDER BY o.order_date::date) AS next_order_date
    FROM 
        orders o
)
SELECT 
    customer_name,
    order_date,
    next_order_date,
     next_order_date - order_date AS days_between
FROM 
    consecutive_orders
WHERE 
    next_order_date IS NOT NULL
AND 
    next_order_date - order_date = 1
ORDER BY 
    customer_name, order_date;

/*markdown
### Step-by-Step Explanation

1. **WITH clause (`consecutive_orders`):**
   - **Partition by `customer_name`:** Groups orders by each customer.
   - **Order by `order_date`:** Orders the purchases of each customer by date.
   - **LEAD function:** Fetches the next order date for each customer.

2. **Main SELECT query:**
   - **Filter results:** Ensures there is a next order date and the days between consecutive orders is 1.
   - **ORDER BY:** Orders the final output by `customer_name` and `order_date`.

This solution effectively uses window functions and CTEs to identify customers who made purchases on consecutive days within the specified month.
*/

/*markdown

*/