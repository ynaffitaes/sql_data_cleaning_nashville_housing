# Nashville Housing Data Cleaning with SQL

## Project Overview

This project focuses on cleaning and preparing the Nashville Housing dataset using PostgreSQL and DBeaver.

The objective was to transform raw housing transaction data into a structured and analysis-ready dataset by applying a series of SQL data cleaning techniques commonly used in real-world analytics projects.

The dataset was sourced from Kaggle and imported into PostgreSQL for cleaning and transformation.

---

## Dataset

**Source:** [Kaggle](https://www.kaggle.com/datasets/tmthyjames/nashville-housing-data)

The dataset contains housing transaction records from Nashville, including:

- Property information
- Owner information
- Sale dates
- Sale prices
- Property addresses
- Land use and tax information

---

## Skills Demonstrated

- SQL Data Cleaning
- PostgreSQL
- Dbeaver
- Data Transformation
- Data Quality Improvement
- Duplicate Detection and Removal
- String Functions
- Data Standardization
- Schema Optimization

---

## Data Cleaning Process

### 1. Date Standardization

Converted the `SaleDate` column to a proper PostgreSQL `DATE` format to ensure consistency and improve usability for future analysis.

Techniques used:

- `ALTER TABLE`
- `CAST()`

---

### 2. Property Address Parsing

Split the `PropertyAddress` field into separate columns:

- Property Address
- Property City

Techniques used:

- `SPLIT_PART()`
- `TRIM()`
- `ALTER TABLE`
- `UPDATE`

---

### 3. Owner Address Parsing

Split the `OwnerAddress` field into three separate columns:

- Owner Address
- Owner City
- Owner State

Techniques used:

- `SPLIT_PART()`
- `TRIM()`
- `ALTER TABLE`
- `UPDATE`

---

### 4. Standardizing Categorical Values

Standardized the `SoldAsVacant` column by replacing abbreviated values with readable labels.

Examples:

| Original | Standardized |
|-----------|------------|
| Y | Yes |
| N | No |

Techniques used:

- `CASE WHEN`

---

### 5. Duplicate Detection and Removal

Identified duplicate property records using a window function and removed redundant rows.

Duplicate detection was based on:

- Parcel ID
- Property Address
- Sale Price
- Sale Date
- Legal Reference

Techniques used:

- `ROW_NUMBER()`
- Common Table Expressions (CTEs)
- `DELETE`

---

### 6. Schema Optimization

Removed columns that were no longer required after the cleaning process.

Removed columns:

- OwnerAddress
- PropertyAddress
- TaxDistrict

Techniques used:

- `ALTER TABLE`
- `DROP COLUMN`

---

## SQL Concepts Used

- SELECT
- UPDATE
- ALTER TABLE
- DELETE
- CASE WHEN
- CAST
- SPLIT_PART
- TRIM
- ROW_NUMBER
- Common Table Expressions (CTEs)
- Window Functions

---


---

## Key Outcomes

- Standardized date formats
- Improved address usability by separating location attributes
- Standardized categorical values
- Removed duplicate records
- Reduced dataset redundancy
- Improved dataset readiness for reporting and analysis

---

## Tools Used

- PostgreSQL
- DBeaver
- Kaggle Dataset

---

## Author

Aram Samb

