const maxn = 1000;
var N, R:longint;
var data:array[1..maxn, 1..maxn] of longint;
var F:array[1..maxn, 1..maxn] of longint;

function max(a:longint; b:longint):longint; begin
	if(a>b) then exit(a) else exit(b);
end;

procedure input_data();
	var i, j:longint;
begin
	readln(N);
	for i:=1 to N do
		for j:=1 to i do
			read(data[i, j]);
end;

procedure handle();
	var i, j:longint;
begin
	for i:=1 to N do
		F[N, i] := data[N, i];
	for i:=N-1 downto 1 do begin
		for j:=1 to i do begin
			F[i, j] := max(F[i+1, j], F[i+1, j+1]) + data[i, j];
		end;
	end;
	R := F[1, 1];
end;

procedure handle2();
	var i, j:longint;
begin
	F[1, 1] := data[1, 1];
	F[2, 1] := data[2, 1] + data[1, 1];
	F[2, 2] := data[2, 2] + data[1, 1];
	for i:=3 to N do begin
		for j:=1 to i do begin
			if not(j=1) then
				F[i, j] := data[i, j] + max(F[i-1 ,j-1], F[i-1, j])
			else
				F[i, j] := data[i, j] + F[i-1, j];
		end;
	end;
	for i:=1 to N do
		if(F[N, i] > R) then
			R := F[N, i];
end;

procedure print(); begin
	writeln(R);
end;

begin
	R := 0;
	input_data();
	handle2();
	print();
end.