//检查登录
function check(){
	var name=document.getElementById("username");
	var pwd=document.getElementById("pwd");
	if(name.value==""){
		document.getElementById("msg").innerHTML="请输入用户名！";
		return false;
	}
	return true;
}

//检查注册
function checkRegister(){
	var name=document.getElementById("username");
	var pwd=document.getElementById("pwd");
	var again=document.getElementById("pwdAgain");
	//正则表达式
	var reg=/^[0-9A-Za-z]{6,12}$/;
	//检查用户名
	var isRight=true;
	if(!reg.test(name.value)){
		document.getElementById("msg1").innerHTML="用户名不符合标准！";
		isRight=false;
	}else{
		document.getElementById("msg1").innerHTML="";
	}
	//检查密码
	if(pwd.value==""){
		document.getElementById("msg2").innerHTML="密码为空！";
		isRight=false;
	}else{
		document.getElementById("msg2").innerHTML="";
	}
	//验证密码
	if(pwd.value!=again.value){
		document.getElementById("msg3").innerHTML="两次输入密码不相等！";
		isRight=false;
	}else{
		document.getElementById("msg3").innerHTML="";
	}
	return isRight;
	
	
}
