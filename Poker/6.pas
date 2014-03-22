type
  data=array[1..5] of longint;
  data2=array[1..7] of real;
var
X,Y:data;
n:longint;

function sTri(a,b,c:real):real;
var l:real;
begin
	l:=(a+b+c)/2;
	exit(sqrt(l*(l-a)*(l-b)*(l-c)) );
end;

function distance(x1,y1,x2,y2:longint):real;
begin
	exit(sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) );
end;


function area(x,y:data):real;
var l:data2;
var i:integer;
begin
	for i:=1 to 4 do
		l[i]:=distance(x[i],y[i],x[i+1],y[i+1]);
	for i:=5 downto 3 do
		l[10-i]:=distance(x[1],y[1],x[i],y[i]);
	exit(sTri(l[1],l[2],l[7])+sTri(l[7],l[6],l[3])+sTri(l[5],l[4],l[6]));
end;

begin
for n:=1 to 5 do
begin
	read(X[n],Y[n]);
end;
writeln(area(X,Y));
end.