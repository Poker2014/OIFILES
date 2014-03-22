var n:integer;
procedure hannoi(i,x,y,z:integer);
begin
	if(i=1) then writeln(1,': ',x,' --> ',z)
	else
	begin
		hannoi(i-1,x,z,y);
		writeln(i,': ',x,' --> ',z);
		hannoi(i-1,y,x,z);
	end;
end;

function count(n:integer):longint;
begin
	if(n=1) then exit(1);
	exit(2*count(n-1)+1);
end;

begin
	readln(n);
	hannoi(n,1,2,3);
	writeln(count(n));
end.