<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电影分类</title>
<link rel="stylesheet"  type="text/css"  href="css/classify.css"/>
</head>
<body>


  <a href='classify.jsp?type=2' class='return'>喜剧</a>");
	<%
	int type=Integer.parseInt(request.getParameter("type"));
	String movieType;
	
	PreparedStatement ps = null;
	Connection ct = null;
	ResultSet rs = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/douban_movie?characterEncoding=utf-8", "root", "123456");
		
		switch(type){
		case 1:
			out.println("<p class='classTitle'>热门电影</p>");
			out.println("<a href='recommend.jsp' class='return'>个性推荐</a>");
			ps=ct.prepareStatement("select m_id,m_name,imgurl from movie order by rate desc limit 0,20");
			break;
		case 2:
			out.println("<p class='classTitle'>喜剧</p>");
			out.println("<a href='recommend.jsp' class='return'>个性推荐</a>");
			ps=ct.prepareStatement("select m_id,m_name,imgurl from movie where type like '%喜剧%' order by rate desc limit 0,20");
			break;
		case 3:
			out.println("<p class='classTitle'>惊悚</p>");
			out.println("<a href='recommend.jsp' class='return'>个性推荐</a>");
			ps=ct.prepareStatement("select m_id,m_name,imgurl from movie where type like '%惊悚%' order by rate desc limit 0,20");
			movieType="惊悚";
			break;
		case 4:
			out.println("<p class='classTitle'>爱情</p>");
			out.println("<a href='recommend.jsp' class='return'>个性推荐</a>");
			ps=ct.prepareStatement("select m_id,m_name,imgurl from movie where type like '%爱情%' order by rate desc limit 0,20");
			movieType="爱情";
			break;
		case 5:
			out.println("<p class='classTitle'>冒险</p>");
			out.println("<a href='recommend.jsp' class='return'>个性推荐</a>");
			ps=ct.prepareStatement("select m_id,m_name,imgurl from movie where type like '%冒险%' order by rate desc limit 0,20");
			movieType="冒险";
			break;
		}
		
		rs=ps.executeQuery();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	out.println("<table style='text-align:center;margin:auto;width:900px;height:1000px'>");
	int movieId;
	String movieName;
	String img_url;
	int i=0;
	while (rs.next()&&i<20){
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
	
	out.println("</table>");
	
	rs.close();
	ps.close();
	ct.close();
	
	
	%>


</body>
</html>