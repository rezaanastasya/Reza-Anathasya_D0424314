# 🛍️ Retail Database Management System

A comprehensive database system for retail business management including customer management, inventory tracking, order processing, and sales reporting.

## 📋 Table of Contents
- [Overview](#overview)
- [Database Schema](#database-schema)
- [Installation](#installation)
- [Usage](#usage)
- [Sample Queries](#sample-queries)
- [Features](#features)
- [Contributing](#contributing)

## 🎯 Overview

This retail database system is designed to handle all aspects of a retail business including:
- Customer relationship management
- Product inventory management
- Order and sales processing
- Employee management
- Supplier management
- Payment tracking
- Shipping and delivery

## 🗄️ Database Schema

### Core Tables

#### 1. Categories
Stores product categories
```sql
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### 2. Suppliers
Manages supplier information
```sql
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(50),
    contact_title VARCHAR(30),
    address VARCHAR(100),
    city VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### 3. Products
Product catalog management
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT,
    unit_price DECIMAL(10,2) NOT NULL,
    units_in_stock INT DEFAULT 0,
    units_on_order INT DEFAULT 0,
    reorder_level INT DEFAULT 0,
    discontinued BOOLEAN DEFAULT FALSE,
    description TEXT,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
```

#### 4. Customers
Customer information management
```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(100),
    city VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

#### 5. Employees
Staff management
```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    title VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2),
    department VARCHAR(50),
    manager_id INT,
    address VARCHAR(100),
    city VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);
```

#### 6. Orders
Order management
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    employee_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    required_date DATE,
    shipped_date DATE,
    ship_name VARCHAR(100),
    ship_address VARCHAR(100),
    ship_city VARCHAR(50),
    ship_postal_code VARCHAR(20),
    ship_country VARCHAR(50),
    freight DECIMAL(10,2) DEFAULT 0,
    order_status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
```

#### 7. Order Details
Individual order items
```sql
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    discount DECIMAL(4,2) DEFAULT 0,
    line_total DECIMAL(12,2) GENERATED ALWAYS AS (unit_price * quantity * (1 - discount)) STORED,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

#### 8. Payments
Payment tracking
```sql
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('Cash', 'Credit Card', 'Debit Card', 'Bank Transfer', 'E-Wallet') NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending',
    transaction_id VARCHAR(100),
    notes TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
```

#### 9. Inventory
Stock management
```sql
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    transaction_type ENUM('IN', 'OUT', 'ADJUSTMENT') NOT NULL,
    quantity INT NOT NULL,
    reference_id INT,
    reference_type ENUM('ORDER', 'PURCHASE', 'ADJUSTMENT'),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (created_by) REFERENCES employees(employee_id)
);
```

## 🚀 Installation

### Prerequisites
- MySQL 8.0 or higher
- MySQL Workbench (optional, for GUI)

### Setup Steps

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/retail-database.git
cd retail-database
```

2. **Create the database**
```sql
CREATE DATABASE retail_db;
USE retail_db;
```

3. **Run the schema creation script**
```bash
mysql -u your_username -p retail_db < schema/create_tables.sql
```

4. **Insert sample data**
```bash
mysql -u your_username -p retail_db < schema/insert_sample_data.sql
```

## 💡 Usage

### Basic Operations

#### Adding a New Customer
```sql
INSERT INTO customers (first_name, last_name, email, phone, address, city, country)
VALUES ('John', 'Doe', 'john.doe@email.com', '+1234567890', '123 Main St', 'New York', 'USA');
```

#### Creating a New Order
```sql
-- Insert order
INSERT INTO orders (customer_id, employee_id, ship_name, ship_address, ship_city, ship_country)
VALUES (1, 1, 'John Doe', '123 Main St', 'New York', 'USA');

-- Add order items
INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount)
VALUES (1, 1, 29.99, 2, 0.05);
```

#### Updating Inventory
```sql
INSERT INTO inventory (product_id, transaction_type, quantity, reference_type, notes, created_by)
VALUES (1, 'IN', 100, 'PURCHASE', 'Stock replenishment', 1);
```

## 📊 Sample Queries

### Sales Reports
```sql
-- Top selling products
SELECT 
    p.product_name,
    SUM(od.quantity) as total_sold,
    SUM(od.line_total) as total_revenue
FROM products p
JOIN order_details od ON p.product_id = od.product_id
JOIN orders o ON od.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 10;
```

### Customer Analytics
```sql
-- Customer lifetime value
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    COUNT(o.order_id) as total_orders,
    SUM(o.total_amount) as lifetime_value,
    AVG(o.total_amount) as avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status IN ('Delivered', 'Shipped')
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY lifetime_value DESC;
```

### Inventory Status
```sql
-- Low stock alert
SELECT 
    p.product_name,
    p.units_in_stock,
    p.reorder_level,
    (p.reorder_level - p.units_in_stock) as shortage
FROM products p
WHERE p.units_in_stock <= p.reorder_level
    AND p.discontinued = FALSE
ORDER BY shortage DESC;
```

## ✨ Features

- **Customer Management**: Complete customer profile and history tracking
- **Product Catalog**: Comprehensive product information with categories
- **Order Processing**: Full order lifecycle management
- **Inventory Control**: Real-time stock tracking and management
- **Sales Analytics**: Built-in reporting and analytics queries
- **Employee Management**: Staff information and role management
- **Payment Tracking**: Multiple payment method support
- **Supplier Management**: Vendor relationship management

## 📈 Database Statistics

- **9 Core Tables** with proper relationships
- **Foreign Key Constraints** for data integrity
- **Triggers** for automatic calculations
- **Indexes** for optimized performance
- **Sample Data** for testing and development

## 🔧 Advanced Features

### Triggers
```sql
-- Update order total when order details change
DELIMITER //
CREATE TRIGGER update_order_total 
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    UPDATE orders 
    SET total_amount = (
        SELECT SUM(line_total) 
        FROM order_details 
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END//
DELIMITER ;
```

### Views
```sql
-- Customer order summary view
CREATE VIEW customer_order_summary AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    c.email,
    COUNT(o.order_id) as total_orders,
    SUM(o.total_amount) as total_spent,
    MAX(o.order_date) as last_order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email;
```

## 📁 Project Structure
```
retail-database/
├── README.md
├── schema/
│   ├── create_tables.sql
│   ├── insert_sample_data.sql
│   ├── triggers.sql
│   └── views.sql
├── queries/
│   ├── sales_reports.sql
│   ├── customer_analytics.sql
│   └── inventory_management.sql
├── documentation/
│   ├── database_design.md
│   ├── table_descriptions.md
│   └── er_diagram.png
└── sample_data/
    └── retail_sample_data.sql
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 👨‍💻 Author

**Reza Anathasya**
- GitHub: https://github.com/rezaanastasya
- Email: rezaanastasya3@gmail.com

## 🙏 Acknowledgments

- Inspired by Northwind Database
- Thanks to the open-source community
- Special thanks to database design best practices
