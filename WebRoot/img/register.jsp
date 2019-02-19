<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
</head>
<body style="background:url(img/background2.png);background-size:100%">

	<script type="text/javascript" src="js/simpleCheck.js"></script>
	<!-- 表格 -->
	<div style="text-align:center;width:500px;margin:auto;margin-top:150px;font-size:25px">
	<p style="color:#247676;font-size:60px;font-weight:bold">请输入注册信息</p>
		<form action="registerControl" method="post">
		
		<table>
		<tr><td>用户名：</td><td><input type="text" placeholder="请输入6-10位数字" name="username" id="username"/></td>
		</tr>
		
		<!-- 不符合标准时的提示行 -->
		<tr style="height:25px"><td colspan=2 style="color:red;font-size:15px" id="msg1">
		<%
		if(session.getAttribute("info")!=null&&session.getAttribute("info").equals(1)){
			out.println("用户名已存在！");
			session.removeAttribute("info");
		}
		else out.println("<br/>");
		%>
		</td></tr>
		
		<tr><td>密码：</td><td><input type="password" placeholder="请输入密码" name="pwd" id="pwd"/></td>
		</tr>
		
		<!-- 不符合标准时的提示行 -->
		<tr style="height:25px"><td colspan=2 style="color:red;font-size:15px" id="msg2">
		<br/>
		</td></tr>
		
		<tr><td>确认密码：</td><td><input type="password" placeholder="请再次输入密码进行确认" id="pwdAgain"/></td>
		</tr>
		
		<!-- 不符合标准时的提示行 -->
		<tr style="height:25px"><td colspan=2 style="color:red;font-size:15px" id="msg3">
		<br/>
		</td></tr>
		
		<tr><td><input type="submit" value="立即注册" onclick="return checkRegister();" style="font-size:25px"></td>
		<td>
		&emsp;&emsp;&emsp;&emsp;
		<a href="index.jsp" style="text-decoration:none">返回登录界面</a>
		</td>
		</tr>
		
		</table>
		</form>
	
	
	</div>

</body>
</html>