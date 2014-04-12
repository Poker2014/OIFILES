// 借书问题
const
	mn=10;
var
	like:array[1..mn,1..mn] of longint;
	lent:array[1..mn] of longint;
	num:array[1..mn] of longint;
	i,n,j:longint;

procedure print;
var k:longint;
begin
	for k:=1 to n do write(num[k],' ');
	writeln;
end;
	
procedure dfs(i:longint);
var j:longint;
begin

	if(i=n) then begin print;exit; end;
	
	for j:=1 to n do							// try all the books
		if (like[i+1,j]=1) and (lent[j]=0) then // like and can lend
		begin
			num[i+1]:=j;	// 'i' borrow 'j'
			lent[j]:=1;		// Dirty Mark
			dfs(i+1);		// Next
			lent[j]:=0;		// Clear Mark
		end;

end;

begin
readln(n);

for i:=1 to n do 
	for j:=1 to n do read(like[i,j]);

dfs(0);
end.