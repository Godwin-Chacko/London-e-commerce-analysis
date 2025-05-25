# London E-Commerce Analysis: 2018-2019

**Tableau dashboard showing tables, line graphs, and area charts for total sales, total orders, and average time to ship**

Analyzing Elist order trends from 2019–2022.  
👉 [View the interactive Tableau dashboard here](#)




## Table of Contents

- [Project Background](#project-background)
- [Executive Summary](#executive-summary)
- [Part 1: Trends (Excel)](#part-1-trends-excel)  
- [Part 2: Targeted Insights (SQL)](#part-2-targeted-insights-sql)  
- [Part 3: Visualizations (Tableau)](#part-3-visualizations-tableau)  
- [Part 4: Recommendations & Next Steps](#part-4-recommendations--next-steps)  
- [Addendum: Notes on Data Cleaning](#addendum-notes-on-data-cleaning)


---

## Project Background

London is a sample e-commerce company that sells holiday decor, baking and pantry items and vintage items worldwide.

The company has significant amounts of data on its Transactions, customers and  product offerings, that has been previously underutilized. This project thoroughly analyzes and synthesizes this data in order to uncover critical insights that will improve London's commercial success.

Insights and recommendations are provided on the following key areas:

**Sales Trends Analysis**: Evaluation of historical sales patterns, both globally and by region, focusing on Revenue, Order Volume, and Average Order Value (AOV). Additional metrics such as product sales volume were also considered to support deeper insights where relevant.


**Product Performance**: An analysis of the business's various products and product catergories, understanding their impact on Revenue, orders and returns.


The data is organized across four tables: `Customers`, `Transactions`, `TransactionDetails`, `Products`,  and `Categories` .


![ERD Diagram](data/ERD.png)

---

## Executive Summary

  ### Overview of findings
 

  21negfk'gemhfrg  ee eg ehe ghe e eeeee
  feglgemeg;mgge



---
## Part 1: Trends (Excel)

[ Back to Table of Contents](#table-of-contents)

Using Excel pivot tables and conditional formatting, I analyzed:

-  **Yearly Trends**  
  - 2020 had the highest AOV ($298), but 2022 saw a 44% drop in revenue YoY.
-  **Seasonality**  
  - Strongest months are typically in winter and spring.
-  **Product Performance**  
  - AirPods dominate sales; Bose headphones consistently underperform.
-  **Loyalty Program Impact**  
  - Loyalty members outspent non-members by $34 per order in 2022.

>  Key tools: Pivot tables, aggregation, conditional formatting

[Download the Excel workbook](#)

---

## Part 2: Targeted Insights (SQL)

[ Back to Table of Contents](#table-of-contents)

Using Google BigQuery and SQL, I extracted insights such as:

-  **MacBook Sales (North America)**  
  - Avg. 30 units/month with $47.8K revenue
-  **Refund Rates**  
  - MacBook Air has the highest refund rate (4.2%)
-  **Account Creation (Jan–Feb 2022)**  
  - Desktop led to 2,487 new customers; tablet purchases had highest AOV
-  **Time to Purchase**  
  - Avg. 51 days from account creation to first purchase
- **Marketing Channels**  
  - Direct and email drive the most orders

>  Key SQL techniques: CTEs, window functions, `QUALIFY`, `CASE`, `JOIN`

[View SQL queries](#)

---

## Part 3: Visualizations (Tableau)

The Tableau dashboard includes:

-  **Orders**  
  - 3 products make up 80% of all orders
-  **Shipping Times**  
  - iPhones & Bose headphones show high delivery variability
-  **Sales Trends**  
  - Gaming monitors lead revenue; charging packs lead volume but not value

>  Tools used: Tableau, BigQuery (data source), filters, area/line charts

[View Tableau dashboard](#)  
[Download Tableau workbook](#)

---

## Part 4: Recommendations & Next Steps

1. **Expand Loyalty Program**  
   Focus on customer retention via email campaigns and member-only promotions.
2. **Grow High-Value Categories**  
   Add more computer hardware products to the catalog.
3. **Track Financial KPIs**  
   Include CAC and COGS to assess net profit and LTV.
4. **Resolve Shipping Delays**  
   Investigate fulfillment processes for iPhones and Bose products.

---

## Addendum: Notes on Data Cleaning

During the data cleaning process, I identified 9,956 duplicate entries in the original Excel dataset. To ensure the integrity and accuracy of the analysis, these duplicates were removed. As a result, the initial total of 536,350 entries was reduced to 526,394 entries. This step was crucial for maintaining the validity and reliability of the insights derived from the data.

---

**Author:**  
[Godwin Chacko](#)  
 godwinrejioutlook.com  
 [LinkedIn](#) | [Portfolio](#)


