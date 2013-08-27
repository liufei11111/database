--@drop_schema_tables.sql;
purge recyclebin;

CREATE TABLE Department(
    did VARCHAR2(20),
    Major VARCHAR2(20),
    PRIMARY KEY (did)
);

CREATE TABLE Student(
     sid  VARCHAR2(20),
  firstname VARCHAR2(20),
   lastname VARCHAR2(20),
       dob DATE,
    PRIMARY KEY(sid)
);

CREATE TABLE Course(
    cid VARCHAR2(20),
    GPA FLOAT,
    semester VARCHAR2(20),
    Availability VARCHAR2(20),
   -- classroom VARCHAR2(20), --we decide not to go for classroom in this part
    PRIMARY KEY(cid)
);


CREATE TABLE Faculty (
    fid VARCHAR2(20),
    name VARCHAR2(20),
    PRIMARY KEY(fid)
);

CREATE TABLE Student_Service(
    Student_No VARCHAR2(20),
    Housing VARCHAR2(20),
    Dining FLOAT,
      Visa VARCHAR2(20),
    PRIMARY KEY(Student_No)
);
CREATE TABLE Financial_Service(
    pid VARCHAR2(20),
  --  tax VARCHAR2(20),
 financial_aid FLOAT,
 --  tuition VARCHAR2(20),
       PRIMARY KEY(pid)
);

CREATE TABLE Employment(
    SSN VARCHAR2(20),
    TypeofEmploment VARCHAR2(20),
    totalhours float,
   payrate float,
    PRIMARY KEY(SSN)
);
--Below are relationship tables
CREATE TABLE Core (
   -- Major VARCHAR2(20),
    did VARCHAR2(20),
    cid VARCHAR2(20),
    primary key(did,cid),
    FOREIGN KEY (did) REFERENCES Department, 
      FOREIGN KEY (cid) REFERENCES Course
);

CREATE TABLE Affiliate (
     sid VARCHAR2(20),
did VARCHAR2(20),
          primary key(sid,did),
    FOREIGN KEY (did) REFERENCES Department,
    FOREIGN KEY (sid) REFERENCES Student
);

CREATE TABLE Register (
    cid VARCHAR2(20),
sid VARCHAR2(20),
        primary key(sid,cid),
    FOREIGN KEY (cid) REFERENCES Course,
    FOREIGN KEY (sid) REFERENCES Student
);



CREATE TABLE Receive(
    sid VARCHAR2(20),
    student_no VARCHAR2(20),
    PRIMARY KEY (sid,student_no),
    FOREIGN KEY (sid) REFERENCES Student,
    FOREIGN KEY (student_no) REFERENCES Student_Service
);
CREATE TABLE Teach(
    fid VARCHAR2(20),
    cid VARCHAR2(20),
    Primary key(fid,cid),
    FOREIGN KEY (fid) REFERENCES faculty,
    FOREIGN KEY (cid) REFERENCES Course
);

CREATE TABLE TA(
    sid VARCHAR2(20),
    cid VARCHAR2(20),
    Primary key(sid,cid),
    FOREIGN KEY (sid) REFERENCES  Student,
    FOREIGN KEY (cid) REFERENCES Course
);

CREATE TABLE Purchase(
    sid VARCHAR2(20),
    pid VARCHAR2(20),
    PRIMARY KEY (sid,pid),
    FOREIGN KEY (sid) REFERENCES Student,
    FOREIGN KEY (pid) REFERENCES Financial_Service
);



CREATE TABLE Work_as(
    sid VARCHAR2(20),
    ssn VARCHAR2(20),
    PRIMARY KEY (sid, ssn),
    FOREIGN KEY (sid) REFERENCES Student,
    FOREIGN KEY (ssn) REFERENCES Employment
);

CREATE TABLE Pay_roll(
    pid VARCHAR2(20),
 ssn VARCHAR2(20),
       PRIMARY KEY ( pid, ssn),
    FOREIGN KEY (pid) REFERENCES Financial_Service,
     FOREIGN KEY (ssn) REFERENCES Employment
);
CREATE TABLE Belongs(
did VARCHAR2(20),
fid VARCHAR2(20),
primary key(did,fid),
foreign key(did) references Department,
foreign key (fid) references Faculty
);

