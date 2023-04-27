DROP database IF EXISTS Assignment02;
CREATE DATABASE IF NOT EXISTS Assignment02;
USE Assignment02;

-- create table Student
DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT(
Student_Id          INT               AUTO_INCREMENT,
StudentName         VARCHAR(30)       NOT NULL,
StudentBirthday     DATE              NOT NULL,
StudentGender       VARCHAR(10)       NOT NULL,
StudentAddress      VARCHAR(50)       NOT NULL,
CONSTRAINT          student_pk        PRIMARY KEY(Student_Id)
);

-- create table Guardian
DROP TABLE IF EXISTS GUARDIAN;
CREATE TABLE GURADIAN(
Guardian_Id         INT                AUTO_INCREMENT,
GuardianName        VARCHAR(30)        NOT NULL,
GuardianAddress     VARCHAR(50)        NOT NULL,
GuardianBirthday    DATE               NOT NULL,
GuardianGender      VARCHAR(10)        NOT NULL,
GuardianPhone       VARCHAR(15)        UNIQUE,
CONSTRAINT          guardian_pk        PRIMARY KEY(Guardian_Id)
);

-- create intersection table betwwen table STUDENT and Table GUARDIAN
DROP TABLE IF EXISTS STUDENT_has_Guardian;
CREATE TABLE STUDENT_has_Guardian (
Student_Id          INT                      NOT NULL,
Guardian_Id         INT                      NOT NULL,
CONSTRAINT stu_gur PRIMARY KEY (Guardian_Id, Student_Id ),
CONSTRAINT stufk   FOREIGN KEY(Student_Id)    
REFERENCES STUDENT(Student_Id)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT gurfk   FOREIGN KEY(Guardian_Id)    
REFERENCES GURADIAN(Guardian_Id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

-- create table test
DROP TABLE IF EXISTS TEST;
CREATE TABLE TEST(
Test_Id        INT                AUTO_INCREMENT,
TestName       VARCHAR(30)        NOT NULL,
TeatDate       DATE               NOT NULL,
TestResult     VARCHAR(10)        NOT NULL,
CONSTRAINT     test_pk            PRIMARY KEY(Test_id)
);

-- create intersection table between table Student and table Test
DROP TABLE IF EXISTS STUDENT_has_TEST;
CREATE TABLE STUDENT_has_TEST (
Student_Id          INT                  NOT NULL,
Test_Id             INT                      NOT NULL,
CONSTRAINT stu_tes PRIMARY KEY ( Student_Id, Test_id ),
CONSTRAINT stfk   FOREIGN KEY(Student_Id)    
REFERENCES STUDENT(Student_Id)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT tesfk FOREIGN KEY(Test_id)    
REFERENCES TEST(Test_id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

-- create table discipinary_action
DROP TABLE IF EXISTS DISCILINARY_ACTION;
CREATE TABLE DISCILINARY_ACTION(
DISCILINARY_ACTION_Id         INT            AUTO_INCREMENT,
IncidentType                  VARCHAR(30)    NOT NULL,
CONSTRAINT       dis_act      PRIMARY KEY(DISCILINARY_ACTION_Id)
);

-- create association table between table STUDENT and table DISCILINARY_ACTION

DROP TABLE IF EXISTS DISCILINARYACTION_ON_STUDENT;
CREATE TABLE DISCILINARYACTION_ON_STUDEN(
IncidentDate                  DATE                     NOT NULL,
DiscilinaryActtionTaken       VARCHAR(50)              NOT NULL,
Student_Id                    INT                      NOT NULL,
DISCILINARY_ACTION_Id         INT                      NOT NULL,
CONSTRAINT stu_dcp PRIMARY KEY ( Student_Id, DISCILINARY_ACTION_Id ),
CONSTRAINT stuufk   FOREIGN KEY(Student_Id)    
REFERENCES STUDENT(Student_Id)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT dcpfk FOREIGN KEY(DISCILINARY_ACTION_Id)    
REFERENCES DISCILINARY_ACTION(DISCILINARY_ACTION_Id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

-- create table club
DROP TABLE IF EXISTS CLUB;
CREATE TABLE CLUB(
Club_Id              INT           AUTO_INCREMENT,
ClubName             VARCHAR(50)   NOT NULL,
CONSTRAINT           club_pk       PRIMARY KEY(Club_Id )
);

-- create association table between table STUDENT and table CLUB
DROP TABLE IF EXISTS STUDENT_has_CLUB;
CREATE TABLE STUDENT_has_CLUB(
Student_Club_Position      VARCHAR(50)       NOT NULL,
Student_Id                 INT               NOT NULL,
Club_Id                    INT               NOT NULL,
CONSTRAINT stu_clb PRIMARY KEY ( Student_Id, Club_Id ),
CONSTRAINT sttufk   FOREIGN KEY(Student_Id)    
REFERENCES STUDENT(Student_Id)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT clbfk FOREIGN KEY(Club_Id)    
REFERENCES CLUB(Club_Id)
ON UPDATE CASCADE
ON DELETE CASCADE
);




