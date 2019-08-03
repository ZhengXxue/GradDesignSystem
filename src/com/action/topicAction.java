package com.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Manager;
import com.bean.Topic;
import com.dao.topicDao;

/**
 * Servlet implementation class teacherAction
 */
@WebServlet("/topicAction")
public class topicAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public topicAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action=request.getParameter("act");
		if(action.equals("insert")){
			try {
				insert(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("update")){
			try {
				update(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("delete")){
			try {
				delete(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("check")){
			try {
				check(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("complete")){
			try {
				complete(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("uncomplete")){
			try {
				uncomplete(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("getall")){
			try {
				getall(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("select")){
			try {
				select(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("look")){
			findByNo(request,response);
	    }
		else if(action.equals("Stucheck")){
			try {
				Stucheck(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(action.equals("uncheckStu")){
		try {
			uncheckStu(request,response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String Teacher=request.getParameter("Tno");
		String Name=request.getParameter("Name");
		String Type=request.getParameter("Type");
		String Source=request.getParameter("Source");
		String Tools=request.getParameter("Tools");
		String Content=request.getParameter("Content");
		String State="拒绝";
		System.out.println(Content);
		int rtn=topicDao.insertTopic(Teacher,Name,Type,Source,Tools,Content,State);
		if(rtn>0){
			response.setCharacterEncoding("UTF-8");
			response.sendRedirect("teacher/topic.jsp");
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String Name=request.getParameter("Name");
		String Type=request.getParameter("Type");
		String Source=request.getParameter("Source");
		String Tools=request.getParameter("Tools");
		String Content=request.getParameter("Content");
		String name=request.getParameter("name");
		int rtn=topicDao.updateTopic(Name,Type,Source,Tools,Content,name);
		if(rtn>0){
			response.setCharacterEncoding("UTF-8");
			response.sendRedirect("teacher/topic.jsp");
		}
	}
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String Name=request.getParameter("Name");
		int rtn=topicDao.deleteTopic(Name);
		if(rtn>0){
			response.sendRedirect("teacher/topic.jsp");
		}
	}
	private void check(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String State=request.getParameter("State");
		String Name=request.getParameter("Name");
		String Tno=request.getParameter("Tno");
		String GPA=request.getParameter("GPA");
		int flag1=topicDao.judgeStunum(Tno);
		int flag2=topicDao.judgeStuGPA(Tno,GPA);
		if(flag1>0){                  //判断老师所指导的学生人数是否达到上限
			HttpSession session=request.getSession();
		    session.setAttribute("message","指导学生人数达到上限!");
		    response.sendRedirect("teacher/uncomplete.jsp");
		}
		else if(flag2>0){             //判断老师所指导的学生优秀占比是否达到上限
			HttpSession session=request.getSession();
		    session.setAttribute("message","指导学生优秀占比达到上限!");
		    response.sendRedirect("teacher/uncomplete.jsp");
		}
		else{
		int rtn=topicDao.checkTopic(State,Name);
		if(rtn>0){
			response.sendRedirect("teacher/uncomplete.jsp");
		}
		}
	}
	private void complete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Topic> topics=new ArrayList<Topic>();
		topics=topicDao.completeTopic();
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
	    session.setAttribute("topics",topics);
	    response.sendRedirect("admin/topic.jsp");
	}
	private void uncomplete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Topic> topics=new ArrayList<Topic>();
		topics=topicDao.uncompleteTopic();
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
	    session.setAttribute("topics",topics);
	    response.sendRedirect("admin/topic.jsp");
	}
	private void getall(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Topic> topics=new ArrayList<Topic>();
		topics=topicDao.getAlltopic1();
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
	    session.setAttribute("topics",topics);
	    response.sendRedirect("admin/topic.jsp");
	}
	private void select(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Topic> all = new  ArrayList<Topic>();
		String sclass = request.getParameter("sclass");
		try {
			Manager manager = topicDao.findByGrade(sclass);
			Date todaydate=new Date();    //获取当前时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String  date1=manager.getTimeStart();
			Date startdate=sdf.parse(date1);   //将字符串转换为时间格式
			String  date2=manager.getTimeEnd();
			Date enddate=sdf.parse(date2);
			//判断学生所在年级是否发布课题，以及当前时间是否在选题时间内
			if (manager.getGradYear()!=null&&manager.getGradYear().equals(sclass)){
				if (manager.getIsPublished().equals("已发布") && todaydate.getTime()>=startdate.getTime() && todaydate.getTime()<=enddate.getTime()){
					request.getSession().setAttribute("flag",1);
					all = topicDao.getAlltopic2();
					request.getSession().setAttribute("allTopics",all);
					response.sendRedirect("user/topic.jsp");
				}else if ("未发布".equals(manager.getIsPublished())){
					request.getSession().setAttribute("message","对不起，管理员尚未发布题目，暂时无法选题！");
					response.sendRedirect("user/topic.jsp");
				}
				else if(todaydate.getTime()<startdate.getTime() || todaydate.getTime()>enddate.getTime()){
					request.getSession().setAttribute("message","对不起，不在选题时间内，无法选题！");
					response.sendRedirect("user/topic.jsp");
				}
			}else {
				request.getSession().setAttribute("message","对不起，管理员尚未发布题目，暂时无法选题！");
				response.sendRedirect("stuMain.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void findByNo(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("sno");
		System.out.println(id);
		ArrayList<Topic> list = new ArrayList<Topic>();
		try {
			list = topicDao.findByNo(id);
			if (list!=null){
				request.getSession().setAttribute("top",list);
				response.sendRedirect("user/mytopic.jsp");
			}else {
				request.getSession().setAttribute("message","你还没有选题，请先去选题吧！");
				response.sendRedirect("user/topic.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void Stucheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String State="拒绝";
		String Name=request.getParameter("Name");
		String Sno = request.getParameter("Sno");
		int rtn=topicDao.StucheckTopic(State,Name,Sno);
		if(rtn>0){
			request.getSession().setAttribute("message","申请选题成功，请等待审核！");
			request.getSession().setAttribute("top",topicDao.findByNo(Sno));
			response.sendRedirect("user/topic.jsp");
		}
	}
	private void uncheckStu(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Topic> list = new ArrayList<Topic>();
		String State="拒绝";
		String Name=request.getParameter("Name");
		String Sno = request.getParameter("Sno");
		int rtn=topicDao.StucheckTopic(State,Name,"");
		if(rtn>0){
			request.getSession().setAttribute("message","取消选题成功!");
			Topic topic = null;
			try {
				list = topicDao.findByNo(Sno);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("top",list);
				response.sendRedirect("user/mytopic.jsp");
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
