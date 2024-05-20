
CREATE TABLE Customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone_number VARCHAR(20),
  date_of_birth DATE,
  income_level VARCHAR(50),
  address VARCHAR(255),
  city VARCHAR(50),
  postal_code VARCHAR(10),
  loyalty_tier VARCHAR(20)
);
 


CREATE TABLE Store (
  store_id INT PRIMARY KEY,
  location VARCHAR(255) NOT NULL,
  size VARCHAR(50) NOT NULL,  -- Can be "Small", "Medium", "Large"
  region VARCHAR(50),
  number_of_checkouts INT
);
 

CREATE TABLE Time (
  date DATE NOT NULL PRIMARY KEY,
  day VARCHAR(10) NOT NULL,  -- Monday, Tuesday, etc.
  month VARCHAR(10) NOT NULL,  -- January, February, etc.
  quarter INT NOT NULL,
  year INT NOT NULL,
  is_weekend varchar(255) NOT NULL  -- TRUE or FALSE
);
 
CREATE TABLE Supplier (
  supplier_id INT PRIMARY KEY ,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  contact_name VARCHAR(255),
  email VARCHAR(255),
  lead_time INT  -- Lead time in days
);
 
CREATE TABLE Department (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL UNIQUE,  -- Ensures unique department names
  description VARCHAR(255)  -- Optional field for additional details
);
 

CREATE TABLE Promotion (
  promotion_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  discount_percentage DECIMAL(5,2)  -- Captures discount percentages up to two decimal places
);

CREATE TABLE Product (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  category VARCHAR(50) NOT NULL,
  brand VARCHAR(50),
  price DECIMAL(10,2) NOT NULL,
  stock_level INT
);

CREATE TABLE Sales (
  transaction_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  customer_id INT NOT NULL,
  store_id INT NOT NULL,
  supplier_id INT NOT NULL,
  department_id INT NOT NULL,
  date DATE NOT NULL,
  quantity INT NOT NULL,
  sales_amount DECIMAL(10,2) NOT NULL,
  loyalty_points_earned INT,
  promotion_id INT,
  payment_type VARCHAR(20),
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (store_id) REFERENCES Store(store_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
  FOREIGN KEY (department_id) REFERENCES Department(department_id),
  FOREIGN KEY (promotion_id) REFERENCES Promotion(promotion_id)
 
);


