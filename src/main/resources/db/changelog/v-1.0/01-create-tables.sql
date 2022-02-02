create table clients (
clientid number(10) not null primary key,
lastname varchar(255) not null,
firstname varchar(255) not null,
middlename varchar(255),
datebirth date not null
)
GO
create table documents (
clientid number(10) not null,
serial number(4) not null,
"NUMBER" number(6) not null,
branchCode varchar(7) not null,
issuedate date not null,
foreign key (clientid) references clients (clientid)
)
GO
create table accounts (
clientid number(10) not null,
account number(20) not null unique,
currency varchar(3) not null,
foreign key (clientid) references clients (clientid),
constraint one_client_one_currency unique (clientid, currency)
)
GO
create table balance (
account number(20) not null unique,
balance number(15,6) not null,
foreign key (account) references accounts (account)
)
GO
create table payments (
paymentid number(12) not null primary key,
payeraccount number(20) not null,
payeeaccount number(20) not null,
amount number(15,6) not null,
status varchar(4) not null,
regularpaymentid varchar(20) unique,
foreign key (payeraccount) references accounts (account),
foreign key (payeeaccount) references accounts (account)
)
GO
create table transactions (
paymentid number(12) not null primary key,
amount number(15,6) not null,
foreign key (paymentid) references payments (paymentid)
)
GO
create table regularpayments(
id long not null,
regularpaymentid varchar(20) unique not null,
payeraccount number(20) not null,
payeeaccount number(20) not null,
amount number(15,6) not null,
status varchar(4) not null,
datestart date not null,
dateend date not null,
frequency number(3) not null,
foreign key (payeraccount) references accounts (account),
foreign key (payeeaccount) references accounts (account),
foreign key (regularpaymentid) references payments(regularpaymentid)
)
GO
create table audithistory (
paymentid number(12) not null primary key,
amount number(15,6) not null,
foreign key (paymentid) references payments (paymentid)
)
GO
create table applications (
id long not null,
applicationid varchar(20) unique not null,
clientid number(10) not null,
status varchar(10) not null,
foreign key (clientid) references clients (clientid)
)
GO
create sequence auto_id_clients
start with 1000000000
increment by 1
nomaxvalue
GO
create or replace trigger auto_id_clients
before insert on clients for each row
begin
    select auto_id_clients.nextval
    into :new.clientid
    from dual;
end;
GO