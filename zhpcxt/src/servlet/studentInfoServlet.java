package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import bean.InsertUpdateDelBean;

public class studentInfoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public studentInfoServlet() {
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
	
		String str = "";
		
		String sql = "select top 20 * from student1";
		String m = request.getParameter("m");
		int n = 20 * (m!=null ? Integer.parseInt(m) : 1);
		if(sql != null){
			if(sql.equals("0")){
			sql = "select top 20 * from student1";
			str = "/admin/evaluating.jsp";	
			}
			if(sql.equals("i")){
				sql = "select top 20 * from student1 where(studentId not in (select top " + n + " studentId from student1 order by studentId)) order by studentId desc";
				str = "/admin/studentInfoUpload.jsp";	
			}
		}
		request.setAttribute( "sql",sql);
		request.getRequestDispatcher(str).forward(request, response);
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
