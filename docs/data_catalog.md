# Data Dictionary for Gold Layer
## Overview
The Gold Layer is the business-level data representation, structured to support analytical and use reporting use cases. It consists of **dimension
tables** and **fact tables** for specific business metrics.

---

**1. gold.dim_customers**  
**Purpose: Stores customer details enriched with demographic and geographic data.**  
**Columns:**  
| Column Name | Data Type | Description |
| :---: | :---: | :---: |
| customer_key | INT | Surrogate key uniquely identifying each customer record in the dimension table|
| customer_id | INT | Unique numerical identifier assigned to each customer |
| customer_number | NVARCHAR(50) | Business or system code assigned to a customer (often formatted as text or alphanumeric ID) |
| first_name | NVARCHAR(50) | The customer's given name |
| last_name | NVARCHAR(50) | The customer's family or surname |
| country | NVARCHAR(50) | The country where the customer resides or is located |
| marital_status | NVARCHAR(50) | The relationship status of the customer (e.g., Single, Married, n/a) |
| gender | NVARCHAR(50) | The customer's gender identity or biological sex (e.g., Male, Female, n/a) |
| birthdate | DATE | The customer's date of birth, used for age calculation and demographic profiling |
| create_date | DATE | The date when the customer record was originally created in the source CRM system |

---

**2. gold_dim_products**  
**Purpose: Provides information about products and their attributes.**  
**Columns:**  

| Column Name | Data Type | Description |
| :---: | :---: | :---: |
| product_key | INT | Surrogate key uniquely identifying each product record in the dimension table |
| product_id | INT | Unique numerical identifier assigned to each product |
| product_number | NVARCHAR(50) | Business or system code assigned to a product (e.g., SKU or model number) |
| product_name | NVARCHAR(50) | The descriptive name of the item or product |
| category_id | NVARCHAR(50) | Unique code or identifier mapping the product to its top-level product category |
| category | NVARCHAR(50) | High-level grouping or classification of the product (e.g., Bikes, Accessories) |
| subcategory | NVARCHAR(50) | Specific secondary grouping under the primary category (e.g., Mountain Bikes, Helmets) |
| maintenance | NVARCHAR(50) | Indicates required maintenance status, classification, or service requirements for the product |
| cost | INT | Wholesale cost or expense to produce/acquire the product |
| product_line | NVARCHAR(50) | Business product line classification (e.g., Mountain, Road, Touring) |
| start_date | DATE | The date when the product became active or available for sale |

---

**3. gold.fact_sales**  
**Purpose: Stores transactional sales data and key metrics for business analysis**  
**Columns:**  

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| order_number | NVARCHAR(50) | Unique identifier or transaction ID assigned to a specific sales order |
| product_key | INT | Surrogate key linking the transaction to its corresponding record in gold.dim_products |
| customer_key | INT | Surrogate key linking the transaction to its corresponding record in gold.dim_customers |
| order_date | DATE | The date when the customer placed the order |
| shipping_date | DATE | The date when the ordered items were shipped to the customer |
| due_date | DATE | The promised or expected delivery/payment date for the order |
| sales_amount | INT | Total monetary revenue generated from the sale (quantity * price) |
| quantity | INT | The number of units of the product purchased in the transaction |
| price | INT | The unit price of the product at the time of purchase |
