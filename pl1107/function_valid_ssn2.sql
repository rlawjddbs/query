-- 주민번호의 유효성 검증
-- 각 자리에 2,3,4,5,6,7,8,9,2,3,4,5 를 곱한 값을 더해서
-- 11로 나눈 나머지를 구하고 11에서 뺀값을 10으로 나눈
-- 나머지를 구해 그 값이 주민번호의 마지막 숫자와 같다면 유효 | 무효
create or replace function valid_ssn(ssn char)
return varchar2
is

begin

end;
/
