// 0-1 backpack 粗剪
var limit,num,r,i:longint;
var weight,value:array[0..300] of longint;

function rest_sv(i:longint):longint;
var j,sum:longint;
begin
	sum:=0;
	for j:=i to num do
		sum:=sum+value[j];
	exit(sum);
end;

procedure dfs(i,sw,sv:longint);
begin
	if i=num then begin
		if(sv>r) then r:=sv;
		exit;
	end;
	if rest_sv(i+1)+sv <= r then exit; //当前价值加剩余可能最大价值小于当前最优解则切掉
	dfs(i+1,sw,sv);
	if(sw+weight[i+1]<=limit) then
		dfs(i+1,sw+weight[i+1],sv+value[i+1]);
end;

begin
r:=0;
readln(num,limit);
for i:=1 to num do
	read(weight[i]);
for i:=1 to num do
	read(value[i]);
dfs(0,0,0);
writeln(r);
end.