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
	

/*2, Show total reseller sales amount (sum of SalesAmount), X
calendar quarter of order date, X
product category name X
and reseller’s business type 
by quarter by category and by business type in 2006. Note: your result set should produce a total of 44 rows. */

use AdventureWorksDW2012;
select sum(T1.Salesamount) as 'Sales',
		T2.CalendarYear as 'Year',
		T2.calendarquarter as 'Quarter',
		T3.BusinessType,
		T6.EnglishProductCategoryName as 'Product Name'
from dbo.FactResellerSales as T1
	join dbo.dimdate as T2
		on T1.OrderDateKey = T2.DateKey
	join dbo.dimreseller as T3
		on T1.Resellerkey = T3.Resellerkey
	Join dbo.DimProduct as T4
		on T1.Productkey = T4.Productkey
	Join dbo.DimProductSubcategory as T5
		on T4.Productsubcategorykey = T5.Productsubcategorykey
	Join dbo.Dimproductcategory as T6
		on T5.Productcategorykey = T6.Productcategorykey
	Where (T2.calendaryear) = 2006
	Group by (T2.calendaryear), (T2.calendarquarter), (T3.BusinessType), (T6.EnglishProductCategoryName)


/*3, Based on 2, perform an OLAP operation: slice. In comment, describe how you perform the slicing, i.e. what do you do to what dimension(s)? Why is it a operation of slicing?*/

use AdventureWorksDW2012;
select sum(T1.Salesamount) as 'Sales',
		T2.CalendarYear as 'Year',
		T2.calendarquarter as 'Quarter',
		T3.BusinessType,
		T6.EnglishProductCategoryName as 'Product Name'
from dbo.FactResellerSales as T1
	join dbo.dimdate as T2
		on T1.OrderDateKey = T2.DateKey
	join dbo.dimreseller as T3
		on T1.Resellerkey = T3.Resellerkey
	Join dbo.DimProduct as T4
		on T1.Productkey = T4.Productkey
	Join dbo.DimProductSubcategory as T5
		on T4.Productsubcategorykey = T5.Productsubcategorykey
	Join dbo.Dimproductcategory as T6
		on T5.Productcategorykey = T6.Productcategorykey
	Where (T2.calendaryear) = 2006 and (T6.EnglishProductCategoryName) = 'Bikes'
	Group by (T2.calendaryear), (T2.calendarquarter), (T3.BusinessType), (T6.EnglishProductCategoryName)

	/*For the slice I'm just looking at Bikes.  This allows me to just look at two different sides (Time and business Type) with Product name staying constant.  This slice gives us the ability to make analysis against this one constant.*/


/*4, Based on 2, perform an OLAP operation: drill-down. In comment, describe how you perform the drill-down, i.e. what do you do to what dimension(s)? Why is it a operation of drilling-down?*/

use AdventureWorksDW2012;
select sum(T1.Salesamount) as 'Sales',
		T2.CalendarYear as 'Year',
		T2.calendarquarter as 'Quarter',
		T3.BusinessType,
		T6.EnglishProductCategoryName as 'Product Name'
from dbo.FactResellerSales as T1
	join dbo.dimdate as T2
		on T1.OrderDateKey = T2.DateKey
	join dbo.dimreseller as T3
		on T1.Resellerkey = T3.Resellerkey
	Join dbo.DimProduct as T4
		on T1.Productkey = T4.Productkey
	Join dbo.DimProductSubcategory as T5
		on T4.Productsubcategorykey = T5.Productsubcategorykey
	Join dbo.Dimproductcategory as T6
		on T5.Productcategorykey = T6.Productcategorykey
	Where (T2.calendaryear) = 2006 and T2.CalendarQuarter = 3
	Group by (T2.calendaryear), (T2.calendarquarter), (T3.BusinessType), (T6.EnglishProductCategoryName)

	/*For the time function I drilled down to the 3rd quarter I shrunk everything else so that I didn't have to see the data and I'm looking at a particular point in time.*/

