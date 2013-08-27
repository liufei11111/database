load data
infile './Student_Service.csv'
into table Student_Service
fields terminated by "," optionally enclosed by '""'
(student_No,Housing,Dining,Visa)
