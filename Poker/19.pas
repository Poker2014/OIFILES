var i,r,n,storage:longint;
var w,v:array[0..1000] of longint;
procedure dfs(i,left,sum:longint);
begin
if i=n then begin
	if sum>r then r:=sum;
	exit;
end;
dfs(i+1,left,sum);
if left>=w[i+1] then
	dfs(i+1,left-w[i+1],sum+v[i+1]);
end;

begin
read(n,storage);
for i:=1 to n do read(w[i]);
for i:=1 to n do read(v[i]);
dfs(0,storage,0);
writeln(r);
end.