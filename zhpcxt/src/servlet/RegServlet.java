package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;
import bean.SelectBean;

public class RegServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegServlet() {
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
		
		String type = request.getParameter("type");
		String sql = "";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		int responseText = 0;
		if(type != null && type.equals("reg")){
			String args[] = {"name","pwd","truename","classes","sex","birthday","phone","address","postalcode","email"};
			String row = "";
			String val = "";
			for(int i = 0;i < args.length;i++){
				if(i == args.length-1){
					row += args[i];
					val += "'"+request.getParameter(args[i])+"'";
				}else{
					row += args[i]+",";
					val += "'"+request.getParameter(args[i])+"',";
				}
			}
			sql = "insert into student("+row+") values("+val+")";
			responseText = ib.insertANDupdateANDdel(sql);
			if(responseText != -1){
				String args1[] = {"id"};
				sql = "select max(id) as id from student";
				SelectBean sb = new SelectBean();
				ArrayList al = sb.selectRow(args1, sql);
				sql = "insert into score(student) values("+al.get(0)+")";
				ib.insertANDupdateANDdel(sql);
			}
		}
		
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
