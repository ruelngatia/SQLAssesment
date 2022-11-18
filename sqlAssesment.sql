--use BikeStores;

--------------Question one---------------------------

create table employee(id int primary key, firstName varchar(60), secondName varchar(60),email varchar(60));

create table sales(sales_id int primary key,employeeId int , product varchar(60), quantity int,price int, foreign key (employeeId) references employee(id) );

insert into employee values (1,'mark','john','john@email.com')
insert into employee values (2,'mark','john','john@email.com')
insert into employee values (3,'mark','john','john@email.com')
insert into employee values (4,'mark','john','john@email.com')

insert into sales values (1,2,'nails',4,300)
insert into sales values (2,4,'oil',14,300)
insert into sales values (3,3,'kiwi',0,300)
insert into sales values (4,1,'bottle water',44,300)

select employee.firstName + '' +  employee.firstName as names, sales.product ,sales.quantity from employee
inner join sales on sales.employeeId = employee.id where sales.quantity = 0;


--------------Question Two---------------------------

create TABLE customer(CustomerID int,CustomerName varchar(60), ContactName varchar(60), Address varChar(60), City varchar(60),
PostalCode varchar(60),
Country varchar(60));

insert into customer values(1,'Charlse','Charlie','kenyatta lane 10','Nairobi','10000','Kenya');
insert into customer values(2,'Mark','Paul','kenyatta lane 10','Nairobi','10000','Kenya')
insert into customer values(3,'John','Katua','kenyatta lane 10','Nairobi','10000','Kenya')
insert into customer values(4,'Paul','Phil','kenyatta lane 10','Nairobi','10000','Kenya')
insert into customer values(5,'Michael','Joseph','kenyatta lane 10','Nairobi','10000','Kenya')
insert into customer values(6,'Densel','Wash','kenyatta lane 10','Nairobi','10000','Kenya')
insert into customer values(7,'pin','Charlie','kenyatta lane 10','Nyeri','10100','Tanzania');
insert into customer values(8,'Mark','John','kenyatta lane 10','Nairobi','10200','Nigeria')
insert into customer values(9,'Charlie','Katua','kenyatta lane 10','Kisii','11700','Morrocoo')
insert into customer values(10,'Paul','Phil','kenyatta lane 10','Eldoret','1500','Tanzania')
insert into customer values(11,'Wash','Joseph','kenyatta lane 10','Narok','1500','Tanzania')
insert into customer values(12,'Densel','pin','kenyatta lane 10','Mombasa','1700','Morrocoo')

--------------Question three---------------------------

select  customer.Country, count(customer.Country)  myCount from customer group by 
customer.Country having count(customer.Country) >= 3 order by myCount;

--------------Question four---------------------------

create or alter Procedure insertOrUpdate (@id int, @name varchar(60), @contactName varchar(60),@address varchar(60),@city Varchar(60),@postalCode varchar(60),@country varchar(60))
as 

if ((select CustomerID from customer where CustomerID= @id) = 0)
 insert into customer values(@id,@name,@contactName,@address,@city,@postalCode,@country)

if ((select CustomerID from customer where CustomerID= @id) > 0)
 update customer set CustomerName = @name, ContactName = @contactName,Address = @address,City = @city,PostalCode = @postalCode,Country = @country where CustomerID = @id

go

exec insertOrUpdate 1,'ruel','mark','outreach center','Jimbo','1000','Eygpt'

--------------Question five---------------------------

select  CustomerName from  customer
difference
select distinct  CustomerName from  customer

--------------Question six---------------------------

select  * from  customer where (CustomerID%2) > 0 
