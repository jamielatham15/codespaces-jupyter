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


with yearmonth_sales as (select  o.year,o.month,od.category,sum (od.amount*quantity) as Total_sum from orders o join order_details od on o.order_id=od.order_id
group by o.year,o.month,od.category,)
sales_diff as(

select year,month,category,(total_sum-target) as diff from sales_target st
join yearmonth_sales ys
on ys.year=st.year
and ys.month=st.month
and ys.Total_sum>st)

select *,dense_rank

.taret







