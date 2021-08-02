----------UC1-->Creating Database------------ 

create database AddressBookSystem

use AddressBookSystem;

-------------UC2---->Create table------------------

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

----------UC3----->Insert into tables using fields--------

Insert into Address_Book_Table values('Logeswari','Jaisankar','Gandhi Bazaar','Bangalore','Karanataka',60048,8548712794,'logi12@gmail.com'),
('Vijay','Kumar','Adyar Flyover','Chennai','TamilNadu',60015,987548512,'vijay123@yahoo.com');
Insert into Address_Book_Table values('Sakthi','Rajan','Bharathi Dasan Nagar','Karaikal','TamilNadu',609602,9840781547,'sakthiraj@gmail.com');
Insert into Address_Book_Table values('Arun','Vijay','Andheri Versova Road','Mumbai','Maharashtra',605842,9840781431,'arun.vijay@gmail.com');
Insert into Address_Book_Table values('Prakash','Raj','Fort Road','Mumbai','Maharashtra',604871,8945127834,'praksah@yahoo.com');

-------------UC4---->edit existing contact person using person name----------

update Address_Book_Table set Phonenum=7845712874 where FirstName='Sakthi';

update Address_Book_Table set EmailId='vijay.kumar23@gmail.com' where FirstName='Vijay';

update Address_Book_Table set EmailId='logi123@gmail.com' where FirstName='Logeswari';

select * from Address_Book_Table;

--------UC5---->Delete a contact using perosn name-----

delete from Address_Book_Table where FirstName='Sakthi' and LastName='Rajan';

---------UC6---->Retrieve data belongs to state or city---------

Select FirstName,LastName from Address_Book_Table where City='Chennai' or StateName='TamilNadu';

-----------UC7---->Count of state and city--------
Select Count(*) As Count,StateName,City from Address_Book_Table group by StateName,City;

---------UC8---->Sort the name alphabetically using city name--------

select FirstName,LastName from Address_Book_Table where City='Mumbai' order by FirstName;

----------UC9---->Add the new columns and adding the address book name and type-----------
alter table Address_Book_Table
add AddressBookName varchar(50),
RelationType varchar(50)


update Address_Book_Table
set AddressBookName='FriendName',RelationType='Friend'
where FirstName='Sakthi' or FirstName='Prakash' or FirstName='Vijay'


update Address_Book_Table
set AddressBookName='Cousin',RelationType='Family'
where ZipCode=60048;

update Address_Book_Table
set AddressBookName='TeamLead',RelationType='Profession'
where Phonenum=9840781431

---------UC10---->Count of persons based on realtion type-----
Select count(*)as CountType, RelationType  from Address_Book_Table group by RelationType;
-------Implementing ER Diagram----------
--Create Address_Book table
create table Address_Book(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(100)
)
---Insert the values in Address_Book
Insert into Address_Book values ('Radhika'),('Arun');
---Retrieve the data
select * from Address_Book;
--Create Contact_Person
create table Contact_Person(
AddressBook_ID int,
ContactID int identity(1,1) primary key,
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
StateName varchar(100),
ZipCode BigInt,
PhoneNum BigInt,
EmailId varchar(200),
foreign key (AddressBook_ID) references Address_Book(AddressBookID));
--Insert the values 
Insert into Contact_Person values
(1,'Divesh','Sankar','Fort Road','Mumbai','Maharashtra',600158,8939478157,'diveshsmart@gmail.com'),
(2,'Vijay','Kumar','Adam Street','Chennai','Tamil Nadu',600015,9847581547,'vijay.12@hyahoo.com'),
(2,'Prakash','Raj','South Marret Street.','Chennai','Tamil Nadu',600145,874875197,'prakash@23gmail.com'),
(1,'Gitanjali','Sekar','Gandhi Bazaar','Bangalore','Karnataka',601454,7847595157,'gitanjali1999@gmail,com');
--Retrieve the data
select * from Contact_Person;
---Create contact_type table
create table Contact_Type
(ContactTypeID int identity(1,1) primary key,
ContactTypeName varchar(100)
)
---Insert the values in contat_type
Insert into Contact_Type values
('Family'),('Friends'),('Profession');
--Retrieve the data
Select * from Contact_Type;
---Create relation type table
create Table Relation_Type(
ContactType_ID int,
Contact_ID int,
foreign key (ContactType_ID) references Contact_Type(ContactTypeID),
foreign key (Contact_ID) references Contact_Person(ContactID)
)
---Insert the values in relation_type
insert into Relation_Type values
(1,3),
(2,3),
(3,1),
(1,2),
(2,4)
--Retrieve the data
Select * from Relation_Type;
------- Create Contact for both Family and Friends Type------
--------UC11--------
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Address_Book 
Full JOIN Contact_Person on Address_Book.AddressBookID=Contact_Person.AddressBook_ID 
Full JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
Full JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID

