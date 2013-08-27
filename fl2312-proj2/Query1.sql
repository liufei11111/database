--update course c
--set c.gpa=(
--SELECT AVG(gpa)
--FROM register r
--where r.cid=c.cid
--group by r.cid
--);
--alter table student add (gpa float);
update student s
set s.gpa=(
SELECT AVG(r.gpa)
FROM register r,student s1
where r.sid=s1.sid AND s.sid=s1.sid
group by s1.sid
);
