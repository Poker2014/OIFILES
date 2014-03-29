var mx,my,i,l,cnt,min,mincnt:longint;
var x,y,minx,miny:array[1..30] of longint;
var dx,dy:array[1..4] of longint;

function check(x,y:longint):boolean;
begin
if (x<=mx) and (y<=my) and (x>=0) and (y>=0) then exit(true) else exit(false);
end;

Procedure print(i:longint);
var j:longint;
begin
write('.',cnt);
for j:=1 to i do write('(',x[j],',',y[j],')');
writeln;
end;

function d_try(i,xx,yy:longint):boolean;
begin
if (check(xx,yy)) then
	begin
		x[i+1]:=xx;
		y[i+1]:=yy;
		exit(true)
	end; 
exit(false);	
end;

Procedure dfs(i:longint);
var k:longint;
begin

if (x[i]=mx) and (y[i]=my) then begin 
cnt:=cnt+1;
if(i<min) then begin
min:=i;
minx:=x;
miny:=y;
mincnt:=cnt;
end;
print(i);
end;

for k:=1 to 4 do begin
if(d_try(i,x[i]+dx[k],y[i]+dy[k])) then dfs(i+1);
end;

end;

begin
i:=1;
cnt:=0;
min:=1000000;
mincnt:=1;
readln(mx,my);

x[1]:=0; y[1]:=0;

dx[1]:=1; dy[1]:=2;
dx[2]:=2; dy[2]:=1;
dx[3]:=1; dy[3]:=-2;
dx[4]:=2; dy[4]:=-1;

dfs(i);
writeln('MIN ',min);write('.',mincnt);
for l:=1 to min do write('(',minx[l],',',miny[l],')');
writeln;
end.