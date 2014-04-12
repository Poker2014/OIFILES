var
n:longint;
r:array[1..10] of longint;
used:array[1..10] of longint;

procedure print;
var k:longint;
begin
	for k:=1 to n do write(r[k],' ');
writeln;	
end;

procedure dfs(i:longint);
var j:longint;
begin

if i=n then begin print;exit; end;

for j:=1 to n do begin			// try all the numbers
	if (used[j]=0) then begin
		r[j]:=i+1;
		used[j]:=1;
		dfs(i+1);
		used[j]:=0;
	end;
end;

end;

begin
readln(n);
dfs(0);
end.