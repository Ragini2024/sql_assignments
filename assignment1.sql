use database new_sample;

CREATE or replace table RG_SALES

(    
     order_id VARCHAR not null PRIMARY KEY,
     order_date date,
     ship_date date,
     ship_mode VARCHAR2(100),
     customer_name VARCHAR2(100),
     segment string,
     state string,
     country string,
     market string,
     region string,
     product_id VARCHAR(100),
     category string,
     sub_category string,
     product_name string,
     quantity int,
     discount int,
     profit int,
     shipping_cost  int,
     order_priority VARCHAR(40),
     year int
     
);


select * from RG_SALES;
---Task1- Primary Key already set while creating original table-----
---Task 2-----------
Desc table RG_SALES;
--------------------------------------------------------------------
select distinct DISCOUNT from RG_SALES; 
---4----
select*,
        case
            when DISCOUNT = 0 THEN 'NO'
            else 'YES'
        end as got_discount
from RG_SALES
---Taks 6----
create or replace table RG_SALES as
select*,
datediff(day, ORDER_DATE, SHIP_DATE) diff_days
from RG_SALES;

-----Task 7---------
#if Processing_days <= 3 days mark 5 rating
#if Processing_days >= 3 and <=6 days mark 4 rating
#if Processing_days >=6 and <=10 days mark 3 rating
#if Processing_days >10  mark 2 rating

Alter table RG_SALES
add column Processing_days_ratings INTEGER;

update RG_SALES
set Processing_day_ratings = (
case
    when diff_days <= 3 then '5'
    when diff_days <= 6 and diff_days >3 then '4'
    when diff_days <= 10 and diff_days > 6 then '3'
    when diff_days > 10 then '2'
    else 'none'
    END);

select * from RG_SALES;


