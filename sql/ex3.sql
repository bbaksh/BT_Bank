INSERT INTO customer(customerId, password, name)
VALUES(1,'BuTCMpxq0wbM', 'Sean Lynch');

SELECT * FROM customer;

INSERT INTO email(email,customerId)
SELECT 'slynch0@booking.com', customerId 
FROM customer
WHERE name = 'Sean Lynch'; 

SELECT * FROM email;

INSERT INTO advisor VALUES (1,'Clarence Taylor',5192314572,'ctaylor0@hubpages.com');
INSERT INTO accountType VALUES (1,'Checking',0);

INSERT INTO account 
SET accountId = 1, advisorId = 1,
	customerId = (SELECT customerId 
				  FROM customer
				  WHERE name = 'Sean Lynch'),
	dateOpened = '2015-02-19',
    accountTypeId = 1;
    
SELECT * FROM account;

INSERT INTO account(accountId, customerId, dateOpened, accountTypeId, advisorId)
VALUES (3001, 52, current_date(), 2, 2);