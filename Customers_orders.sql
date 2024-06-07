SELECT ord.order_id, 
	   CONCAT(cus.first_name, ' ', cus.last_name) AS name, 
       cus.city, 
       cus.state, 
       ord.order_date
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id;
