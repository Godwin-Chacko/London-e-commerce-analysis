





---- creating tables after normalization, non-mandatory relationships first for referential integrity


-- create customers table
create table customers (
    customerno nvarchar(55) primary key,
    country nvarchar(100))

-- insert distinct customers from salest
insert into customers (customerno, country)
select distinct customerno, country
from salest
where customerno is not null;

-- unique customers from normalized customers table
select count(*) as customercount_normalizedfrom customers

-- unique customers directly from flat salest table
select count(distinct customerno) from salest


-- create categories table
create table categories (
    catno nvarchar(55) primary key,
    catname nvarchar(100))

-- insert distinct categories from salest
insert into categories (catno, catname)
select distinct catno, catname
from salest
where catno is not null



-- create products table
create table products (
    productno nvarchar(55) primary key,
    productname nvarchar(255),
    price decimal(10, 2),
    catno nvarchar(55),
    foreign key (catno) references categories(catno))


-- insert unique products using max to resolve duplicates
insert into products (productno, productname, price, catno)
select 
    productno,
    max(productname) as productname,  
    max(price) as price,
    max(catno) as catno
from salest
where productno is not null
group by productno



-- create transactions table
create table transactions (
    transactionno nvarchar(55) primary key,
    date date,
    customerno nvarchar(55),
    foreign key (customerno) references customers(customerno))

-- insert distinct transactions
insert into transactions (transactionno, date, customerno)
select distinct transactionno, date, customerno
from salest
where transactionno is not null



-- create transactiondetails table 
create table transactiondetails (
    transactionno nvarchar(55),
    productno nvarchar(55),
    quantity int,
    price decimal(5,2),
    primary key (transactionno, productno),
    foreign key (transactionno) references transactions(transactionno),
    foreign key (productno) references products(productno))