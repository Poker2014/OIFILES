const maxn = 10000;
const inf = maxlongint div 2;
var i, j, N, M, targetX, targetY:longint;
var data:array[1..maxn, 1..maxn] of longint;

procedure InputData();
	var a, b, w, i, j:longint;
begin
	read(N, M);
	read(targetX, targetY);
	for i:=1 to N do
		for j:=1 to N do
			if not(i=j) then data[i,j] := inf;
	for i:=1 to M do begin
		read(a, b, w);
		data[a, b] := w;
		data[b, a] := w;
	end;
end;

procedure Floyed();
	var i, j, k:longint;
begin
	for k:=1 to N do 
		for i:=1 to N do
			for j:=1 to N do
				if data[i,k]+data[k,j]<data[i,j] then data[i,j]:=data[i,k]+data[k,j];
end;

procedure OutputData();
begin
	for i:=1 to N do begin
		for j:=1 to N do begin
			if data[i,j] = inf then
				write('.  ')
			else
				if data[i,j] < 10 then
					write(data[i,j], '  ')
				else
					write(data[i,j], ' ');
		end;
		writeln;
	end;
end;

begin
	InputData();
	OutputData();
	writeln;
	Floyed();
	OutputData();
	writeln;
	writeln(data[targetX,targetY]);
end.