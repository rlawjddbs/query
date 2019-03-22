/* 영화코드 'M_000001'를 반환하는 함수 */
create or replace function movie_code
return char
is

begin
	return concat('M_', lpad(seq_movie.nextval,6,0));
end;
/
