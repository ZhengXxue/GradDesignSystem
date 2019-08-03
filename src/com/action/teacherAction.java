package com.action;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.teacherDao;
/**
 * Servlet implementation class teacherAction
 */
@WebServlet("/teacherAction")
public class teacherAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public teacherAction() {
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
		if(action.equals("update")){
			try {
				update(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(action.equals("delete")){
			try {
				delete(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(action.equals("reset")){
			try {
				reset(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String Tname=request.getParameter("Tname");
		String Tno=request.getParameter("Tno");
		String Tpwd=request.getParameter("Tpwd");
		String Tpost=request.getParameter("Tpost");
		String Tintro=request.getParameter("Tintro");
		int rtn=teacherDao.insertTeacher(Tname,Tno,Tpwd,Tpost,Tintro);
		if(rtn>0){
			response.setCharacterEncoding("UTF-8");
			HttpSession session=request.getSession();
    	    session.setAttribute("message","添加成功!");
			response.sendRedirect("admin/teacher.jsp");
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String Tname=request.getParameter("Tname");
		String Tno=request.getParameter("Tno");
		String Tpwd=request.getParameter("Tpwd");
		String Tpost=request.getParameter("Tpost");
		String Tintro=request.getParameter("Tintro");
		String number=request.getParameter("number");
		int rtn=teacherDao.updateTeacher(Tname,Tno,Tpwd,Tpost,Tintro,number);
		if(rtn>0){
			response.setCharacterEncoding("UTF-8");
			HttpSession session=request.getSession();
    	    session.setAttribute("message","修改成功!");
			response.sendRedirect("admin/teacher.jsp");
		}
	}
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String Tno=request.getParameter("Tno");
		int rtn=teacherDao.deleteTeacher(Tno);
		if(rtn>0){
			response.sendRedirect("admin/teacher.jsp");
		}
	}
	private void reset(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		int rtn=teacherDao.resetTeacher();
		if(rtn>0){
			response.sendRedirect("admin/teacher.jsp");
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
