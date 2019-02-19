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

	<body>
			
			<%
			PreparedStatement ps = null;
	    	Connection ct = null;
		   ResultSet rs = null;
		    request.setCharacterEncoding("UTF-8");
		    String username=(String)request.getParameter("username");
		    String password=(String)request.getParameter("pwd");
		    
		    Class.forName("com.mysql.jdbc.Driver");
			ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/douban_movie?characterEncoding=utf-8", "root", "123456");
			ps=ct.prepareStatement("insert into user where uid="+"'"+username+"' and passwors="+"'"+password+"'");
		    
				String sql="insert into user values ('"+username+"','"+password+"')";		
			ps.executeUpdate(sql);
		   
		   
		  
		  
		        response.setHeader("refresh", "0;url=wait.jsp");
		    
		    
		%>
			
			
			
			
			
</body>
</html>

