// 0-1 backpack 细剪
var limit,num,r,i:longint;
var weight,value:array[0..300] of longint;
var rho:array[0..300] of real;

procedure sort();
var tmp,i,j:longint;
var tmp2:real;
begin
	for i:=1 to num-1 do begin
		for j:=i+1 to num do begin
			if(rho[j]>rho[i]) then begin
				tmp:=weight[i];weight[i]:=weight[j];weight[j]:=tmp;
				tmp:=value[i];value[i]:=value[j];value[j]:=tmp;
				tmp2:=rho[i];rho[i]:=rho[j];rho[j]:=tmp2;
			end;
		end;
	end;
end;

procedure dfs(i,sw,sv:longint);
begin
	if i=num then begin
		if(sv>r) then r:=sv;
		exit;
	end;
	if (limit-sw)*rho[i+1]+sv <= r then exit;
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
for i:=1 to num do
	rho[i]:=value[i]/weight[i];
sort;
dfs(0,0,0);
writeln(r);
end.