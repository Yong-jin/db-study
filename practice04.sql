 1.
Student 테이블의 birthday 컬럼을 사용하여 생일이 1월인 학생의 이름과 birthday 를 출력하세요.

select
    studno, name, TO_CHAR(birthday, 'YYYY-MM-DD') BIRTHDAY, TO_CHAR(birthday, 'MM')
from student
--WHERE SUBSTR(birthday, 4,2) = '01'; XXXXX
--WHERE SUBSTR(jumin, 3, 2) = '01';  OOOO
WHERE TO_CHAR(birthday, 'MM') = '01';
 --테이블의 정보 팝업설명  Shitf+F4

desc student;


2.
emp 테이블의 hiredate 컬럼을 사용하여 입사일이 1,2,3 월인 사람들의 사번과 이름, 입사일을 출력하세요.

select 
    empno,
    ename,
    hiredate,
    TO_CHAR(hiredate, 'MM')
from emp
WHERE
    TO_CHAR(hiredate, 'MM') IN ('01', '02', '03');

/*
WHERE 
    TO_CHAR(hiredate, 'MM') = '01' OR
    TO_CHAR(hiredate, 'MM') = '02' OR
    TO_CHAR(hiredate, 'MM') = '03' ;
    */
--WHERE TO_CHAR(hiredate, 'MM') <= 3;

