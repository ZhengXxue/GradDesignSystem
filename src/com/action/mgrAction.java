package com.action;

import java.io.IOException;

import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.mgrDao;
import com.bean.Manager;

/**
 * Servlet implementation class stuAction
 */
@WebServlet("/mgrAction")
public class mgrAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mgrAction() {
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
		if(action.equals("updatetime")){
				try {
					updateTime(request,response);
				} catch (ClassNotFoundException | SQLException | ParseException  e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		if(action.equals("check")){
			try {
				check(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(action.equals("rules")){
			try {
				rules(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private void updateTime(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException, ParseException {
		// TODO Auto-generated method stub
		String TimeStart=request.getParameter("TimeStart");
		String TimeEnd=request.getParameter("TimeEnd");
		String ID=request.getParameter("ID");
		int rtn=mgrDao.updateTime(TimeStart,TimeEnd,ID);
		if(rtn>0){
			response.sendRedirect("admin/mgrtopic.jsp");
		}
	}
	private void check(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String IsPublished=request.getParameter("IsPublished");
		String ID=request.getParameter("ID");
		int rtn=mgrDao.check(IsPublished,ID);
		if(rtn>0){
			response.sendRedirect("admin/mgrtopic.jsp");
		}
	}
	private void rules(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		int Maxnum=Integer.valueOf(request.getParameter("Maxnum"));
		int radio=Integer.valueOf(request.getParameter("radio"));
		String year=request.getParameter("year");
		int rtn=mgrDao.setRules(Maxnum, radio, year);
		if(rtn>0){
			response.sendRedirect("admin/rules.jsp");
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
