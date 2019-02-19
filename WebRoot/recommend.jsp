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
<title>电影推荐</title>
</head>
<body style="margin:0">

	<script type="text/javascript" src="js/change.js"></script>
	
	<!-- 非正常登录，转到登录界面 -->
	<%
		if((session.getAttribute("username"))==null){
			response.sendRedirect("index.jsp");
			return;
		}
	%>
	
	<!-- 获取当前用户名 -->
	<%
		String name=session.getAttribute("username").toString();
		String pwd=session.getAttribute("pwd").toString();
	%>
	
	<div style="background:url(img/title.png) no-repeat left top;
	background-size:100%;
	margin:0;
	height:250px;
	padding-top:30px">
	</div>	
		

	<div style="background:url(img/background2.png);background-size:100%">
	<!-- 用户信息 -->
	
		<div style="font-size:20px;margin-left:50px">
		用户：<%out.print(name);%>&emsp;&emsp;
		<a href="index.jsp?out=true" style="text-decoration:none;color:black" onmouseover="changeColor(1)" onmouseout="changeColor(2)" id="close">注销登录</a>
		</div>
	
	
		
	
	
	<table style="width:1400px;height:800px">
	<tr><td style="width:1200px">
		
		<!-- 推荐信息列表 -->
		<div style="height:950px;width:1350px">
		<p style="font-size:40px;text-align:center;color:#455c73;line-height:15px">您可能感兴趣的十部电影</p>
		
		<!-- 从数据库取出10部推荐电影并显示 -->
		
		<table style="border:2px solid #9495ae;
		width:1200px;
		height:620px;
		margin-left:60px;
		text-align:center;
		padding-top:20px">
		<%
		PreparedStatement ps = null;
		Connection ct = null;
		ResultSet rs = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/douban_movie?characterEncoding=utf-8&useSSL=false", "root", "123456");
			ps=ct.prepareStatement("select m_id,m_name,imgurl from rec_movies,movie where movieIds=m_id and userId="+name);
			rs=ps.executeQuery();
			
			int movieId;
			String movieName;
			String img_url;
			int i=0;
			//在表格中显示
			while (rs.next()&&i<10){
				movieId=rs.getInt(1);
	        	movieName=rs.getString(2);
	        	img_url=rs.getString(3);
	        	if(i%5==0){
	        		out.println("<tr>");
	        	}
	        	i++;
				out.print("<td>");
				%>
				
				<!-- 显示图片 -->
				<img src="<%=img_url%>" style="height:200px"/>
				
				<%out.print("<br/><a href='movieInfo.jsp?id="+movieId+"' style='text-decoration:none;color:#32564F;font-weight:bold'>"+movieName+"</a></td>");
				if(i%5==0){
	        		out.println("</tr>");
	        	}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
	
		</table>
		<br/><br/><br/>
		</div>
	</td>
	
	
	
	<!-- 用户评过分的电影列表 -->
	<td>
	<div style="height:800px;width:400px">
	<p style="font-size:30px;text-align:center;color:#455c73;line-height:25px">
	您评过分的电影
	</p>
	
	<div style="opacity:0.5;background-color:white;
	height:500px;
	border:2px #9495ae solid;
	padding-left:30px;
	padding-top:25px;
	font-size:20px;
	line-height:43px">
	<ul>
	
	<!-- 从数据库查询用户曾经评过分的电影 -->
	<%
	
	try{
		ps=ct.prepareStatement("select movie.m_id,m_name from rating,movie where rating.m_id=movie.m_id and u_id="+name+" order by rating.rate desc limit 0,10");
		rs=ps.executeQuery();
		
		String movieName;
		int movieId;
		int i=0;
		//在表格中显示
		while (rs.next()&&i<10){
        	movieId=rs.getInt(1);
        	movieName=rs.getString(2);
        	out.println("<a href='movieInfo.jsp?id="+movieId+"' style='text-decoration:none'><li>"+movieName+"</li></a>");
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	rs.close();
	ps.close();
	ct.close();
	%>
	
	</ul>
	
	
	
	
	
	</div>
	
	
	
	
	</div>
	</td></tr>
	</table>
	</div>
</body>
</html>