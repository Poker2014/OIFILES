var n:integer;
procedure f(n:integer);
begin
	if(n>0) then
	begin
		f(n-1);
		write(n);
		f(n-1);
	end;
end;
begin
	f(3);
end.