-- SCOTT --
-------------------------------------------------------------------------------
CREATE TABLE tbl_admin -- 관리자
(
    adminseq NUMBER(4) PRIMARY KEY -- 관리자코드
    , adminid VARCHAR2(20) NOT NULL -- 관리자ID
    , adminpw VARCHAR2(20) NOT NULL -- 관리자명
    , adminname VARCHAR2(20) NOT NULL -- 비밀번호
    , admintel VARCHAR2(20) -- 휴대폰
    , adminaddr VARCHAR2(100) -- 주소
);

CREATE TABLE tbl_member -- 회원
(
    memberseq NUMBER(4) PRIMARY KEY -- 회원코드
    , memberid VARCHAR2(20) NOT NULL -- 회원ID
    , memberpw VARCHAR2(20) NOT NULL -- 비밀번호
    , membername VARCHAR2(20) NOT NULL -- 회원명
    , membertel VARCHAR2(20) -- 휴대폰
    , memberaddr VARCHAR2(100) -- 주소
);

CREATE TABLE tbl_poll -- 설문조사
(
    pollseq NUMBER(4) PRIMARY KEY -- 설문코드
    , writer NVARCHAR2(50) NOT NULL -- 작성자
    , question NVARCHAR2(256) NOT NULL -- 질문
    , sdate CHAR(8) NOT NULL -- 시작일
    , edate CHAR(8) NOT NULL -- 종료일
    , itemcnt NUMBER(1) NOT NULL -- 답변 항목수
    , polltotal NUMBER(4) NOT NULL -- 총 참여자수
    , regdate DATE DEFAULT SYSDATE -- 작성일
    , adminseq REFERENCES tbl_admin(adminseq) NOT NULL -- 관리자코드(외래키)
);

CREATE TABLE tbl_pollsub -- 답변항목
(
    pollsubseq NUMBER(38) PRIMARY KEY -- 답변항목코드
    , pollseq REFERENCES tbl_poll(pollseq) NOT NULL -- 답변항목
    , answer NVARCHAR2(100) -- 답변항목선택수 / 득표수
    , acnt NUMBER(4) NOT NULL -- 설문코드(외래키)
);

CREATE TABLE tbl_voter -- 투표자
(
    voterseq NUMBER PRIMARY KEY -- 투표자코드
    , pollseq REFERENCES tbl_poll(pollseq) NOT NULL -- 투표일
    , pollsubseq REFERENCES tbl_pollsub(pollsubseq) NOT NULL -- 닉네임
    , memberseq REFERENCES tbl_member(memberseq) NOT NULL -- 설문코드(외래키)
    , username NVARCHAR2(256) DEFAULT '익명' -- 답변항목코드(외래키)
    , regdate DATE DEFAULT SYSDATE -- 회원코드(외래키)
);


INSERT INTO tbl_admin( adminseq , adminid, adminpw, adminname, admintel, adminaddr) VALUES(1001,'admin1','1234','관리자1', '010-1212-3434', '서울특별시 마포구');
INSERT INTO tbl_admin( adminseq , adminid, adminpw, adminname, admintel, adminaddr) VALUES(1002,'admin2','2345','관리자2', '010-5656-7878', '경기도 용인시');

INSERT INTO tbl_member( memberseq , memberid, memberpw, membername, membertel, memberaddr) VALUES(2001,'member1','1234','일길동', '010-1234-1234', '서울특별시 강남구');
INSERT INTO tbl_member( memberseq , memberid, memberpw, membername, membertel, memberaddr) VALUES(2002,'member2','2345','이길동', '010-2345-2345', '경기도 수원시');
INSERT INTO tbl_member( memberseq , memberid, memberpw, membername, membertel, memberaddr) VALUES(2003,'member3','3456','삼길동', null, null);
INSERT INTO tbl_member( memberseq , memberid, memberpw, membername, membertel, memberaddr) VALUES(2004,'member4','4567','사길동', null, null);
INSERT INTO tbl_member( memberseq , memberid, memberpw, membername, membertel, memberaddr) VALUES(2005,'member5','5678','오길동', null, null);

-- 설문 1
INSERT INTO tbl_poll( pollseq, writer, question, sdate, edate, itemcnt, polltotal, adminseq ) 
    VALUES( 3001, '관리자', '가장 좋아하는 여자 연예인은?', '20230301', '20230331', 5, 0, 1001 );   
-- 설문 1 항목
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5001, 3001, '배슬기',  0);
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5002, 3001, '김옥빈',  0 );
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5003, 3001, '아이비',  0);
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5004, 3001, '한효주', 0 );
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5005, 3001, '김태희', 0 );
-- 설문 1 투표
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq, username)
    VALUES( 6001, 3001, 5001, 2001, '일길동' );
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq)
    VALUES( 6002, 3001, 5004, 2002 );
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq, username)
    VALUES( 6003, 3001, 5004, 2003, '삼식이' );
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq)
    VALUES( 6004, 3001, 5004, 2004 );
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq, username)
    VALUES( 6005, 3001, 5005, 2005, '오길동' );
    
-- 설문 2   
INSERT INTO tbl_poll( pollseq, writer, question, sdate, edate, itemcnt, polltotal, adminseq ) 
    VALUES( 3002, '관리자', '가장 좋아하는 남자 연예인은?', '20230201', '20230228', 5, 0, 1001 );    
-- 설문 2 항목
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5006, 3002, '장동건', 0);
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5007, 3002, '김수로', 0);
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5008, 3002, '이종혁', 0);
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5009, 3002, '김우빈', 0);
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5010, 3002, '이종현', 0);
-- 설문 2 투표
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq, username)
    VALUES( 6006, 3002, 5007, 2001, '일길동' );
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq)
    VALUES( 6007, 3002, 5008, 2002 );
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq, username)
    VALUES( 6008, 3002, 5009, 2003, '삼식이' );
INSERT INTO tbl_voter(voterseq  , pollseq, pollsubseq  , memberseq)
    VALUES( 6009, 3002, 5009, 2004 );

-- 설문 3
INSERT INTO tbl_poll( pollseq, writer, question, sdate, edate, itemcnt, polltotal, adminseq ) 
    VALUES( 3003, '관리자', '강아지 vs 고양이', '20230401', '20230430', 2, 0, 1002 );
-- 설문 3 항목
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5011, 3003, '강아지', 0);
INSERT INTO tbl_pollsub(pollsubseq , pollseq  , answer  , acnt) 
    VALUES( 5012, 3003, '고양이', 0);
-- 설문 3 투표

ROLLBACK;    
COMMIT;

-- 설문 조회수 업데이트(수정)
UPDATE tbl_poll a
SET polltotal = ( SELECT COUNT(*) FROM tbl_voter WHERE pollseq = a.pollseq );
-- 설문 투표수 업데이트(수정)
UPDATE tbl_pollsub a
SET acnt = ( SELECT COUNT(*) FROM tbl_voter WHERE pollsubseq = a.pollsubseq );

SELECT * FROM tbl_admin;
SELECT * FROM tbl_member;
SELECT * FROM tbl_poll;
SELECT * FROM tbl_pollsub;
SELECT * FROM tbl_voter;

-- 설문목록
SELECT pollseq - 3000 번호, question 질문, writer 작성자, sdate 시작일, edate 종료일, itemcnt 항목수, regdate 작성일, polltotal 참여자수,
    CASE 
        WHEN TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN sdate AND edate THEN '진행중'
        WHEN sdate > TO_CHAR(SYSDATE,'YYYYMMDD') THEN '진행예정'
        ELSE '종료'
    END 상태
FROM tbl_poll t;
-- 설문보기1(정보)
SELECT pollseq - 3000 번호, question 질문, writer 작성자, TO_CHAR(SYSDATE,'YYYY-MM-DD AM HH:MI:SS') 작성일
     , TO_DATE(sdate,'YYYYMMDD') 시작일, TO_DATE(edate,'YYYYMMDD') 종료일
     , CASE 
        WHEN TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN sdate AND edate THEN '진행중'
        WHEN sdate > TO_CHAR(SYSDATE,'YYYYMMDD') THEN '진행예정'
        ELSE '종료'
       END 상태, itemcnt 항목수, polltotal 총참여자수
FROM tbl_poll
WHERE pollseq = 3001;
-- 설문보기2(항목)
SELECT a.pollseq - 3000 게시글번호, answer 항목
    ,(SELECT COUNT(*) FROM tbl_voter WHERE pollsubseq=b.pollsubseq) 항목선택
    ,LPAD(' ',(SELECT COUNT(*) FROM tbl_voter WHERE pollsubseq=b.pollsubseq)+1,'#') 막대그래프
FROM tbl_poll a RIGHT JOIN tbl_pollsub b ON a.pollseq=b.pollseq
WHERE a.pollseq = 3001
ORDER BY a.pollseq, pollsubseq;

--
DELETE FROM tbl_voter
WHERE pollseq = 3001;
DELETE FROM tbl_pollsub
WHERE pollseq = 3001;
DELETE FROM tbl_poll
WHERE pollseq = 3001;
--
DELETE FROM tbl_member
WHERE pollseq = 3001;
DELETE FROM tbl_admin
WHERE pollseq = 3001;

DROP TABLE tbl_voter PURGE;
DROP TABLE tbl_pollsub PURGE;
DROP TABLE tbl_poll PURGE;
DROP TABLE tbl_member PURGE;
DROP TABLE tbl_admin PURGE;



















