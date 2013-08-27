
SELECT T1.sid,T2.numberofCourse*5*3000 - T3.totalpayoffofEmployment- T1.financialaid+ housing_cost + i3.after_discount(0.95) as TuitionDue,ss3.housing, i3.Company_name as InsuCompany,i3.plan_type
FROM (Select  s.sid,s.firstname,s.lastname,f.financial_aid as financialaid
FROM student s, Financial_service f
Where s.sid=f.sid) T1,
(SELECT s.sid,count(*) as numberofCourse
FROM course c, student s, register r
Where c.cid=r.cid AND s.sid=r.sid
Group by s.sid)T2,
(Select s.sid,totalhours*payrate as totalpayoffofEmployment
From student s, employment e, work_as w
Where s.sid=w.sid AND e.ssn=w.ssn)T3,Receive r3, Student_Service
ss3,purchase_insurance pi3,insurance_obj_table i3,Financial_service fs3
Where T1.sid=T2.sid AND T3.sid=T2.sid AND r3.Student_No=ss3.Student_No 
AND r3.sid=T1.sid AND pi3.pid=fs3.pid AND fs3.sid=T1.sid AND pi3.iid=i3.iid;

