const maxn = 10000;
const inf = maxlongint div 2;
var i, j, N, Rk, R:longint;
var data:array[1..maxn, 1..maxn] of longint;

procedure InputData();
	var w, i, j:longint;
begin
	read(N);
	for i:=1 to N do
		for j:=1 to N do begin
			read(w);
			if w = -1 then begin
				data[i, j] := inf;
				data[j, i] := inf;
			end else begin
				data[i, j] := w;
				data[j, i] := w;
			end;
			if i = j then begin
				data[i, j] := 0;
				data[j, i] := 0;
			end;
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

procedure Handle();
	var i, c, s:longint;
begin
	for i:=1 to N do begin
		s := 0;
		for c:=1 to N do
			s += data[i, c];
		if s < R then begin
			R := s;
			Rk := i;
		end;
	end;
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
	R := inf;
	InputData();
//	OutputData();
//	writeln;
	Floyed();
//	OutputData();
	Handle();
//	writeln;
	writeln(Rk, ' ', R);
end.