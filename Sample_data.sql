-- 1. Insert into Categories
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Apparel and fashion wear'),
('Home & Kitchen', 'Household and kitchen products'),
('Books', 'Books, magazines and publications'),
('Toys & Games', 'Toys, games and entertainment items');

-- 2. Insert into Suppliers
INSERT INTO suppliers (company_name, contact_name, contact_title, address, city, postal_code, country, phone, email) VALUES
('TechWorld Supplies', 'John Carter', 'Sales Manager', '123 Tech Lane', 'San Francisco', '94105', 'USA', '+1-415-555-0123', 'sales@techworld.com'),
('Global Garments Ltd', 'Lila Gupta', 'Procurement Head', '456 Fashion St', 'Mumbai', '400001', 'India', '+91-22-5555-6666', 'procure@globalgarments.com'),
('KitchenEssentials Inc.', 'Emma Stone', 'Supplier Relations', '789 Cook Ave', 'London', 'SW1A 1AA', 'UK', '+44-20-7946-0018', 'supplier@kitcheneasy.co.uk'),
('BookHaven Publishing', 'Robert Down', 'Editor-in-Chief', '101 Read St', 'New York', '10001', 'USA', '+1-212-555-4567', 'editor@bookhavenpub.com'),
('Toyland Distributors', 'Sophia Lee', 'Account Manager', '202 Play Rd', 'Sydney', '2000', 'Australia', '+61-2-5555-7890', 'accounts@toyland.com.au');

-- 3. Insert into Products
INSERT INTO products (product_name, category_id, supplier_id, unit_price, units_in_stock, units_on_order, reorder_level, discontinued, description, image_url) VALUES
('Smartphone X1', 1, 1, 799.99, 50, 0, 10, FALSE, 'Latest flagship smartphone with AI features', 'https://example.com/images/smartphonex1.jpg '),
('Wireless Headphones', 1, 1, 149.99, 120, 30, 20, FALSE, 'Noise-canceling wireless headphones', 'https://example.com/images/headphones.jpg '),
('Men T-Shirt Basic White', 2, 2, 19.99, 200, 50, 30, FALSE, 'Cotton t-shirt for everyday use', 'https://example.com/images/tshirtwhite.jpg '),
('Coffee Maker Deluxe', 3, 3, 89.99, 45, 15, 10, FALSE, 'Automatic drip coffee maker with timer', 'https://example.com/images/coffeemaker.jpg '),
('Cookbook: Italian Recipes', 4, 4, 24.99, 80, 0, 15, FALSE, 'Collection of authentic Italian dishes', 'https://example.com/images/italiancookbook.jpg '),
('Wooden Puzzle Game', 5, 5, 12.99, 60, 0, 10, FALSE, 'Educational wooden puzzle for kids', 'https://example.com/images/puzzle.jpg ');

-- 4. Insert into Customers
INSERT INTO customers (first_name, last_name, email, phone, address, city, postal_code, country, date_of_birth, gender) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '+1-555-123-4567', '123 Main St', 'New York', '10001', 'USA', '1985-06-15', 'Female'),
('Michael', 'Brown', 'michael.brown@example.com', '+44-7700-900123', '45 High Street', 'London', 'SW1A 1AA', 'UK', '1990-03-22', 'Male'),
('Siti', 'Rahayu', 'siti.rahayu@example.com', '+62-812-3456-7890', 'Jl. Merdeka No. 10', 'Jakarta', '10110', 'Indonesia', '1995-11-08', 'Female'),
('James', 'Wilson', 'james.wilson@example.com', '+61-412-345-678', '10 Queen St', 'Sydney', '2000', 'Australia', '1988-09-14', 'Male'),
('Emily', 'Davis', 'emily.davis@example.com', '+1-555-987-6543', '78 Pine Rd', 'Toronto', 'M5H 2N2', 'Canada', '2000-01-30', 'Female');

-- 5. Insert into Employees
INSERT INTO employees (first_name, last_name, email, job_title, department, hire_date, salary, address, city, postal_code, country, phone) VALUES
('David', 'Miller', 'david.miller@retail.com', 'Store Manager', 'Sales', '2018-04-01', 65000.00, '55 Market St', 'Chicago', '60601', 'USA', '+1-312-555-0198'),
('Anita', 'Kumar', 'anita.kumar@retail.com', 'Customer Service Rep', 'Support', '2020-07-15', 42000.00, 'Sector 28, Noida', 'Delhi', '201301', 'India', '+91-98765-43210'),
('Liam', 'Clark', 'liam.clark@retail.com', 'Inventory Analyst', 'Logistics', '2021-02-10', 48000.00, '89 King St', 'Manchester', 'M1 1AE', 'UK', '+44-7890-123456'),
('Zara', 'Lee', 'zara.lee@retail.com', 'Sales Associate', 'Retail', '2022-05-05', 38000.00, '34 Orchard Rd', 'Singapore', '238842', 'Singapore', '+65-8123-4567'),
('Oliver', 'Nguyen', 'oliver.nguyen@retail.com', 'IT Support', 'Technology', '2019-11-20', 55000.00, '10 Tech Park', 'Melbourne', '3000', 'Australia', '+61-422-333-444');

-- 6. Insert into Orders
INSERT INTO orders (customer_id, employee_id, order_date, required_date, shipped_date, ship_address, ship_city, ship_postal_code, ship_country, status, total_amount, payment_method, payment_status) VALUES
(1, 1, '2024-03-10', '2024-03-15', '2024-03-13', '123 Main St', 'New York', '10001', 'USA', 'Delivered', 819.98, 'Credit Card', 'Paid'),
(2, 3, '2024-03-12', '2024-03-18', NULL, '45 High Street', 'London', 'SW1A 1AA', 'UK', 'Processing', 19.99, 'PayPal', 'Unpaid'),
(3, 2, '2024-03-14', '2024-03-20', '2024-03-18', 'Jl. Merdeka No. 10', 'Jakarta', '10110', 'Indonesia', 'Shipped', 24.99, 'Bank Transfer', 'Paid'),
(4, 4, '2024-03-15', '2024-03-22', NULL, '10 Queen St', 'Sydney', '2000', 'Australia', 'Pending', 12.99, 'Cash on Delivery', 'Unpaid'),
(5, 5, '2024-03-16', '2024-03-24', '2024-03-20', '78 Pine Rd', 'Toronto', 'M5H 2N2', 'Canada', 'Delivered', 149.99, 'Credit Card', 'Paid');

-- 7. Insert into Order_Details
INSERT INTO order_details (order_id, product_id, quantity, unit_price, discount, subtotal) VALUES
(1, 1, 1, 799.99, 0.00, 799.99),
(1, 2, 1, 149.99, 30.00, 119.99),
(2, 3, 1, 19.99, 0.00, 19.99),
(3, 5, 1, 24.99, 0.00, 24.99),
(4, 6, 1, 12.99, 0.00, 12.99),
(5, 2, 1, 149.99, 0.00, 149.99);

-- 8. Insert into Payments
INSERT INTO payments (order_id, payment_date, amount, payment_method, transaction_id, status) VALUES
(1, '2024-03-10 14:23:00', 819.98, 'VISA-4567', 'txn_123456789', 'Completed'),
(3, '2024-03-14 10:15:00', 24.99, 'Bank BCA', 'bank_987654321', 'Completed'),
(5, '2024-03-16 16:45:00', 149.99, 'MasterCard-8888', 'txn_456789123', 'Completed');

-- 9. Insert into Inventory
INSERT INTO inventory (product_id, warehouse_id, stock_level, minimum_level, last_restocked) VALUES
(1, 1, 45, 10, '2024-03-01'),
(2, 1, 110, 20, '2024-03-05'),
(3, 2, 180, 30, '2024-02-28'),
(4, 2, 40, 10, '2024-03-10'),
(5, 3, 75, 15, '2024-03-08'),
(6, 3, 58, 10, '2024-03-09');

-- 10. Insert into Warehouses (Optional)
INSERT INTO warehouses (warehouse_name, address, city, postal_code, country, contact_phone) VALUES
('Central Warehouse NY', '100 Logistics Blvd', 'New York', '10001', 'USA', '+1-555-100-0001'),
('Asia Distribution Ctr', 'Warehouse 5, Port Area', 'Singapore', '476321', 'Singapore', '+65-6543-2109'),
('Europe Fulfillment Hub', 'Unit 3, Logistics Park', 'Manchester', 'M1 1AE', 'UK', '+44-161-555-0199');
