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

drop table Email;
select * from Headphone;
select * from Email;
update Headphone set status=0 where ItemID=40;
select h.Name, cb.BidPrice, bi.CloseDateAndTime from Headphone as h join CurrentBid as cb on h.ItemID=cb.ItemID join BidInfo as bi on h.ItemID=bi.ItemID where h.ItemID=40;

Create Table Alert (
Email varchar(50),
ItemID int,
primary key (Email, ItemID),
foreign key (Email) references EndUser (Email)
	on delete cascade,
foreign key (ItemID) references Headphone (ItemID)
	on delete cascade
);

update Headphone set InitialPrice=2, Increment=3 where ItemID=2;
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
drop table Seller;

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
select * from CurrentBid;
drop table RemoveBid;
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

show variables like '%sche%';
update Headphone set status = 0 where ItemID=63;
drop table Email;
select ItemID from AutomaticlyBid;
set global event_scheduler = ON;
select (select Price from final);
show processlist;
select  @@global.event_scheduler;
select h.Name, count(*), Max(b.BidTime) from Headphone as h join Bid as b on h.ItemID=b.ItemID where b.Email= '123@123.com' group by b.ItemID;
select BidID from Bid where Email = '12@12.com' and ItemID=40 order by BidPrice desc limit 1;
select * from Headphone;
select localtimestamp();
select Email from CurrentBid where ItemID=63;
select * from Seller;
select * from Bid;
select * from CurrentBid;
select * from BidInfo;
select * from final;
select * from AutomaticlyBid;
select * from EndUser;
select Email from CurrentBid where ItemID=42;
delete from AutomaticlyBid where ItemID=40;
drop trigger autobid;
select Email from AutomaticlyBid where ItemID=40 order by Lmt desc limit 1;
select * from Email;
DELIMITER //
CREATE TRIGGER bidPriceCheck
after INSERT ON Bid
FOR EACH ROW
BEGIN
	if (new.ItemID not in (select ItemID from CurrentBid)) THEN begin
		if (new.BidPrice < (select InitialPrice + Increment from BidInfo where BidInfo.ItemID=new.ItemID)) then begin
			signal sqlstate '44000' set message_text='error for bid price smaller then increment';
		end;
        else 
			insert into CurrentBid values (new.ItemID, new.BidID, new.Email, new.BidPrice);
		end if;
	end;
	elseif (new.BidPrice < (select BidInfo.Increment + CurrentBid.BidPrice from BidInfo, CurrentBid where CurrentBid.ItemID=new.ItemID and BidInfo.ItemID=new.ItemID))
	THEN BEGIN
			
            if (true )then begin
			Signal SQLSTATE '45000' set message_text='error for bid price smaller then current price';
			End;
            end if;
    END;
    else begin
		delete from CurrentBid where ItemID=new.ItemID;
        insert into CurrentBid values (new.ItemID, new.BidID, new.Email, new.BidPrice);
	end;
	END IF;
END//

CREATE TRIGGER datecheck
After INSERT ON BidInfo
FOR EACH ROW
BEGIN
IF (NEW.CloseDateAndTime <= (select PostDate from Headphone where new.ItemID=Headphone.ItemID))
THEN BEGIN
        Signal sqlstate '22000' set message_text='error for close date before post date';
        END;
End if;
END//

CREATE TRIGGER bidPriceCheck2
after update ON Bid
FOR EACH ROW
BEGIN
	if (new.ItemID not in (select ItemID from CurrentBid)) THEN begin
		if (new.BidPrice < (select InitialPrice + Increment from BidInfo where BidInfo.ItemID=new.ItemID)) then begin
			signal sqlstate '44000' set message_text='error for bid price smaller then increment';
		end;
        else 
			insert into CurrentBid values (new.ItemID, new.BidID, new.Email, new.BidPrice);
		end if;
	end;
	elseif (new.BidPrice < (select BidInfo.Increment + CurrentBid.BidPrice from BidInfo, CurrentBid where CurrentBid.ItemID=new.ItemID and BidInfo.ItemID=new.ItemID))
	THEN BEGIN
			
            if (true )then begin
			Signal SQLSTATE '45000' set message_text='error for bid price smaller then current price';
			End;
            end if;
    END;
    else begin
		delete from CurrentBid where ItemID=new.ItemID;
        insert into CurrentBid values (new.ItemID, new.BidID, new.Email, new.BidPrice);
	end;
	END IF;
END//



Create trigger autocheck
before insert on AutomaticlyBid
for each row
begin
if(new.Lmt < (select BidInfo.Increment + CurrentBid.BidPrice from BidInfo, CurrentBid where CurrentBid.ItemID=new.ItemID and BidInfo.ItemID=new.ItemID))
then begin
	signal sqlstate '30000' set message_text='Lmt cannot be lower then the current bid + increment';
    end;
end if;
end//

create trigger autobid
after insert on CurrentBid
for each row
begin 
	declare a bool;
    declare bidid int;
    declare eml varchar(30);
    declare p int;
	set a = (select Anonymous from Bid where ItemID=new.ItemID and Email = eml);
	
	set bidid = (select BidID from Bid where ItemID = new.ItemID order by BidPrice desc limit 1);
	
    set eml = (select Email from AutomaticlyBid where ItemID=new.ItemID order by Lmt desc limit 1);
    
    set p = (select BidPrice + Increment from CurrentBid join BidInfo where BidInfo.ItemID=new.ItemID and CurrentBid.ItemID=new.ItemID);
	if(new.ItemID in (select ItemID from AutomaticlyBid) and new.Email <> eml)
	then begin
		if ((select Lmt from AutomaticlyBid where ItemID=new.ItemID order by Lmt desc limit 1) < p)
        then begin
			insert into Email values ("System alert",eml,now(),"Alert for bid item",concat("someone bid higher then you on item",new.ItemID));
            delete from AutomaticlyBid where ItemID=new.ItemID and Email=eml;
		end;
		else begin
			signal sqlstate '30000' set message_text='!!!';
			#insert into Bid (BidTime, BidPrice, ItemID, Email, Anonymous) values (
			#now(),
             #  p,
             #  new.ItemID,
             #  eml,
            #   a
            #);
            #elete from CurrentBid where ItemID=new.ItemID;
			#nsert into CurrentBid values (new.ItemID, bidid, eml, p);
		end;
		end if;
	end;
	End if;
End//


CREATE  
EVENT closedate
ON SCHEDULE EVERY 1 MINUTE 
ON COMPLETION NOT PRESERVE ENABLE
DO 
BEGIN
	update Headphone set status = 1 where ItemID in (select bi.ItemID from BidInfo as bi where bi.CloseDateAndTime <= localtimestamp());
END //

create trigger done 
after update on Headphone
for each row
begin
	declare itemid int;
    declare min int;
    declare p int;
    declare tm datetime;
    declare eml varchar(30);
    set eml = (select Email from CurrentBid where ItemID=new.ItemID);
    set tm = (select CloseDateAndTime from BidInfo where ItemID=new.ItemID);
    set min = (select MinPrice from BidInfo where ItemID=new.ItemID);
    set itemid = new.ItemID;
    set p = (select BidPrice from CurrentBid where ItemID=new.ItemID order by BidPrice limit 1);
    if (new.status = 1 and old.status=0) then begin
		if(eml <> 'NULL') then begin
			
			if (p > min and new.status = 1 and old.status=0) then begin
				insert into final values (itemid, tm, eml,p);
				insert into Email values ("System Alert", eml, now(),"Got' em", "you are the winner");
			end;
			else begin
				insert into Email values ("System Alert", eml, now(),"not reach the reserve price","rt");
			end;
			end if;
		end;
        else begin
			set eml = new.SEmail;
			insert into Email values (concat('System Alert for ', itemid), eml, now(),"No one bid your item","");
		
		end;
		end if;
	end;
    end if;
end//

create trigger rvbid
after delete on Bid
for each row
begin
	declare bd int;
    declare eml varchar(30);
    declare bp int;
    set bd = (select BidID from Bid where ItemID=old.ItemID order by BidPrice desc limit 1);
    set eml = (select Email from Bid where ItemID=old.ItemID order by BidPrice desc limit 1);
    set bp = (select BidPrice from Bid where ItemID=old.ItemID order by BidPrice desc limit 1);
	if(old.Email = (select Email from CurrentBid where ItemID=old.ItemID)) then begin
        update CurrentBid set BidID=bd, Email=eml, BidPrice=bp;
	end;
    end if;
end//
		
create trigger rv
after insert on RemoveBid
for each row
begin
	delete from Bid where BidID = new.BidID;
end//
drop trigger done;