var mx,my,i,j,l,cnt,min,mincnt:longint;
var x,y,minx,miny:array[1..961] of longint;
var a:array[0..30,0..30] of longint;
const dx:array[1..8] of longint = (0, 0,1, 1,1,-1,-1,-1);
const dy:array[1..8] of longint = (1,-1,1,-1,0, 1,-1, 0);

function check(x,y:longint):boolean;
begin
if (x<=mx) and (y<=my) and (x>=1) and (y>=1) and (a[x,y]=0) then exit(true) else exit(false);
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
		a[xx,yy]:=1;
		exit(true)
	end; 
exit(false);	
end;

Procedure dfs(i:longint);
var k:longint;
begin

if (x[i]=1) and (y[i]=my) then begin 
cnt:=cnt+1;
if(i<min) then begin
min:=i;
minx:=x;
miny:=y;
mincnt:=cnt;
end;
print(i);
end;

for k:=1 to 8 do begin
if(d_try(i,x[i]+dx[k],y[i]+dy[k])) then
begin
dfs(i+1);
a[x[i]+dx[k],y[i]+dy[k]]:=0;
end;

end;

end;

begin
i:=1;
cnt:=0;
min:=1000000;
mincnt:=1;
read(mx,my);
for i:=1 to mx do 
begin
	for j:=1 to my do read(a[i,j]);
end;

x[1]:=1; y[1]:=1;

//dx[1]:=1; dy[1]:=2;
//dx[2]:=2; dy[2]:=1;
//dx[3]:=1; dy[3]:=-2;
//dx[4]:=2; dy[4]:=-1;

a[1,1]:=1;
dfs(1);
writeln('MIN ',min);write('.',mincnt);
for l:=1 to min do write('(',minx[l],',',miny[l],')');
writeln;
end.