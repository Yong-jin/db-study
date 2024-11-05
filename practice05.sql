--
emp 테이블을 조회하여 comm 값을 가지고 있는 사람들의 
empno , ename , hiredate,
총연봉,15% 인상 후 연봉을 아래 화면처럼 출력하세요.
단 총연봉은 (sal*12)+comm 으로 계산하고
아래 화면에서는 SAL 로 출력되었으며
15% 인상한 값은 총연봉의 15% 인상 값입니다.

select
    empno,
    ename,
    TO_CHAR(hiredate, 'YYYY-MM-DD') HIREDATE,
    TO_CHAR( (sal*12)+comm , '$999,999') SAL,
    TO_CHAR( ((sal*12)+comm)*1.15 , '$999,999') "15%인상"
    --((sal*12)+comm) + ((sal*12)+comm)*0.15
from emp
where comm IS NOT NULL;