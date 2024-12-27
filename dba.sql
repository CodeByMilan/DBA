-- table creation
CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number NUMBER(12),
    country VARCHAR(255)
)

CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status_id INT,
    quantity INT,
    amount FLOAT,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
)
-- adding order_status_id as FOREIGN key CONSTRAINT
ALTER TABLE ORDERS
ADD CONSTRAINT fk_order_status_id FOREIGN KEY (order_status_id) REFERENCES ORDER_STATUS(order_status_id)

CREATE TABLE ORDER_STATUS (
    order_status_id INT PRIMARY KEY,
    order_status VARCHAR(255)
    )

CREATE TABLE PRODUCT_CATEGORY (
    product_category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
    )

CREATE TABLE PRODUCT(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_description VARCHAR(255),
    price FLOAT,
    product_category_id INT,
    FOREIGN KEY (product_category_id) REFERENCES PRODUCT_CATEGORY(product_category_id)
)

CREATE TABLE ORDER_PRODUCT (
    order_id INT PRIMARY KEY,
    product_id INT,
    product_ord_id INT,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
    )
-- removing order_id as PRIMARY key and adding product_ord_id
ALTER TABLE ORDER_PRODUCT
DROP PRIMARY KEY 
ADD PRIMARY KEY (product_ord_id)


CREATE TABLE PAYMENT (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_status VARCHAR(255),
    amount_paid FLOAT,
    payment_status_id INT,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
    )
    ALTER TABLE PAYMENT
ADD CONSTRAINT fk_payment_status_id FOREIGN KEY (payment_status_id) REFERENCES PAYMENT_STATUS(payment_status_id)

CREATE TABLE PAYMENT_STATUS(
    payment_status_id INT PRIMARY KEY,
    payment_status VARCHAR(255)
)


-- Insert operation 
INSERT INTO PRODUCT_CATEGORY (product_category_id, category_name) VALUES (1, 'Electronics');
INSERT INTO PRODUCT_CATEGORY (product_category_id, category_name) VALUES (2, 'Fashion');
INSERT INTO PRODUCT_CATEGORY (product_category_id, category_name) VALUES (3, 'Home and Kitchen');
INSERT INTO PRODUCT_CATEGORY (product_category_id, category_name) VALUES (4, 'Beauty and Personal');


INSERT INTO PRODUCT (product_id, product_name, product_description, price, product_category_id) 
VALUES (1, 'Apple iPhone', 'Latest model of Apple iPhone', 999.99,1);
INSERT INTO PRODUCT (product_id, product_name, product_description, price, product_category_id)
VALUES (2, 'Nike', 'Latest model of Nike', 1999.99,2);
INSERT INTO PRODUCT (product_id, product_name, product_description, price, product_category_id)
VALUES (3, 'Pan', 'Non- sticky pan latest model', 699.99,3);
INSERT INTO PRODUCT (product_id, product_name, product_description, price, product_category_id)
VALUES (4, 'Lakme', 'Best quality of Lakme', 499.99,4);

INSERT INTO CUSTOMER (customer_id, first_name, last_name, phone_number,country) 
VALUES (1, 'John', 'Doe', '9817452398', 'USA');
INSERT INTO CUSTOMER (customer_id, first_name, last_name, phone_number,country)
VALUES (2, 'Jane', 'Doe', '9817452399', 'UK');
INSERT INTO CUSTOMER (customer_id, first_name, last_name, phone_number,country)
VALUES (3, 'Rahul', 'Sharma', '9817452400', 'NEPAL');
INSERT INTO CUSTOMER (customer_id, first_name, last_name, phone_number,country)
VALUES (4, 'Rahul', 'Sharma', '9817452401', 'INDIA');
INSERT INTO CUSTOMER (customer_id, first_name, last_name, phone_number,country)
VALUES (5, 'Rahul', 'Sharma', '9817452402', 'CHINA');


INSERT INTO ORDER_STATUS (order_status_id, order_status)
VALUES (1, 'pending');
INSERT INTO ORDER_STATUS (order_status_id, order_status)
VALUES (2, 'shipped');
INSERT INTO ORDER_STATUS (order_status_id, order_status)
VALUES (3, 'delivered');
INSERT INTO ORDER_STATUS (order_status_id, order_status)
VALUES (4, 'cancelled');
INSERT INTO ORDER_STATUS (order_status_id, order_status)
VALUES (5, 'refunded');
INSERT INTO ORDER_STATUS (order_status_id, order_status)
VALUES (6, 'returned');


INSERT INTO PAYMENT_STATUS (payment_status_id, payment_status)
VALUES (1, 'paid');
INSERT INTO PAYMENT_STATUS (payment_status_id, payment_status)
VALUES (2, 'pending');
INSERT INTO PAYMENT_STATUS (payment_status_id, payment_status)
VALUES (3, 'unpaid');

INSERT INTO ORDERS (order_id, customer_id, order_date, amount, order_status_id, quantity)
VALUES (1, 1, '15-03-22', 999.99,1,5);
INSERT INTO ORDERS (order_id, customer_id, order_date, amount, order_status_id,quantity)
VALUES (2, 2, '15-03-21', 1999.99,6,20);
INSERT INTO ORDERS (order_id, customer_id, order_date, amount, order_status_id,quantity)
VALUES (3, 3, '15-03-20', 699.99,2,10);

INSERT INTO ORDER_PRODUCT (product_ord_id,order_id, product_id)
VALUES (1,1,1);
INSERT INTO ORDER_PRODUCT (product_ord_id,order_id, product_id)
VALUES (2,1,2);
INSERT INTO ORDER_PRODUCT (product_ord_id,order_id, product_id)
VALUES (3,1,3);
INSERT INTO ORDER_PRODUCT (product_ord_id,order_id, product_id)
VALUES (4,2,4);

INSERT INTO PAYMENT (payment_id, order_id,  payment_status_id, payment_status,amount_paid) 
VALUES (1,1,1,'paid',999.99);
INSERT INTO PAYMENT (payment_id, order_id,  payment_status_id, payment_status,amount_paid)
VALUES (2,2,2,'pending',1999.99);
INSERT INTO PAYMENT (payment_id, order_id,  payment_status_id, payment_status,amount_paid)
VALUES (3,3,3,'unpaid',699.99);





