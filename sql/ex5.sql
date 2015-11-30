/*1) Customer Ids and Customer Names of customers who closed their account */
SELECT account.customerId, customer.name
FROM  account
JOIN customer
ON account.customerId = customer.customerId
WHERE dateClosed IS NOT NULL;

/*2) Names and Countries of customers I'm in charge of as an advisor 1*/                   
SELECT customer.name, countryCode.name, advisor.advisorName
FROM countryCode
INNER JOIN telephone ON countryCode.code = telephone.countryNumber
INNER JOIN customer ON telephone.customerId = customer.customerId
INNER JOIN account ON customer.customerId = account.customerId
INNER JOIN advisor ON account.advisorId = advisor.advisorId
WHERE account.advisorId = 1
ORDER BY customer.name;

/*3) The number of accounts created in 2015 and assigned to each advisor*/
SELECT account.advisorId, advisor.advisorName, (accountId) AS accountCount
FROM advisor
LEFT JOIN account ON advisor.advisorId = account.advisorId
WHERE dateOpened > '2015-01-01'
GROUP BY advisorId
HAVING accountCount > 0;

/*4) Advisor name and id of each account*/                    
SELECT advisor.advisorId, advisor.advisorName, accountType.name, account.accountId
FROM advisor
LEFT JOIN account ON advisor.advisorId = account.advisorId
LEFT JOIN accountType ON account.accountTypeId = accountType.accountTypeId;

/*5) Transactions that customer with accountId 52 made, negative specifying credit and positive for debit*/
SELECT account.accountId, transaction.date, 
	IF (transaction.accountToCredit = account.accountId, transaction.amount * -1, transaction.amount) as transaction
FROM account
INNER JOIN transaction ON account.accountId = transaction.accountToCredit 
					   OR account.accountId = transaction.accountToDebit
WHERE accountId = 52;


/*Other queries written*/
/*Showing all the transactions in chronological order*/
SELECT transaction.date, transaction.accountToDebit, transaction.accountToCredit, transaction.amount
FROM transaction
WHERE transaction.amount > 500
ORDER BY transaction.date;

/*No Results shown? Customer names that transacted with each other*/
SELECT customer.name
FROM customer
WHERE customerId IN (SELECT accountId
					FROM account
                    JOIN transaction
                    ON account.accountId = transaction.accountToCredit
                    OR account.accountId = transaction.accountToDebit);

/*ERROR? Showing customer names that transacted with each other the first time in this database*/
SELECT debit.name AS customerDebit, credit.name AS customerCredit
FROM customer AS debit, customer AS credit
JOIN account as a1 ON debit.customerId = account.customerId
JOIN account as a2 ON credit.customerId = account.customerId
JOIN transaction as t1 ON a1.accountId = transaction.accountToDebit
JOIN transaction as t2 ON a2.accountId = transaction.accountToCredit
WHERE t1.transactionId = 1;