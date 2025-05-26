# London E-Commerce Analysis: 2018-2019

**Tableau dashboard showing tables, line graphs, and area charts for total sales, total orders, and average time to ship**

Analyzing Elist order trends from 2019–2022.  
👉 [View the interactive Tableau dashboard here](#)




## Table of Contents

- [Project Background](#project-background)
- [Executive Summary](#executive-summary)
- [Sales Trend Analysis (Excel/SQL)](#sales-trend-analysis-excelsql)  
- [Product Performance (Excel/SQL)](#product-performance-excelsql)  
- [Recommendations & Next Steps](#recommendations--next-steps)  
- [Assumptions and Caveats](#assumptions-and-caveats)


---

## Project Background

London is a sample e-commerce company that sells christmas and holiday decor, baking and pantry items, vintage and retro lunch bags, and vintage and retro kids items.

The company has significant amounts of data on its Transactions, customers and  product offerings, that has been previously underutilized. This project thoroughly analyzes and synthesizes this data in order to uncover critical insights that will improve London's commercial success.

Insights and recommendations are provided on the following key areas:

**Sales Trends Analysis**: Evaluation of historical sales patterns, both globally and by region, focusing on Revenue, Order Volume, and Average Order Value (AOV). Additional metrics such as product sales volume were also considered to support deeper insights where relevant.


**Product Performance**: An analysis of the business's various products and product catergories, understanding their impact on Revenue, orders and returns.


The data is organized across four tables: `Customers`, `Transactions`, `TransactionDetails`, `Products`,  and `Categories` with a total row count of 536,355.

Here is the Entity Relationship Diagram:

![ERD Diagram](data/ERD.png)

---

## Executive Summary

  ### Overview of findings
 

  21negfk'gemhfrg  ee eg ehe ghe e eeeee
  feglgemeg;mgge



---
## Sales Trend Analysis (Excel/SQL)

[ Back to Table of Contents](#table-of-contents)

Using Excel pivot tables and conditional formatting, I analyzed:

-  **Yearly Trends**  
  - 
  - Despite the sales drawback in December 2019 the bussiness still enjoyed a 6% growth for revenue and 19% growth for quantity from Q419
-  **Seasonality**  
  - Strongest months are typically in winter and spring.
-  **Monthly trends**  
  - AOV declined 19% even before the supply chain disruptions from china
-  **Regional sales**  
  - In 2019 88% of our products were sold in the UK and 12% were international.
  - 

>  Key tools: Pivot tables, aggregation, conditional formatting

[Download the Excel workbook](#)

---

## Product Performance (Excel/SQL)

[ Back to Table of Contents](#table-of-contents)

Using Google BigQuery and SQL, I extracted insights such as:


 **Revenue**  
 - Our top 50 most sold products only account for 4.5% of total revenue and product sales
  - 


-  **Orders**  
  - Desktop led to 2,487 new customers; tablet purchases had highest AOV

  - 
  **AOV*  
  - Avg. 51 days from account creation to first purchase
  - 

  
 **Returns**  
  - Across all years, Macbook Airs had the highest refund rate at 4.2% followed by ThinkPads (3.8%) and iPhones (3.5%).

>  Key SQL techniques: CTEs, window functions, `QUALIFY`, `CASE`, `JOIN`

[View SQL queries](#)

---


## Recommendations & Next Steps

1. **Expand Loyalty Program**  
   Focus on customer retention via email campaigns and member-only promotions.
2. **Grow High-Value Categories**  
   Add more computer hardware products to the catalog.
3. **Track Financial KPIs**  
   Include CAC and COGS to assess net profit and LTV.
4. **Resolve Shipping Delays**  
   Investigate fulfillment processes for iPhones and Bose products.

---

## Assumptions and Caveats

**Data cleaning**

During the data cleaning process, I identified 9,956 duplicate entries in the original Excel dataset. To ensure the integrity and accuracy of the analysis, these duplicates were removed. As a result, the initial total of 536,350 entries was reduced to 526,394 entries. This step was crucial for maintaining the validity and reliability of the insights derived from the data.

**Refund rate**
Some refunds do not have matching sales records in the dataset, these refunds are excluded from the refund rate calculations since they skew the rate above 100%

Refunds for products below 20 orders were excluded to ensure adequate sample size



---

**Author:**  
[Godwin Chacko](#)  
 godwinrejioutlook.com  
 [LinkedIn](#) | [Portfolio](#)


