/*markdown
# SQL Challenge 

Description:

- You have data about an e-commerce site
- The 'sales_target' table contains the monthly target for each product category
- The 'orders' table contains records of each order
- The 'order_details' table contains details about the order such as purchased items, amounts, and price.

Run the queries below to see a sample of each dataset
*/

SELECT * from sales_target LIMIT 10;

SELECT * from orders LIMIT 10;

SELECT * from order_details LIMIT 10;

/*markdown
## Question 1

#### Using the 'sales_target', 'orders', and 'order_details' tables, write a SQL query to find the top 5 months where the sales team exceeded their target in any category in terms of percentage.
*/

with sales_by_category as (
    select
        category,
        month,
        year,
        sum(amount * quantity) as total_sales
    from orders o
    inner join order_details od on o.order_id = od.order_id
    group by year, month, category
)

select
    cs.year,
    cs.month, 
    total_sales,
    target,
    ROUND(CAST((total_sales * 100) / target - 100 as NUMERIC), 2) as perc_above_target
from sales_by_category cs
inner join sales_target st on cs.year = st.year and cs.month = st.month
where total_sales > target
order by ROUND(CAST((total_sales * 100) / target as NUMERIC), 2) desc
limit 5

/*markdown

*/