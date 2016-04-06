package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.lang.Float;

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
     * <p/>
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     * <p/>
     * This method is called when a form has its tag value method equals to post.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

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
        String mgr = request.getParameter("mgr");
        String student_id = request.getParameter("student_id");
        String school_year = request.getParameter("school_year");
        float daodesuyangPlus = Float.parseFloat(request.getParameter("daodesuyangPlus"));
        float daodesuyangSub = Float.parseFloat(request.getParameter("daodesuyangSub"));
        float studyingPlus = Float.parseFloat(request.getParameter("studyingPlus"));
        float studyingSub = Float.parseFloat(request.getParameter("studyingSub"));
        float suzhituozhanPlus = Float.parseFloat(request.getParameter("suzhituozhanPlus"));
        float suzhituozhanSub = Float.parseFloat(request.getParameter("suzhituozhanSub"));
        float doPlusOrSub = Float.parseFloat(request.getParameter("doPlusOrSub"));
        String[] classID = request.getParameterValues("checkClass");
        HttpSession session = request.getSession();
        String class_id = (String) session.getAttribute("class_id");

        if (student_id != null && !student_id.equals("") ) {
            if (!(Float.isNaN(daodesuyangPlus) || Float.isNaN(daodesuyangSub) || Float.isNaN(studyingPlus) || Float.isNaN(studyingSub) || Float.isNaN(suzhituozhanPlus) || Float.isNaN(suzhituozhanSub) || Float.isNaN(doPlusOrSub))) {
                float daodesuyang = daodesuyangPlus + daodesuyangSub;
                float studying = studyingPlus + studyingSub;
                float suzhituozhan = suzhituozhanPlus + suzhituozhanSub;
                float sum = daodesuyang + studying + suzhituozhan + doPlusOrSub;
                sql = "insert into evaluating (student_id,class_id,school_year,daodesuyang,studying,suzhituozhan,doPlusOrSub,sum) values('" + student_id + "','" + class_id + "','" + school_year + "','"+ daodesuyang + "','" + studying + "','" + suzhituozhan + "','" + doPlusOrSub + "','" + sum + "')";
                System.out.println("sql" + sql);
                ib.insertANDupdateANDdel(sql);
                str = "/admin/classStuInfo.jsp";
                String responseText = "";
                responseText = "1";
                PrintWriter out = response.getWriter();
                out.print(responseText);
                out.close();
            }
        }
        if (mgr != null && !mgr.equals("")) {

            sql = "update class set mgr='" + mgr + "' where class_id='" + class_id + "'";
            System.out.println("sql" + sql);
            ib.insertANDupdateANDdel(sql);
            str = "/admin/classStuInfo.jsp";
            String responseText = "";
            responseText = "1";
            PrintWriter out = response.getWriter();
            out.print(responseText);
            out.close();
        }
        if (mgr != null && !mgr.equals("") && classID.length != 0) {
            for (int i = 0; i < classID.length; i++) {
                sql = "update class set mgr='" + mgr + "' where class_id='" + classID[i] + "'";
                System.out.println("sql" + sql);
                ib.insertANDupdateANDdel(sql);
            }
            str = "/admin/systemuser.jsp";
            String responseText = "";
            responseText = "1";
            PrintWriter out = response.getWriter();
            out.print(responseText);
            out.close();
        }
        if (verify != null && !verify.equals("")) {
            sql = "delete from verify where id=" + verify;
            ib.insertANDupdateANDdel(sql);
            str = "/admin/verify.jsp?verifyType=" + verifyType;
        }
        if (sportsgrade != null && !sportsgrade.equals("")) {
            sql = "delete from sportsgrade where id=" + sportsgrade;
            ib.insertANDupdateANDdel(sql);
            str = "/admin/sportsgrade.jsp";
        }
        if (intellectualgrade != null && !intellectualgrade.equals("")) {
            sql = "delete from intellectualgrade where id=" + intellectualgrade;
            ib.insertANDupdateANDdel(sql);
            str = "/admin/intellectualgrade.jsp";
        }
        if (student != null && !student.equals("")) {
            sql = "delete from intellectualgrade where student=" + student;
            ib.insertANDupdateANDdel(sql);
            sql = "delete from score where student=" + student;
            ib.insertANDupdateANDdel(sql);
            sql = "delete from sportsgrade where student=" + student;
            ib.insertANDupdateANDdel(sql);
            sql = "delete from verify where student=" + student;
            ib.insertANDupdateANDdel(sql);
            sql = "delete from student where id=" + student;
            ib.insertANDupdateANDdel(sql);
            str = "/admin/student.jsp";
        }
        if (evaluating != null && !evaluating.equals("")) {
            sql = "delete from intellectualgrade where evaluating=" + evaluating;
            ib.insertANDupdateANDdel(sql);
            sql = "delete from sportsgrade where evaluating=" + evaluating;
            ib.insertANDupdateANDdel(sql);
            sql = "delete from verify where evaluating=" + evaluating;
            ib.insertANDupdateANDdel(sql);
            sql = "delete from evaluating where id=" + evaluating;
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
