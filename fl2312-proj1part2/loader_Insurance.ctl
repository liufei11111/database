load data
infile './Insurance.csv'
into table Insurance
fields terminated by "," optionally enclosed by '""'
(iid,Company_Name)

