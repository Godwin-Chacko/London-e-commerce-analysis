



create view revenue as
select transactionno,  sum(quantity * price) as "revenue"
from  TransactionDetails
group by TransactionNo



select count(distinct transactionno) from Transactions








---- analyzing returns
SELECT top 10 p.Productname, Quantity, td.Price, (Quantity * td.Price) AS Revenue,date
FROM TransactionDetails td inner join Transactions t on td.TransactionNo=t.TransactionNo inner join products p on p.ProductNo= td.ProductNo

where td.TransactionNo like '%C%'
order by revenue 




--- product mix for retro and vintage kids items in dec 2018 and dec 2019, to see how it changed rev per unit and aov

select productname, count(quantity) as "prod count",  ROUND(SUM(td.Quantity * td.Price) / COUNT(DISTINCT td.TransactionNo), 2) AS "AOV" from Categories c inner join products p on c.CatNo =p.CatNo inner join TransactionDetails td on p.ProductNo =td.ProductNo 
inner join transactions t on t. TransactionNo = td.TransactionNo 
where (year(date) = 2018  and month (date) = 12) and c.catno = '0'
group by productname
order by "prod count" desc


select productname, count(quantity) as "prod count",  ROUND(SUM(td.Quantity * td.Price) / COUNT(DISTINCT td.TransactionNo), 2) AS [AOV] from Categories c inner join products p on c.CatNo =p.CatNo inner join TransactionDetails td on p.ProductNo =td.ProductNo 
inner join transactions t on t. TransactionNo = td.TransactionNo 
where (year(date) = 2019  and month (date) = 12) and c.catno = '0'
group by productname
order by "prod count" desc





---revenue and order decline in april

select sum(quantity) from  TransactionDetails td inner join transactions t on t. TransactionNo = td.TransactionNo 
where  year(date) = 2019 and month(date) = 3

select sum(quantity) from  TransactionDetails td inner join transactions t on t. TransactionNo = td.TransactionNo 
where  year(date) = 2019 and month(date) = 4



-- aov decline from october to november 2019, checking if a product shift is to blame

with product_level as (
 select  td.Productno, sum(td.price * td.quantity) * 1.0 / nullif(sum(td.quantity), 0) as  "product weighted price"
from TransactionDetails td inner join transactions t on t.TransactionNo = td.TransactionNo 
 where  year(t.date) = 2019 and month(t.date) = 10
  group by  td.Productno) 
select avg("product weighted price") as  "avg weighted price across products"
from product_level


--- aov decline from october to november 2019, seeing if its units per order is to blame

select   month(t.date) as sale_month, count(distinct t.TransactionNo) as "num orders",sum(td.quantity) as total_units,
 sum(td.quantity) * 1.0 / count(distinct t.TransactionNo) as avg_units_per_order
from TransactionDetails td inner join transactions t on t.TransactionNo = td.TransactionNo
 
where  year(t.date) = 2019 and month(t.date) in (10, 11)
group by  month(t.date)
order by sale_month




---items per order for each category

select sum(quantity)/count(distinct td.TransactionNo) as avg_items_per_order, c.catname from Categories c inner join products p on c.CatNo =p.CatNo inner join TransactionDetails td on p.ProductNo =td.ProductNo 
inner join transactions t on t. TransactionNo = td.TransactionNo 
group by c.catname




-- avg price per cateogry over time

select tr.date, c.CatName, t.price
from Categories c 
inner join Products p on c.CatNo = p.CatNo
inner join TransactionDetails t on p.ProductNo = t.ProductNo
inner join Transactions tr on tr.TransactionNo = t.TransactionNo






----- finding name of product with -800k returns in revenue
select p.productname, t.transactionno, t.quantity, t.price, (t.quantity * t.price) as revenue  
from transactiondetails t inner join products p on p.productno = t.productno  

where t.transactionno like '%C541433%'


--analyzing Medium Ceramic Top Storage Jar returns
select p.productname, t.transactionno, t.quantity, t.price, (t.quantity * t.price) as revenue, CustomerNo
from transactiondetails t inner join products p on p.productno = t.productno  inner join Transactions tr on tr.TransactionNo=t.TransactionNo

where productname = 'Medium Ceramic Top Storage Jar' and date = '2019-01-18'






    


--- exploring product with highest revenue
Select revenue, date, td.TransactionNo, customerNo, td.quantity from TransactionDetails td inner join Transactions t on td.TransactionNo = t.TransactionNo 
inner join Products p on td.ProductNo = p.ProductNo inner join revenue a on t.TransactionNo = a.transactionno
where ProductName = 'Paper Craft Little Birdie' 

--exploring difference sales price and returns for Paper Craft Little Birdie
SELECT TransactionNo, Quantity, Price, (Quantity * Price) AS Revenue
FROM TransactionDetails
WHERE TransactionNo IN ('581483', 'C581484')



-- worst selling products
select top 100
    productname, sum(quantity)
from products p inner join TransactionDetails td on p.ProductNo = td.ProductNo inner join Transactions t on td.transactionno = t.TransactionNo
where quantity>0 and p.ProductNo  in ( select distinct p.ProductNo from Products 
inner  join TransactionDetails td on td.ProductNo = p.ProductNo
 inner join Transactions t on td.TransactionNo = t.TransactionNo
 where Date >= '2018-12-01' and Date < '2019-01-01')
 group by productname
order by sum(quantity)



  -- top products by return rate 
select top 5
    productname,  
    abs(sum(case when quantity < 0 then quantity else 0 end)) * 1.0 /   
    nullif(sum(case when quantity > 0 then quantity else 0 end), 0) as "return rate"
from products p inner join TransactionDetails td on p.ProductNo = td.ProductNo inner join Transactions t on td.transactionno = t.TransactionNo
group by productname
having (abs(sum(case when quantity < 0 then quantity else 0 end)) * 1.0 / nullif(sum(case when quantity > 0 then quantity else 0 end), 0) < 1)
and count(distinct t.transactionno) >20
order by "return rate" desc

--- avg monthly return rate
select 
    avg(monthly_return_rate) as avg_monthly_return_rate
from (
    select year(t.date) as yr,month(t.date) as mn,abs(sum(case when td.quantity < 0 then td.quantity else 0 end)) * 1.0 / nullif(sum(case when td.quantity > 0 then td.quantity else 0 end), 0) as monthly_return_rate
    from  transactiondetails td inner join transactions t on td.transactionno = t.transactionno
    group by year(t.date), month(t.date)) as monthly_rates




--investigating products by return date
select td.TransactionNo, t.CustomerNo, productname,td.quantity, t.date from  products p inner join TransactionDetails td on p.ProductNo =td.ProductNo 
inner join transactions t on t. TransactionNo = td.TransactionNo  inner join customers c on t.CustomerNo = c.CustomerNo inner join revenue r on t.TransactionNo = r.transactionno
where ProductName = 'Rotating Silver Angels T-Light Hldr'



--- why did returns of retro and vintage bags increase in september an october

select td.TransactionNo, t.CustomerNo, productname,td.quantity, t.date, sum(td.price*td.quantity) as "revenue" from Categories ca inner join  products p on p.CatNo =ca.CatNo inner join TransactionDetails td on p.ProductNo =td.ProductNo 
inner join transactions t on t. TransactionNo = td.TransactionNo  inner join customers c on t.CustomerNo = c.CustomerNo 
where (year(date) = 2019 and month(date) = 10) and td.Quantity<0 and ca.catno ='0'
group by td.TransactionNo, t.CustomerNo, productname,td.quantity, t.date
order by quantity





--refund price ratio
select
  s.ProductNo,
  ts.CustomerNo,
  s.Price as SalePrice,
  r.Price as ReturnPrice,
  round(r.Price / s.Price, 2) as RefundRate,
  tr.date
from
  TransactionDetails s
inner join Transactions ts on s.TransactionNo = ts.TransactionNo
inner join TransactionDetails r on
  s.ProductNo = r.ProductNo AND 
  s.Quantity > 0 AND r.Quantity < 0

inner join Transactions tr ON r.TransactionNo = tr.TransactionNo

where
  ts.CustomerNo = tr.CustomerNo AND
  s.TransactionNo <> r.TransactionNo
order by
  RefundRate desc



--investigate retirn price ratio anomalies
  select productname,customerno, td.quantity, td.price,(td.price*quantity) as revenue, date from 
  TransactionDetails td inner
join Transactions t ON t.TransactionNo = td.TransactionNo inner join products p on p.productno = td.productno
where p.ProductNo ='22826' and CustomerNo ='12359'

  select productname,customerno, td.quantity, td.price, (td.price*quantity) as revenue, date from 
  TransactionDetails td inner join Transactions t on t.TransactionNo = td.TransactionNo inner join products p on p.productno = td.productno
where p.ProductNo ='23485' and CustomerNo ='17528'

-- View all transactions for product 22826 by customer 12359
select td.TransactionNo,p.productname,t.customerno, td.quantity, td.price, td.price * td.quantity as revenue, t.date from transactiondetails td inner join transactions t on t.transactionno = td.transactionno
inner join products p on p.productno = td.productno 
where  p.productno = '22826' and  t.customerno = '12359'


  --category check
select  c.catname from Categories c inner join products p on c.CatNo =p.CatNo

where p.ProductName = 'Love Seat Antique White Metal'


-- View all transactions for product 23485 by customer 17528
select  p.productname, t.customerno,td.quantity, td.price, td.price * td.quantity as revenue, t.date
from transactiondetails td inner join transactions t on t.transactionno = td.transactionno
inner join products p on p.productno = td.productno
where  p.productno = '23485' and t.customerno = '17528'


--------------------------------------------------------------------------------------------------------------------------------

























