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


## 🧩 Visualisasi Sederhana (Text-Based ERD)

+--------------+       +----------------+
|  categories  |<----->|    products    |
+--------------+       +----------------+
                            ↑
+--------------+           |
|  suppliers   |<----------+
+--------------+

+--------------+       +-------------+       +------------------+
|  customers   |<------|    orders   |<------|   order_details  |
+--------------+       +-------------+       +------------------+
                            ↑                     ↑
+--------------+           |                     |
|  employees   |<----------+                     |
+--------------+                                 |
                                                 |
                            +--------------+     |
                            |   payments   |<----+
                            +--------------+

+----------------+       +--------------+
|   inventory    |<------| warehouses   | (optional)
+----------------+       +--------------+


