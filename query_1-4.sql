
-- //basics
 -- Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;
 -- Calculate the total revenue generated from pizza sales.
 SELECT 
    round(SUM(order_details.quantity * pizzas.price) ,0)AS total_revenue
FROM
   
    order_details
        JOIN
    pizzas ON  order_details.pizza_id= pizzas.pizza_id;
    -- Identify the highest-priced pizza.
    select max(pizzas.price) from pizzas;
    SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;
   -- Identify the most common pizza size ordered.
   SELECT 
  pizzas.size , count(order_details.order_details_id) as order_count 
FROM
    pizzas
        JOIN
  order_details ON pizzas.pizza_id =order_details.pizza_id group by  pizzas.size
ORDER BY order_count  DESC limit 1
;

-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name,sum(order_details.quantity) as quantity from pizza_types join pizzas
 on pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id
 group by pizza_types.name
 order by quantity desc limit 5;


SELECT pizza_types.name, COUNT(order_details.quantity) AS quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY COUNT(order_details.quantity)
LIMIT 5;

   