select s.sid, s.firstname, s.lastname, ca.clubid, ca.name, fa.name
From Student s, Course c, Faculty fa, Register rg, teach t, clubadviser ca
where s.sid=rg.sid and rg.cid=c.cid and c.cid=t.cid and t.fid=fa.fid and fa.fid=ca.fid;
