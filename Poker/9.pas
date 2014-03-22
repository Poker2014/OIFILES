procedure dfs(i:longint);
begin
	writeln(i);
	dfs(i+1);
end;
begin
	dfs(1);
end.
// Never stop