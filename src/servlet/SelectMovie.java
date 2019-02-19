package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SelectMovie
 */
@WebServlet("/SelectMovie")
public class SelectMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		findByName(request,  response);
		//System.out.println(request.getParameter("search"));
		
		
	}

	private void findByName(HttpServletRequest request, HttpServletResponse response) {
		//String names='%'+name+'%';
		String names=request.getParameter("search");
		 try{
	            //调用Class.forName()方法加载驱动程序
	            Class.forName("com.mysql.jdbc.Driver");
	       
	            String url="jdbc:mysql://localhost:3306/douban_movie?characterEncoding=utf-8";    //JDBC的URL    
	            Connection conn;
	            conn = DriverManager.getConnection(url,"root","123456");
	            Statement stmt = conn.createStatement(); //创建Statement对象
	           
	            String sql = "select m_id,m_name from movie where m_name= '"+names+"'";    //要执行的SQL
	            //要执行的SQL
	            ResultSet rs = stmt.executeQuery(sql);//创建数据对象
	               
	              int movieId=0;
	          
	                if(rs.next()){
	                    
	                    System.out.println(rs.getInt(1));
	                    System.out.println(rs.getString(2));
	                    movieId=rs.getInt(1);
	                  
	        			response.sendRedirect("movieInfo.jsp?id="+movieId);
	                    
	                    
	                    
	                    
	                }
	                else{
	                	request.getSession().setAttribute("isRight","none");
	        			response.sendRedirect("recommend.jsp");
	                }
	                rs.close();
	                stmt.close();
	                conn.close();
	            }catch(Exception e)
	            {
	                e.printStackTrace();
	            }
	    
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
