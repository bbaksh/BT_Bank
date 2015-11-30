/*View Current Balance for each account*/
CREATE VIEW balance AS (
SELECT accountId, current_date() as currentDate, SUM(transactions) as balanceTransactions
FROM ( 
SELECT 
	account.accountId, 
	transaction.date, 
    IF(transaction.accountToCredit = account.accountId, transaction.amount * -1, transaction.amount) as transactions
FROM account
INNER JOIN transaction ON 
	account.accountId = transaction.accountToCredit 
	OR account.accountId = transaction.accountToDebit
) AS allT
GROUP BY accountId);

/*View all accounts for a specific customer*/
CREATE VIEW myAccounts AS (
SELECT account.accountId,accountType.name, dateOpened, dateClosed
FROM account
JOIN accountType
ON account.accountTypeId = accountType.accountTypeId
WHERE account.customerId = 52);

/*Inserting into view*/
INSERT INTO balance (accountId, currentDate, balanceTransactions)
VALUES (3001,current_date(), 200);