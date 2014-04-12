//一条或所有路线
const
  dx:array[1..8] of longint=(-1,-1,0,1,1,1,0,-1);
  dy:array[1..8] of longint=(0,1,1,1,0,-1,-1,-1);
var
  x,y:array[1..100] of longint;
  a:array[1..10,1..10] of longint;
  n,m,cnt:longint;
  procedure init;
    var i,j:longint;
    begin
      assign(input,'a1.in'); reset(input);
      readln(n,m);
      for i:=1 to n do
        for j:=1 to m do read(a[i,j]);
      close(input);
    end;
  procedure print(i:longint);
    var j:longint;
    begin
      cnt:=cnt+1;
      write(cnt,':');
      for j:=1 to i do write('(',x[j],',',y[j],')');
      writeln;
      //halt;
    end;
  procedure dfs(i:longint);
    var k,xx,yy:longint;
    begin
      if (x[i]=1)and(y[i]=m) then  print(i);
      for k:=1 to 8 do
        begin
          xx:=x[i]+dx[k];yy:=y[i]+dy[k];
          if (xx>=1)and(xx<=n)and(yy>=1)and(yy<=m)and(a[xx,yy]=0) then
            begin
              x[i+1]:=xx;
              y[i+1]:=yy;
              a[xx,yy]:=1;
              dfs(i+1);
              a[xx,yy]:=0;
            end;
        end;
    end;
begin
  init;
  x[1]:=1;
  y[1]:=1;
  cnt:=0;
  a[1,1]:=1;
  assign(output,'a.out'); rewrite(output);
  dfs(1);
  close(output);
end.


