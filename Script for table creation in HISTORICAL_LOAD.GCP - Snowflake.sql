create table order_items_dataset(order_id string,order_item_id	int,product_id	string,seller_id string,
shipping_limit_date datetime,price number,freight_value number);

create table order_payments_dataset(order_id string,payment_sequential	int,payment_type varchar(50),
payment_installments int,payment_value number);

create table order_reviews_dataset(review_id string,order_id string,review_score int ,review_comment_title varchar,
review_comment_message varchar,review_creation_date datetime,review_answer_timestamp datetime);

create table orders_dataset(order_id string,customer_id string,order_status varchar,order_purchase_timestamp datetime,
order_approved_at datetime,order_delivered_carrier_date datetime,order_delivered_customer_date datetime,
order_estimated_delivery_date datetime);

create or replace table sellers_dataset(seller_id string primary key not null,seller_zip_code_prefix number,
seller_city varchar(250),seller_state varchar(10));

create or replace table product_category_name_translation(product_category_name varchar primary key not null,product_category_name_english varchar);

create table customers_dataset(customer_id string primary key not null,customer_unique_id string,
customer_zip_code_prefix number,
customer_city varchar(250),customer_state varchar(50));

create or replace table geolocation_dataset(geolocation_zip_code_prefix number ,
geolocation_lat decimal,geolocation_lng decimal,geolocation_city varchar(50),geolocation_state varchar(10));

create or replace table products_dataset(product_id string primary key not null,
product_category_name VARCHAR(16777216) foreign key references product_category_name_translation(product_category_name),
product_name_lenght int,product_description_lenght int,product_photos_qty int,product_weight_g int,product_length_cm int,
product_height_cm int,product_width_cm int);
