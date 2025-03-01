I have created a database and table with this variable names in this  script create i am doing other project so i want diferent table and differnt tablse spadce but similar to this so change the variable name where needed and make another verson for the peroject using this script

-- create tablespace

CREATE TABLESPACE INT_DATA
  DATAFILE 'C:/Chetan/Development/DB/INT_DATAA.dbf'
  SIZE 100M AUTOEXTEND ON; 
  
  
alter session set "_ORACLE_SCRIPT"=true;

-- Part 1: Create User to serve as the 'Schema Owner' of all the objects
CREATE USER INTSO IDENTIFIED BY "INTSO_pwd"
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  QUOTA UNLIMITED ON users;


-- Part 2: Create Application Connect User as one with Read-write access to the schema
CREATE USER INTCU IDENTIFIED BY "INTCU_pwd"
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE tempp;
  
ALTER USER INTSO quota unlimited on INT_DATA;


-- ROLES

--Part 1: Create application role with write access
CREATE ROLE INT_ROLE_CU_RW NOT IDENTIFIED;
GRANT CREATE SESSION TO INT_ROLE_CU_RW;
GRANT CONNECT TO INT_ROLE_CU_RW;

-- Assign ROLES
GRANT INT_ROLE_CU_RW TO INTCUU;


-- CREATE APPUSER TABLE scripts



CREATE SEQUENCE INTSO.APP_USER_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
GRANT SELECT ON INTSO.APP_USER_SEQ TO INT_ROLE_CU_RW;

CREATE TABLE INTSO.APP_USER
(
USER_SEQ_ID 	NUMBER(38,0) NOT NULL,
EMAIL_ADDRESS 	VARCHAR2(255)NOT NULL,
PASSWORD 		VARCHAR2(255)NOT NULL,
USER_NAME 		VARCHAR2(255)NOT NULL,
CONSTRAINT APP_USER_PK PRIMARY KEY(USER_SEQ_ID)
)TABLESPACE INT_DATA;

GRANT SELECT, INSERT, UPDATE, DELETE ON INTSO.APP_USER TO INT_ROLE_CU_RW;




