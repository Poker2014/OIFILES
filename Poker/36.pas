const maxn = 1000;
const inf = 2147483647 / 2;
var i, j, N, tX, tY:longint;
var R:real;
var data,tmp:array[1..maxn, 1..maxn] of real;

procedure InputData();
	var i, j:longint;
	var w:real;
begin
	read(N, tX, tY);
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

function GetPath(targetX, targetY, dx, dy:longint; ratio:real):real;
	var i, j, k:longint;
//	var tmp:array[1..maxn, 1..maxn] of real;
begin
	tmp := data;
	tmp[dx, dy] *= ratio;
	for k:=1 to N do 
		for i:=1 to N do
			for j:=1 to N do
				if tmp[i,k]+tmp[k,j]<tmp[i,j] then tmp[i,j]:=tmp[i,k]+tmp[k,j];
	exit(tmp[targetX, targetY]);
end;

procedure Handle();
	var i, c:longint;
	var s, delta:real;
begin
	s := GetPath(tX, tY, 0, 0, 1);
	for i:=1 to N do
		for c:=1 to N do
			if not(data[i, c] = 0) and not(data[i, c] = inf) then begin
				delta := s-GetPath(tX, tY, i, c, 0.5);
				if delta > R then R := delta;
			end;
end;

procedure OutputData();
begin
	for i:=1 to N do begin
		for j:=1 to N do begin
			if data[i,j] = inf then
				write('.     ')
			else
				if data[i,j] < 10 then
					write(data[i,j]:0:1, '   ')
				else
					write(data[i,j]:0:1, '  ');
		end;
		writeln;
	end;
end;

begin
	InputData();
//	OutputData();
	Handle();
	writeln;
	writeln(R:0:1);
end.