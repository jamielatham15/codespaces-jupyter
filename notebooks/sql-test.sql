/*markdown
# SQL Challenge 
Description:
- You have data about an e-commerce site
- The 'order_details' table contains details about the order such as purchased items, amounts, and price.
Run the queries below to see a sample of each dataset
*/

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

SELECT * from order_details LIMIT 10;

WITH T AS (
    SELECT 
    A.order_id, 
    -- A.category AS category_1, 
    A.sub_category AS sub_category_1, 
    -- B.category AS category_2, 
    B.sub_category AS sub_category_2
    FROM 
    order_details A
    JOIN
    order_details B
    ON A.order_id = B.order_id
)

SELECT 
sub_category_1,
sub_category_2,
COUNT(*) AS pair_count
FROM T
WHERE sub_category_1 != sub_category_2
GROUP BY sub_category_1, sub_category_2
ORDER BY pair_count DESC




/* code here */



/* code here */

