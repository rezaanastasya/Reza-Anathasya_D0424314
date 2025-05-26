# 🧩 Entity Relationship Diagram (ERD)

## 🔗 Relasi Antar Tabel

categories
   ↑
products (category_id)
   ↑
order_details (product_id)
   ↑
inventory (product_id)

suppliers
   ↑
products (supplier_id)

customers
   ↑
orders (customer_id)

employees
   ↑
orders (employee_id)

orders
   ↑
order_details (order_id)
   ↑
payments (order_id)

warehouses (optional)
   ↑
inventory (warehouse_id)

# 🧩 Entity Relationship Diagram (ERD) - Retail Database

```mermaid
erDiagram

    categories ||--o{ products : "1..N"
    suppliers ||--o{ products : "1..N"
    products ||--o{ order_details : "1..N"
    customers ||--o{ orders : "1..N"
    employees ||--o{ orders : "1..N"
    orders ||--o{ order_details : "1..N"
    orders ||--o{ payments : "1..N"
    products ||--o{ inventory : "1..N"
    warehouses ||--o{ inventory : "1..N" optional

    class categories {
        + INT category_id PK
        VARCHAR(100) category_name
        TEXT description
        TIMESTAMP created_at
    }

    class suppliers {
        + INT supplier_id PK
        VARCHAR(100) company_name
        VARCHAR(50) contact_name
        VARCHAR(30) contact_title
        VARCHAR(100) address
        VARCHAR(50) city
        VARCHAR(20) postal_code
        VARCHAR(50) country
        VARCHAR(20) phone
        VARCHAR(100) email
        TIMESTAMP created_at
    }

    class products {
        + INT product_id PK
        VARCHAR(100) product_name
        INT category_id FK
        INT supplier_id FK
        DECIMAL(10,2) unit_price
        INT units_in_stock
        INT units_on_order
        INT reorder_level
        BOOLEAN discontinued
        TEXT description
        VARCHAR(255) image_url
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    class customers {
        + INT customer_id PK
        VARCHAR(50) first_name
        VARCHAR(50) last_name
        VARCHAR(100) email UK
        VARCHAR(20) phone
        VARCHAR(100) address
        VARCHAR(50) city
        VARCHAR(20) postal_code
        VARCHAR(50) country
        DATE date_of_birth
        ENUM('Male', 'Female', 'Other') gender
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    class employees {
        + INT employee_id PK
        VARCHAR(50) first_name
        VARCHAR(50) last_name
        VARCHAR(100) email UK
        VARCHAR(50) job_title
        VARCHAR(50) department
        DATE hire_date
        DECIMAL(10,2) salary
        VARCHAR(100) address
        VARCHAR(50) city
        VARCHAR(20) postal_code
        VARCHAR(50) country
        VARCHAR(20) phone
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    class orders {
        + INT order_id PK
        INT customer_id FK
        INT employee_id FK
        DATE order_date
        DATE required_date
        DATE shipped_date
        VARCHAR(100) ship_address
        VARCHAR(50) ship_city
        VARCHAR(20) ship_postal_code
        VARCHAR(50) ship_country
        ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') status
        DECIMAL(10,2) total_amount
        VARCHAR(50) payment_method
        ENUM('Unpaid', 'Paid', 'Refunded') payment_status
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    class order_details {
        + INT order_detail_id PK
        INT order_id FK
        INT product_id FK
        INT quantity
        DECIMAL(10,2) unit_price
        DECIMAL(5,2) discount
        DECIMAL(10,2) subtotal
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    class payments {
        + INT payment_id PK
        INT order_id FK
        DATETIME payment_date
        DECIMAL(10,2) amount
        VARCHAR(50) payment_method
        VARCHAR(100) transaction_id
        ENUM('Pending', 'Completed', 'Failed', 'Refunded') status
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    class inventory {
        + INT inventory_id PK
        INT product_id FK
        INT warehouse_id FK
        INT stock_level
        INT minimum_level
        DATE last_restocked
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    class warehouses {
        + INT warehouse_id PK
        VARCHAR(100) warehouse_name
        VARCHAR(100) address
        VARCHAR(50) city
        VARCHAR(20) postal_code
        VARCHAR(50) country
        VARCHAR(20) contact_phone
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
