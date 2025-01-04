-- table creation
create table customer (
   customer_id  int primary key,
   first_name   varchar(255),
   last_name    varchar(255),
   phone_number number(12),
   country      varchar(255)
)

create table orders (
   order_id        int primary key,
   customer_id     int,
   order_date      date,
   order_status_id int,
   quantity        int,
   amount          float,
   foreign key ( customer_id )
      references customer ( customer_id )
)
-- adding order_status_id as FOREIGN key CONSTRAINT
alter table orders
   add constraint fk_order_status_id foreign key ( order_status_id )
      references order_status ( order_status_id )

create table order_status (
   order_status_id int primary key,
   order_status    varchar(255)
)

create table product_category (
   product_category_id int primary key,
   category_name       varchar(255)
)

create table product (
   product_id          int primary key,
   product_name        varchar(255),
   product_description varchar(255),
   price               float,
   product_category_id int,
   foreign key ( product_category_id )
      references product_category ( product_category_id )
)

create table order_product (
   order_id       int primary key,
   product_id     int,
   product_ord_id int,
   foreign key ( order_id )
      references orders ( order_id ),
   foreign key ( product_id )
      references product ( product_id )
)
-- removing order_id as PRIMARY key and adding product_ord_id
alter table order_product drop primary key add primary key ( product_ord_id )


create table payment (
   payment_id        int primary key,
   order_id          int,
   payment_status    varchar(255),
   amount_paid       float,
   payment_status_id int,
   foreign key ( order_id )
      references orders ( order_id )
)
alter table payment
   add constraint fk_payment_status_id foreign key ( payment_status_id )
      references payment_status ( payment_status_id )

create table payment_status (
   payment_status_id int primary key,
   payment_status    varchar(255)
)


-- Insert operation 
insert into product_category (
   product_category_id,
   category_name
) values ( 1,
           'Electronics' );
insert into product_category (
   product_category_id,
   category_name
) values ( 2,
           'Fashion' );
insert into product_category (
   product_category_id,
   category_name
) values ( 3,
           'Home and Kitchen' );
insert into product_category (
   product_category_id,
   category_name
) values ( 4,
           'Beauty and Personal' );


insert into product (
   product_id,
   product_name,
   product_description,
   price,
   product_category_id
) values ( 1,
           'Apple iPhone',
           'Latest model of Apple iPhone',
           999.99,
           1 );
insert into product (
   product_id,
   product_name,
   product_description,
   price,
   product_category_id
) values ( 2,
           'Nike',
           'Latest model of Nike',
           1999.99,
           2 );
insert into product (
   product_id,
   product_name,
   product_description,
   price,
   product_category_id
) values ( 3,
           'Pan',
           'Non- sticky pan latest model',
           699.99,
           3 );
insert into product (
   product_id,
   product_name,
   product_description,
   price,
   product_category_id
) values ( 4,
           'Lakme',
           'Best quality of Lakme',
           499.99,
           4 );

insert into customer (
   customer_id,
   first_name,
   last_name,
   phone_number,
   country
) values ( 1,
           'John',
           'Doe',
           '9817452398',
           'USA' );
insert into customer (
   customer_id,
   first_name,
   last_name,
   phone_number,
   country
) values ( 2,
           'Jane',
           'Doe',
           '9817452399',
           'UK' );
insert into customer (
   customer_id,
   first_name,
   last_name,
   phone_number,
   country
) values ( 3,
           'Rahul',
           'Sharma',
           '9817452400',
           'NEPAL' );
insert into customer (
   customer_id,
   first_name,
   last_name,
   phone_number,
   country
) values ( 4,
           'Rahul',
           'Sharma',
           '9817452401',
           'INDIA' );
insert into customer (
   customer_id,
   first_name,
   last_name,
   phone_number,
   country
) values ( 5,
           'Rahul',
           'Sharma',
           '9817452402',
           'CHINA' );


insert into order_status (
   order_status_id,
   order_status
) values ( 1,
           'pending' );
insert into order_status (
   order_status_id,
   order_status
) values ( 2,
           'shipped' );
insert into order_status (
   order_status_id,
   order_status
) values ( 3,
           'delivered' );
insert into order_status (
   order_status_id,
   order_status
) values ( 4,
           'cancelled' );
insert into order_status (
   order_status_id,
   order_status
) values ( 5,
           'refunded' );
insert into order_status (
   order_status_id,
   order_status
) values ( 6,
           'returned' );


insert into payment_status (
   payment_status_id,
   payment_status
) values ( 1,
           'paid' );
insert into payment_status (
   payment_status_id,
   payment_status
) values ( 2,
           'pending' );
insert into payment_status (
   payment_status_id,
   payment_status
) values ( 3,
           'unpaid' );

insert into orders (
   order_id,
   customer_id,
   order_date,
   amount,
   order_status_id,
   quantity
) values ( 1,
           1,
           '15-03-22',
           999.99,
           1,
           5 );
insert into orders (
   order_id,
   customer_id,
   order_date,
   amount,
   order_status_id,
   quantity
) values ( 2,
           2,
           '15-03-21',
           1999.99,
           6,
           20 );
insert into orders (
   order_id,
   customer_id,
   order_date,
   amount,
   order_status_id,
   quantity
) values ( 3,
           3,
           '15-03-20',
           699.99,
           2,
           10 );

insert into order_product (
   product_ord_id,
   order_id,
   product_id
) values ( 1,
           1,
           1 );
insert into order_product (
   product_ord_id,
   order_id,
   product_id
) values ( 2,
           1,
           2 );
insert into order_product (
   product_ord_id,
   order_id,
   product_id
) values ( 3,
           1,
           3 );
insert into order_product (
   product_ord_id,
   order_id,
   product_id
) values ( 4,
           2,
           4 );

insert into payment (
   payment_id,
   order_id,
   payment_status_id,
   payment_status,
   amount_paid
) values ( 1,
           1,
           1,
           'paid',
           999.99 );
insert into payment (
   payment_id,
   order_id,
   payment_status_id,
   payment_status,
   amount_paid
) values ( 2,
           2,
           2,
           'pending',
           1999.99 );
insert into payment (
   payment_id,
   order_id,
   payment_status_id,
   payment_status,
   amount_paid
) values ( 3,
           3,
           3,
           'unpaid',
           699.99 );


--join
--  syntax :SELECT * FROM TABLEA AS T1 INNER JOIN TABLEB AS T2 ON T1.id = T2.id;
-- as is optional 
--CUSTOMER AND ORDERS(LEFT JOIN)


-- ORDERSTATUS AND ORDER (INNER JOIN )
select o.order_date,
       o.amount,
       o.customer_id,
       o.order_status_id,
       os.order_status
  from orders o
 inner join order_status os
on o.order_status_id = os.order_status_id;


-- view :logical table it doesnot store a actual data  and its types are normal and materalized (it creates a virtual table which fetches the data from the table and when we create the view the data are displayed from the materalized view rather than directly from a table while creating a view)

create view customer_order_view as
   select c.customer_id,
          c.first_name,
          c.last_name,
          c.country,
          c.phone_number,
          o.quantity,
          o.amount,
          o.order_date,
          os.order_status
     from customer c
    inner join orders o
   on c.customer_id = o.customer_id
    inner join order_status os
   on o.order_status_id = os.order_status_id;

select *
  from customer_order_view;
--materatized view 

create materialized view m_customer_order_view as
   select c.customer_id,
          c.first_name,
          c.last_name,
          c.country,
          c.phone_number,
          o.quantity,
          o.amount,
          o.order_date,
          os.order_status
     from customer c
    inner join orders o
   on c.customer_id = o.customer_id
    inner join order_status os
   on o.order_status_id = os.order_status_id;

select *
  from m_customer_order_view;

-- SELECT LOG_MODE FROM V$DATABASE;

-- SHUTDOWN IMMEDIATE ;
-- STARTUP MOUNT;
-- ALTER DATABASE ARCHIVELOG;
-- ALTER DATABASE OPEN;

--update order 
update orders
   set
   amount = 69999.99
 where order_id = 3;

--STANDARD  SEQUNECE OF QUERY CLAUSE : WHERE ,GROUP BY ,HAVING AND ORDER BY
--GROUP BY
select country,
       count(*)
  from customer
 group by country
having count(*) > 1
 order by country desc;

--DISTINCT IS USED TO REMOVE THE DUPLICATE VALUES FROM THE TABLE
select distinct country
  from customer;

--SUBQUERY IS USED WHEN WE DONT KNOW THE CONDITION OF THE MAIN QUERY 
select order_date,
       max(amount)
  from orders
 where amount < (
   select max(amount)
     from orders
)
 group by order_date;

select global_name
  from global_name;
select instance_name
  from v$instance;

--create index _
   create index idx_customer_id on
      orders (
         customer_id
      )

--unique index 
select *
  from customer;

alter table customer add email varchar(25);

update customer
   set
   email = 'john@gmail.com'
 where customer_id = 1;

update customer
   set
   email = 'jane@gmail.com'
 where customer_id = 2;

update customer
   set
   email = 'rahul@gmail.com'
 where customer_id = 3;

update customer
   set
   email = 'sharma@gmail.com'
 where customer_id = 4;

update customer
   set
   email = 'sharmarahul@gmail.com'
 where customer_id = 5;

create unique index idx_unique_email on
   customer (
      email
   );

--view index 
select index_name
  from user_indexes
 where table_name = 'CUSTOMER';

select sys_context(
   'USERENV',
   'CURRENT_SCHEMA'
) as schema_name
  from dual;

--create synonym 
create synonym my_orders for orders;

--view synonym
select synonym_name,
       table_owner,
       table_name,
       db_link
  from user_synonyms;

--check specific synonym
select synonym_name,
       table_owner,
       table_name
  from all_synonyms
 where synonym_name = 'MY_ORDERS';

select *
  from my_orders;
--drop Synonum
drop synonym my_orders;

--sequence
create sequence customer_sequence start with 7 increment by 2 nocycle -- Prevents the sequence from cycling back to its minimum value after reaching its maximum value.
 cache 10; --keep 10 values in memory

--getting current value in sequence 
select customer_sequence.currval
  from dual;
select customer_sequence.nextval
  from dual;

--insert into table using sequence
select *
  from customer;
insert into customer (
   customer_id,
   first_name,
   last_name,
   phone_number,
   country,
   email
) values ( customer_sequence.nextval,
           'hari',
           'Sharma',
           '1234567890',
           'Singapore',
           'hari@gmail.com' );

insert into customer (
   customer_id,
   first_name,
   last_name,
   phone_number,
   country,
   email
) values ( customer_sequence.nextval,
           'sita',
           'Sharma',
           '1234567840',
           'Singapore',
           'sita@gmail.com' );

insert into customer (
   customer_id,
   first_name,
   last_name,
   phone_number,
   country,
   email
) values ( customer_sequence.nextval,
           'gita',
           'Sharma',
           '1234567890',
           'Singapore',
           'gita6@gmail.com' );

--if output is not displayed on the screen then use
-- SET SERVEROUTPUT ON;

--print 
begin
   dbms_output.put_line('hello World');
end;
/ --represent the end of the function or the above code is the part of the function 

--if else condition 
declare
   v_salary number := 5000;
begin
   if v_salary > 10000 then
      dbms_output.put_line('Salary is greater than 10000');
   else
      dbms_output.put_line('Salary is less than 10000');
   end if;
end;
/

--for loop
begin
   for i in 1..10 loop
      dbms_output.put_line('value of i:' || i);--||used for concatination
   end loop;
end;
/

--while loop 
declare
   v_counter number := 1;
begin
   while v_counter <= 10 loop
      dbms_output.put_line('Value of counter: ' || v_counter);
      v_counter := v_counter + 1;
   end loop;
end;
/

--nested if else 

declare
   v_score number := 85;
begin
   if v_score >= 90 then
      dbms_output.put_line('Grade: A');
   elsif v_score >= 80 then
      dbms_output.put_line('Grade: B');
   elsif v_score >= 70 then
      dbms_output.put_line('Grade: C');
   else
      dbms_output.put_line('Grade: D');
   end if;
end;
/
select *
  from orders;

select *
  from product;

insert into product (
   product_id,
   product_name,
   product_description,
   price,
   product_category_id
) values ( 5,
           'Apple Watch',
           'Apple Watch is a smartwatch developed by Apple',
           5999,
           1 );


select *
  from order_product;
insert into order_product values ( 2,
                                   2,
                                   6 );
insert into order_product values ( 3,
                                   4,
                                   4 );
insert into order_product values ( 2,
                                   3,
                                   5 );

select ord.order_id,
       sum(ord.quantity * p.price) as total_amount
  from orders ord
 inner join order_product op
on ord.order_id = op.order_id
 inner join product p
on op.product_id = p.product_id
 where ord.order_id = 2
 group by ord.order_id;


--view function 
select owner,
       object_name
  from all_objects
 where object_type = 'FUNCTION';

select object_name,
       status
  from user_objects
 where object_type = 'FUNCTION';
DESC concat_full_name


--function to concat first name and last name 
create or replace function concat_full_name (
   first_name in varchar2,
   last_name  in varchar2
) return varchar2 as
begin
   return first_name
          || ' '
          || last_name;
end;
/

select * from CUSTOMER;
select concat_full_name (first_name,last_name) from customer where customer_id=1;



select * from orders;

--  function to update orders amount
CREATE OR REPLACE FUNCTION update_order_total(in_order_id IN NUMBER) 
RETURN VARCHAR2 
AS
    updated_amount NUMBER;
BEGIN
    -- Calculate the total amount, defaulting to 0 if no data is found
    SELECT COALESCE(SUM(ord.quantity * p.price), 0)
    INTO updated_amount
    FROM orders ord
    INNER JOIN order_product op ON ord.order_id = op.ord_id
    INNER JOIN product p ON op.prod_id = p.product_id
    WHERE ord.order_id = in_order_id;

    -- Update the total_amount in the orders table
    UPDATE orders
    SET amount = updated_amount
    WHERE order_id = in_order_id;

    -- Commit the changes
    COMMIT;

    RETURN 'Total amount updated successfully';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No matching records found for the given order_id';
    WHEN OTHERS THEN
        RETURN 'An error occurred: ' || SQLERRM;
END;
/