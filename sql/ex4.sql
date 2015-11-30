load data local infile 'C:/Users/User/Desktop/sqlData/customerData.csv' into table customer fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
    (customerId,name,password,sinNumber);
    
load data local infile 'C:/Users/User/Desktop/sqlData/emailData.csv' into table email fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
    (email,customerId);
    
load data local infile 'C:/Users/User/Desktop/sqlData/telephoneData.csv' into table telephone fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
    (countryNumber,areaNumber,number,customerId);
    
load data local infile 'C:/Users/User/Desktop/sqlData/countryCodesData.csv' into table countryCode fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
    (countryCodeId,name,code);
    
load data local infile 'C:/Users/User/Desktop/sqlData/advisorData.csv' into table advisor fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
    (advisorId,advisorName,advisorNumber,advisorEmail);
    
load data local infile 'C:/Users/User/Desktop/sqlData/accountTypeData.csv' into table accountType fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
    (accountTypeId,name,interestRate);
    
load data local infile 'C:/Users/User/Desktop/sqlData/accountData.csv' into table account fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
    (accountId,customerId,dateOpened,dateClosed,accountTypeId,advisorId); 
    
load data local infile 'C:/Users/User/Desktop/sqlData/transactionData.csv' into table transaction fields terminated by ','
  enclosed by '"'
  lines terminated by '\r\n'
    (transactionId,accountToDebit,accountToCredit,date,description,amount);