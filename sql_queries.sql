create database food_delivery;
use food_delivery;

SELECT * FROM orders LIMIT 10;

select count(*) as total_orders from orders;

select avg(delivery_time_min) as avg_delivery_time from orders;

select count(case when delay_flag='late' then 1 end)*100.0/count(*) as late_percentage from orders;

select count(case when cancellation_flag='yes' then 1 end)*100.0/count(*) as cancellation_rate from orders;

select traffic_level, avg(delivery_time_min) as avg_time from orders group by traffic_level order by avg_time desc;

select weather,count(case when delay_flag='late' then 1 end) as late_orders from orders group by weather order by late_orders desc;

select cancellation_reason,count(*) as total from orders where cancellation_flag='yes' group by cancellation_reason order by total desc;

select customer_zone,avg(delivery_time_min) as avg_time from orders group by customer_zone order by avg_time desc;

select sum(refund_amount) as total_loss from orders where cancellation_flag='yes';

select customer_zone,avg(delivery_time_min) as avg_time,rank() over (order by avg(delivery_time_min) desc) as rank_position from orders group by customer_zone;