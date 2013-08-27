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


exp:
	exp fl2312/wgqi5lf@ADB TABLES=Department,Student,Course,Insurance,Faculty,Student_Service,Financial_Service,Employment,Core,Affiliate,Register,Receive,Teach,TA,Work_as,Pay_roll,Belongs,Purchase_Insurance,ClubAdviser,join,dinninghall,residential_college,locate,spend_dinningplan,live_in  ROWS=Y

imp:
	imp fl2312/wgqi5lf@ADB3 TABLES=Department,Student,Course,Insurance,Faculty,Student_Service,Financial_Service,Employment,Core,Affiliate,Register,Receive,Teach,TA,Work_as,Pay_roll,Belongs,Purchase_Insurance,ClubAdviser,join,dinninghall,residential_college,locate,spend_dinningplan,live_in file=expdat.dmp  ROWS=Y

.PHONY:clean
clean:
	rm -f *~ *.swp *.swn *.bad


.PHONY:all
all: clean main	
