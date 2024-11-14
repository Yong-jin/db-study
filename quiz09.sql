								
DELETE FROM 테이블
    DML	데이터삭제 / WHERE조건 특정데이터				COMMIT/ROLBACLK
TRUNCATE TABLE
    DDL	통으로 데이터삭제			ROLLBACK 기회x	
							
CREATE TABLE T_MEMBER_POINT								
(								
	id NUMBER(6),							
	no NUMBER(6),							
	member_id VARCHAR2(24) NOT NULL,							
	point NUMBER(3),							
	point_date DATE DEFAULT SYSDATE							
	CONSTRAINT T_MEMBER_POINT_PK PRIMARY KEY(id, no)							
);								
								
CREATE SEQUENCE T_MEMBER_POINT_PK_SEQ 								
START WITH 1								
INCREMENT BY 1								
MINVALUE 1								
MAXVALUE 999999								
NOCYCLE;								
								
INSERT INTO T_MEMBER_POINT (id, no, member_id, point)								
VALUES ( T_MEMBER_POINT_PK_SEQ.nextval,  
SELECT COUNT(*)+1 
FROM t_member_point 
WHERE member_id = 'A'
, 'A', 90);								
								
INSERT INTO T_MEMBER_POINT (id, no, member_id, point)								
VALUES ( T_MEMBER_POINT_PK_SEQ.nextval,  
SELECT COUNT(*)+1 
FROM t_member_point 
WHERE member_id = 'A'
, 'A', 90);								
								
INSERT INTO T_MEMBER_POINT (id, no, member_id, point)								
VALUES ( T_MEMBER_POINT_PK_SEQ.nextval,  
SELECT NVL(MAX(no),0)+1 
FROM t_member_point 
WHERE member_id = 'A'
, 'A', 90);								
								
								
								
INSERT INTO T_MEMBER_POINT 								
VALUES ( …. SYSDATE); 								
