-- Q1: За поръчка 1 - кой колко дължи. Връща (name, amount).
SELECT s.name, SUM(oi.quantity * m.price) AS amount
FROM order_items oi
JOIN students s   ON s.id = oi.student_id
JOIN menu_items m ON m.id = oi.menu_item_id
WHERE oi.order_id = 1
GROUP BY s.name
ORDER BY s.name;

-- Q2: Общата сума на всяка поръчка, подредена по дата. Връща (order_date, place, total).
SELECT o.order_date, o.place, SUM(oi.quantity * m.price) AS total
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN menu_items m   ON m.id = oi.menu_item_id
GROUP BY o.id, o.order_date, o.place
ORDER BY o.order_date;