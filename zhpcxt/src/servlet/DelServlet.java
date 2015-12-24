package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import bean.InsertUpdateDelBean;

public class DelServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelServlet() {
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
		
		String sql = "";
		String str = "";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		
		String admin = request.getParameter("admin");
		String verify = request.getParameter("verify");
		String verifyType = request.getParameter("verifyType");
		String sportsgrade = request.getParameter("sportsgrade");
		String intellectualgrade = request.getParameter("intellectualgrade");
		String student = request.getParameter("student");
		String evaluating = request.getParameter("evaluating");
		String cMgr = request.getParameter("cMgr");
		HttpSession session = request.getSession();
		String classId = (String) session.getAttribute("classId");
		if(cMgr != null && !cMgr.equals("")){
			
			sql = "update class1 set cMgr='"+cMgr+"' where classId='"+classId+"'";
			System.out.println("sql"+sql);
			ib.insertANDupdateANDdel(sql);
			str = "/admin/classStuInfo.jsp";
			String responseText = "";
			responseText = "1";
			PrintWriter out = response.getWriter();
			out.print(responseText);
			out.close();
		}
		if(verify != null && !verify.equals("")){
			sql = "delete from verify where id="+verify;
			ib.insertANDupdateANDdel(sql);
			str = "/admin/verify.jsp?verifyType="+verifyType;			
		}
		if(sportsgrade != null && !sportsgrade.equals("")){
			sql = "delete from sportsgrade where id="+sportsgrade;
			ib.insertANDupdateANDdel(sql);
			str = "/admin/sportsgrade.jsp";			
		}
		if(intellectualgrade != null && !intellectualgrade.equals("")){
			sql = "delete from intellectualgrade where id="+intellectualgrade;
			ib.insertANDupdateANDdel(sql);
			str = "/admin/intellectualgrade.jsp";			
		}
		if(student != null && !student.equals("")){
			sql = "delete from intellectualgrade where student="+student;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from score where student="+student;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from sportsgrade where student="+student;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from verify where student="+student;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from student where id="+student;
			ib.insertANDupdateANDdel(sql);
			str = "/admin/student.jsp";			
		}
		if(evaluating != null && !evaluating.equals("")){
			sql = "delete from intellectualgrade where evaluating="+evaluating;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from sportsgrade where evaluating="+evaluating;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from verify where evaluating="+evaluating;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from evaluating where id="+evaluating;
			ib.insertANDupdateANDdel(sql);
			str = "/admin/evaluating.jsp";			
		}
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
