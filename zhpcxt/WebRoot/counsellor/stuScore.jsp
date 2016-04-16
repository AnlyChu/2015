<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ArrayList adminlogin = (ArrayList) session
            .getAttribute("adminlogin");
    boolean closed = false;
    ArrayList stuScore = null;
    ArrayList stuScoreTableName = null;
    ArrayList course = null;
    String student_id = (String) request.getParameter("student_id");
    String class_id = (String) request.getParameter("class_id");
    ArrayList classSchoolYear = null;
    ArrayList classTerm = null;
    String schoolYear1 = (String) request.getParameter("schoolYear");
    String term1 = (String) request.getParameter("term");
    if (term1 == null) {
        term1 = null;
    } else {
        try {
            term1 = (new String(term1.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (schoolYear1 == null) {
        schoolYear1 = null;
    } else {
        try {
            schoolYear1 = (new String(schoolYear1.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        stuScore = array.getStuScore(student_id, class_id);
        classSchoolYear = array.getSchYear(class_id);
        classTerm = array.getTerm(class_id);
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
        });
        function getSchoolYear(schoolYear) {
            var cSchoolYear = schoolYear;
            document.termSelect.action = "<%=basePath%>counsellor/stuScore.jsp?student_id=<%=student_id%>&class_id=<%=class_id%>&schoolYear="
            + cSchoolYear;
            document.termSelect.submit();

        }
        function getTerm(term) {
            var cTerm = term;
            document.termSelect.action = "<%=basePath%>counsellor/stuScore.jsp?student_id=<%=student_id%>&class_id=<%=class_id%>&term="
            + cTerm;
            document.termSelect.submit();

        }

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
    <form method="post" name="termSelect">
    <table width="100%">
        <thead>
        <tr>
            <td colspan="6" align="center" style="padding:5px;"><h3>学生成绩</h3></td>
        </tr>
        <tr class="thead">
            <td align="center">
                <select name="schoolYear" class="schoolYear" onchange="getSchoolYear(this.value);">
                    <%
                        String showSchoolYear = "学年";
                        if (schoolYear1 != null){
                            showSchoolYear = schoolYear1;
                        }
                    %>
                    <option selected="selected" style="text-align:center"><%=showSchoolYear%></option>
                    <%
                        for (int j = 0; j < classSchoolYear.size(); j++) {
                            ArrayList getSchoolYear = (ArrayList) classSchoolYear.get(j);
                    %>
                    <option><%=getSchoolYear.get(0)%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>
            <td align="center">
                <select name="term" onchange="getTerm(this.value);">
                    <%
                        String showTerm = "学期";
                        if (schoolYear1 != null && term1 != null){
                            showTerm = term1;
                        }
                    %>
                    <option selected="selected" style="text-align:center"><%=showTerm%></option>
                    <%
                        if (schoolYear1 != null) {
                            for (int j = 0; j < classTerm.size(); j++) {
                                ArrayList getTerm = (ArrayList) classTerm.get(j);
                    %>
                    <option value=<%=getTerm.get(0)%>><%=getTerm.get(0)%>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>
            </td>
            <td align="center">课程名称</td>
            <td align="center">课程成绩</td>
        </tr>
        </thead>
        <tbody class="tbody">
        <%
            for (int i = 0; i < stuScore.size(); i++) {
                ArrayList myscore1 = (ArrayList) stuScore.get(i);
                course = array.getCourse(myscore1.get(3).toString());
                for (int j = 0; j < course.size(); j++) {
                    ArrayList course1 = (ArrayList) course.get(j);
        %>
        <tr>
            <td align="center"><%=myscore1.get(1)%>
            </td>
            <td align="center"><%=myscore1.get(2)%>
            </td>
            <td align="center"><%=course1.get(1)%>
            </td>
            <td align="center"><%=myscore1.get(4)%>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    </form>
</div>
</body>
</html>
