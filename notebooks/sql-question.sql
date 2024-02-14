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
#### Using the 'sales_target', 'orders', and 'order_details' tables, write a SQL query to find the top 5 months where the sales team exceeded their target in any category and show the percentage above target.
*/