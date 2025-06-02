


----  categories by aov,revenue price,quantity
SELECT c.catname, sum(quantity * td.price)/count( distinct t.transactionno)  as "aov", sum(td.Price * td.Quantity) AS revenue,AVG(td.Price) AS avg_price, sum(td.Quantity) AS "prod count" ,t.date
from Products p inner join TransactionDetails td on p.ProductNo = td.ProductNo inner join Transactions t on t.TransactionNo = td.TransactionNo inner join Categories c on p.CatNo =c.CatNo
Group by t.date,c.catname
Order By  aov desc


--categories by returns  over time
select tr.date, c.CatName, t.Quantity 
from Categories c 
inner join Products p on c.CatNo = p.CatNo
inner join TransactionDetails t on p.ProductNo = t.ProductNo
inner join Transactions tr on tr.TransactionNo = t.TransactionNo
where t.quantity < 0


---revenue per unit sold by category

Select distinct c.catname, sum(td.price*td.Quantity)/sum(td.quantity) as rev_per_unit,t.date from Categories c inner join Products p on  c.CatNo = p.CatNo
inner join TransactionDetails td on p.ProductNo = td.ProductNo
inner join Transactions t on t.TransactionNo = td.TransactionNo 
group by c.catname,t.date
having sum(td.price*td.Quantity) > 0 and sum(td.quantity) > 0



