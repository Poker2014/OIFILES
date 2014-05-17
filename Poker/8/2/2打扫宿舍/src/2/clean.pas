const
  maxn=300001;
var
  h:array[0..maxn] of longint;
  st:array[0..maxn] of longint;
  l,r:array[0..maxn] of longint;
  n,top:longint;
  ans1,ans2:int64;
  procedure init;
    var i,x:longint;
    begin
      assign(input,'clean.in'); reset(input);
      readln(n);
      for i:=1 to n do readln(x,h[i]);
     close(input);
    end;
  procedure solve1;
    var i:longint;
    begin
      top:=0;
      st[0]:=-1;
      ans1:=0;
      for i:=1 to n do
        if h[i]>st[top] then
          begin inc(ans1); inc(top); st[top]:=h[i];end
        else
          begin
            while h[i]<st[top] do dec(top);
            if h[i]>st[top] then
              begin inc(ans1); inc(top); st[top]:=h[i]; end;
          end;
    end;

  procedure print;
    begin
      assign(output,'clean.out'); rewrite(output);
      writeln(ans1);
      close(output);
    end;
begin
  init;
  solve1;
  print;
end.
