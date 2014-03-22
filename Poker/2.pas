var
 n,j,I,t,pointer,max:integer;
 filename:string;
 numbers:array[1..1000] of integer;
begin

//filename:='a2.in';
//assign(input,filename);reset(input);

Readln(n);
for I:=1 to n do read(numbers[I]);

for pointer:=1 to n-1 do
begin
max:=pointer;

 for j:=pointer+1 to n do
   if numbers[j]>numbers[pointer] then max:=j;
 if numbers[pointer]<>numbers[max] then
 begin t:=numbers[max];numbers[max]:=numbers[pointer];numbers[pointer]:=t; end;


end;

for pointer:=1 to n do
  writeln(numbers[pointer]);

 writeln('----'); 
 
for pointer:=1 to n-2 do
begin
if numbers[pointer+1]+numbers[pointer+2]>numbers[pointer] then
begin
writeln(numbers[pointer]+numbers[pointer+1]+numbers[pointer+2]);
break;
end;
end;

end. 