
/* Drop Tables */

DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE FOODBBS CASCADE CONSTRAINTS;
DROP TABLE HEART CASCADE CONSTRAINTS;
DROP TABLE IMAGE CASCADE CONSTRAINTS;
DROP TABLE LINECOMMENTS CASCADE CONSTRAINTS;
DROP TABLE MAPPINGLINECOMMENTS CASCADE CONSTRAINTS;
DROP TABLE MAPPING CASCADE CONSTRAINTS;
DROP TABLE ONEMEMO CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE VERIFICATION CASCADE CONSTRAINTS;
DROP TABLE WEIGHTBBS CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE WEIGHTLIST CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_FOODBBS;
DROP SEQUENCE SEQ_HNO;
DROP SEQUENCE SEQ_LINECOMMENTS;
DROP SEQUENCE SEQ_MAPPING;
DROP SEQUENCE SEQ_MAPPINGLINECOMMENTS;
DROP SEQUENCE SEQ_ONEMEMO;
DROP SEQUENCE SEQ_RNO;
DROP SEQUENCE SEQ_VERIFICATION;
DROP SEQUENCE SEQ_WEIGHTBBS;
DROP SEQUENCE SEQ_WEIGHTLIST;




/* Create Sequences */

CREATE SEQUENCE SEQ_BNO NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_FOODBBS NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_HNO NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_LINECOMMENTS NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_MAPPING NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_MAPPINGLINECOMMENTS NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_ONEMEMO NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_RNO NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_VERIFICATION NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_WEIGHTBBS NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_WEIGHTLIST NOCACHE NOCYCLE;



/* Create Tables */

CREATE TABLE BOARD
(
	BNO  NOT NULL,
	SUBJECT nvarchar2(50) NOT NULL,
	CONTENT nvarchar2(1000) NOT NULL,
	HIT  DEFAULT 0  NOT NULL,
	REPLY  DEFAULT 0  NOT NULL,
	HEART  DEFAULT 0  NOT NULL,
	WDATE date NOT NULL,
	ID varchar2(10 char),
	CONSTRAINT PRIMARY KEY (BNO)
);


CREATE TABLE FOODBBS
(
	F_NO  NOT NULL,
	F_NAME nvarchar2(50) NOT NULL,
	F_SIZE  NOT NULL,
	F_KCAL  NOT NULL,
	F_TAN  NOT NULL,
	F_DAN  NOT NULL,
	F_GI  NOT NULL,
	F_POSTDATE date NOT NULL,
	ID varchar2(10 char),
	CONSTRAINT PRIMARY KEY (F_NO)
);


CREATE TABLE HEART
(
	HNO  NOT NULL,
	ID varchar2(10 char),
	BNO  NOT NULL,
	CONSTRAINT PRIMARY KEY (HNO)
);


CREATE TABLE IMAGE
(
	INO  NOT NULL,
	I_SRC  NOT NULL,
	BNO  NOT NULL,
	CONSTRAINT PRIMARY KEY (INO)
);


CREATE TABLE LINECOMMENTS
(
	LNO  NOT NULL,
	LINECOMMENT nvarchar2(50) NOT NULL,
	LPOSTDATE date DEFAULT SYSDATE,
	NO  NOT NULL,
	ID varchar2(10 char),
	CONSTRAINT PRIMARY KEY (LNO)
);


CREATE TABLE MAPPING
(
	NO  NOT NULL,
	TITLE nvarchar2(100),
	CONTENT nvarchar2(2000),
	EVENTADDRESS nvarchar2(100),
	POSTDATE date DEFAULT sysdate,
	EVENTDATE date DEFAULT sysdate,
	ID varchar2(10 char) NOT NULL,
	LATITUDE number(20,18),
	LONGITUDE number(20,17),
	CONSTRAINT PRIMARY KEY (NO)
);


CREATE TABLE MAPPINGLINECOMMENTS
(
	LNO  NOT NULL,
	LINECOMMENT nvarchar2(50) NOT NULL,
	LPOSTDATE date DEFAULT SYSDATE,
	NO  NOT NULL,
	ID varchar2(10 char) NOT NULL,
	CONSTRAINT PRIMARY KEY (LNO)
);


CREATE TABLE MEMBER
(
	ID varchar2(10 char) NOT NULL,
	PWD varchar2(10 char) NOT NULL,
	NAME varchar2(10 char) UNIQUE,
	GENDER nvarchar2(2) NOT NULL,
	BIRTH varchar2(20 char) NOT NULL,
	PHONE varchar2(20 char) NOT NULL,
	EMAIL varchar2(50 char) UNIQUE,
	PROFILE blob,
	CONSTRAINT PRIMARY KEY (ID)
);


CREATE TABLE ONEMEMO
(
	NO  NOT NULL,
	TITLE nvarchar2(100),
	CONTENT nvarchar2(2000),
	POSTDATE date DEFAULT sysdate,
	ID varchar2(10 char) NOT NULL,
	CONSTRAINT PRIMARY KEY (NO)
);


CREATE TABLE REPLY
(
	RNO  NOT NULL,
	GRP  NOT NULL,
	GRPS  NOT NULL,
	GRPL  NOT NULL,
	CONTENT nvarchar2(1000) NOT NULL,
	RWDATE date NOT NULL,
	RWGAP  NOT NULL,
	BNO  NOT NULL,
	ID varchar2(10 char),
	CONSTRAINT PRIMARY KEY (RNO)
);


CREATE TABLE VERIFICATION
(
	NO  NOT NULL,
	MID varchar2(10 char) NOT NULL,
	LOCATION nvarchar2(30) NOT NULL,
	CONSTRAINT PRIMARY KEY (NO)
);


CREATE TABLE WEIGHTBBS
(
	W_NO  NOT NULL,
	W_KG varchar2(100 char) NOT NULL,
	W_COUNT varchar2(100 char) NOT NULL,
	W_POSTDATE date NOT NULL,
	NO ,
	ID varchar2(10 char),
	CONSTRAINT PRIMARY KEY (W_NO)
);


CREATE TABLE WEIGHTLIST
(
	NO  NOT NULL,
	TYPE nvarchar2(10) NOT NULL,
	NAME nvarchar2(20) NOT NULL,
	CONSTRAINT PRIMARY KEY (NO)
);



/* Create Foreign Keys */

ALTER TABLE MAPPINGLINECOMMENTS
	ADD CONSTRAINT SYS_C007594 FOREIGN KEY (NO)
	REFERENCES MAPPING (NO)
;


ALTER TABLE BOARD
	ADD CONSTRAINT PK_MEMBER_7 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE FOODBBS
	ADD CONSTRAINT PK_MEMBER_2 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE HEART
	ADD CONSTRAINT PK_MEMBER_9 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE LINECOMMENTS
	ADD CONSTRAINT PK_MEMBER_6 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE MAPPING
	ADD CONSTRAINT PK_MEMBER_3 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE MAPPINGLINECOMMENTS
	ADD CONSTRAINT PK_MEMBER_10 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE ONEMEMO
	ADD CONSTRAINT PK_MEMBER_5 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE REPLY
	ADD CONSTRAINT PK_MEMBER_8 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE VERIFICATION
	ADD CONSTRAINT PK_MEMBER_4 FOREIGN KEY (MID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE WEIGHTBBS
	ADD CONSTRAINT PK_MEMBER_1 FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
	ON DELETE CASCADE
;


ALTER TABLE LINECOMMENTS
	ADD CONSTRAINT FOREIGN KEY (NO)
	REFERENCES ONEMEMO (NO)
;


ALTER TABLE WEIGHTBBS
	ADD CONSTRAINT FOREIGN KEY (NO)
	REFERENCES WEIGHTLIST (NO)
;



