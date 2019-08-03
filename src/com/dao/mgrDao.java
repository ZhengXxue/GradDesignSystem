package com.dao;
import java.sql.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import com.bean.Manager;
import com.util.dbAccess;
public class mgrDao {
	static public Manager getManager(String number) throws ClassNotFoundException,SQLException{
		Manager manager=null;
		String sql="select *from Mgrinfo where ID='"+number+"'";
		dbAccess db=new dbAccess();
		ResultSet rs=db.Query(sql);
		if(rs!=null){
			rs.next();
			manager=new Manager();
			manager.setID(rs.getInt(1));
		    manager.setGradYear(rs.getString(2));
		    manager.setStuNum(rs.getString(3));
		    manager.setTimeStart(rs.getString(4));
		    manager.setTimeEnd(rs.getString(5));
		    manager.setIsPublished(rs.getString(6));
		}
		return manager;
	}
	static public ArrayList<Manager> getAllmanager() throws SQLException, ClassNotFoundException{
		ArrayList<Manager> managers=new ArrayList<Manager>();
		dbAccess db=new dbAccess();
		String sql="select ID,GradYear,StuNum,TimeStart,TimeEnd,IsPublished from Mgrinfo";
		ResultSet rs=db.Query(sql);
		while(rs.next()){
			Manager manager=new Manager();
			manager=new Manager();
			manager.setID(rs.getInt(1));
		    manager.setGradYear(rs.getString(2));
		    manager.setStuNum(rs.getString(3));
		    manager.setTimeStart(rs.getString(4));
		    manager.setTimeEnd(rs.getString(5));
		    manager.setIsPublished(rs.getString(6));
		    managers.add(manager);
		}
		return managers;
	}
	static public ArrayList<Manager> getRules()throws ClassNotFoundException,SQLException{
		ArrayList<Manager> rules=new ArrayList<Manager>();
		String sql="select GradYear,Maxnum,radio from MgrInfo";
		dbAccess db=new dbAccess();
		ResultSet rs=db.Query(sql);
		while(rs.next()){
			Manager rule=new Manager();
			rule.setGradYear(rs.getString(1));
			rule.setMaxnum(Integer.valueOf(rs.getString(2)));
			rule.setRadio(Integer.valueOf(rs.getString(3)));
			rules.add(rule);
		}
		return rules;
	}
	//管理员设置选题规则，每位老师指导学生数量上限以及优秀学生占比
	static public int setRules(int Maxnum,int radio,String year)throws ClassNotFoundException,SQLException{
		int rtn=0;
		String sql="update Mgrinfo set Maxnum='"+Maxnum+"',radio='"+radio+"' where GradYear='"+year+"'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	//管理员获得每个年级的学生总人数
	static public int setStuCount(String year)throws ClassNotFoundException,SQLException{
		int rtn=0;
		String sql="update Mgrinfo set StuNum='"+stuDao.getStudentCount(year)+"' where GradYear='"+year+"'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	//管理员设置每个年级的选题开始时间和结束时间
	static public int updateTime(String TimeStart,String TimeEnd,String ID)throws ClassNotFoundException,SQLException, ParseException{
		int rtn=0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1=sdf.parse(TimeStart);
		Date date2=sdf.parse(TimeEnd);  //转换类型
		String sql="update Mgrinfo set TimeStart='"+sdf.format(date1)+"',TimeEnd='"+sdf.format(date2)+"' where ID='"+ID+"'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	static public int check(String IsPublished,String ID)throws ClassNotFoundException,SQLException{
		int rtn=0;
		String sql="update Mgrinfo set IsPublished='"+IsPublished+"' where ID='"+ID+"'";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
	static public int insertManager(String ID,String GradYear,String StuNum,String TimeStart,String TimeEnd
	,String IsPublished) throws ClassNotFoundException,SQLException{
		int rtn=0;
		String sql="insert into Mgrinfo(ID,GradYear,StuNum,TimeStart,TimeEnd,IsPublished) values('"+ID
			+"','"+GradYear+"','"+StuNum+"','"+TimeStart+"','"+TimeEnd+"','"+IsPublished+"')";
		dbAccess db=new dbAccess();
		rtn=db.Update(sql);
		return rtn;
	}
}
