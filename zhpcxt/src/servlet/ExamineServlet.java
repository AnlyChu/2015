package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AllBean;
import bean.InsertUpdateDelBean;

public class ExamineServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ExamineServlet() {
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
		String state = request.getParameter("state");
		String id = request.getParameter("id");
		String str = "";
		HttpSession session = request.getSession();
		ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		
		if(type != null && type.equals("item")){
			str = "/admin/verifyexamine.jsp";
			String sql = "update verify set evaluating="+adminlogin.get(0)+",state="+state+" where id="+id;
			if(state != null && state.equals("2")){
				ib.insertANDupdateANDdel(sql);
			}else if(state != null && state.equals("1")){
				ib.insertANDupdateANDdel(sql);
				AllBean ab = new AllBean();
				ArrayList verify = ab.getVerify(id);
				if(verify.get(3).equals("¼Ó·Ö")){
					sql = "update score set "+verify.get(2)+"="+verify.get(2)+"+"+verify.get(4)+" where student="+verify.get(1);
					int flag = ib.insertANDupdateANDdel(sql);
					if(flag == -1){
						sql = "update score set "+verify.get(2)+"='100' where student="+verify.get(1);
						ib.insertANDupdateANDdel(sql);
					}
				}else if(verify.get(3).equals("¼õ·Ö")){
					sql = "update score set "+verify.get(2)+"="+verify.get(2)+"+"+verify.get(4)+" where student="+verify.get(1);
					int flag = ib.insertANDupdateANDdel(sql);
					if(flag == -1){
						sql = "update score set "+verify.get(2)+"='0' where student="+verify.get(1);
						ib.insertANDupdateANDdel(sql);
					}
				}
			}
		}
		if(type != null && type.equals("sports")){
			str = "/admin/sportsgradeexamine.jsp";
			String sql = "update sportsgrade set evaluating="+adminlogin.get(0)+",state="+state+" where id="+id;
			if(state != null && state.equals("2")){
				ib.insertANDupdateANDdel(sql);
			}else if(state != null && state.equals("1")){
				ib.insertANDupdateANDdel(sql);
				AllBean ab = new AllBean();
				ArrayList verify = ab.getSportsgradeOne(id);
				sql = "update score set sports=sports+"+verify.get(2)+" where student="+verify.get(1);
				int flag = ib.insertANDupdateANDdel(sql);
				if(flag == -1){
					sql = "update score set sports='100' where student="+verify.get(1);
					ib.insertANDupdateANDdel(sql);
				}
			}
		}
		if(type != null && type.equals("intellectual")){
			str = "/admin/intellectualgradeexamine.jsp";
			String sql = "update intellectualgrade set evaluating="+adminlogin.get(0)+",state="+state+" where id="+id;
			if(state != null && state.equals("2")){
				ib.insertANDupdateANDdel(sql);
			}else if(state != null && state.equals("1")){
				ib.insertANDupdateANDdel(sql);
				AllBean ab = new AllBean();
				ArrayList verify = ab.getIntellectualgradeOne(id);
				float f = 0;
				String term = (String)verify.get(2);
				String grade[] = verify.get(4).toString().split(",");
				if(term.equals("1")){
					f = (Float.parseFloat(grade[0])*3+Float.parseFloat(grade[1])*4+Float.parseFloat(grade[2])*2+Float.parseFloat(grade[3])*2+Float.parseFloat(grade[4])*3+Float.parseFloat(grade[5])*4)/18;
				}else if(term.equals("2")){
					f = (Float.parseFloat(grade[0])*2+Float.parseFloat(grade[1])*3+Float.parseFloat(grade[2])*2+Float.parseFloat(grade[3])*4+Float.parseFloat(grade[4])*1+Float.parseFloat(grade[5])*4+Float.parseFloat(grade[6])*4+Float.parseFloat(grade[7])*4+Float.parseFloat(grade[8])*4)/28;
				}else if(term.equals("3")){
					f = (Float.parseFloat(grade[0])*3+Float.parseFloat(grade[1])*4+Float.parseFloat(grade[2])*(float)2.5+Float.parseFloat(grade[3])*3+Float.parseFloat(grade[4])*5+Float.parseFloat(grade[5])*3)/(float)20.5;
				}else if(term.equals("4")){
					f = (Float.parseFloat(grade[0])*3+Float.parseFloat(grade[1])*4+Float.parseFloat(grade[2])*3+Float.parseFloat(grade[3])*(float)3.5+Float.parseFloat(grade[4])*(float)3.5+Float.parseFloat(grade[5])*(float)4.5)/(float)21.5;
				}else if(term.equals("5")){
					f = (Float.parseFloat(grade[0])*2+Float.parseFloat(grade[1])*2+Float.parseFloat(grade[2])*(float)4.5+Float.parseFloat(grade[3])*(float)4.5)/13;
				}else if(term.equals("6")){
					f = (Float.parseFloat(grade[0])*2+Float.parseFloat(grade[1])*2+Float.parseFloat(grade[2])*1+Float.parseFloat(grade[3])*1)/6;
				}else if(term.equals("7")){
					f = (Float.parseFloat(grade[0])*2+Float.parseFloat(grade[1])*4+Float.parseFloat(grade[2])*1)/7;
				}else if(term.equals("8")){
					f = (Float.parseFloat(grade[0])*2+Float.parseFloat(grade[1])*6)/8;
				}
				sql = "update score set intellectual=intellectual+"+f+" where student="+verify.get(1);
				int flag = ib.insertANDupdateANDdel(sql);
				if(flag == -1){
					sql = "update score set intellectual='100' where student="+verify.get(1);
					ib.insertANDupdateANDdel(sql);
				}
			}
		}
		
		request.getRequestDispatcher(str).forward(request, response);
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
