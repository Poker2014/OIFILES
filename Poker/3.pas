var
x,y,z:integer;
function handle(number:integer):longint;
 var r,i:longint;
begin
 r:=1;
 for i:=1 to number do r:=r*i;
 handle:=r;
end;
function s(a,b,c:integer):real;
var l:real;
begin
	l:=(a+b+c)/2;
	exit(sqrt(l*(l-a)*(l-b)*(l-c)) );
end;
 begin
readln(x,y,z);

writeln(handle(x),' ',handle(y),' ',handle(z));
writeln(handle(x)+handle(y)+handle(z));
writeln('----');
writeln(s(x,y,z));
end.