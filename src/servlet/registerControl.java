package servlet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/registerControl")
public class registerControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");

		HttpSession session=request.getSession();
		//检查用户名是否已经存在
		//已存在
		if(exist(username)==true) {
			session.setAttribute("info", 1);
			response.sendRedirect("register.jsp");
		}
		//可以创建用户
		else {
			insertUser(username,request.getParameter("pwd"));
			//跳转到提示注册成功界面
			request.getRequestDispatcher("wait.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

	//检查用户名是否存在
	private boolean checkExist(String username) throws IOException {
		boolean isMatch=false;
		//从文件读取用户信息
		FileReader fr=new FileReader("userLogin.txt");
		BufferedReader br=new BufferedReader(fr);
		String line;
		
		while((line=br.readLine())!=null) {
			if(line.startsWith(username+" ")){
				isMatch=true;
				break;
			}
		}
		br.close();
		fr.close();
		return isMatch;
	}
	
	private boolean exist(String name){
		boolean isExist=false;
		 try{
	            //调用Class.forName()方法加载驱动程序
	            Class.forName("com.mysql.jdbc.Driver");
	         
	       
	            String url="jdbc:mysql://localhost:3306/douban_movie?characterEncoding=utf-8";    //JDBC的URL    
	            Connection conn;
	            conn = DriverManager.getConnection(url,"root","123456");
	            java.sql.Statement stmt = conn.createStatement(); //创建Statement对象
	           
	            String sql = "select uid from user where uid= "+name+" ";    //要执行的SQL
	            

	            ResultSet rs = stmt.executeQuery(sql);//创建数据对象
	         
	               if (rs.next()){
	                    
	               isExist=true;
	                    
	                }
	                rs.close();
	                stmt.close();
	                conn.close();
	            }catch(Exception e)
	            {
	                e.printStackTrace();
	            }
	    return isExist;
	}
	
	
	
	//追加新用户到文件
	private void createUser(String name,String pwd) throws IOException {
		FileWriter fw=new FileWriter("userLogin.txt",true);
		fw.write(name+" "+pwd+"\r\n");
		fw.close();
	}
	
	private void insertUser(String name,String pwd){
		 try{
	            //调用Class.forName()方法加载驱动程序
	            Class.forName("com.mysql.jdbc.Driver");
	         
	       
	            String url="jdbc:mysql://localhost:3306/douban_movie?characterEncoding=utf-8";    //JDBC的URL    
	            Connection conn;
	            conn = DriverManager.getConnection(url,"root","123456");
	            java.sql.Statement stmt = conn.createStatement(); //创建Statement对象
	           
	            String sql = "insert into user values ('"+name+"','"+pwd+"')";    //要执行的SQL
	            

	            stmt.execute(sql);//创建数据对象
	         
	             
	              	                stmt.close();
	                conn.close();
	            }catch(Exception e)
	            {
	                e.printStackTrace();
	            }
	    
	}
	
}
