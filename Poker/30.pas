var str:string;
var s:array[1..100] of string;
var pointer,i:longint;

function m(a,b:string):boolean; begin
if (a='(') and (b=')') then exit(true);
if (a='[') and (b=']') then exit(true);
if (a='{') and (b='}') then exit(true);
if (a='<') and (b='>') then exit(true);
exit(false);
end;

procedure push(x:string); begin
pointer:=pointer+1;
s[pointer]:=x;
end;

procedure pop(); begin
s[pointer]:='0';
pointer:=pointer-1;
end;

begin;
pointer:=0;
readln(str);
push(str[1]);
i:=1;
while(i<length(str)) do begin
i:=i+1;
push(str[i]);
if(m(s[pointer-1],s[pointer])) then begin
	pop();pop();
end;
end;

if(pointer=0) then begin 
	push(str[length(str)]);
	i:=length(str);
	while(i>1) do begin
		i:=i-1;
		push(str[i]);
		if(m(s[pointer],s[pointer-1])) then begin
			pop();pop();
		end;
	end;
	if(pointer=0) then writeln('Yes');
end else begin
	writeln('No');
end;

end.