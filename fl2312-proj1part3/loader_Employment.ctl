load data
infile './Employment.csv'
into table Employment 
fields terminated by "," optionally enclosed by '""'
(ssn,TypeofEmploment,totalhours,payrate)
