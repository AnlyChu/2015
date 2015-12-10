package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SelectBean;

public class AdminLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminLoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String status = request.getParameter("status");
		String table = "";
		System.out.print("status="+status);
		if(status.equals("辅导员")){
			table = "counsellor";
		}else if(status.equals("书记")){
			table = "admin";
		}else{
			table = "student";
		}
		String sql = "select * from "+table+" where id='"+id+"' and pwd='"+pwd+"'";

		String args[] = {"id","name","pwd","status"};
		SelectBean sb = new SelectBean();		
		ArrayList al = sb.selectRow(args, sql);

        String responseText = "";
		
		if(al == null || al.size() == 0){
			responseText = "1";
//			request.setAttribute("message", responseText);
		}else if(status.equals("辅导员")){
			HttpSession session = request.getSession();
			session.setAttribute("adminlogin", al);
			responseText = "3";
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("adminlogin", al);
			responseText = "2";
//			request.setAttribute("adminName", name);
		}
//		response.sendRedirect("/twtweb/users/index.jsp?message="+responseText);
//		request.getRequestDispatcher("/users/index.jsp").forward(request, response);
		PrintWriter out = response.getWriter();
		out.print(responseText);
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
