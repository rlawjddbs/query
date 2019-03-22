create or replace function plus(num1 number, num2 number)
return number
is
    result number;
begin

	result := nvl(num1, 0) + nvl(num2, 0);
	return result;
end;
/
