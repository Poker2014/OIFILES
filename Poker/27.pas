var a:array[0..300] of longint;
var n,i,gcd,lcm,l,p,r:longint;

procedure factor(n:longint);
begin
	for i:=2 to n do begin
    if n mod i=0 then begin
       p:=p+1;
       a[p]:=i;
       n:=n div i;
    end;
    while n mod i=0 do begin
       a[p]:=a[p]*i;
       n:=n div i;
    end;
    end;
end;

procedure dfs(i,x:longint);
begin
	if (i=p) and ((x*gcd + lcm div x) < l) then begin
		l:=(x*gcd + lcm div x);
		r:=x;
	end;
	if i=p then exit;
	dfs(i+1,x*a[i+1]);
	dfs(i+1,x);
end;

begin
	l:=1000000000;
	p:=0;
	readln(gcd,lcm);
	n:=(lcm div gcd);
	factor(n);
	for i:=2 to p do
		writeln(a[i]);
	dfs(0,1);
	writeln(r*gcd,' ', lcm div r);
end.