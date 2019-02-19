<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

   <form action="Find" method="get">
			请输入搜索关键字: <input type="text" name="search" id="search"/>

			<input type="submit"  value="查找" onclick= "getValue()"/>
           
		</form>
<script language="javascript"> 

    function getValue()
    {
        var v = document.getElementById("search");
        alert(v.value);
     // window.location.href="http://localhost:8080/RecommendMovie/movieInfo.jsp?id=/"+v
    }
 </script>
 <!--  % 
  System.out.println(v.value);
    try{
	            //调用Class.forName()方法加载驱动程序
	            Class.forName("com.mysql.jdbc.Driver");
	       
	            String url="jdbc:mysql://localhost:3306/douban_movie";    //JDBC的URL    
	            Connection conn;
	            conn = DriverManager.getConnection(url,"root","123456");
	            Statement stmt = conn.createStatement(); //创建Statement对象
	           
	           // String sql = "select m_id,m_name from movie_copy where m_name= '"+names+"'";    //要执行的SQL
	            String sql = "select m_id,m_name from movie_copy where m_name= '伊丽莎白'";    //要执行的SQL
	            ResultSet rs = stmt.executeQuery(sql);//创建数据对象
	               
	              int movieId=0;
	          
	                if(rs.next()){
	                    
	                    System.out.println(rs.getInt(1));
	                    System.out.println(rs.getString(2));
	                    movieId=rs.getInt(1);
	                  
	        			response.sendRedirect("movieInfo.jsp?id="+movieId);
	                    
	                    
	                    
	                    
	                }
	                rs.close();
	                stmt.close();
	                conn.close();
	            }catch(Exception e)
	            {
	                e.printStackTrace();
	            }
	    
		
	
	
	%-->
   

</body>
</html>