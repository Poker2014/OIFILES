const maxn = 1000;
var N, M:longint;
var data:array[1..maxn, 1..maxn] of longint;
var F:array[0..maxn, 0..maxn] of longint;

function max(a:longint; b:longint):longint; begin
	if(a>b) then exit(a) else exit(b);
end;

procedure input_data();
	var i, x, y, K:longint;
begin
	read(N, M, K);
	for i:=1 to K do begin
		read(x, y);
		read(data[x, y]);
	end;
end;

procedure handle();
	var i, j:longint;
begin
	for i:=1 to N do begin
		for j:=1 to M do begin
			F[i, j] := data[i, j] + max(F[i-1, j], F[i, j-1]);
		end;
	end;
end;


procedure print();
begin
	writeln(F[N,M]);
end;

begin
	input_data();
	handle();
	print();
end.