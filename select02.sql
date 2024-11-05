단일행 함수

임시로 사용하는 테이블 dual 
select * from dual;

select ename, INITCAP('ABCDE'), INITCAP(ename)
from emp;

select LOWER(name), UPPER(name)
from student;

select LENGTH('abcdefaef'), LENGTHB('abcdefaef'),
    LENGTH('점심'), LENGTHB('점심')
from dual;

select *
from emp --이름 5글자이상인 사람들
where LENGTH(ename) >= 5;

select '아침' || '점심', CONCAT('아침', '점심')
from dual;

select '아침'||'점심'||'저녁' , CONCAT( CONCAT('아침', '점심'), '저녁')
from dual;

-- SUBSTR(대상, 시작지점, 자리수)
select 
    SUBSTR('abcdefg', 1, 3),
    SUBSTR('abcdefg', 3, 5),
    SUBSTR('abcdefg', -5, 2)
from dual;

select 
    name, 
    SUBSTR(jumin,3,4) Birthday,
    SUBSTR(jumin,3,4) - 1 "Birthday - 1"
from student
where deptno1 = 101
;

--INSTR(대상, 찾는, 시작, 몇번째[1] )
select
    INSTR('2024/11/04 10/45/45', '/', 1),
    INSTR('2024/11/04 10/45/45', '/', 6),
    INSTR('2024/11/04 10/45/45', '/', 1, 4),
    INSTR('2024/11/04 10/45/45', '/', 6, 2),
    INSTR('2024/11/04 10/45/45', '/', 1, 5),
    INSTR('2024/11/04 10/45/45', '/', 16, 2)
from dual;

select name, tel, INSTR(tel, ')')
from student
where deptno1 = 201;


SELECT
    LPAD('문자', 10, '*'),
    LPAD(123, 5, 0),
    LPAD(33, 3, 0)
FROM dual;

SELECT
    LPAD(id, 10, '*'),
    RPAD(id, 10, '*')
FROM student;

select LPAD(ename, 9, 123456789)
from emp;

--TRIM -> 불필요한요소 제거
--공백제거용
select LTRIM('abcd', 'a'),
    RTRIM('abcd', 'd'),
    RTRIM('abcd', 'b'),
    LTRIM('abcd', 'd'),
    LTRIM(' abcd '),
    RTRIM(' abcd '),
    TRIM(' abcd '),
    TRIM(' a b c d ')
FROM dual;


select 
    REPLACE('abcde', 'c', '*'),
    REPLACE('2024-11-04', '-', '/')
FROM dual;



----------------
SELECT
    ROUND(1.66, 1),
    TRUNC(1.4567, 2),
    TRUNC(1.4567, 0),
    TRUNC(123.4567, -1),
    MOD(15,4),
    CEIL(123.133),
    FLOOR(123.1333),
    POWER(3,5) --
FROM dual;

select 
    rownum, --행번호
    CEIL(rownum/3),     --1/3 = 0.33  2/3 = 0.66 3/3 = 1  4/3 = 1.33 1.66 2
    CEIL(rownum/4),     --1/4=0.25 2/4=0.5 3/4=0.75 4/4=1 5/4=1.25
    empno,
    ename
--select *    
from emp;
--where deptno = 30;



SELECT
    null, 
    SYSDATE, --현재날짜시간 24/11/04  YY/MM/DD YYYY-MM-DD
    SYSTIMESTAMP,
    MONTHS_BETWEEN('2024-01-05', '2024-03-05'), -- 앞에날짜 - 뒤에날짜 (월로 환산)
    MONTHS_BETWEEN('2024-03-05', '2024-01-05'),
    ADD_MONTHS(SYSDATE, 3),   --11/4 -> 3개월수
    LAST_DAY(SYSDATE),  -- 28 , 31, 30
    NEXT_DAY(SYSDATE, '수'),
    NEXT_DAY(SYSDATE, '토')
FROM dual;

SELECT
    ROUND(SYSDATE), --  24/11/04 15:48:ss    12:00
    TRUNC(SYSDATE),
    TRUNC(123.113, 1),
    TRUNC(SYSDATE, 'MM'), --Year Month Day
    TRUNC(SYSDATE, 'YY'),
    ADD_MONTHS(SYSDATE, 1),
    SYSDATE + 3,
    SYSDATE - 3,
    SYSDATE + 7,
    --다음달의 첫날
    TRUNC(ADD_MONTHS(SYSDATE,1 ), 'MM'),
    LAST_DAY(SYSDATE)+1,
    --전월의 마지막 날
    TRUNC(SYSDATE, 'MM') -1,
    LAST_DAY(ADD_MONTHS(SYSDATE, -1 ))
FROM dual;


------------------------
SELECT 2 + '2'  --자동형변환
FROM dual;

SELECT 2 || '123a'  
FROM dual;

SELECT
    TO_CHAR(123),
    TO_CHAR(590493.238),
    TO_CHAR(502.23),
    SYSDATE,
    TO_CHAR(SYSDATE),  --날짜 -> 문자
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),     --24/11/04   2024-11-04
    TO_CHAR(SYSDATE, 'DD'),
    TO_CHAR(SYSDATE, 'YYYYMMDD'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT 
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'HH24:MI:SS'),
    TO_CHAR( ROUND(SYSDATE), 'YYYY-MM-DD HH24:MI:SS')
FROM dual;


SELECT
    TO_CHAR(1234, '999999'),
    TO_CHAR(1234, '099999'),
    TO_CHAR(1234, '$99999'),
    '$' || 1234,
    TO_CHAR(1234, '99999.99'),
    TO_CHAR(1234, '99,999')
FROM dual;


--문자 -> 날짜  TO_DATE
SELECT      
    TO_DATE('2024-06-02') + 3,
    TO_DATE('2024/06/02') + 3,
    TO_DATE('24/06/02') + 3,
    TO_DATE('20240602') + 3,
    LAST_DAY('2024-08-05'),
    TO_DATE('24:06:02') + 3,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_DATE('2024-01-05', 'YYYY-MM-DD'),
    TO_DATE('2024,01,05', 'YYYY,MM,DD'),
    TO_DATE('12/10/20', 'MM/DD/YY')     --12년 10월 20일 -> 12월 10일 20년도
FROM dual;



--NVL

select 
    sal,
    comm,
    sal*12+comm,   --숫자*12 + null 
    sal*12 + NVL(comm, 0)
from emp;

select 
    sal*12+comm   --숫자*12 + null 
from emp
where comm IS NOT NULL
UNION ALL
select 
    sal*12   --숫자*12 + null 
from emp
where comm IS NULL;



SELECT
    NVL(null, 10),
    NVL2(123, '있다', '없다'),
    NVL2(null, '있다', '널이다')
FROM dual;

--DECODE

SELECT 
    DECODE(10, 10, '같다', '다르다'),
    DECODE(10, 20, '같다', '다르다'),
    DECODE(10, 20, '같다'),  --DECODE(10, 20, '같다', null)
    DECODE(10, 20, '같다', null),
    DECODE(50, 30, '30이다', 40, '40이다', 50, '50이다', '아니다'),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', '아니다'),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', null),
    DECODE(40, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다')
FROM dual;

select 
    deptno, name,
    DECODE(deptno, 101, '컴퓨터공학', '다른학과'),
    DECODE(deptno, 101, '컴퓨터공학', 'ETC'),
    DECODE(deptno, 101, '컴퓨터공학'),
    DECODE(deptno, 101, '컴퓨터공학', null)
from professor;

select 
    deptno, name,
    DECODE(deptno, 101, '컴퓨터공학', 102, '멀티미디어', 103, '소프트웨어', 'ETC') DNAME,
    deptno
from professor;

-- 조건? 참:거짓       조건? 참:거짓      조건? 참: ( 조건? 참:거짓   )   


--case

--grade 학년
--1 1학년 2 2학년 3 3학년 4 4학년
select grade || '학년'
from student;

--1 저학년 2 저학년 3 고학년 4 고학년
SELECT
    grade,
    DECODE(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4, '고학년') 구분,
    CASE grade
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
    END AS "학년구분",
    CASE
        WHEN grade IN (1,2) THEN '저학년'
        WHEN grade BETWEEN 3 AND 4 THEN '고학년'
    END 학년구분
FROM student;








