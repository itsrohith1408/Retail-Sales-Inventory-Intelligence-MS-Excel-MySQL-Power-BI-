create database retail_sales;

use retail_sales;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT ,
    street TEXT,
    city TEXT,
    state TEXT,
    zip_code INT
);

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name TEXT NOT NULL,
    phone TEXT,
    email TEXT ,
    street TEXT,
    city TEXT,
    state TEXT,
    zip_code INT
);

CREATE TABLE staffs (
    staff_id INT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT,
    phone TEXT,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name TEXT
);

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name TEXT 
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT NOT NULL,
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DOUBLE NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_status INT NOT NULL,
    order_status_text text,
    order_date TEXT NOT NULL,
    required_date TEXT,
    shipped_date TEXT,
    store_id INT,
    staff_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES staffs(staff_id)
);

CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT NOT NULL,
    list_price DOUBLE NOT NULL,
    total_price DOUBLE,
    discount DOUBLE NOT NULL,
    discount_Amount DOUBLE,
    final_price DOUBLE,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE stocks (
    store_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


