var
data:array[1..100,1..100] of longint;
sum:array[1..100] of longint;
i,j,k,l,ii,s,s1,result,R,C:longint;

begin
s:=0;
s1:=0;

readln(R,C);
for i:=1 to R do begin
	for j:=1 to  C do read(data[i,j]);
end;

{ Get the sum of each row }
for k:=1 to R do begin
	if((C mod 3) = 0) then begin
		for l:=1 to C div 3 do
			sum[k]:=sum[k]+data[k,(3*l-1)];
	end;
	if((C mod 3) = 1) then begin
	sum[k]:=data[k,1]+data[k,C];
		for l:=1 to (C div 3)-1 do
			sum[k]:=sum[k]+data[k,3*l+1];
	end;
	if((C mod 3) = 2) then begin
	sum[k]:=data[k,C];
		for l:=1 to C div 3 do
			sum[k]:=sum[k]+data[k,3*l-1];
	end;
end;

{ Get the number at the middle of sum array }
s:=0;
s1:=0;
if((R mod 3) = 0) then begin
	for l:=1 to R div 3 do
		s:=s+sum[3*l-1];
	s1:=sum[1]+sum[R];
	for l:=1 to (((R div 3)+1) div 2)-1 do
		s1:=s1+sum[3*l+1]+sum[R-3*l];
	result:=s1-s;
end;
if((R mod 3) = 1) then begin
	s:=sum[1]+sum[R];
	for l:=1 to (R div 3)-1 do
		s:=s+sum[3*l+1];
	for l:=1 to R div 6 do
		s1:=s1+sum[3*l-1]+sum[R-3*l+2];
	result:=s-s1;
end;
if((R mod 3) = 2) then begin
	s:=sum[R];
	for l:=1 to R div 3 do
		s:=s+sum[3*l-1];
	s1:=sum[1]+sum[R];
	for l:=1 to (R div 3)-1 do
		s1:=s1+sum[4*l];
	result:=s-s1;
end;

writeln('Sum Array:');
for l:=1 to R do write(sum[l],' ');
writeln;writeln('Result:');
writeln(result);

end.