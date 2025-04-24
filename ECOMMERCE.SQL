-- SQL Script: ecommerce.sql

CREATE TABLE brand (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

CREATE TABLE product_category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

CREATE TABLE product (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  brand_id INT,
  category_id INT,
  base_price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (brand_id) REFERENCES brand(id),
  FOREIGN KEY (category_id) REFERENCES product_category(id)
);

CREATE TABLE product_image (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE color (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  hex_code VARCHAR(7)
);

CREATE TABLE size_category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE size_option (
  id INT PRIMARY KEY AUTO_INCREMENT,
  label VARCHAR(10) NOT NULL,
  size_category_id INT,
  FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

CREATE TABLE product_variation (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT NOT NULL,
  color_id INT,
  size_option_id INT,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (color_id) REFERENCES color(id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

CREATE TABLE product_item (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT NOT NULL,
  variation_id INT,
  price_override DECIMAL(10, 2),
  stock_quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (variation_id) REFERENCES product_variation(id)
);

CREATE TABLE attribute_type (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE attribute_category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE product_attribute (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT NOT NULL,
  attribute_type_id INT NOT NULL,
  attribute_category_id INT NOT NULL,
  value VARCHAR(255) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id),
  FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id)
);
