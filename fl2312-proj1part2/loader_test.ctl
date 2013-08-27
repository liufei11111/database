load data
infile './Course.csv'
into table Course
fields terminated by "," optionally enclosed by '""'
(cid,name,GPA,Semester,Availability)

