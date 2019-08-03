package com.dao;
import java.sql.*;
import java.util.ArrayList;

import com.bean.Teacher;
import com.util.dbAccess;
public class teacherDao {
	static public Teacher getTeacher(String number) throws ClassNotFoundException,SQLException{
		Teacher teacher=null;
		String sql="select *from Teacherinfo where Tno='"+number+"'";
		dbAccess db=new dbAccess();
		ResultSet rs=db.Query(sql);
		if(rs!=null){
			rs.next();
			teacher=new Teacher();
			teacher.setTname(rs.getString(1));
		    teacher.setTno(rs.getString(2));
		    teacher.setTpwd(rs.getString(3));
		    teacher.setTpost(rs.getString(4));
		    teacher.setTintro(rs.getString(5));
		}
		return teacher;
	}
	static public ArrayList<Teacher> getAllteacher() throws SQLException, ClassNotFoundException{
		ArrayList<Teacher> teachers=new ArrayList<Teacher>();
		dbAccess db=new dbAccess();
		String sql="select *from Teacherinfo";
		ResultSet rs=db.Query(sql);
		while(rs.next()){
			Teacher teacher=new Teacher();
			teacher.setTname(rs.getString(1));
		    teacher.setTno(rs.getString(2));
		    teacher.setTpwd(rs.getString(3));
		    teacher.setTpost(rs.getString(4));
		    teacher.setTintro(rs.getString(5));
		    teachers.add(teacher);
		}
		return teachers;
	}
	static public int insertTeacher(String Tname,String Tno,String Tpwd,String Tpost,String Tintro
	) throws ClassNotFoundException,SQLException{
		int rtn=0;
		String sql="insert into Teacherinfo(Tname,Tno,Tpwd,Tpost,Tintro) values('"+Tname
			+"','"+Tno+"','"+Tpwd+"','"+Tpost+"','"+Tintro+"')";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	static public int updateTeacher(String Tname,String Tno,String Tpwd,String Tpost,String Tintro,
			String number) throws ClassNotFoundException,SQLException{
		int rtn=0;
		String sql="update Teacherinfo set Tname='"+Tname+"',Tno='"+Tno+"',Tpwd='"+Tpwd
				+"',Tpost='"+Tpost+"',Tintro='"+Tintro+"' where Tno='"+number+"'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	static public int deleteTeacher(String number) throws ClassNotFoundException, SQLException{
		int rtn=0;
		String sql="delete from Teacherinfo where Tno='"+number+"'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	//管理员重置老师密码
	static public int resetTeacher() throws ClassNotFoundException, SQLException{
		int rtn=0;
		String sql="update Teacherinfo set Tpwd='123456'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
}
