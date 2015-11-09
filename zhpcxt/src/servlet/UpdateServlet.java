package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import bean.InsertUpdateDelBean;

public class UpdateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateServlet() {
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
		
		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("gb2312");
		String name = request.getParameter("a");
		String admin= request.getParameter("admin");
//		String turename = request.getParameter("2");
//		String classes = request.getParameter("3");
//		String sex = request.getParameter("4");
//		String birthday = request.getParameter("5");
//		String phone= request.getParameter("6");
//		String address = request.getParameter("7");
//		String postalcode = request.getParameter("8");
//		String email = request.getParameter("9");
		String sql="update dbo.student  set name="+name+"where id="+admin;
//				+ ",turename="+2+"" ,turename=?,classes=?,sex=?,birthday=?,phone=?,address=?,postalcode=?,email=? WHERE name=?" 
	}
		
	public void init() throws ServletException {
		// Put your code here
	}
	
}
