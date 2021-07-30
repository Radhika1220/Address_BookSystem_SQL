----------UC1--------------

create database AddressBookSystem

use AddressBookSystem;

-------------UC2------------------

create table Address_Book_Table
(
FirstName varchar(50) not null,
LastName varchar(20),
Address varchar(100),
City varchar(50),
StateName varchar(55),
ZipCode int,
Phonenum bigint,
EmailId varchar(100)
);

----------UC3-----------

Insert into Address_Book_Table values('Logeswari','Jaisankar','Gandhi Bazaar','Bangalore','Karanataka',60048,8548712794,'logi12@gmail.com'),
('Vijay','Kumar','Adyar Flyover','Chennai','TamilNadu',60015,987548512,'vijay123@yahoo.com');
Insert into Address_Book_Table values('Sakthi','Rajan','Bharathi Dasan Nagar','Karaikal','TamilNadu',609602,9840781547,'sakthiraj@gmail.com');
Insert into Address_Book_Table values('Arun','Vijay','Andheri Versova Road','Mumbai','Maharashtra',605842,9840781431,'arun.vijay@gmail.com');
Insert into Address_Book_Table values('Prakash','Raj','Fort Road','Mumbai','Maharashtra',604871,8945127834,'praksah@yahoo.com');

-------------UC4--------------

update Address_Book_Table set Phonenum=7845712874 where Address='Gandhi Bazaar';

update Address_Book_Table set EmailId='vijay.kumar23@gmail.com' where FirstName='Vijay';

update Address_Book_Table set EmailId='logi123@gmail.com' where FirstName='Logeswari';

select * from Address_Book_Table;

--------UC5---------

delete from Address_Book_Table where FirstName='Sakthi' and LastName='Rajan';

---------UC6-------------

Select FirstName,LastName from Address_Book_Table where City='Chennai' or StateName='TamilNadu';

-----------UC7------------
Select Count(*) As Count,StateName,City from Address_Book_Table group by StateName,City;

---------UC8------------

select FirstName,LastName from Address_Book_Table where City='Mumbai' order by FirstName;