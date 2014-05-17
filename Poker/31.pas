var h:array[1..250000] of longint;
var S:array[1..250000] of longint;
var pointer, n, i, t, r:longint;

procedure init(); begin
	pointer:=0;
end;

procedure push(x:longint); begin
	pointer:=pointer+1;
	S[pointer]:=x;
end;

procedure pop(); begin
	pointer:=pointer-1;
end;

function get(offset:longint):longint; begin
	exit(S[pointer+offset]);
end;

begin
	init();
	readln(n);
	for i:=1 to n do begin
		read(t, h[i]);
	end;
	r:=1;
	
	push(h[1]);
	for i:=2 to n do begin
		if(h[i] > get(0)) then begin push(h[i]);r:=r+1; end;
		if(h[i] < get(0)) then begin
			while h[i] < get(0) do
				pop();
			if not(h[i] = get(0)) then begin
				push(h[i]);r:=r+1;
			end;
		end;
	end;
	writeln(r);
end.