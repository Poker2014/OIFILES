var
input:longint;
function s(number:longint):longint;
begin
	if(number=1) then exit(1);
	exit(number*s(number-1));
end;
begin
	readln(input);
	writeln(s(input));
end.