gcloud sql connect order-demo --user=postgres
\connect Project

CREATE USER fivetran PASSWORD 'Fivetran@1997';
GRANT USAGE ON SCHEMA "public" TO fivetran;
GRANT SELECT ON ALL TABLES IN SCHEMA "public" TO fivetran;
ALTER DEFAULT PRIVILEGES IN SCHEMA "public" GRANT SELECT ON TABLES TO fivetran;

create table customers_dataset(customer_id varchar,customer_unique_id varchar,customer_zip_code_prefix varchar(50),customer_city varchar(250),customer_state  varchar(4));
create table geolocation_dataset(GEOLOCATION_ZIP_CODE_PREFIX varchar,GEOLOCATION_LAT double precision,GEOLOCATION_LNG double precision,GEOLOCATION_CITY VARCHAR(50),GEOLOCATION_STATE VARCHAR(10));
create table SELLERS_DATASET(SELLER_ID VARCHAR,SELLER_ZIP_CODE_PREFIX VARCHAR(10),SELLER_CITY VARCHAR(250),SELLER_STATE VARCHAR(10));
create table ORDERS_DATASET(ORDER_ID VARCHAR,CUSTOMER_ID VARCHAR,ORDER_STATUS VARCHAR,ORDER_PURCHASE_TIMESTAMP TIMESTAMP,ORDER_APPROVED_AT TIMESTAMP,ORDER_DELIVERED_CARRIER_DATE TIMESTAMP,ORDER_DELIVERED_CUSTOMER_DATE TIMESTAMP,ORDER_ESTIMATED_DELIVERY_DATE TIMESTAMP);	
create table ORDER_PAYMENTS_DATASET(ORDER_ID VARCHAR,PAYMENT_SEQUENTIAL int,PAYMENT_TYPE VARCHAR(50),PAYMENT_INSTALLMENTS int,PAYMENT_VALUE double precision);	
create table ORDER_REVIEWS_DATASET(REVIEW_ID VARCHAR,ORDER_ID VARCHAR,REVIEW_SCORE int,REVIEW_COMMENT_TITLE VARCHAR,REVIEW_COMMENT_MESSAGE VARCHAR,REVIEW_CREATION_DATE TIMESTAMP,REVIEW_ANSWER_TIMESTAMP TIMESTAMP);
create table PRODUCTS_DATASET(PRODUCT_ID VARCHAR,PRODUCT_CATEGORY_NAME VARCHAR(50),PRODUCT_NAME_LENGHT int,PRODUCT_DESCRIPTION_LENGHT int,PRODUCT_PHOTOS_QTY int,PRODUCT_WEIGHT_G int,PRODUCT_LENGTH_CM int,PRODUCT_HEIGHT_CM int,PRODUCT_WIDTH_CM int);
create table PRODUCT_CATEGORY_NAME_TRANSLATION(PRODUCT_CATEGORY_NAME VARCHAR,PRODUCT_CATEGORY_NAME_ENGLISH VARCHAR);
create table ORDER_ITEMS_DATASET(ORDER_ID VARCHAR,ORDER_ITEM_ID int,PRODUCT_ID VARCHAR,SELLER_ID VARCHAR,SHIPPING_LIMIT_DATE TIMESTAMP,price double precision,freight_value double precision);

\COPY sellers_dataset  FROM  '/home/mssrmkumar/sellers_dataset.csv' WITH delimiter ','  CSV HEADER;
\COPY orders_dataset  FROM  '/home/mssrmkumar/orders_dataset.csv' WITH delimiter ','  CSV HEADER;
\COPY order_items_dataset  FROM  '/home/mssrmkumar/order_items_dataset.csv' WITH delimiter ','  CSV HEADER;
\COPY order_payments_dataset  FROM  '/home/mssrmkumar/order_payments_dataset.csv' WITH delimiter ','  CSV HEADER;
\COPY order_reviews_dataset  FROM  '/home/mssrmkumar/order_reviews_dataset.csv' WITH delimiter ','  CSV HEADER;
\COPY products_dataset  FROM  '/home/mssrmkumar/products_dataset.csv' WITH delimiter ','  CSV HEADER;
\COPY product_category_name_translation  FROM  '/home/mssrmkumar/product_category_name_translation.csv' WITH delimiter ','  CSV HEADER;
\COPY geolocation_dataset FROM  '/home/mssrmkumar/geolocation_dataset.csv' WITH delimiter ','  CSV HEADER;
\COPY customers_dataset FROM  '/home/mssrmkumar/customers_dataset.csv' WITH delimiter ','  CSV HEADER;

drop table sellers_dataset ;
drop table orders_dataset ;
drop table order_items_dataset ;
drop table order_payments_dataset;
drop table order_reviews_dataset ;
drop table products_dataset ;
drop table product_category_name_translation ;
drop table geolocation_dataset ;
drop table customers_dataset ;