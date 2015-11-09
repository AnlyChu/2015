package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Validate;
import bean.InsertUpdateDelBean;

public class SportsgradeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SportsgradeServlet() {
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

		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String args[] = {"grade"};
		String row = "";
		String val = "";
		Validate v = new Validate();
		HttpSession session = request.getSession();
		ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
		for(int i = 0;i < args.length;i++){
			if(i == args.length-1){
				row += args[i]+",student,dates";
				val += "'"+request.getParameter(args[i])+"',"+adminlogin.get(0)+",'"+v.getSystemDate().substring(0,10)+"'";
			}else{
				row += args[i]+",";
				val += "'"+request.getParameter(args[i])+"',";
			}
		}
		String sql = "insert into sportsgrade("+row+") values("+val+")";
		int responseText = ib.insertANDupdateANDdel(sql);
		if(responseText != -1){
			request.setAttribute("message", "'成绩评测提交成功！'");
		}else{
			request.setAttribute("message", "'此成绩评测您已提交！'");
		}
		request.getRequestDispatcher("/admin/sportsgrade.jsp").forward(request, response);		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
