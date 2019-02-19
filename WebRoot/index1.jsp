<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movie recommendor</title>
</head>
<body style="background:url(img/background1.png) no-repeat left top;background-size:100%">
	
	<script type="text/javascript" src="js/simpleCheck.js"></script>
	
	<div style="width:500px;
	background:url(img/login.png) no-repeat;
	background-size:100%;
	height:400px;
	line-height:120%;
	margin-left:55%;
	margin-top:20%;
	font-size:20px;
	text-align: center">
		<form method="post" action="">
			<br/><br/><br/><br/><br/>
			用户名：<input type="text" name="username" id="username"/>
			<p style="color:red;margin:0;padding:0;height:10px" id="msg"></p>
			<br/>
			密　码：<input type="password" name="pwd" id="pwd"/>
			
			<p style='color:red;margin:0;padding:0;height:10px'>
			<%
			if(request.getSession().getAttribute("isRight")!=null&&request.getSession().getAttribute("isRight").equals("none")){
			out.println("用户名或密码错误！");
			request.getSession().removeAttribute("isRight");
			}	
			%>
			
			<%
			PreparedStatement ps = null;
	    	Connection ct = null;
		   ResultSet rs = null;
		    request.setCharacterEncoding("UTF-8");
		    String username=(String)request.getParameter("username");
		    String password=(String)request.getParameter("password");
		    
		    Class.forName("com.mysql.jdbc.Driver");
			ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/douban_movie", "root", "123456");
			ps=ct.prepareStatement("select * from user where uid="+"'"+username+"'");
			rs=ps.executeQuery();
		   
		   
		    if(rs.next())
		    {
		      
		        if(password.equals(rs.getObject("password"))){
		            response.sendRedirect("classify.jsp?type=1");
		        }
		        else{
		            out.print("<script language='javaScript'> alert('密码错误');</script>");
		            response.setHeader("refresh", "0;url=index.jsp");
		        }
		    }
		    else 
		    {
		        out.print("<script language='javaScript'> alert('账号错误——else');</script>");
		        response.setHeader("refresh", "0;url=index.jsp");
		    }
		    
		%>
			
			
			
			
			
			</p>
			<br/>
			
			<input type="submit" value="登录" style="width:30%;height:5%;margin:auto" onclick="return check();">
			<a href="register.jsp" style="text-decoration:none;color:#191970;font-size:20px">立即注册</a>
		</form>
	</div>
	
	
	
	<!-- 如果注销，则清空session -->
	<%
	if(request.getParameter("out")!=null&&request.getParameter("out").equals("true"))
	{
		session.invalidate();
	}
	%>
</body>
</html>

