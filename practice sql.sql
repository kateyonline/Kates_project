
insert into me.product
values(111, "Printer", "East", "Q1-2016", 7956),
(112, "Scanner", "West", "Q1-2016", 5763),
(113, "Television", "North", "Q1-2016", 7301),
(114, "Laptop", "South", "Q1-2016", 5719),
(115, "Printer", "East", "Q2-2016", 5742),
(116, "scanner", "West", "Q2-2016", 5873),
(117, "Television", "North", "Q2-2016", 1361),
(118, "Laptop", "South", "Q2-2016", 3659),
(119, "Printer", "East", "Q3-2016", 6869),
(120, "Scanner", "West", "Q3-2016", 1736),
(121, "Television", "North", "Q3-2016", 2061),
(122, "Laptop", "South", "Q3-2016", 8253),
(123, "Printer", "East", "Q4-2016", 6054),
(124, "Scanner", "West", "Q4-2016", 8550),
(125, "Television", "North", "Q4-2014", 2073),
(126, "Laptop", "South", "Q4-2016", 9961); 


-- USING WHERE TO FILTER DATA --
select * from me.product
where NetSales>5000;

-- USING AND -- 
select * from me.product
where NetSales<=5000 and ProdName="Printer";

select * from me.product
where NetSales<=5000 or ProdName="Book";

-- to find two or more values from a column --
select * from me.product
where ProdName in ("Printer", "Scanner");

-- we can also write the above as--
select * from me.product
where ProdName="Printer" or ProdName="Scanner";

-- TO ARRANGE A COLUMN IN ASCENDING ORDER--
select * from me.Product
order by NetSales asc;

-- TO FIND AVERAGE OF NETSALES AND RETURN AS AVERAGE--
select avg(NetSales) as Average
from me.product;

-- TO GET SUM OF NETSALES AND RETURN AS TOTAL NETSALES --
select sum(NetSales) as TotalNetSales
from me.Product;

-- TO GROUP DATA --
select RegionName, sum(NetSales) as Total
from me.product
group by RegionName;

-- TO ARRANGE IN ASC OR DESC ORDER WE USE ORDER BY --
select RegionName, sum(Netsales) as Total
from me.product
group by RegionName
order by Total;

select RegionName, sum(Netsales) as Total
from me.product
group by RegionName
order by Total desc;

select RegionName, max(Netsales) as Max_sales
from me.product
group by RegionName
order by Max_sales;

select RegionName, count(ProdName) as Totalnumberofproducts
from me.product
group by RegionName
order by Totalnumberofproducts;

select * from me.product;

-- TO DISPLAYONLY A PARTICULAR VALUE OR SET OF VALUES,WE USE HAVING --
select RegionName, sum(NetSales) as Total
from me.product
group by RegionName
having RegionName= "East";

select RegionName, sum(NetSales) as Total
from me.product
where RegionName in("East", "West")
group by RegionName;


select RegionName, sum(NetSales) as Total
from me.product
group by RegionName
having RegionName in("East", "West");



-- UPDATE AND DELETE STATEMENTS --
-- TO UPDATEF WHERE NETSALES=7956 AND REPLACE WITH 8500 -- 
update me.product
set NetSales=8500
where NetSales=7956;

select * from  me.product;

-- UPDATE NETSALES TO 9000 WHERE ORDERID IS 115 --
update me.product
set NetSales=9000
where OrderId=115;

select * from me.product;

-- TO DELETE ROWS IN A TABLE--
delete from me.product
where OrderId=126;

-- ALTER TABLE STATEMENT --
-- THE SYNTAX FOR CREATING NEW COLUMN in a table IS "ALTER TABLE" --

alter table me.product
add City char(40);

-- if after adding new column "city", we realize it should be "Town" --
alter table me.product
change City Town char(40);

-- to change data type in a particular column say from var to int --
alter table me.product
modify Town int;

describe me.product;

-- To drop or delete a column in a table --
-- to drop town column --
alter table me.product
drop Town;

-- to create a view/a copy of our table. eg we want to see everything in the product table except "Town"
create view me.new as
select OrderId, ProdName, RegionName, FiscalQtr, NetSales
from me.product;

select * from me.new;

-- using wildcards to filter data ie getting specific data from table--
-- TO GET DATA THAT STARTS WITH P --
select * from me.New 
where ProdName like "P%";

-- TO GET DATA THAT ENDS WITH P --
select * from me.New 
where ProdName like "%P";

-- to get data that has p anywhere in it --
select * from me.New
where ProdName like "%p%";


 
 