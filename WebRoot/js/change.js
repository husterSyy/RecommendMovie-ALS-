//注销登录的颜色变化
function changeColor(a){
	var close=document.getElementById("close");
	
	if(a==1){
		close.style.backgroundColor = "#2C4C32";
		close.style.color="white";
	}
	else if(a==2){
		close.style.backgroundColor = "";
		close.style.color="black";
	}
	
}

//鼠标移上或移下分类
function type(i,a){
	var type=document.getElementById("type"+i);
	if(a==1){
		type.style.backgroundColor="grey";
		type.style.color="white";
		type.style.cursor="pointer";
	}
	if(a==2){
		type.style.backgroundColor="white";
		type.style.color="black";
	}
}

//跳转到相应分类页面
function go(i){
	window.location.href="classify.jsp?type="+i;	
}



