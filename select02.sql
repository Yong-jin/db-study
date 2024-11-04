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

