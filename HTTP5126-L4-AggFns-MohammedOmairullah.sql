-- LAB 4 AGGREGATE FUNCTIONS
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

--  1 
-- A
SELECT MIN(price) FROM stock_item;

-- B
SELECT MAX(inventory) FROM stock_item;

-- C
SELECT AVG(price) FROM stock_item;

-- D
SELECT SUM(inventory) FROM stock_item;


--  2
-- A
SELECT role, COUNT(employee_id) AS employee_count
FROM employee
GROUP BY role;

-- B
SELECT category AS Mammals , COUNT(stock_item_id)
FROM stock_item 
WHERE category!="Piscine"
GROUP BY category;

-- C
SELECT category, AVG(price)
FROM stock_item
WHERE inventory > 0
GROUP BY category;


--  3
-- A
SELECT category AS "Species", 
SUM(inventory) AS "In Stock"
FROM stock_item
GROUP BY category
ORDER BY inventory DESC;

-- B
SELECT category, 
SUM(inventory) ,
AVG(price) 
FROM stock_item
GROUP BY category
HAVING  AVG(price) < 100 AND SUM(inventory)<100;


--  4
-- A 
SELECT item AS "Product" , CONCAT("$",price) AS "Price", inventory AS "Stock Remaining" , category
AS "Species" , SUM(inventory),SUM(inventory)*price AS "Potential Earnings" FROM stock_item
GROUP BY stock_item_id
ORDER BY SUM(inventory)*price DESC;