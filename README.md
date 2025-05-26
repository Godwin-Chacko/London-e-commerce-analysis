# London E-Commerce Analysis: 2018-2019


Analyzing Elist order trends from 2019–2022.  
👉 [View the interactive Tableau dashboard here](#)




## Table of Contents

- [Project Background](#project-background)
- [Executive Summary](#executive-summary)
- [Sales Trend Analysis (Excel/SQL)](#sales-trend-analysis-excelsql)  
- [Product Performance (Excel/SQL)](#product-performance-excelsqlpython)  
- [Recommendations & Next Steps](#recommendations--next-steps)  
- [Assumptions and Caveats](#assumptions-and-caveats)


---

## Project Background

This is a sales transaction data set of UK-based e-commerce (online retail) for one year. This London-based shop has been selling gifts and homewares for adults and children through the website since 2007. Their customers come from all over the world and usually make direct purchases for themselves. There are also small businesses that buy in bulk and sell to other customers through retail outlet channels.

The company has significant amounts of data on its Transactions, customers and  product offerings, that has been previously underutilized. This project thoroughly analyzes and synthesizes this data in order to uncover critical insights that will improve London's commercial success.

Insights and recommendations are provided on the following key areas:

- **Sales Trends Analysis**: Evaluation of historical sales patterns, both globally and by region, focusing on Revenue, Order Volume, and Average Order Value (AOV). Additional metrics such as product sales volume were also considered to support deeper insights where relevant.


- **Product Performance**: An analysis of the business's various products and product catergories, understanding their impact on Revenue, orders and returns.


The data is organized across four tables: `Customers`, `Transactions`, `TransactionDetails`, `Products`,  and `Categories` with a total row count of 536,355.

Here is the Entity Relationship Diagram:

![ERD Diagram](data/ERD.png)

---

## Executive Summary

  ### Overview of findings
 
After sales peaked in november 2019, all key performance indicators have decreased month over month in December 2019: Revenue declined 74%, Orders fell 70% and AOV decreased 15%. This decline can most likely be attributed to supply chain disruptions in China that started in December 2019




---
## Sales Trend Analysis (Excel/SQL)

[ Back to Table of Contents](#table-of-contents)

![image](https://github.com/user-attachments/assets/1de44a7a-4d16-445e-8f7f-1d0d73b6c5ab)





Using Excel pivot tables and conditional formatting, I analyzed:

 **Yearly Trends** 
- Revenue declined 53% year-over-year (YoY)
- Orders were down 48% YoY
- **Average Order Value (AOV) only decreased 8% YoY, indicating that the **quality/value of orders remained stable** even as the order quantity dropped by 48%
- **The company’s sales peaked in November 2019**, with **3,146 orders** generating **£7,650,200** in revenue. This strong performance was driven by a **36% increase in orders containing lower-priced, high-volume products**
- Despite a dip in sales in December 2019, the business still recorded a 6% increase in revenue and a 19% rise in quantity sold** from Q3 to Q4 2019

  -



**Monthly trends**
  - The AOV decline of 19% in November 2019 can be largely attributed to shift in product mix that resulted in a 15% decrease of the average price of a prodct sold that month. This was compounded with a 8% decline items per order from last month
  - Revenue declined by 22% and order volume dropped 16% in April 2019. The primary driver of this downturn was a **290% surge in returns**, which rose sharply to a total of 13,700. Additionally, **product sales fell by 26%**, helping explain why the decline in revenue outpaced the drop in order quantity.


**Chineese supply chain disruptions**


 
 **Seasonality**
  -  orders, revenue peaked in deceimber 2018 and subseqently dipped in jan and feb of next year likely due to the holiday season and the shopping frenzy that comes along with it, return seasonality likely exists in january where consumers returned christmas and holiday related products,they increased  and average of 404% from December to jaunaury.  increases for orders and revenue  in september 2019 are explained by a 53% increase in sales of the Christmas and holiday decor category which accounted for 74% of all sales that month suggesting consumers of our products 


    
 


-  **Regional sales**  
  - In 2019 88% of our products were sold in the UK and 12% were international.
  - 

>  Key tools: Pivot tables, aggregation, conditional formatting

[Download the Excel workbook](#)

---

## Product Performance (Excel/SQL/Python)

[ Back to Table of Contents](#table-of-contents)






 **Revenue**  
 - Our top 50 most sold products only account for 4.5% of total revenue and product sales
   -This makes ![image](https://github.com/user-attachments/assets/4aef4726-1ed1-43a1-9470-3841803ed28b)

  - 


-  **Orders**  
  - 
-  orders of Retro & Vintage kids items have grow significantly YoY  
  - 
  **AOV*  
  - Avg. 51 days from account creation to first purchase
  - 

  
 **Returns**  
  - Across all years, Macbook Airs had the highest refund rate at 4.2% followed by ThinkPads (3.8%) and iPhones (3.5%).

>  Key SQL techniques: CTEs, aggregates, nested queries, `CASE`, ` INNER JOIN`

[View SQL queries](#)

---


## Recommendations & Next Steps

1. **Create/improve category data**: Given the size of our product catalog(3,768), manually categorizing thousands of items is likely not feasible or scalable in the long term. To address this, I used k-means clustering to group products based on their similarities in attributes like name, . While this approach provides a useful starting point, it's an unsupervised method that doesn't account for context or business logic.For more accurate and business-aligned categorization, it may be worth exploring advanced predictive models—such as supervised classification algorithms which can learn from existing labeled data to make smarter categorization decisions. This model could deliver more consistent and relevant categories, especially as the product catalog continues to grow.



2. **Grow High-Value Categories**:
   
3. **Track Financial KPIs**:  
   
4. **Investigate high return rate and worst selling products**

Review whether to discontinue products with return rates above 50% or consistently low sales performance, in order to streamline the product assortment and enhance profitability.
   
 

---

## Assumptions and Caveats

**Data cleaning**

-During the data cleaning process, I identified 9,956 duplicate entries in the original Excel dataset. To ensure the integrity and accuracy of the analysis, these duplicates were removed. As a result, the initial total of 536,350 entries was reduced to 526,394 entries. This step was crucial for maintaining the validity and reliability of the insights derived from the data. 

**Refund rate**
-Some refunds do not have matching sales records in the dataset, these refunds are excluded from the refund rate calculations since they skew the rate above 100%

-Refunds for products below 20 orders were excluded to ensure adequate sample size



---

**Author:**  
[Godwin Chacko](#)  
 godwinrejioutlook.com  
 [LinkedIn](#) | [Portfolio](#)


