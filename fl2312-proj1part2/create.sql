--@drop_schema_tables.sql;
purge recyclebin;

CREATE TABLE Department(
    did VARCHAR2(20),
    Major VARCHAR2(20),
    PRIMARY KEY (did),
    constraint Major_notNull
    check (Major != NULL)
);

CREATE TABLE Student(
     sid  VARCHAR2(20),
  firstname VARCHAR2(20),
   lastname VARCHAR2(20),
       dob DATE,
    gpa float,
    PRIMARY KEY(sid),
    constraint Firstname_notNull
    check (firstname != NULL )
);

CREATE TABLE Course(
    cid VARCHAR2(20),
    name VARCHAR2(20),
    GPA FLOAT,
    semester VARCHAR2(20),
    Availability VARCHAR2(20),
   -- classroom VARCHAR2(20), --we decide not to go for classroom in this part
    PRIMARY KEY(cid),
   Constraint check_GPA
        CHECK(GPA<4.3 AND GPA>=0)
);


CREATE TABLE Faculty (
    fid VARCHAR2(20),
    name VARCHAR2(20),
    PRIMARY KEY(fid),
    constraint fname_notNull
    check (name != null)
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
  --  tax VARCHAR2(20),--left for expansion in the part3
 financial_aid FLOAT,
 --  tuition VARCHAR2(20),--left for expansion in the part3
       PRIMARY KEY(pid),
    constraint aid_notNegative
    check (financial_aid >=0)
);

CREATE TABLE Employment(
    SSN VARCHAR2(20),
    TypeofEmploment VARCHAR2(20),
    totalhours float,
    payrate float,
    PRIMARY KEY(SSN),
    constraint totalWork_notZero
    check (totalhours >=0)
);
CREATE TABLE Insurance(
    iid  VARCHAR2(20),
    Company_Name VARCHAR2(20),
    PRIMARY KEY(iid),
    constraint companyname_notNull
    check (Company_Name!=NULL)
);

--Below are relationship tables
CREATE TABLE Core (
   -- Major VARCHAR2(20),--left for expansion in part3
    did VARCHAR2(20),
    cid VARCHAR2(20),
    primary key(did,cid),
    FOREIGN KEY (did) REFERENCES Department, 
      FOREIGN KEY (cid) REFERENCES Course
);

CREATE TABLE Affiliate (
     sid VARCHAR2(20),
did VARCHAR2(20),
          primary key(sid),
    FOREIGN KEY (did) REFERENCES Department,
    FOREIGN KEY (sid) REFERENCES Student
);

CREATE TABLE Register (
   cid VARCHAR2(20),
  sid VARCHAR2(20),
  GPA float,
       primary key(sid,cid),
    FOREIGN KEY (cid) REFERENCES Course,
    FOREIGN KEY (sid) REFERENCES Student,
 Constraint check_GPA1
        CHECK(GPA<=4.3 AND GPA>=0)
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
CREATE TABLE Purchase_Insurance(
iid VARCHAR2(20),
pid VARCHAR2(20),
primary key(iid,pid),
foreign key(iid) references Insurance,
foreign key (pid) references Financial_service);

