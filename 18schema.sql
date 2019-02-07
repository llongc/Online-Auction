create database auction;
create TABLE EndUser(
Email varchar(50),
FirstName varchar(30),
LastName varchar(30),
Password varchar(30) NOT NULL,
Primary key (Email)
);

CREATE TABLE Headphone(
ItemID int auto_increment,
Name varchar(30) NOT NULL,
Condt varchar(30) NOT NULL,
Usee varchar(30),
Color varchar(30),
Connectivities varchar(30),
Type varchar(30) NOT NULL,
ConnectorSize varchar(30),
Brand varchar(30),
Measure varchar(30),
PostDate date NOT NULL,
SEmail varchar(30) NOT NULL,
Primary key (ItemID)
);
alter table Headphone modify column PostDate datetime;
alter table Headphone add column status int;



Create Table Alert (
Email varchar(50),
ItemID int,
primary key (Email, ItemID),
foreign key (Email) references EndUser (Email)
	on delete cascade,
foreign key (ItemID) references Headphone (ItemID)
	on delete cascade
);


CREATE TABLE BidInfo(
ItemID int,
InitialPrice int NOT NULL,
CloseDateAndTime date NOT NULL,
Increment int NOT NULL,
MinPrice int NOT NULL
check(Minprice >= InitialPrice),
ShippingPrice int,
Primary key (ItemID),
Foreign key (ItemID) references Headphone (ItemID)
	on delete cascade
);
alter table BidInfo add check(InitialPrice >= 0 and Increment >0 and MinPrice >=0);
alter table BidInfo modify column CloseDateAndTime datetime;
alter table BidInfo add check(ShippingPrice >=0);

select * from Seller;
create table Seller(
Email varchar(30),
Address1 varchar(30) NOT NULL,
Address2 varchar(30),
PostCode int NOT NULL,
State varchar(30) NOT NULL,
Phone bigint,
Primary key (Email),
Foreign key (Email) references EndUser (Email)
 on delete cascade
 on update cascade
);
alter table Seller add Country varchar(30) NOT NULL;


CREATE TABLE Bid(
BidID int,
BidTime date NOT NULL,
BidPrice int NOT NULL,
ItemID int NOT NULL,
Email varchar(30) NOT NULL,
Primary key (BidID),
foreign key (Email) references EndUser (Email)
);
alter table Bid modify column BidTime datetime;
alter table Bid add Anonymous boolean NOT NULL;
alter table Bid modify column BidID int auto_increment;

CREATE TABLE CurrentBid(
ItemID int,
BidID int,
Email varchar(30) NOT NULL,
BidPrice int NOT NULL,
Primary key (BidID, ItemID),
Foreign key (BidID) references Bid (BidID)
	on delete cascade
    on update cascade,
Foreign key (ItemID) references Headphone (ItemID)
    on delete cascade
);

CREATE TABLE AutomaticlyBid(
Email varchar(30),
ItemID int,
Lmt int NOT NULL,
Primary key (ItemID, Email),
Foreign key (ItemID) references Headphone (ItemID)
	on delete cascade,
Foreign key (Email) references EndUser (Email)
	on delete cascade
    on update cascade
);


CREATE TABLE CustomerRepresentative(
Email varchar(30),
FirstName varchar(30),
LastName varchar(30),
Password varchar(30) NOT NULL,
Primary key (Email)
);


CREATE TABLE ResetPassword(
CREmail varchar(30),
Password varchar(30) NOT NULL,
EUEmail varchar(30),
ResetDate date,
Primary key (CREmail, EUEmail, ResetDate),
Foreign key (CREmail) references CustomerRepresentative (Email)
 on delete cascade,
Foreign key (EUEmail) references EndUser (Email)
	on delete cascade
    on update cascade
);

CREATE TABLE RemoveBid(
CREmail varchar(30) NOT NULL,
BidID int,
RemoveDate date,
Primary key (BidID)
);


CREATE TABLE AdministrativeStaff(
Email varchar(30),
Name varchar(30),
Password varchar(30) NOT NULL,
Primary key (Email)
);

CREATE TABLE Question(
Title varchar(30) NOT NULL,
Detail varchar(1000),
EUEmail varchar(30) NOT NULL,
Qid int auto_increment,
Primary key (Qid),
foreign key (EUEmail) references EndUser (Email)
	on delete cascade
);

Create TABLE Reply(
CREmail varchar(30) NOT NULL,
Detail varchar(1000) NOT NULL,
Qid int,
Primary key (Qid),
Foreign key (Qid) references Question (Qid)
	on delete cascade,
Foreign key (CREmail) references CustomerRepresentative (Email)
	on delete cascade
    on update cascade
);


create table final (
	ItemID int,
    CloseDateAndTime datetime check(CloseDateAndTime < now()),
    Email varchar(30),
    Price int,
    primary key(ItemID),
    foreign key(ItemID) references Headphone(ItemID),
    foreign key(Email) references EndUser(Email)
);


CREATE TABLE Email(
Fr varchar(30),
T varchar(30),
tm date,
Sub varchar(30),
Detail varchar(1000),
primary key (Fr, T, tm)
);
alter table Email modify column tm datetime;
