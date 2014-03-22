var

input,i:longint;

function isP(num:longint):boolean;
var i:integer;
begin
	for i:=2 to num-1 do
		if(num mod i = 0) then exit(false);
	exit(true);
end;

begin

readln(input);
for i:=input downto 4 do
begin
	if(isP(i) and isP(i-2)) then begin writeln(i,' ',i-2);break; end;
end;

end.