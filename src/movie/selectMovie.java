package movie;

import java.sql.*;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

public class selectMovie {

	public static void main(String[] args) {
	    try{
            //����Class.forName()����������������
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("�ɹ�����MySQL������");
                
            String url="jdbc:mysql://localhost:3306/douban_movie";    //JDBC��URL    
            Connection conn;
            conn = DriverManager.getConnection(url,"root","123456");
            Statement stmt = conn.createStatement(); //����Statement����
            System.out.println("�ɹ����ӵ����ݿ⣡");
            String sql = "select m_id,m_name,imgurl from movie";    //Ҫִ�е�SQL
            ResultSet rs = stmt.executeQuery(sql);//�������ݶ���
                System.out.println("��ӰID"+"\t"+"��Ӱ����"+"\t"+"��ӰͼƬ");
                while (rs.next()){
                    System.out.print(rs.getInt(1) + "\t");
                    System.out.print(rs.getString(2) + "\t");
                    System.out.print(rs.getInt(3) + "\t");
                    System.out.println();
                }
                rs.close();
                stmt.close();
                conn.close();
            }catch(Exception e)
            {
                e.printStackTrace();
            }
    

	}

}
