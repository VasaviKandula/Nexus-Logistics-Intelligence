# 🚚 Nexus Logistics Intelligence Hub
"C:\Users\vasav\OneDrive\Desktop\Nexus_Logistics_Project\final_shot.png" 

## 📊 Project Overview
This project simulates an enterprise-level Business Intelligence solution for a global logistics company. The goal was to transform raw transaction data into actionable insights regarding shipping efficiency, product profitability, and regional performance.

## 🛠️ Tech Stack
* **Database:** Microsoft SQL Server (T-SQL)
* **ETL & Modeling:** Star Schema Design (Fact/Dimension Tables)
* **Visualization:** Power BI (DAX Measures, Dynamic Formatting)
* **Concepts:** Time Intelligence (YoY), Profit Margin Logic

## 🔍 Key Features
### 1. Robust Data Modeling
* Designed a normalized **Star Schema** consisting of `Fact_Sales` linked to dimensions: `Dim_Product`, `Dim_Customer`, `Dim_Date`.
* Ensured referential integrity and optimized query performance for reporting.

### 2. Advanced DAX Calculations
* **Sales YoY Growth %:** Time-intelligence calculation to track performance against the previous year.
* **Dynamic Margin Analysis:** `Gross Profit Margin %` measure used to identify profitability.

### 3. "Red Alert" Logic (Conditional Formatting)
* Implemented logic to automatically flag products with **< 40% profit margin** in red, enabling immediate executive attention to underperforming assets.

## 🚀 How to Run
1.  Run the `Database_Setup.sql` script in **SSMS** to generate the schema.
2.  Open `Nexus_Dashboard.pbix` in Power BI Desktop.
