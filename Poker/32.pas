const maxn=100;
type
	Node=record
	num:longint;
	step:longint;
end;
var data : array[1..maxn, 1..maxn] of longint;
var q : array[1..maxn] of Node;
var f : array[1..maxn] of boolean;
var n, nr, head, tail: longint;

procedure get_data(); 
var i, x, y : longint; begin
	readln(n);
	readln(nr);
	for i:=1 to nr do begin
		readln(x, y);
		data[x,y]:=1;
		data[y,x]:=1;
	end;
end;

procedure q_init();
var i:longint; begin
	for i:=1 to n do f[i]:=false;
	head := 0;
	tail := 1;
	q[1].num := 1;
	q[1].step := 0;
	f[1] := true;
end;

function go_on():Node; begin
	head := head+1;
	exit(q[head]);
end;

procedure insert(num, step : longint);
begin
	tail := tail+1;
	q[tail].num := num;
	q[tail].step := step;
end;

function bfs():longint;
	var v:Node;
	var i:longint;
begin
	q_init();
	while head<tail do begin
		v:=go_on();
		if(v.num = n) then exit(v.step-1);
		for i:=2 to n do begin
			if (data[v.num,i]=1) and (f[i]=false) then begin
				insert(i, v.step+1);
				f[i] := true;
			end;
		end;
	end; 
end;

begin
get_data();
writeln(bfs());
end.