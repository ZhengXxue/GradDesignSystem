package com.action;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.*;
import com.bean.*;
import com.util.*;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/loginAction")
public class loginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String loginType=request.getParameter("loginType");
		Student stu=new Student();
		Teacher teacher=new Teacher();
		try{
			if(loginType.equals("user")){                       //身份为学生时
				stu=stuDao.getStudent(userName);
				if(stu!=null){
					if(!password.equals(stu.getSpwd())){
						HttpSession session=request.getSession();
			    	    session.setAttribute("message","密码错误!");
						response.sendRedirect("login.jsp");
			        }
					else{
						HttpSession session=request.getSession();
			    	    session.setAttribute("stu",stu);
			    	    response.sendRedirect("stuMain.jsp");
			    	    return;
					}
				}
			}
			else if(loginType.equals("teacher")){                       //身份为老师时
				teacher=teacherDao.getTeacher(userName);
				if(teacher!=null){
					if(!password.equals(teacher.getTpwd())){
						HttpSession session=request.getSession();
			    	    session.setAttribute("message","密码错误!");
						response.sendRedirect("login.jsp");
			        }
					else{
						HttpSession session=request.getSession();
			    	    session.setAttribute("teacher",teacher);
			    	    response.sendRedirect("teacherMain.jsp");
			    	    return;
					}
				}
			}
			else if(loginType.equals("admin")){                             //身份为管理员时
				if(userName.equals("admin") && password.equals("admin")){
					response.sendRedirect("adminMain.jsp");
				}
				else{
					HttpSession session=request.getSession();
		    	    session.setAttribute("message","管理员密码错误!");
		    	    response.sendRedirect("login.jsp");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
