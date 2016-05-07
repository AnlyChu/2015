<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String student_id = request.getParameter("student_id");
    String class_id = request.getParameter("class_id");
    String schoolYear = request.getParameter("school_year");
    String term = request.getParameter("term");
    ArrayList stuScore = null;
    if (term == null || term == "") {
        term = null;
    } else {
        try {
            term = (new String(term.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (schoolYear == null || schoolYear == "") {
        schoolYear = null;
    } else {
        try {
            schoolYear = (new String(schoolYear.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (schoolYear == null && term == null) {
        stuScore = array.getStuScore(student_id, class_id);
    } else if (schoolYear != null && term == null) {
        stuScore = array.getStuScoreOfSchoolYear(student_id, class_id, schoolYear);
    }else if (schoolYear != null && term != null) {
        stuScore = array.getStuScoreOfTerm(student_id, class_id,schoolYear,term);
    }
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
            String scoreEx = stuScore1.get(4).toString();
            if (stuScore1.get(4).toString().equals("良好")) {
                scoreEx = "80";
            } else if (stuScore1.get(4).toString().equals("优秀")) {
                scoreEx = "90";
            } else if (stuScore1.get(4).toString().equals("中等")) {
                scoreEx = "70";
            } else if (stuScore1.get(4).toString().equals("合格")) {
                scoreEx = "60";
            } else if (stuScore1.get(4).toString().equals("不合格")) {
                scoreEx = "50";
            }
            if (Float.parseFloat(scoreEx) < 60.0) {
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
