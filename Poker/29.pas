var i,_in,n,_o:longint;
var r:boolean;
var _out,_temp:array[1..100] of longint;

begin
readln(n);
_in:=1;
for i:=1 to n do read(_out[i]);
i:=0;
_o:=1;
r:=true;
while _o<=n do begin
	if (i>0) and (_out[_o]=_temp[i]) then begin
		_o:=_o+1;
		i:=i-1;
	end else begin
		if(_in<=n) then begin
			i:=i+1;
			_temp[i]:=_in;
			_in:=_in+1;
		end else begin
			r:=false;break;
		end;
	end;
end;

if r=true then
	writeln('Yes')
else
	writeln('No');

end.