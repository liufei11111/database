load data
infile './Register.csv'
into table register
fields terminated by "," optionally enclosed by '""'
(cid,sid)
