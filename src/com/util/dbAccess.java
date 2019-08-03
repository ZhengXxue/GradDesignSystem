package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class dbAccess {
	String drivername="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String dburl="jdbc:sqlserver://localhost:1433;DatabaseName=GradDesign;useunicode=true;characterEncoding=UTF-8";
	String user="sa";
	String pwd="123456";
	Connection con;
	public dbAccess() throws ClassNotFoundException, SQLException{
	    Class.forName(drivername);     
	    con=DriverManager.getConnection(dburl,user,pwd);        
	}
	public ResultSet Query(String sql) throws ClassNotFoundException, SQLException{    
		ResultSet rs=null;
		Statement stmt=con.createStatement();
		rs=stmt.executeQuery(sql);
		return rs;
	}
	public int Update(String sql) throws ClassNotFoundException, SQLException{               
		int result=0;
		Statement stmt=con.createStatement();
		result=stmt.executeUpdate(sql);
		return result;
	}
	public void close() throws ClassNotFoundException, SQLException{      
		if(con!=null){
			con.close();
		}
	}
}