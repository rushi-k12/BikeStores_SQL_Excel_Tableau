SELECT ord.order_id, 
       CONCAT(cus.first_name, ' ', cus.last_name) AS name, 
       cus.city, 
       cus.state, 
       ord.order_date, 
       SUM(ite.quantity) AS total_units, 
       SUM(ite.quantity * ite.list_price) AS revenue,
	   pro.product_name,
	   cat.category_name,
	   sal.store_name,
	   concat(sta.first_name, ' ', sta.last_name) as 'sales_rep'
FROM sales.orders ord
JOIN sales.customers cus ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite ON ord.order_id = ite.order_id
JOIN production.products pro ON ite.product_id = pro.product_id
JOIN production.categories cat ON pro.category_id = cat.category_id
JOIN sales.stores sal ON ord.store_id = sal.store_id
JOIN sales.staffs sta ON ord.staff_id = sta.staff_id
GROUP BY ord.order_id, cus.first_name, cus.last_name, cus.city, cus.state, ord.order_date,pro.product_name,cat.category_name,sal.store_name,sta.first_name,sta.last_name
