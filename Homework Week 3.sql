USE AdventureWorks2012; /*Set current database*/

/*1, Display the total amount collected from the orders for each order date. */

Select (Orderdate) as Date,
		sum(Subtotal) as 'Sum Total'
From Sales.SalesOrderHeader
Group by (OrderDate)
Order by (Orderdate) Desc;


/*2, Display the total amount collected from selling each of the products, 774 and 777.*/

Select (ProductID) as Product,
		sum(LineTotal) as Total
From Sales.SalesOrderDetail
    Where ProductID=774 or ProductID=777
	Group by (ProductID)


/*3, Write a query to display the sales person BusinessEntityID, last name and first name of ALL the sales persons and the name
of the territory to which they belong, even though they don't belong to any territory.*/

Select t1.businessEntityID,
		t1.FirstName,
		t1.LastName,
		t3.Name
From Person.person as t1
        Join sales.salesperson as t2 
            on t1.businessentityID=t2.businessentityID
        Left Join sales.salesterritory as t3 
            on t3.TerritoryID = t2.territoryID;


/*4,  Write a query to display the Business Entities (IDs, names) of the customers that have the 'Vista' credit card.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard, Person.Person*/

Select t1.BusinessEntityID,
		t1.FirstName,
		t1.LastName,
		t3.Cardtype
From person.person as t1
	Join sales.personcreditcard as t2
	on t1.businessEntityID=t2.businessEntityID
	Join sales.CreditCard as t3
	on t2.CreditCardID=t3.CreditCardID
Where cardtype='vista'


/*5, Write a query to display ALL the countries/regions along with their corresponding territory IDs, including those the countries/regions that do not belong to any territory.*/
/* tables: Sales.SalesTerritory and Person.CountryRegion*/

Select t1.Name as Region,
		t2.territoryID,
		t2.Name as 'Territory Name'
From person.CountryRegion as t1
	left Join sales.SalesTerritory as t2
	on t1.Countryregioncode=t2.countryregioncode;


/*6, Find out the average of the total dues of all the orders.*/

Select AVG(Subtotal) as 'Total Dues'
From Sales.SalesOrderHeader


/*7, Write a query to report the sales order ID of those orders where the total due is greater than the average of the total dues of all the orders*/

Select SalesOrderID,
		Subtotal
From Sales.SalesOrderHeader
	Where subtotal > (Select Avg(Subtotal) From Sales.SalesOrderHeader)