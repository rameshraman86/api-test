DROP TABLE restaurants IF EXISTS;

DROP TABLE customers IF EXISTS;

DROP TABLE dishes IF EXISTS;

DROP TABLE orders IF EXISTS;

DROP TABLE orders_dishes IF EXISTS;

DROP TABLE orders_queue IF EXISTS;

CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  phone VARCHAR(255) NOT NULL,
  street VARCHAR(255),
  city VARCHAR(255),
  country VARCHAR(255),
  post_code VARCHAR(255),
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  phone VARCHAR(255) NOT NULL
);

CREATE TABLE dishes(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  is_available BOOLEAN DEFAULT TRUE,
  price NUMERIC NOT NULL DEFAULT 0
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id REFERENCES customers(id) ON DELETE CASCADE,
  status VARCHAR(255),
  eta_minutes INTEGER,
  total_amount NUMERIC,
  is_picked_up BOOLEAN DEFAULT FALSE,
  order_date TIMESTAMP
);

CREATE TABLE orders_dishes (
  id SERIAL PRIMARY KEY,
  order_id REFERENCES orders(id) ON DELETE CASCADE,
  dish_id REFERENCES dishes(id) ON DELETE CASCADE,
  quantity INTEGER NOT NULL,
  total_amount_per_dish NUMERIC ON DELETE CASCADE
);

CREATE TABLE orders_queue(
  id SERIAL PRIMARY KEY,
  order_id REFERENCES orders(id) ON DELETE CASCADE queue_position INTEGER NOT NULL,
);