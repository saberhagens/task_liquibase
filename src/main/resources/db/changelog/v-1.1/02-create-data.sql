insert into clients (lastname, firstname, middlename, datebirth) values ('Петров', 'Иван', 'Петрович', to_date('18.01.94','DD.MM.RR'))
GO
insert into clients (lastname, firstname, middlename, datebirth) values ('Волохов', 'Алекснадр', '', to_date('06.07.98','DD.MM.RR'))
GO
insert into clients (lastname, firstname, middlename, datebirth) values ('Иванов', 'Пётр', 'Витальевич', to_date('23.01.86','DD.MM.RR'))
GO


insert into documents (clientid, serial, "NUMBER", branchcode, issuedate) values ('1000000000', '1234', '567890', '563-986', to_date('01.07.00','DD.MM.RR'))
GO
insert into documents (clientid, serial, "NUMBER", branchcode, issuedate) values ('1000000000', '5623', '784512', '065-447', to_date('11.07.20','DD.MM.RR'))
GO
insert into documents (clientid, serial, "NUMBER", branchcode, issuedate) values ('1000000001', '1234', '567890', '096-245', to_date('07.09.19','DD.MM.RR'))
GO
insert into documents (clientid, serial, "NUMBER", branchcode, issuedate) values ('1000000002', '1234', '567890', '053-237', to_date('11.10.15','DD.MM.RR'))
GO


insert into accounts (clientid, account, currency) values ('1000000000', '45369875412365315487', 'RUB')
GO
insert into accounts (clientid, account, currency) values ('1000000000', '45369875412365315488', 'USD')
GO
insert into accounts (clientid, account, currency) values ('1000000000', '45369875412365315489', 'EUR')
GO
insert into accounts (clientid, account, currency) values ('1000000001', '45369875412365315492', 'RUB')
GO
insert into accounts (clientid, account, currency) values ('1000000001', '45369875412365315495', 'EUR')
GO


insert into balance (account, balance) values ('45369875412365315487', '12546,36')
GO
insert into balance (account, balance) values ('45369875412365315488', '42,00')
GO
insert into balance (account, balance) values ('45369875412365315489', '124563244,36')
GO
insert into balance (account, balance) values ('45369875412365315492', '15000,36')
GO
insert into balance (account, balance) values ('45369875412365315495', '99999,99')
GO


insert into payments (paymentid, payeraccount, payeeaccount, amount, status, regularpaymentid) values ('1', '45369875412365315487', '45369875412365315492', '100', 'DONE', '1234-5678-9101-45789')
GO
insert into payments (paymentid, payeraccount, payeeaccount, amount, status) values ('2', '45369875412365315489', '45369875412365315495', '200', 'DONE')
GO
insert into payments (paymentid, payeraccount, payeeaccount, amount, status) values ('3', '45369875412365315487', '45369875412365315488', '300', 'DONE')
GO


insert into regularpayments (id, regularpaymentid, payeraccount, payeeaccount, amount, status, datestart, dateend, frequency) values ('1', '1234-5678-9101-45789', '45369875412365315487', '45369875412365315492', '100', 'STOP', to_date('04.07.11','DD.MM.RR'), to_date('06.07.11','DD.MM.RR'),'010')
GO


insert into transactions (paymentid, amount) values ('1', '100')
GO
insert into transactions (paymentid, amount) values ('2', '200')
GO
insert into transactions (paymentid, amount) values ('3', '300')
GO


insert into audithistory (paymentid, amount) values ('1', '100')
GO
insert into audithistory (paymentid, amount) values ('2', '200')
GO
insert into audithistory (paymentid, amount) values ('3', '300')
GO


insert into applications (id, applicationid, clientid, status) values ('1', '1234-5678-9101-45789', '1000000000', 'STOP')
GO
