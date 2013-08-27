load data
infile './Faculty.csv'
into table Faculty
fields terminated by "," optionally enclosed by '""'
(fid,name)
