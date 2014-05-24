const maxn=40321;maxf=76543210;
type
	Node=record
	status: array[1..8] of longint;
	pos:longint;
	step:longint;
end;
type queue=Object
	private
	 q:array[1..maxn] of Node;
	 f:array[1..maxf] of longint;
	 head, tail : longint;
	public
	 procedure init(init_val:Node);
	 procedure insert(val:Node);
	 procedure setF(pointer:longint);
	 function isF(pointer:longint):boolean;
	 function shift():Node;
	 function getHead():longint;
	 function getTail():longint;
end;

procedure queue.init(init_val:Node);
begin
	head := 0;
	tail := 1;
	q[1] := init_val;
end;

procedure queue.insert(val:Node);
begin
	tail := tail+1;
	q[tail] := val;
end;

procedure queue.setF(pointer:longint);
begin
	f[pointer]:=1;
end;

function queue.isF(pointer:longint):boolean;
begin
	if(f[pointer]=1) then exit(true);
	exit(false);
end;

function queue.shift():Node;
begin
	head := head+1;
	exit(q[head]);
end;

function queue.getHead():longint; begin
	exit(head);
end;

function queue.getTail():longint; begin
	exit(tail);
end;

//----------------------------------------------

var start_node:Node;
var q:queue;

function hash(a:Node):longint;
	var i:longint;
begin
	hash:=0;
	for i:=1 to 8 do hash:=10*hash+a.status[i];
end;

procedure get_data();
	var i:longint;
begin
	for i:=1 to 8 do begin
		read(start_node.status[i]);
		if start_node.status[i]=0 then start_node.pos:=i;
	end;
	start_node.step:=0;
end;

procedure move(c:Node; delta:longint);
	var new_node:Node;
begin
	new_node:=c;
	new_node.status[new_node.pos]:=new_node.status[new_node.pos+delta];
	new_node.status[new_node.pos+delta]:=0;
	new_node.pos:=new_node.pos+delta;
	new_node.step:=new_node.step+1;
	if q.isF(hash(new_node))=false then begin
		q.insert(new_node);
		q.setF(hash(new_node));
	end;	
end;

function dfs():longint;
var current:Node;
begin
	//q:=queue.Create;
	q.init(start_node);
	while q.getHead() < q.getTail() do begin
		current := q.shift();
		if(hash(current)=1234567) then exit(current.step);
		if current.pos mod 4 <> 1 then move(current, -1);
		if current.pos mod 4 <> 0 then move(current, 1);
		if current.pos >=5 then move(current, -4);
		if current.pos <=4 then move(current, 4);
		end;
end;

begin
	get_data();
	writeln(dfs());
end.