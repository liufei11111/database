load data
infile './Affiliate.csv'
into table Affiliate
fields terminated by "," optionally enclosed by '""'
(did,sid)
