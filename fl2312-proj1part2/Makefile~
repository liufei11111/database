main:
	sh loader_script.sh

.PHONY:run1
run1:	
	sqlldr fl2312/wgqi5lf@ADB control=loader_test.ctl
.PHONY:run2

run2:	
	sqlldr fl2312/wgqi5lf@ADB control=loader_Department.ctl
.PHONY:run3

run3:	
	sqlldr fl2312/wgqi5lf@ADB control=loader_Student.ctl
.PHONY:run4
run4:	
	sqlldr fl2312/wgqi5lf@ADB control=loader_Employment.ctl
.PHONY:run5

run5:	
	sqlldr fl2312/wgqi5lf@ADB control=loader_Faculty.ctl
.PHONY:run6

run6:	
#	sqlldr fl2312/wgqi5lf@ADB control=loader_Student_Service.ctl
.PHONY:run7

run7:   
	sqlldr fl2312/wgqi5lf@ADB control=loader_Financial_Service.ctl
.PHONY:run8

run8:   
	sqlldr fl2312/wgqi5lf@ADB control=loader_Insurance.ctl

exp:
	exp fl2312/wgqi5lf@ADB TABLES=Department,Student,Course,Insurance,Faculty,Student_Service,Financial_Service,Employment,Core,Affiliate,Register,Receive,Teach,TA,Purchase,Work_as,Pay_roll,Belongs,Purchase_Insurance ROWS=Y
.PHONY:clean
clean:
	rm -f *~ *.swp *.swn *.bad


.PHONY:all
all: clean main	
