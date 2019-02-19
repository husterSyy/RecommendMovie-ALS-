
package servlet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.enterprise.context.spi.Context;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;


@WebServlet("/loginCheck")
public class loginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		login(request, response);
		
		
		
		
		
	}


	private void login(HttpServletRequest request, HttpServletResponse response)
			throws IOException, UnsupportedEncodingException {
		response.setContentType("text/html;charset=UTF-8");
		//ArrayList<String> users=read();
		//检查
	//	boolean isRight=check(users,request);
		
		boolean isRight=readSql(request);
		
		//密码正确，跳转到推荐界面
		if(isRight==true) {
			HttpSession session=request.getSession();
			session.setAttribute("username",request.getParameter("username"));
			session.setAttribute("pwd",request.getParameter("pwd"));
			response.sendRedirect("classify.jsp?type=1");
		}
		//密码错误，重新登录
		else{
			request.getSession().setAttribute("isRight","none");
			response.sendRedirect("index.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	//检查用户名密码是否正确
	private boolean check(ArrayList<String> users,HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		boolean isRight=users.contains(request.getParameter("username")+" "+request.getParameter("pwd"));
		return isRight;
	}

	//从文件读取用户信息
	private ArrayList<String> read() throws IOException {
		FileReader fr=new FileReader("userLogin.txt");
		
		
		BufferedReader br=new BufferedReader(fr);
		String line;
		ArrayList<String> users=new ArrayList<String>();
		while((line=br.readLine())!=null) {
			users.add(line);
		}
		br.close();
		fr.close();
		return users;
	}
	
	private boolean readSql(HttpServletRequest req){
		
		boolean login=false;
		 try{
	            //调用Class.forName()方法加载驱动程序
	            Class.forName("com.mysql.jdbc.Driver");
	         
	       
	            String url="jdbc:mysql://localhost:3306/douban_movie?characterEncoding=utf-8";    //JDBC的URL    
	            Connection conn;
	            conn = DriverManager.getConnection(url,"root","123456");
	            java.sql.Statement stmt = conn.createStatement(); //创建Statement对象
	           
	            String sql = "select uid,password from user where uid= '"+req.getParameter("username")+"' and password= '"+req.getParameter("pwd")+"' ";    //要执行的SQL
	            
	         //   String sql = "select uid,password from user where uid=2108698 and password=123456 "; 
	            
//	            String sql = "select * from User where username=? and pwd=?";
//
//	            	PreparedStatement ps = conn.prepareStatement(sql);
//
//	            	ps.setString(1, username);
//
//
//	            	ps.setString(2, pwd);
//
//                   rs = ps.executeQuery();

	            ResultSet rs = stmt.executeQuery(sql);//创建数据对象
	         
	               if (rs.next()){
	                    
	               login=true;
	                    
	                }
	                rs.close();
	                stmt.close();
	                conn.close();
	            }catch(Exception e)
	            {
	                e.printStackTrace();
	            }
	    
		
		return login;
		
	}
	
	
}
