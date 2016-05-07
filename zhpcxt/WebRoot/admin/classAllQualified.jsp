<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList student = null;
    String class_id = (String) request.getParameter("class_id");
    ArrayList course = null;
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        student = array.getClassStudent(class_id);
        course = array.getAllCourse(class_id);
    }
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=path%>/css/admin-css.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=path%>/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="<%=path%>/css/themes/icon.css">
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path%>/js/admin.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('tbody tr:even').css({'background': '#ffffff'});
            $('tbody tr:odd').css({'background': '#eeeeff'});
            var message = <%=message%>;
            if (message != null && message != "") {
                alert(message);
            }
            login('<%=path%>', <%=closed%>);
            $("#click_logout").click(function () {
                logout('<%=path%>');
            });
            $("#editpass").click(function () {
                editpass('<%=path%>');
            });
            $("#admin_add").click(function () {
                adminAdd('<%=path%>');
            });
            $("#course_add").click(function () {
                courseAdd('<%=path%>');
            });
            $("#change_cmgr").click(function () {
                changeCmgr('<%=path%>');
            });
        });

        /* function display_alert()
         {
         var lujing=document.form.fileUpload.value;
         alert("路径="+lujing)
         } */
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no"
      resizable="false">
<div id="north" region="north" split="false" border="false">
    <jsp:include page="/admin/head.jsp"></jsp:include>
</div>
<div region="west" split="false" border="false" title="导航菜单"
     style="width:180px;" id="west">
    <div id="left-menus" border="false" fit="true">
        <jsp:include page="/admin/left.jsp"></jsp:include>
    </div>
</div>
<div id="mainPanle" region="center" border="true"
     style="background:#f7f7f7; padding:5px;">
    <form method="post" name="classScore">
        <table width="100%">
            <thead>
            <tr>
                <td colspan="11" align="center" style="padding:5px;">
                    <h3>
                        <%--<a href="javascript:void(0)" id="courseQualified" style="color: blue;">--%>
                        班级课程及格率
                        <%--</a>--%>
                        <%--|--%>
                        <%--<a href="javascript:void(0)" id="schoolYearQualified">班级学年及格率</a>--%>
                        <%--|--%>
                        <%--<a href="javascript:void(0)" id="termQualified">班级学期及格率</a>--%>
                        <%--|--%>
                        <%--<a href="javascript:void(0)" id="classQualified">班级总及格率</a>--%>
                    </h3>
                </td>
            </tr>
            <tr class="thead courseQualified">
                <td align="center">课程名称</td>
                <td align="center">班级总人数</td>
                <td align="center">通过人数</td>
                <td align="center">未通过人数</td>
                <td align="center">及格率</td>
            </tr>
            <%--<tr class="thead schoolYearQualified" style="display: none">--%>
            <%--<td align="center">学年</td>--%>
            <%--<td align="center">通过人数</td>--%>
            <%--<td align="center">及格率</td>--%>
            <%--</tr>--%>
            <%--<tr class="thead termQualified" style="display: none">--%>
            <%--<td align="center">学期</td>--%>
            <%--<td align="center">通过人数</td>--%>
            <%--<td align="center">及格率</td>--%>
            <%--</tr>--%>
            <%--<tr class="thead classQualified" style="display: none">--%>
            <%--<td align="center">班级</td>--%>
            <%--<td align="center">通过人数</td>--%>
            <%--<td align="center">及格率</td>--%>
            <%--</tr>--%>
            </thead>
            <tbody class="tbody courseQualified">
            <%
                if (student != null && student.size() != 0) {
                    for (int i = 0; i < course.size(); i++) {
                        int[] man = new int[course.size()];
                        String[] rate = new String[course.size()];
                        ArrayList courseID = (ArrayList) course.get(i);
                        ArrayList courseName = array.getCourseName(courseID.get(0).toString());
                        for (int j = 0; j < courseName.size(); j++) {
                            ArrayList courseName1 = (ArrayList) courseName.get(j);
            %>
            <tr>

                <td align="center"><%=courseName1.get(0)%>
                </td>
                <td align="center"><%=student.size()%>
                </td>
                <%
                    for (int m = 0; m < course.size(); m++) {
                        ArrayList courseScore = array.getCourseScore(courseID.get(0).toString(), class_id);
                        for (int n = 0; n < courseScore.size(); n++) {
                            ArrayList courseScore1 = (ArrayList) courseScore.get(n);
                            String scoreEx = courseScore1.get(2).toString();
                            if (courseScore1.get(2).toString().equals("良好")) {
                                scoreEx = "80";
                            } else if (courseScore1.get(2).toString().equals("优秀")) {
                                scoreEx = "90";
                            } else if (courseScore1.get(2).toString().equals("中等")) {
                                scoreEx = "70";
                            } else if (courseScore1.get(2).toString().equals("合格")) {
                                scoreEx = "60";
                            } else if (courseScore1.get(2).toString().equals("不合格")) {
                                scoreEx = "50";
                            }
                            float score = Float.parseFloat(scoreEx);
                            if (score >= 60.0) {
                                man[m]++;
                                float qualified = (float) man[m] / student.size();
                                DecimalFormat df = new DecimalFormat("0.00");//格式化小数
                                rate[m] = df.format(qualified * 100) + "%";//返回的是String类型
                            }
                        }
                    }
                %>
                <td align="center"><%=man[i]%>
                </td>
                <td align="center"><%=student.size() - man[i]%>
                </td>
                <td align="center"><%=rate[i]%>
                </td>
                <%
                    }
                %>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
            <%--<tbody class="tbody schoolYearQualified" style="display: none">--%>
            <%--<%--%>
            <%--if (student != null && student.size() != 0) {--%>
            <%--for (int i = 0; i < course.size(); i++) {--%>
            <%--ArrayList courseID = (ArrayList) course.get(i);--%>
            <%--ArrayList courseName = array.getCourseName(courseID.get(0).toString());--%>
            <%--for (int j = 0; j < courseName.size(); j++) {--%>
            <%--ArrayList courseName1 = (ArrayList) courseName.get(j);--%>
            <%--%>--%>
            <%--<tr>--%>

            <%--<td align="center"><%=courseName1.get(0)%>--%>
            <%--</td>--%>
            <%--<%--%>
            <%--}--%>
            <%--for (int m = 0; m < course.size(); m++) {--%>
            <%--ArrayList courseScore = array.getCourseScore(courseID.get(0).toString(), class_id);--%>
            <%--for (int n = 0; n < courseScore.size(); n++) {--%>
            <%--ArrayList courseScore1 = (ArrayList) courseScore.get(n);--%>
            <%--float score = Float.parseFloat(courseScore1.get(2).toString());--%>
            <%--if (score >= 60.0) {--%>
            <%--man++;--%>
            <%--float qualified = (float) man/student.size();--%>
            <%--DecimalFormat df = new DecimalFormat("0.00");//格式化小数--%>
            <%--String rate = df.format(qualified) + "%";//返回的是String类型--%>
            <%--%>--%>
            <%--<td align="center"><%=man%>--%>
            <%--</td>--%>
            <%--<td align="center"><%=rate%>--%>
            <%--</td>--%>
            <%--<%--%>
            <%--}--%>
            <%--}--%>
            <%--}--%>
            <%--%>--%>
            <%--</tr>--%>
            <%--<%--%>
            <%--}--%>
            <%--}--%>
            <%--%>--%>
            <%--</tbody>--%>
            <%--<tbody class="tbody termQualified" style="display: none">--%>
            <%--<%--%>
            <%--if (student != null && student.size() != 0) {--%>
            <%--for (int i = 0; i < course.size(); i++) {--%>
            <%--ArrayList courseID = (ArrayList) course.get(i);--%>
            <%--ArrayList courseName = array.getCourseName(courseID.get(0).toString());--%>
            <%--for (int j = 0; j < courseName.size(); j++) {--%>
            <%--ArrayList courseName1 = (ArrayList) courseName.get(j);--%>
            <%--%>--%>
            <%--<tr>--%>

            <%--<td align="center"><%=courseName1.get(0)%>--%>
            <%--</td>--%>
            <%--<%--%>
            <%--}--%>
            <%--for (int m = 0; m < course.size(); m++) {--%>
            <%--ArrayList courseScore = array.getCourseScore(courseID.get(0).toString(), class_id);--%>
            <%--for (int n = 0; n < courseScore.size(); n++) {--%>
            <%--ArrayList courseScore1 = (ArrayList) courseScore.get(n);--%>
            <%--float score = Float.parseFloat(courseScore1.get(2).toString());--%>
            <%--if (score >= 60.0) {--%>
            <%--man++;--%>
            <%--float qualified = (float) man/student.size();--%>
            <%--DecimalFormat df = new DecimalFormat("0.00");//格式化小数--%>
            <%--String rate = df.format(qualified) + "%";//返回的是String类型--%>
            <%--%>--%>
            <%--<td align="center"><%=man%>--%>
            <%--</td>--%>
            <%--<td align="center"><%=rate%>--%>
            <%--</td>--%>
            <%--<%--%>
            <%--}--%>
            <%--}--%>
            <%--}--%>
            <%--%>--%>
            <%--</tr>--%>
            <%--<%--%>
            <%--}--%>
            <%--}--%>
            <%--%>--%>
            <%--</tbody>--%>
            <%--<tbody class="tbody classQualified" style="display: none">--%>
            <%--<%--%>
            <%--if (student != null && student.size() != 0) {--%>
            <%--for (int i = 0; i < course.size(); i++) {--%>
            <%--ArrayList courseID = (ArrayList) course.get(i);--%>
            <%--ArrayList courseName = array.getCourseName(courseID.get(0).toString());--%>
            <%--for (int j = 0; j < courseName.size(); j++) {--%>
            <%--ArrayList courseName1 = (ArrayList) courseName.get(j);--%>
            <%--%>--%>
            <%--<tr>--%>

            <%--<td align="center"><%=courseName1.get(0)%>--%>
            <%--</td>--%>
            <%--<%--%>
            <%--}--%>
            <%--for (int m = 0; m < course.size(); m++) {--%>
            <%--ArrayList courseScore = array.getCourseScore(courseID.get(0).toString(), class_id);--%>
            <%--for (int n = 0; n < courseScore.size(); n++) {--%>
            <%--ArrayList courseScore1 = (ArrayList) courseScore.get(n);--%>
            <%--float score = Float.parseFloat(courseScore1.get(2).toString());--%>
            <%--if (score >= 60.0) {--%>
            <%--man++;--%>
            <%--float qualified = (float) man/student.size();--%>
            <%--DecimalFormat df = new DecimalFormat("0.00");//格式化小数--%>
            <%--String rate = df.format(qualified) + "%";//返回的是String类型--%>
            <%--%>--%>
            <%--<td align="center"><%=man%>--%>
            <%--</td>--%>
            <%--<td align="center"><%=rate%>--%>
            <%--</td>--%>
            <%--<%--%>
            <%--}--%>
            <%--}--%>
            <%--}--%>
            <%--%>--%>
            <%--</tr>--%>
            <%--<%--%>
            <%--}--%>
            <%--}--%>
            <%--%>--%>
            <%--</tbody>--%>
        </table>
    </form>
</div>
</body>
</html>
