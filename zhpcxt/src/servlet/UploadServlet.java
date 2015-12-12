package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Validate;
import bean.InsertUpdateDelBean;
import bean.StuService;
import bean.studentInfoUpload;
import bean.scoreUpload;

public class UploadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UploadServlet() {
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
		String path = request.getContextPath();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("fileUpload") != null){
			String lujing=(File)request.getAttribute("fileUpload") + request.getParameter("fileUpload");
//        	String filepath=new File(lujing).getAbsoluteFile();
			StuService stu=new StuService();
			stu.upload(lujing);
		}
		else if(request.getParameter("fileUpload1") != null){
			String lujing="G:/biyesheji/电子档/"+request.getParameter("fileUpload1");
			studentInfoUpload stu=new studentInfoUpload();
			stu.upload(lujing);
			request.setAttribute("message", "'上传成功！'");
			request.getRequestDispatcher("/counsellor/studentInfoUpload.jsp").forward(request, response);
		}
		else if(request.getParameter("fileUpload2") != null){
			String lujing="G:/biyesheji/电子档/"+request.getParameter("fileUpload2");
			scoreUpload stu=new scoreUpload();
			stu.upload(lujing);	
			request.setAttribute("message", "'成绩上传成功！'");
			request.getRequestDispatcher("/counsellor/classScore.jsp").forward(request, response);
		}
        
        

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