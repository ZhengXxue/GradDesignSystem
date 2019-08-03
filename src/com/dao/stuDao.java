package com.dao;
import java.sql.*;
import java.util.ArrayList;

import com.bean.Student;
import com.util.dbAccess;
public class stuDao {
	static public Student getStudent(String number) throws ClassNotFoundException,SQLException{
		Student stu=null;
		String sql="select *from Studentinfo where Sno='"+number+"'";
		dbAccess db=new dbAccess();
		ResultSet rs=db.Query(sql);
		if(rs!=null){
			rs.next();
			stu=new Student();
			stu.setSname(rs.getString(1));
		    stu.setSno(rs.getString(2));
		    stu.setSpwd(rs.getString(3));
		    stu.setSmajor(rs.getString(4));
		    stu.setSclass(rs.getString(5));
		    stu.setSemail(rs.getString(6));
		    stu.setStel(rs.getString(7));
		    stu.setGPA(rs.getFloat(8));
		}
		return stu;
	}
	static public ArrayList<Student> getAllstudent() throws SQLException, ClassNotFoundException{
		ArrayList<Student> students=new ArrayList<Student>();
		dbAccess db=new dbAccess();
		String sql="select *from Studentinfo";
		ResultSet rs=db.Query(sql);
		while(rs.next()){
			Student student=new Student();
			student.setSname(rs.getString(1));
		    student.setSno(rs.getString(2));
		    student.setSpwd(rs.getString(3));
		    student.setSmajor(rs.getString(4));
		    student.setSclass(rs.getString(5));
		    student.setSemail(rs.getString(6));
		    student.setStel(rs.getString(7));
		    student.setGPA(rs.getFloat(8));
		    students.add(student);
		}
		return students;
	}
	//老师查看所有学生的选题情况
	static public ResultSet getAllstuSelect() throws SQLException, ClassNotFoundException{
		dbAccess db=new dbAccess();
		String sql="select Sname,s.Sno,Smajor,Sclass,GPA,Name,Type,Tname,State from  TopicInfo as t join"
				+ " Studentinfo as s on s.Sno=t.Sno join TeacherInfo as teacher on t.Teacher=teacher.Tno";
		ResultSet rs=db.Query(sql);
		return rs;
	}
	static public int getStudentCount(String year) throws ClassNotFoundException, SQLException{
		ResultSet rs;
		int count=0;
		String sql="select count(*) from Studentinfo where Sclass='"+year+"'";
		dbAccess db=new dbAccess();
		rs=db.Query(sql);
		rs.next();
		count=rs.getInt(1);
		return count;
	}
	static public float getStudentGPA(String Sno) throws ClassNotFoundException, SQLException{
		ResultSet rs;
		float GPA=0;
		String sql="select GPA from StudentInfo where Sno='"+Sno+"'";
		dbAccess db=new dbAccess();
		rs=db.Query(sql);
		rs.next();
		GPA=rs.getFloat(1);
		return GPA;
	}
	static public int insertStudent(String Sname,String Sno,String Spwd,String Smajor,String Sclass,
			String Semail,String Stel,String GPA) throws ClassNotFoundException,SQLException{
		int rtn=0;
		String sql="insert into Studentinfo(Sname,Sno,Spwd,Smajor,Sclass,Semail,Stel,GPA) values('"+Sname
			+"','"+Sno+"','"+Spwd+"','"+Smajor+"','"+Sclass
			+"','"+Semail+"','"+Stel+"','"+GPA+"')";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	static public int updateStudent(String Sname,String Sno,String Spwd,String Smajor,String Sclass,
			String Semail,String Stel,String GPA,String number) throws ClassNotFoundException,SQLException{
		int rtn=0;
		String sql="update Studentinfo set Sname='"+Sname+"',Sno='"+Sno+"',Spwd='"+Spwd
				+"',Smajor='"+Smajor+"',Sclass='"+Sclass+"',Semail='"+Semail+"',Stel='"+Stel
				+"',GPA='"+GPA+"' where Sno='"+number+"'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	static public int deleteStudent(String number) throws ClassNotFoundException, SQLException{
		int rtn=0;
		String sql="delete from Studentinfo where Sno='"+number+"'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	//管理员重置学生密码
	static public int resetStudent() throws ClassNotFoundException, SQLException{
		int rtn=0;
		String sql="update Studentinfo set Spwd='123456'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
}
