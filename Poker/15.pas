//123台阶版
var inp:longint;
var op:string;

function AA(in1,in2:string):string;
var temp1,add1,r:string;
var i,maxlength,n1,n2:longint;
var add,current1,current2,c,temp,temp2:longint;
begin
r:='';
n1:=length(in1);
n2:=length(in2);
maxlength:=n1;
if(n1>n2) then
	begin
		for i:=1 to n1-n2 do in2:='0'+in2;
		maxlength:=n1;
	end
	else if(n1<n2) then
	begin
		for i:=1 to n2-n1 do in1:='0'+in1;
		maxlength:=n2;
	end;
add:=0;
for i:=maxlength downto 1 do
	begin
		val(Copy(in1,i,1),current1,c);
		val(Copy(in2,i,1),current2,c);
		temp:=current1+current2;
		temp2 := (temp+add) mod 10;
		add:=(temp+add) div 10; //先用上一个的进位，再设定新的进位
		str(temp2,temp1);
		if (i=1) and (add<>0) then begin //处理最大位的进位
			str(add,add1);
			r:=add1+temp1+r;
		end else
			r:=temp1+r;
	end;
exit(r);
end;

function f(x:longint):string;
var i:longint;
var a,b,c,r:string;
begin
a:='1';
b:='2';
c:='4';
for i := 4 to x do
begin
r:=AA(AA(a,b),c);
a:=b;
b:=c;
c:=r;
end;
exit(r);
end;

begin
op:='';
readln(inp);
op:=f(inp);
writeln(op);
writeln(length(op));
end.