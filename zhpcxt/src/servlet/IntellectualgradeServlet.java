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

public class IntellectualgradeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public IntellectualgradeServlet() {
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
		String term = request.getParameter("term");
		String name = "";
		String grade = "";
		if(term != null && term.equals("1")){
			name = "思想道德修养与法律基础,大学英语1,国防教育,计算机导论,线性代数,高等数学上";
			grade = request.getParameter("input1")+","+request.getParameter("input2")+","+request.getParameter("input3")+","+request.getParameter("input4")+","+request.getParameter("input5")+","+request.getParameter("input6");
		}else if(term != null && term.equals("2")){
			name = "大学语文,马克思主义基本原理,中国近代史纲要,大学英语2,教师口语,离散数学,高等数学下,普通物理,高级语言程序设计";
			grade = request.getParameter("input1")+","+request.getParameter("input2")+","+request.getParameter("input3")+","+request.getParameter("input4")+","+request.getParameter("input5")+","+request.getParameter("input6")+","+request.getParameter("input7")+","+request.getParameter("input8")+","+request.getParameter("input9");
		}else if(term != null && term.equals("3")){
			name = "毛泽东思想、邓小平理论和“三个代表”重要思想概论,大学英语3,电路原理,模拟电子技术,算法与数据结构,汇编语言";
			grade = request.getParameter("input1")+","+request.getParameter("input2")+","+request.getParameter("input3")+","+request.getParameter("input4")+","+request.getParameter("input5")+","+request.getParameter("input6");
		}else if(term != null && term.equals("4")){
			name = "毛泽东思想、邓小平理论和“三个代表”重要思想概论,大学英语4,数字逻辑,计算机组成原理,编译原理,操作系统";
			grade = request.getParameter("input1")+","+request.getParameter("input2")+","+request.getParameter("input3")+","+request.getParameter("input4")+","+request.getParameter("input5")+","+request.getParameter("input6");
		}else if(term != null && term.equals("5")){
			name = "心理学,现代教育技术,数据库系统原理,计算机通信与网络";
			grade = request.getParameter("input1")+","+request.getParameter("input2")+","+request.getParameter("input3")+","+request.getParameter("input4");
		}else if(term != null && term.equals("6")){
			name = "计算机教学法,教育学,教育见习,网络管理实习";
			grade = request.getParameter("input1")+","+request.getParameter("input2")+","+request.getParameter("input3")+","+request.getParameter("input4");
		}else if(term != null && term.equals("7")){
			name = "形势与政策,教育实习,计算机职业调查";
			grade = request.getParameter("input1")+","+request.getParameter("input2")+","+request.getParameter("input3");
		}else if(term != null && term.equals("8")){
			name = "软件工程综合实习,毕业设计";
			grade = request.getParameter("input1")+","+request.getParameter("input2");
		}
		String sql = "insert into intellectualgrade(student,term,name,grade,dates) values("+adminlogin.get(0)+",'"+term+"','"+name+"','"+grade+"','"+v.getSystemDate().substring(0,10)+"')";
		int responseText = ib.insertANDupdateANDdel(sql);
		if(responseText != -1){
			request.setAttribute("message", "'成绩评测提交成功！'");
		}else{
			request.setAttribute("message", "'此成绩评测您已提交！'");
		}
		request.getRequestDispatcher("/admin/intellectualgrade.jsp").forward(request, response);	
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
