package com.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.stuDao;
import com.dao.teacherDao;
import com.bean.Student;

/**
 * Servlet implementation class stuAction
 */
@WebServlet("/stuAction")
public class stuAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stuAction() {
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
		if(action.equals("update")){
				try {
					update(request,response);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		if(action.equals("insert")){
			try {
				insert(request,response);
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
		String Sname=request.getParameter("Sname");
		String Sno=request.getParameter("Sno");
		String Spwd=request.getParameter("Spwd");
		String Smajor=request.getParameter("Smajor");
		String Sclass=request.getParameter("Sclass");
		String Semail=request.getParameter("Semail");
		String Stel=request.getParameter("Stel");
		String GPA=request.getParameter("GPA");
		int rtn=stuDao.insertStudent(Sname,Sno,Spwd,Smajor,Sclass,Semail,Stel,GPA);
		if(rtn>0){
			response.setCharacterEncoding("UTF-8");
			HttpSession session=request.getSession();
    	    session.setAttribute("message","添加成功!");
			response.sendRedirect("admin/user.jsp");
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String Sname=request.getParameter("Sname");
		String Sno=request.getParameter("Sno");
		String Spwd=request.getParameter("Spwd");
		String Smajor=request.getParameter("Smajor");
		String Sclass=request.getParameter("Sclass");
		String Semail=request.getParameter("Semail");
		String Stel=request.getParameter("Stel");
		String GPA=request.getParameter("GPA");
		String number=request.getParameter("number");
		int rtn=stuDao.updateStudent(Sname,Sno,Spwd,Smajor,Sclass,Semail,Stel,GPA,number);
		if(rtn>0){
			HttpSession session=request.getSession();
    	    session.setAttribute("message","修改成功!");
			response.sendRedirect("admin/user.jsp");
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String number=request.getParameter("Sno");
		int rtn=stuDao.deleteStudent(number);
		if(rtn>0){
			HttpSession session=request.getSession();
			response.sendRedirect("admin/user.jsp");
		}
	}
	private void reset(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		int rtn=stuDao.resetStudent();
		if(rtn>0){
			response.sendRedirect("admin/user.jsp");
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
