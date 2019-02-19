<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.HttpSession"%>
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
			ps=ct.prepareStatement("select * from user where uid="+"'"+username+"'");
			rs=ps.executeQuery();
		     session=request.getSession();
		   
		    if(rs.next())
		    {
		      
		        if(password.equals(rs.getObject("password"))){
		        
		     
			session.setAttribute("username",request.getParameter("username"));
			session.setAttribute("pwd",request.getParameter("pwd"));
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
			
			
			
			
			
</body>
</html>

