load data
infile './Student.csv'
into table Student
fields terminated by "," optionally enclosed by '""'
(firstname,lastname,sid,dob,gpa)
