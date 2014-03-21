var output_r = new Array
var W = 7;
var H = 5;
function init(){
/*
    for(i=1;i<=15;i++){
	chessboard[i] = new Array(10)
    }
*/
    exploreway(0,0);
    output_r.pop();
    for(i=output_r.length-1;i>0;i--){
	if(output_r[i] == "B"){
	    output_r.splice(i,1)
	    var add_r = new Array
	    for(j=i;j<output_r.length;j++){
		add_r.push(output_r[j])
	    }
	    for(k=i-2;k>1;k--){
		if(output_r[k]==output_r[i-1]){
		    output_r.splice(k+1,0,add_r);
		}
	    }
	}
    }
    console.log(output_r.toString().replace(/,/g,""))
}


function exploreway(x,y){
    if(x > W || y > H){
	return false;
    }else if(x == W && y == H){
	output_r.push("["+x+"."+y+"]\n")
	return true;
    }else{
	var a = false
	var b = false
	if(exploreway(x+1,y+2)){
	    output_r.push("["+x+"."+y+"]\n")
	    a = true
	}
	if(exploreway(x+2,y+1)){
	    output_r.push("["+x+"."+y+"]\n")
	    b = true
	}
	if(a && b) output_r.push("B");
	if(a || b) return true; else return false;
    }
}


function exploreway_old(x,y){
    if(x > W || y > H){
	return false;
    }else if(x == W && y == H){
	console.log("["+x+","+y+"]")	
	return true;
    }else{
	var a = false
	if(exploreway(x+1,y+2)){
	    console.log("["+x+","+y+"]")
	    a = true
	}
	if(exploreway(x+2,y+1)){
	    console.log("["+x+","+y+"]")
	    a = true
	}
	return a;
    }
}



