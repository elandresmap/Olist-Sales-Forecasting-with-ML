CREATE DATABASE Olist;
USE Olist;

/* Creating geolocation table */
CREATE TABLE geo_location(
    zipcode char(5),
    latitude double precision,
    longitude double precision,
    city varchar(50),
    geostate char(2) 
    );
    
/* Creating customers datatable */
CREATE TABLE customers(
    customer_id varchar(50),
    customer_unique_id varchar(50),
    customer_zipcode char(5),
    customer_city varchar(50),
    customer_state char(2),
    CONSTRAINT customer_key PRIMARY KEY (customer_id)
);


/* Creating sellers table */
CREATE TABLE sellers(
    seller_id varchar(50),
    seller_zipcode char(5),
    seller_city varchar(50),
    seller_state varchar(5),
    CONSTRAINT seller_key PRIMARY KEY (seller_id)
);


/* Creating product table */
CREATE TABLE products(
    product_id varchar(50),
    product_category varchar(50),
    product_name_length smallint,
    product_desc_length smallint,
    product_photos_qty smallint,
    product_weight_grams integer,
    product_length_cm smallint,
    product_height_cm smallint,
    product_width_cm smallint,
    CONSTRAINT product_key PRIMARY KEY (product_id)
);

/* Creating order datatable */
CREATE TABLE orders(
    order_id varchar(50),
    customer_id varchar(50) REFERENCES customers (customer_id),
    order_status varchar(50),
    order_purchase timestamp,
    order_approved timestamp,
    order_delivered_carrier timestamp,
    order_delivered_customer timestamp,
    order_estimated_delivery timestamp,
    CONSTRAINT order_key PRIMARY KEY (order_id)
);



/* Creating order_payments datatable */
CREATE TABLE order_payments(
    order_id varchar(50) REFERENCES orders (order_id),
    payment_sequential smallint,
    payment_type varchar(20),
    payment_installments smallint,
    payment_value double precision
);

/* Creating order_review datatable */
CREATE TABLE order_reviews(
    review_id varchar(50),
    order_id varchar(50) REFERENCES orders (order_id), 
    review_score smallint,
    review_title text,
    review_comment text,
    review_create timestamp,
    review_answer timestamp
);



/* Creating order_item table */
CREATE TABLE order_items(
    order_id varchar(50) REFERENCES orders (order_id),
    order_item_id smallint,
    product_id varchar(50) REFERENCES products (product_id),
    seller_id varchar(50) REFERENCES sellers (seller_id),
    shipping_limit_date timestamp,
    price real,
    freight_value real
);


/* Creating product_translation table */
CREATE TABLE product_translation(
    category varchar(50),
    category_translation varchar(50)
);

/* importing geo_location data */
LOAD DATA INFILE geo_location
FROM '/home/nabeel/Github/olist_database_analysis/olist_data/olist_geolocation_dataset.csv'
WITH (FORMAT CSV, HEADER);



/* importing customers data */
LOAD DATA INFILE customers
FROM '/home/nabeel/Github/olist_database_analysis/olist_data/olist_customers_dataset.csv'
WITH (FORMAT CSV, HEADER);


/* importing sellers data */
LOAD DATA INFILE sellers
FROM '/home/nabeel/Github/olist_database_analysis/olist_data/olist_sellers_dataset.csv'
WITH (FORMAT CSV, HEADER);



/* importing products data */
LOAD DATA INFILE 'C:\Users\USUARIO\Documents\Bases de datos Olist\olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


/* importing orders data */
LOAD DATA INFILE orders
FROM '/home/nabeel/Github/olist_database_analysis/olist_data/olist_orders_dataset.csv'
WITH (FORMAT CSV, HEADER);

/* importing order payments data */
LOAD DATA INFILE order_payments
FROM '/home/nabeel/Github/olist_database_analysis/olist_data/olist_order_payments_dataset.csv'
WITH (FORMAT CSV, HEADER);


/* importing order reviews data */
LOAD DATA INFILE order_reviews
FROM '/home/nabeel/Github/olist_database_analysis/olist_data/olist_order_reviews_dataset.csv'
WITH (FORMAT CSV, HEADER);

/* importing order items data */
LOAD DATA INFILE order_items
FROM '/home/nabeel/Github/olist_database_analysis/olist_data/olist_order_items_dataset.csv'
WITH (FORMAT CSV, HEADER);

/* importing product translation */
LOAD DATA INFILE product_translation
FROM '/home/nabeel/Github/olist_database_analysis/olist_data/product_category_name_translation.csv'
WITH (FORMAT CSV, HEADER);










