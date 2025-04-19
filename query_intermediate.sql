-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category,sum(order_details.quantity) as total_quantity from pizza_types
join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details
 on pizzas.pizza_id=order_details.pizza_id group by pizza_types.category order by total_quantity desc ;



-- Determine the distribution of orders by hour of the day.
select hour(order_time),count(order_id) as hour_sale from orders 
group by hour(order_time) order by hour_sale desc ;

-- Join relevant tables to find the category-wise distribution of pizzas.
select category,count(name) as total_distribution from pizza_types group by category;
-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
   round( AVG(quantity),0)
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) as order_quantity;
-- Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name,sum(order_details.quantity*pizzas.price)as revenue from pizza_types join pizzas 
on pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on pizzas.pizza_id=order_details.pizza_id 
group by pizza_types.name order by revenue desc limit 3;



