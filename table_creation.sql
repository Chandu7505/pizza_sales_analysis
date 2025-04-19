
create database if not exists pizzahut;

use pizzahut;
create table if not exists orders(order_id int not null ,
order_date int not null,
order_time int not null,
primary key(order_id));

drop  table order_details;
create table order_details(
order_details_id int not null primary key,
order_id int not null ,
pizza_id text not null,
quantity int not null);