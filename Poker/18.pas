//   1
//  1 2
// 1 2 3
//1 2 3 4

var data:array[1..100,1..100] of integer;
var rr,rc:array[1..100] of integer;
var i,j,n,r:integer;

Procedure dfs(row,col,sum,step:integer);
var k:integer;
begin
if row=n then
	begin
		if sum>r then r:=sum;
		for k:=1 to step do write('(',data[rr[k],rc[k]],')');
		writeln;
		exit;
	end;
rr[step]:=row+1;
rc[step]:=col;
dfs(row+1,col,sum+data[row+1,col],step+1);
rr[step]:=row+1;
rc[step]:=col+1;
dfs(row+1,col+1,sum+data[row+1,col+1],step+1);
end;

Procedure main;
begin
readln(n);
for i:=1 to n do
	for j:=1 to i do read(data[i,j]);
r:=0;
dfs(1,1,data[1,1],1);
writeln(r);
end;

begin
main;
end.