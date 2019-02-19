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
<title>电影介绍</title>
</head>
<body style="background:url(img/background2.png);background-size:100%">
	<div style="text-align:center">
	<%
	/* 没有电影编号,跳转到推荐界面 */
	if((request.getParameter("id"))==null){
		response.sendRedirect("recommend.jsp");
		return;
	}
	
	int movieId=Integer.parseInt(request.getParameter("id"));
	PreparedStatement ps = null;
	Connection ct = null;
	ResultSet rs = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/douban_movie", "root", "123456");
		ps=ct.prepareStatement("select m_name,imgurl,director,type,area,rate,actor,screenwriter from movie where m_id="+movieId);
		rs=ps.executeQuery();
		
		/* 将读取到的信息显示 */
		rs.next();
		String name=rs.getString(1);
		String imgurl=rs.getString(2);
		String director=rs.getString(3);
		String type=rs.getString(4);
		String area=rs.getString(5);
		int rate=rs.getInt(6);
		String actor=rs.getString(7);
		String screenWriter=rs.getString(8);
		out.println("<p style='color:#455c73;font-size:45px;font-weight:bold;line-height:30px'>"+name+"</p></div>");
		%>
		
		<div style="margin-left:200px;
		padding-top:50px;
		margin-right:200px;
		background-color:rgba(255,255,255,0.5);
		height:500px">
		<table><tr><td>
		<!-- 显示图片 -->
		<img src="<%=imgurl%>" style="height:400px;margin-left:100px"/>
		
		</td>
		<!-- 电影信息 -->
		<td><div style="margin-left:50px;font-size:20px;color:#455c73;margin-right:100px;width:800px">
		<%
		out.println("<p>导演:&emsp;"+director+"</p>");
		out.println("<p>类型:&emsp;"+type+"</p>");
		out.println("<p>地区:&emsp;"+area+"</p>");
		out.println("<p>编剧:&emsp;"+screenWriter+"</p>");
		out.println("<p>演员:&emsp;"+actor+"</p>");
		out.println("<p>评分:&emsp;"+rate+"</p>");
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	
	<br/><br/><br/>
	<form action="recommend.jsp">
	<input type="submit" value="返回上一页" style="font-size:25px;float:right">
	</form>
	
	</div></td></tr>
	</table>
	
	
	
	</div>
	
	<p style="font-size:20px;margin-left:200px;margin-top:50px;line-height:50px;float:left">看过这部电影的用户</p>
	<!-- 读取曾经看过这部电影的用户 -->
	<div style="width:1000px;height:100px;margin:auto;margin-top:40px;background-color:#55AA88;text-align:center">
	
	<table style="width:1000px;height:100px"><tr>
	<%
	
	ps=ct.prepareStatement("select u_id from rating where m_id="+movieId+" order by rate desc limit 0,10");
	rs=ps.executeQuery();
	String userId;
	for(int i=0;i<10;i++){
		rs.next();
		userId=rs.getString(1);
		out.println("<td>"+userId+"</td>");
	}
	out.println("");

	rs.close();
	ct.close();
	ps.close();
	%>
	
	
	</tr></table>
	
	</div>
</div>
	
</body>
</html>