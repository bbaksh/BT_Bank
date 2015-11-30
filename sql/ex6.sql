/*Delete Advisor 1 and Assign advisor with least account to the accounts that need an advisor*/
UPDATE account
SET account.advisorId = (SELECT account.advisorId
							FROM account /*Same table, need to split*/
                            GROUP BY account.advisorId
                            ORDER BY COUNT(*) ASC LIMIT 1)
WHERE account.advisorId = 1;
DELETE FROM advisor
WHERE advisorId = 1;

/*Add 100 dollars to accounts that over a specific value*/
INSERT INTO transaction(accountToDebit,date,amount)
SELECT balance.accountId, balance.currentDate, 100 as gift
FROM balance
WHERE balance.balanceTransactions < 0;

/*Update all accounts with balance 0 to have an account closed date*/
UPDATE account
SET dateClosed = current_date() 
WHERE balance.transactions = 0 AND account.accountID != 
	(SELECT account.accountId
	 FROM account /*Same table, need to split*/
     JOIN transaction
     ON account.accountId = transaction.accountToCredit OR account.accountId = transaction.accountToDebit
	 WHERE transaction.date > DATE_SUB(current_date(),INTERVAL 3 MONTH)
     GROUP BY account.accountId);/* doesnt have transactions in the last 3 months*/;