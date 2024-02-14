/*markdown
# Question:

Using the 'sales_target', 'orders', and 'order_details' tables, write a SQL query to find the top 5 months where the sales team exceeded their target in any category in terms of percentage.
*/

SELECT * from sales_target LIMIT 10;

SELECT * from orders LIMIT 10;

SELECT * from order_details LIMIT 10;

SELECT
    *,
    EXTRACT(MONTH FROM TO_DATE("Month of Order Date", 'Mon-YY')) AS month,
    EXTRACT(YEAR FROM TO_DATE("Month of Order Date", 'Mon-YY')) AS year
FROM sales_target;

with targets as (
    SELECT
        *,
        EXTRACT(MONTH FROM TO_DATE("Month of Order Date", 'Mon-YY')) AS month,
        EXTRACT(YEAR FROM TO_DATE("Month of Order Date", 'Mon-YY')) AS year
    FROM sales_target
),

customer_sales as (
select
    o."Order ID",
    to_date("Order Date", 'DD-MM-YYYY'),
    "CustomerName",
    "Amount",
    "Category",
    EXTRACT(MONTH FROM TO_DATE("Order Date", 'DD-MM-YYYY')) AS month,
    EXTRACT(YEAR FROM TO_DATE("Order Date", 'DD-MM-YYYY')) AS year
from orders o
inner join order_details od on o."Order ID" = od."Order ID"

)

, total_sales as (
select 
    year,
    month,
    "Category",
    SUM("Amount") as total_sales
from customer_sales co
group by year, month, "Category"
)

select 
*,
ROUND(CAST((total_sales * 100) / "Target" - 100 as NUMERIC), 2) as perc_above_target
from total_sales cs
inner join targets t on cs.year = t.year and cs.month = t.month and cs."Category" = t."Category"
where total_sales > "Target"
order by ROUND(CAST((total_sales * 100) / "Target" as NUMERIC), 2) desc
limit 5