<%@ page language="java" import="java.util.* , java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <%
     try{
            //调用Class.forName()方法加载驱动程序
            Class.forName("com.mysql.jdbc.Driver");
         
       
            String url="jdbc:mysql://localhost:3306/douban_movie";    //JDBC的URL    
            Connection conn;
            conn = DriverManager.getConnection(url,"root","123456");
            Statement stmt = conn.createStatement(); //创建Statement对象
           
            String sql = "select m_id,m_name,imgurl from movie ";    //要执行的SQL
            ResultSet rs = stmt.executeQuery(sql);//创建数据对象
               
               out.println("电影ID"+"\t"+"电影名字"+"\t"+"电影图片");
               out.println();
               String img_url=null;
                while (rs.next()){
                    
                    out.print(rs.getInt(1) + "\t");
                    out.print(rs.getString(2) + "\t");
               //     out.print(rs.getString(3) + "\t");
                  img_url=rs.getString(3);
                  %>
                  
                  <img src='<%=rs.getString("imgurl")%>'/>
                  
                  <%
                    out.println();
                    
                }
                rs.close();
                stmt.close();
                conn.close();
            }catch(Exception e)
            {
                e.printStackTrace();
            }
    

	
	%>
	   
  </body>
</html>
