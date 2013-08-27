
-- This query found the tuition through multiple causes
--tuition=#courses*5*5000-TA-financial_aid+housing_cost+insurance
SELECT T1.sid,T2.numberofCourse*5*3000 - T3.totalpayoffofEmployment- T1.financialaid+ housing_cost + i3.cost as TuitionDue,ss3.housing, i3.Company_name as InsuCompany,i3.plan_type
FROM (Select  s.sid,s.firstname,s.lastname,f.financial_aid as financialaid
FROM student s, Financial_service f
Where s.sid=f.sid) T1,
(SELECT s.sid,count(*) as numberofCourse
FROM course c, student s, register r
Where c.cid=r.cid AND s.sid=r.sid
Group by s.sid)T2,
(Select s.sid,totalhours*payrate as totalpayoffofEmployment
From student s, employment e, work_as w
Where s.sid=w.sid AND e.ssn=w.ssn)T3,Receive r3, Student_Service ss3,purchase_insurance pi3,Insurance i3,Financial_service fs3
Where T1.sid=T2.sid AND T3.sid=T2.sid AND r3.Student_No=ss3.Student_No 
AND r3.sid=T1.sid AND pi3.pid=fs3.pid AND fs3.sid=T1.sid AND pi3.iid=i3.iid;
--the difference of Average GPA and difference of tuition between students who
--register in any basic health insurance plan and students who register in 
--any advanced plan  
SELECT final1.AvgGPA -final2.AvgGPA as GPAdifference, final1.AvgTuition-final2.AvgTuition as TuitionDifference
FROM
(SELECT AVG(temp1.gpa) as AvgGPA,AVG(temp1.TuitionDue) as AvgTuition
From
(SELECT T1.gpa,T1.sid,T2.numberofCourse*5*3000 - T3.totalpayoffofEmployment- T1.financialaid+ housing_cost + i3.cost as TuitionDue,i3.plan_type
FROM (Select s.gpa, s.sid,s.firstname,s.lastname,f.financial_aid as financialaid
FROM student s, Financial_service f
Where s.sid=f.sid) T1,
(SELECT s.sid,count(*) as numberofCourse
FROM course c, student s, register r
Where c.cid=r.cid AND s.sid=r.sid
Group by s.sid)T2,
(Select s.sid,totalhours*payrate as totalpayoffofEmployment
From student s, employment e, work_as w
Where s.sid=w.sid AND e.ssn=w.ssn)T3,Receive r3, Student_Service ss3,purchase_insurance pi3,Insurance i3,Financial_service fs3
Where T1.sid=T2.sid AND T3.sid=T2.sid AND r3.Student_No=ss3.Student_No 
AND r3.sid=T1.sid AND pi3.pid=fs3.pid AND fs3.sid=T1.sid AND pi3.iid=i3.iid
AND i3.plan_type='Basic')temp1
GROUP BY temp1.plan_type
)final1,
(
SELECT AVG(temp1.gpa) as AvgGPA,AVG(temp1.TuitionDue) as AvgTuition
From
(SELECT T1.gpa,T1.sid,T2.numberofCourse*5*3000 - T3.totalpayoffofEmployment- T1.financialaid+ housing_cost + i3.cost as TuitionDue,i3.plan_type
FROM (Select s.gpa, s.sid,s.firstname,s.lastname,f.financial_aid as financialaid
FROM student s, Financial_service f
Where s.sid=f.sid) T1,
(SELECT s.sid,count(*) as numberofCourse
FROM course c, student s, register r
Where c.cid=r.cid AND s.sid=r.sid
Group by s.sid)T2,
(Select s.sid,totalhours*payrate as totalpayoffofEmployment
From student s, employment e, work_as w
Where s.sid=w.sid AND e.ssn=w.ssn)T3,Receive r3, Student_Service ss3,purchase_insurance pi3,Insurance i3,Financial_service fs3
Where T1.sid=T2.sid AND T3.sid=T2.sid AND r3.Student_No=ss3.Student_No 
AND r3.sid=T1.sid AND pi3.pid=fs3.pid AND fs3.sid=T1.sid AND pi3.iid=i3.iid
AND i3.plan_type='Advanced'
)temp1
GROUP BY temp1.plan_type
)final2;

--This one shows the student ID and the percentage of meals they eat
-- outside their Residential College out of their total meal plan 
SELECT temp1.sid, temp2.MealsInOtherHall/temp1.TotalMealsInHall as PercOfMealsSpentInOtherRC
FROM
(
SELECT s.sid,COUNT(*) as TotalMealsInHall
FROM Student s,Student_service ss,Spend_DinningPlan sdp,Receive r
WHERE s.sid=r.sid AND r.student_no=ss.student_no 
AND ss.student_no=sdp.student_no
GROUP BY s.sid) TEMP1,
(
SELECT s.sid,COUNT(*) as MealsInOtherHall
FROM Student s,Student_service ss,Spend_DinningPlan sdp,Receive r,locate l,Residential_College rc
WHERE s.sid=r.sid AND r.student_no=ss.student_no 
AND ss.student_no=sdp.student_no AND sdp.name=l.Dinningname AND l.rcname=rc.rcname AND ss.housing!= rc.rcname
GROUP BY s.sid) TEMP2
WHERE temp1.sid=temp2.sid;

