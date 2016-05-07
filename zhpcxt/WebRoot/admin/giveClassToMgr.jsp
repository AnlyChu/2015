<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList counsellor = null;
    ArrayList allClass = null;
    String mgr = request.getParameter("mgr");
    if (mgr == null) {
        mgr = null;
    } else {
        try {
            mgr = (new String(mgr.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    String classMgr = null;
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        allClass = array.getAllBj();
    }
%>
<style type="text/css">
    .table-padding {
        text-align: center
    }

    .table-padding td {
        padding: 5px;
        margin-top: 5px;
    }
</style>
<form id="from_giveClassToMgr" method="post">
    <table class="table-padding" align="left">
        <tr>
            <input type="hidden" name="mgr" value="<%=mgr%>"/>
            <%
                for (int i = 0; i < allClass.size(); i++) {
                    ArrayList classInfo = (ArrayList) allClass.get(i);
                    String className = classInfo.get(2).toString() + classInfo.get(3).toString() + classInfo.get(4).toString() + "班";
                    String classID = classInfo.get(0).toString();
                    if (classInfo.get(5).toString().equals("null") || classInfo.get(5).toString().equals("")) {
                        classMgr = "暂无";
                    } else {
                        classMgr = classInfo.get(5).toString();
                    }

            %>
            <input type="checkbox" name="checkClass" value="<%=classID%>"/><%=className%>(辅导员:<%=classMgr%>)
            <br/>
            <br/>
            <%
                }
            %>
        </tr>
    </table>
</form>
