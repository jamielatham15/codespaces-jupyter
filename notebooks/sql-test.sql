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
## Identifying Frequently Purchased Sub-Category Pairs
*/

/*markdown
##### Write a query to find pairs of sub-categories that are frequently bought together in the same order. For each pair, provide the sub-categories and the number of times they were purchased together. Ensure the pairs are unique (i.e., "A-B" is considered the same as "B-A").
*/

/* Expected Result
sub_category_1	sub_category_2	pair_count
Hankerchief	     Stole	        242
Hankerchief	     Saree	        220
Saree	         Stole	        218
Phones	         Saree	        106
Electronic Games Hankerchief	96
Saree	         Skirt	        96
Printers	     Saree	        94
Hankerchief	     Skirt	        92
Saree	         T-shirt	    90
Electronic Games Saree	        88
*/

/* code here */



/* code here */



/* code here */



/* code here */

