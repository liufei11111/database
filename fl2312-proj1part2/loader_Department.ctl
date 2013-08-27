load data
infile './Department.csv'
into table Department 
fields terminated by "," optionally enclosed by '""'
(did,major)

