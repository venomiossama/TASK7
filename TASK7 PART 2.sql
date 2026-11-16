--TASK7_PART2
CREATE DATABASE TASK7_PART2
use TASK7_PART2
go
create schema task
go
--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table  task.Employees(
ID int ,
Name varchar(20) ,
Salary decimal
)
--Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table task.Employees
add Department varchar(50)
--Remove the "Salary" column from the "Employees" table.
alter table task.Employees
drop column [Salary]
--Rename the "Department" column in the "Employees" table to "DeptName".
execute sp_rename 'task.Employees.Department' , 'DeptName' , 'column'
--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table task.Projects (
ProjectID int ,
ProjectName varchar(30)
)
--Add a primary key constraint to the "Employees" table for the "ID" column.
alter table task.Employees
alter column ID int NOT NULL;
go
alter table task.Employees
add constraint PK_Employees_ID primary key (ID);
--Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
alter table task.Projects
add constraint FK_Projects_Employees
foreign key (ProjectID) references task.Employees(ID)
--Remove the foreign key relationship between "Employees" and "Projects."
alter table task.Projects
drop constraint FK_Projects_Employees
--Add a unique constraint to the "Name" column in the "Employees" table.
alter table task.Employees
add constraint UQ_Employees_Name unique(Name)
--Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
create table task.Customers(
CustomerID int ,
FirstName varchar(20) ,
LastName varchar(20) ,
Email varchar(50) ,
Status varchar(20)
)
--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table task.Customers
add constraint UQ_Customers_FullName unique (FirstName , LastName)
--Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted
alter table task.Customers
add constraint def_Customers_Status
default 'Active' for Status
--Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
create table task.Orders(
OrderID int ,
CustomerID int ,
OrderDate datetime ,
TotalAmount decimal
)
--Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
alter table task.Orders
add constraint CH_Orders_TotalAmount
check(TotalAmount > 0) 
--Create a schema named "Sales" and move the "Orders" table into this schema.
go
create schema Sales
go
alter schema Sales
transfer task.Orders
--Rename the "Orders" table to "SalesOrders."
execute sp_rename 'Sales.Orders' , 'SalesOrders'
--End Task--