const maxn = 1000;
const inf = maxlongint div 2;
var i, j, N, M:longint;
var data:array[1..maxn, 1..maxn] of longint;

procedure InputData();
	var i, j, k, d:longint;
	var rd:array[0..500] of longint;
begin
	readln(M);
	readln(N);
	for i:=1 to N do
		for j:=1 to N do
			if not(i=j) then data[i,j] := inf else data[i,j] := 0;
	for i:=1 to M do begin
		j:=0;
		while not(eoln) do begin
			inc(j);
			read(rd[j]);
		end;
		for k:=1 to j-1 do
			for d:=k+1 to j do
				data[rd[k], rd[d]] := 1;
		readln;
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
				write('.   ')
			else
				if data[i,j] < 10 then
					write(data[i,j], '   ')
				else if data[i,j] < 100 then
					write(data[i,j], '  ')
				else
					write(data[i,j],' ');
		end;
		writeln;
	end;
end;

begin
	InputData();
//	OutputData();
//	writeln;
	Floyed();
//	OutputData();
//	writeln;
	if not(data[1, N] = inf) then
		writeln(data[1, N]-1)
	else
		writeln('No Roud!');
end.