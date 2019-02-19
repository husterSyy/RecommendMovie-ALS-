<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="refresh" content="2;URL=index.jsp">
<title>Insert title here</title>
</head>
<body style="background:url(img/background2.png);background-size:100%">
	<p style="font-size:30px;text-align:center">
	<%
	out.println("用户 "+request.getParameter("username")+" 注册成功！2秒后返回登录界面");
	%>
	</p>
</body>
</html>