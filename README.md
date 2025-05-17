## dbt_snowflake_project

A data project where I used DBT and Snowflake.


## Project Overview

This project is a complete ELT pipeline built using **dbt** (Data Build Tool) and **Snowflake**, designed to demonstrate modern data engineering practices including data modeling, testing, documentation, and environment management using Python virtual environments.


## ⚙️ Setup & Installation

### 1. Create a Python virtual environment:

```bash
python -m venv dbt_venv
```

### 2. Activate the environment:

- On Windows:
```bash
dbt_venv\Scripts\activate
```

### 3. Install dbt for Snowflake:

```bash
pip install dbt-snowflake
```

---

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
