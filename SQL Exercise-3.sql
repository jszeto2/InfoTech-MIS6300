use AdventureWorksDW2012;


/*1, Display number of orders and total sales amount(sum of SalesAmount) of Internet Sales in 1st quarter each year in each country. Note: your result set should produce a total of 18 rows. */

use AdventureWorksDW2012;
select count(T1.salesordernumber) as 'Total Orders',
		sum(T1.salesamount) as 'Total Sales',
		T2.calendarquarter as 'Quarter',
		T2.calendaryear as 'Year',
		T3.CountryRegionCode as 'Country'
from dbo.FactInternetSales as T1
	join dbo.DimDate as T2
	on T1.OrderDateKey = T2.DateKey
	join dbo.DimGeography as T3
	on T1.Salesterritorykey = T3.Salesterritorykey
	where (T2.calendarquarter) = 1
	group by (T2.CalendarYear), (T2.calendarquarter), (T3.CountryRegionCode)
	

/*2, Show total reseller sales amount (sum of SalesAmount), calendar quarter of order date, product category name and reseller’s business type by quarter by category and by business type in 2006. Note: your result set should produce a total of 44 rows. */

use AdventureWorksDW2012;
select ProductCategoryKey,
		EnglishProductCategoryName
from dbo.Dimproductcategory





/*3, Based on 2, perform an OLAP operation: slice. In comment, describe how you perform the slicing, i.e. what do you do to what dimension(s)? Why is it a operation of slicing?*/






/*4, Based on 2, perform an OLAP operation: drill-down. In comment, describe how you perform the drill-down, i.e. what do you do to what dimension(s)? Why is it a operation of drilling-down?*/





