CREATE TABLE customer(
		customerId INT 			auto_increment NOT NULL CHECK(customerId > 0), 
        password VARCHAR(45)	NOT NULL,
        name VARCHAR(45)		NOT NULL,
        sinNumber VARCHAR(45),
        PRIMARY KEY(customerId)
);

CREATE TABLE account(
	   accountId INT			auto_increment NOT NULL CHECK(accountId > 0), 
       customerId INT			NOT NULL CHECK(customerId > 0), 
       dateOpened DATETIME		NOT NULL, 
       dateClosed DATETIME, 
       accountTypeId INT		NOT NULL CHECK(accountTypeId > 0),
       advisorId int			NOT NULL CHECK(advisorId > 0),
       PRIMARY KEY(accountId)
);

ALTER TABLE account 
   ADD FOREIGN KEY(customerId) REFERENCES customer(customerId),
   ADD FOREIGN KEY(accountTypeId) REFERENCES accountType(accountTypeId),
   ADD FOREIGN KEY(advisorId) REFERENCES advisor(advisorId);

CREATE TABLE transaction(
	   transactionId INT		auto_increment NOT NULL CHECK(transactionId > 0),
       accountToDebit INT		CHECK(accountToDebit > 0),
       accountToCredit INT		CHECK(accountToCredit > 0),
       date DATETIME			NOT NULL,
       description VARCHAR(45),
       amount DOUBLE			NOT NULL,
       PRIMARY KEY(transactionId),
       FOREIGN KEY(accountToDebit) REFERENCES account(accountId),
       FOREIGN KEY(accountToCredit) REFERENCES account(accountId)
);

CREATE TABLE accountType(
	   accountTypeId INT		auto_increment NOT NULL CHECK(accountTypeId > 0),
       name VARCHAR(45)			NOT NULL,
	   interestRate DOUBLE		NOT NULL,
       PRIMARY KEY(accountTypeId)
);

CREATE TABLE advisor(
	   advisorId INT			auto_increment NOT NULL CHECK(advisorId > 0),
       advisorName VARCHAR(45)	NOT NULL,
       advisorNumber VARCHAR(45) NOT NULL,
       advisorEmail VARCHAR(45) NOT NULL,
       PRIMARY KEY(advisorId)
);

CREATE TABLE email(
	   email VARCHAR(45)		NOT NULL,
       customerId int			NOT NULL CHECK(customerId > 0),
       PRIMARY KEY(email),
       FOREIGN KEY(customerId) REFERENCES customer(customerId)
);

CREATE TABLE telephone(
	   countryNumber INT		NOT NULL,
       areaNumber INT			NOT NULL,
       number VARCHAR(45)		NOT NULL,
       customerId int			NOT NULL CHECK(customerId > 0),
       PRIMARY KEY(countryNumber, areaNumber, number)
);

ALTER TABLE telephone
	ADD FOREIGN KEY(customerId) REFERENCES customer(customerId),
    ADD FOREIGN KEY(countryNumber) REFERENCES countryCode(code);

CREATE TABLE countryCode(
	   countryCodeId INT		auto_increment NOT NULL CHECK(countryCodeId > 0),
       name VARCHAR(45)			NOT NULL,
       code INT					NOT NULL,
       PRIMARY KEY(countryCodeId)
);

DESCRIBE customer;
DESCRIBE account;
DESCRIBE transaction;
DESCRIBE accountType;
DESCRIBE advisor;
DESCRIBE email;
DESCRIBE telephone;
DESCRIBE countryCode;