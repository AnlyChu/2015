<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String student_id = request.getParameter("student_id");
    String class_id = request.getParameter("class_id");
    ArrayList stuScore = array.getStuScore(student_id, class_id);
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css"/>
<link rel="stylesheet" type="text/css"
      href="<%=path%>/css/admin-css.css"/>
<link rel="stylesheet" type="text/css"
      href="<%=path%>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
      href="<%=path%>/css/themes/icon.css">
<table width="100%">
    <%
        for (int k = 0; k < stuScore.size(); k++) {
            ArrayList stuScore1 = (ArrayList) stuScore.get(k);
            if (Float.parseFloat(stuScore1.get(4).toString()) > 60.0) {
            ArrayList theCourseName = array.getCourse(stuScore1.get(3).toString());
            for (int m = 0; m < theCourseName.size(); m++) {
                ArrayList theCourseInfo = (ArrayList) theCourseName.get(m);
    %>
    <tr class="thead theCourse">
        <td align="center"><%=stuScore1.get(1)%>学年
        </td>
        <td align="center">第<%=stuScore1.get(2)%>学期
        </td>
        <td align="center"><%=theCourseInfo.get(1)%>
        </td>
        <td align="center"><%=theCourseInfo.get(2)%>
        </td>
        <td align="center"><%=theCourseInfo.get(3)%>
        </td>
        <td align="center"><%=Float.parseFloat(stuScore1.get(4).toString())%>
        </td>
    </tr>
    <%
                }
            }
        }
    %>
</table>
