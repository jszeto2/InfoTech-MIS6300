use AdventureWorks2012;

/*a.	Show First name and last name of employees whose job title is “Sales Representative”, ranking from oldest to youngest. You may use HumanResources.Employee table and Person.Person table. (14 rows)*/

Select T2.FirstName,
		T2.LastName,
		T1.JobTitle,
		T1.Birthdate
From Humanresources.Employee as T1
	Join Person.person as T2
		on T1.BusinessEntityID = T2.BusinessEntityID
	Where (T1.JobTitle) = 'Sales Representative'
	Order by T1.birthdate asc


/*b.	Find out all the products which sold more than $5000 in total. Show product ID and name and total amount collected after selling the products. You may use LineTotal from Sales.SalesOrderDetail table and Production.Product table. (254 rows)*/


Select T1.ProductID,
        sum(T1.Linetotal) as 'Total Amount',
        T2.Name
From Sales.salesOrderdetail AS T1
    Join Production.Product as T2
        on T1.ProductID = T2.ProductID
    Group by (T1.ProductID), (T2.Name)
	Having sum(T1.Linetotal) >5000


/*c.	Show BusinessEntityID, territory name and SalesYTD of all sales persons whose SalesYTD is greater than $500,000, regardless of whether they are assigned a territory. You may use Sales.SalesPerson table and Sales.SalesTerritory table. (16 rows)*/

Select T2.BusinessEntityID,
		T1.Name,
		T2.SalesYTD
From Sales.Salesterritory as T1
	Right Join Sales.salesperson as T2
		on T1.TerritoryID = T2.TerritoryID
	Where T2.SalesYTD > 500000


/*d.	Show the sales order ID of those orders in the year 2008 of which the total due is great than the average total due of all the orders of the same year. (3200 rows)*/

Select salesorderID,
		OrderDate as Date,
		Totaldue as Total
From Sales.salesorderheader
	Where year(Orderdate) = 2008 and Totaldue > (Select avg(totaldue)
												From Sales.salesorderheader
												Where year(Orderdate) = 2008)
