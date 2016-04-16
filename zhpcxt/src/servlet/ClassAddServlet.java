package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

public class ClassAddServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ClassAddServlet() {
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

		int responseText = 0;
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String args[] = {"class_id","grade","dept","pro","class","mgr","class_score_table"};
		String row = "";
		String val = "";
		for(int i = 0;i < args.length;i++){
			if(i == args.length-1){
				row += args[i];
				val += "'"+request.getParameter(args[0])+"'";
			}else{
				row += args[i]+",";
				val += "'"+request.getParameter(args[i])+"',";
			}
		}
		String creatTableSql = "CREATE TABLE `" +
				request.getParameter(args[0]) + "` (\n" +
				"  `id` int(11) NOT NULL AUTO_INCREMENT,\n" +
				"  `student_id` varchar(255) DEFAULT NULL,\n" +
				"  `course_id` varchar(255) DEFAULT NULL,\n" +
				"  `school_grades` float DEFAULT NULL,\n" +
				"  `school_year` varchar(255) DEFAULT NULL,\n" +
				"  `term` varchar(255) DEFAULT NULL,\n" +
				"  `score` varchar(255) DEFAULT NULL,\n" +
				"  PRIMARY KEY (`id`)\n" +
				") ENGINE=InnoDB DEFAULT CHARSET=utf8";

		String sql = "insert into class("+row+") values("+val+")";
		System.out.println("sql="+sql);
		System.out.println("creatTableSql="+creatTableSql);
		responseText = ib.insertANDupdateANDdel(creatTableSql);
		responseText = ib.insertANDupdateANDdel(sql);
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
