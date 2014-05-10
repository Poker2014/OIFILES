var n,i,x:longint;
var data:array[1..100] of longint;

begin
	readln(n);
	for i:=1 to n do
		data[i]:=i;
	i:=1;
	x:=n;
	while(x>1) do begin
		write(data[i],' ');
		data[i]:=0;
		data[((i+1) div 2)+n]:=data[i+1];
		i:=i+2;
		x:=x-1;
	end;
	write(data[((i+1) div 2)+n-1]);
end.