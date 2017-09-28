use AdventureWorksDW2012;


/*1, Display number of orders and total sales amount(sum of SalesAmount) of Internet Sales in 1st quarter each year in each country. Note: your result set should produce a total of 18 rows. */
Select T1.salesorderID,
		T1.TotalDue,
		T1.Onlineorderflag,
		T1.OrderDate,
		T2.Countryregioncode
From Sales.SalesOrderHeader as T1
	join Sales.salesterritory as T2
		on T1.TerritoryID = T2.TerritoryID
		Where OnlineOrderFlag = 1







/*2, Show total reseller sales amount (sum of SalesAmount), calendar quarter of order date, product category name and reseller’s business type by quarter by category and by business type in 2006. Note: your result set should produce a total of 44 rows. */






/*3, Based on 2, perform an OLAP operation: slice. In comment, describe how you perform the slicing, i.e. what do you do to what dimension(s)? Why is it a operation of slicing?*/






/*4, Based on 2, perform an OLAP operation: drill-down. In comment, describe how you perform the drill-down, i.e. what do you do to what dimension(s)? Why is it a operation of drilling-down?*/





