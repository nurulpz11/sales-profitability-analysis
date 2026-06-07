# Sales & Profitability Analysis

## Project Overview

This project analyzes sales and profitability performance using the sales dataset. The objective is to identify factors affecting profit performance, uncover loss generating products, and provide business recommendations through SQL analysis, Python exploratory data analysis (EDA), and an interactive dashboard built in Looker Studio.

---

## Business Problem

Despite generating strong sales revenue, the company experiences relatively low profitability. This project aims to answer the following questions:

- Which product categories generate the highest and lowest profit?
- Which products contribute the most to losses?
- How do discounts affect profitability?
- Which regions perform best and worst in terms of profit?

---

## Dataset

**Dataset:** Sales Dataset

The dataset contains transactional sales records including:

- Orders
- Products
- Categories and Sub-Categories
- Customers
- Regions and States
- Sales
- Profit
- Discount

Analysis period: 2014 – 2017

---

## Tools Used

- **Google BigQuery** 
- **Python**
  - Pandas
  - Matplotlib
  - Seaborn
- **Looker Studio**
- **GitHub**

---

## Analysis Workflow

```text
Business Understanding
        ↓
Data Understanding
        ↓
Data Quality Check
        ↓
Data Cleaning
        ↓
SQL Analysis
        ↓
Python EDA
        ↓
Dashboard Development
        ↓
Business Recommendations
```

---

## Data Quality Validation

Several validation checks were performed before analysis:

- Missing value check
- Duplicate row check
- Date range validation

One duplicate record was identified and removed by creating a cleaned view (`sales_clean`) in BigQuery.

---

## Dashboard Preview

> Dashboard screenshot

![Dashboard](Dashboard/Dashboard.pdf)

---

## Key Findings

### Product Performance

- Technology generated the highest total profit.
- Furniture produced the lowest profitability among all categories.
- Tables was the largest loss-making sub-category.

### Discount Impact

- Average profit decreased as discount levels increased.
- Higher discount levels were associated with lower profitability.
- Profit became negative at higher discount ranges.

### Regional Performance

- The West region generated the highest profit.
- Profitability varied significantly across regions and states.

---

## Business Recommendations

1. Review discount policies, especially for products receiving high discount levels.
2. Investigate the pricing strategy and cost structure of the Tables sub category.
3. Prioritize high margin categories such as Technology.
4. Replicate successful sales strategies from the West region in lowerperforming regions.
5. Continuously monitor profit margin alongside sales performance to avoid revenue growth without profit growth.

---



## Author

**Nurul Putri Zaen**

Aspiring Data Analyst with interests in SQL, Business Intelligence, Data Visualization, and Data Analytics.
