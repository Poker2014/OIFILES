var str,str1:string;
var s:array[1..100] of string;
var pointer,i:longint;

function m(a,b:string):boolean; begin
	if (a='(') and (b=')') then exit(true);
	if (a='[') and (b=']') then exit(true);
	if (a='{') and (b='}') then exit(true);
	if (a='<') and (b='>') then exit(true);
	exit(false);
end;

function m1(a:string):boolean; begin
	if (a='(') or (a=')') then exit(true);
	if (a='[') or (a=']') then exit(true);
	if (a='{') or (a='}') then exit(true);
	if (a='<') or (a='>') then exit(true);
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

procedure readStr();
	var i:longint; begin
	readln(str1);
	for i:=1 to length(str1) do begin
		if(m1(str1[i])) then begin
			str := str + str1[i];
		end;
	end;
end;

begin;
	str:='';
	pointer:=0;
	readStr();
	if(length(str) = 0) then begin writeln('Yes');halt; end;
	if(length(str) mod 2 = 1) then begin writeln('No');halt; end;
	push(str[1]);
	i:=1;
	while(i<length(str)) do begin
		i:=i+1;
		push(str[i]);
		if(m(s[pointer-1],s[pointer])) then begin
			pop();pop();
		end;
	end;


if (pointer=0) then
	writeln('Yes')
else	
	writeln('No');

end.