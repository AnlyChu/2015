package util;

import java.sql.*;
public class DBConn {
    static{
        try{
       	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        	Class.forName("com.mysql.jdbc.Driver"); 
   //     	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        }catch(Exception ex){
            ex.printStackTrace();
        }

    }

    public static Connection getConn(){
        try{
        	Connection conn=DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=zhpcxt1","sa","123456");
//        												 jdbc:sqlserver://localhost:1433;DatabaseName=zhpcxt","sa","123456"
//        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/northwind","root","123");
 //       	Connection conn=DriverManager.getConnection("jdbc:odbc:twtweb");
            return conn;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    public static void close(Connection conn,Statement st,ResultSet rs){
    	if(rs!=null){
            try{
                rs.close();
            }catch(SQLException ex){
            }
       }
       if(st!=null){
           try {
               st.close();
           }catch(Exception ex){
           }
       }
       if(conn!=null){
           try{
               conn.close();
           }catch(Exception ex){
           }
       }
    }

}
