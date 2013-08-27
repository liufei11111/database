load data
infile './Financial_Service.csv'
into table Financial_Service
fields terminated by "," optionally enclosed by '""'
(pid,financial_aid)
