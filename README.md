## dbt_snowflake_project

A data project where I used DBT and Snowflake.


## Project Overview

This project is a complete ELT pipeline built using **dbt** (Data Build Tool) and **Snowflake**, designed to demonstrate modern data engineering practices including data modeling, testing, documentation, and environment management using Python virtual environments.


## Below are some commands to setup the environment + SQL scripts:

### Create a Python virtual environment:

```bash
python -m venv dbt_venv
```

### Activate the environment:

- On Windows:
```bash
dbt_venv\Scripts\activate
```

### Install dbt for Snowflake:

```bash
pip install dbt-snowflake
```

### SQL scripts used in Snowflake:

```bash
CREATE OR REPLACE WAREHOUSE finance_wh
WITH WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE;

CREATE OR REPLACE DATABASE finance_db;
CREATE OR REPLACE SCHEMA raw;


CREATE OR REPLACE TABLE raw.customers (
    id INT PRIMARY KEY,
    name VARCHAR,
    email VARCHAR,
    country VARCHAR
);


CREATE OR REPLACE TABLE raw.orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount INT,
    status VARCHAR
);

CREATE OR REPLACE TABLE raw.order_items (
    id INT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price INT
);

CREATE OR REPLACE TABLE raw.products (
    id INT PRIMARY KEY,
    name STRING,
    category STRING,
    price INT
);


CREATE OR REPLACE STAGE finance_stage
    FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1);


COPY INTO raw.customers
FROM @finance_stage/customers.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1);

COPY INTO raw.orders
FROM @finance_stage/orders.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1);

COPY INTO raw.order_items
FROM @finance_stage/order_items.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1);

COPY INTO raw.products
FROM @finance_stage/products.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1);

```

## 🚀 Run dbt Commands

### Build all models
```bash
dbt run
```

### Run tests
```bash
dbt test
```

### Clean target and packages
```bash
dbt clean
```

## Data Warehouse

This project uses [Snowflake](https://www.snowflake.com/) as the cloud data warehouse. Connections and credentials are configured via `profiles.yml` in the user's home directory.
