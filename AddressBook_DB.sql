--UC1 - Creating "AddressBook" Database--

create database AddressBook_DB

--Using "AddressBook_DB" Database--
Use AddressBook_DB;


--UC2 - Creating table in AddressBook_Db Database--

Create Table AddressBookService(Id int NOT NULL Primary key Identity(101,1),FirstName varchar(30),LastName varchar(15), Address varchar(50), City Varchar(25), State varchar(25), Zip int, PhoneNumber varchar(10),Email varchar(50));

Select *from AddressBookService;


--UC3 - Inserting records into "AddressBookService" table--

insert into AddressBookService (FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email)
values
('Vidya','Shree','MaruthiNagar','Tumkur','Karnataka',572102,'9108330986','vidyashree2109@gmail.com'),
('Sneha','Sharma','JayNagar','Bangalore','Karnataka',560001,'6364557890','sneha345@gmail.com'),
('Vivek','Roy','VijayNagar','Ananthapur','AndhraPradesh',515001,'9876656743','vivek2318@gmail.com'),
('Priyanka','Suresh','DevNagar','Kozhikode','Kerala',671121,'8799090655','priya678@gmail.com'),
('Siri','Chaitanya','RamNagar','Chennai','TamilNadu',600001,'6754439087','siri98@gmail.com'),
('Nithin','Srivatsa','Agadgaon','AhmedNagar','Maharashtra',440001,'9234533679','nithin456@gmail.com');


--UC4 - Update "AddressBookService" table by FirstName--

update AddressBookService
set LastName='Hegde',Address='Hebbal',City='Mysore', State='Karnataka' where FirstName='Siri';


--UC5 - Deleting Person from "AddressBookService" table by FirstName--

Delete from AddressBookService where FirstName='Sneha';


--UC6 - Retreiving Person Details From "AddressBookService" table by City of State--

select *from AddressBookService where City='Tumkur';

select *from AddressBookService where State='Maharashtra';


--UC7 - Display size of the "AddressBookSErvice" by City or State--

select Count(City) from AddressBookService;

select Count(State) from AddressBookService where State='Karnataka';


--UC8 - Sorting City in "AddressBookService" table alphabetically by FirstName--

select City from AddressBookService Order by FirstName;


--UC9 - Adding three new columns in "AddressBookService" table (Family, Friend And Profession)--

Alter table AddressBookService 
Add Name varchar(50), Type varchar(50);

Select *from AddressBookService;

update AddressBookService
set Name='Jay', Type='Friend' where FirstName='Nithin';


-----UC10 - Dispaly number Of count by Type-----


select Count(*),Type from AddressBookService group by Type;


--UC11 - Queries to be performed with new table structure

Alter table AddressBookService
Drop COLUMN Type ;

Select* from AddressBookService;

Create table AddressBookType(TypeId int NOT NULL Primary Key  Identity(101,1),Type varchar(25));

Select *from AddressBookType;

Create table AddressBookMap(Id int NOT NULL PRIMARY KEY IDENTITY(101,1),MappingId int,TypeId int,AddressBookId int Foreign Key References AddressBookService(Id),AddressBookTypeId int Foreign Key References AddressBookType(TypeId));

Select *from AddressBookMap;

Alter table AddressBookMap ADD Foreign Key (AddressBookId)
References AddressBookService(Id);

Alter table AddressBookMap ADD Foreign Key (TypeId)
References AddressBookType(TypeId);

insert into AddressBookType 
values
('Friend'),
('Family'),
('Profession'),
('Others');

insert into AddressBookMap
Values
(111,112,113,114),
(101,102,103,104);

Select AddressBookService.FirstName, LastName, Address,City, State, Zip,PhoneNumber,Email,  AddressBookService.Name, AddressBookType.Type from AddressBookService INNER JOIN 
AddressBookMap On AddressBookService.Id=AddressBookMap.AddressBookId
INNER JOIN AddressBookType ON AddressBookType.TypeId=AddressBookMap.TypeId;