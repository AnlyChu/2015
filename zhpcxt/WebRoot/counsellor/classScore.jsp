<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList myscore = null;
    ArrayList course = null;
    ArrayList classSchoolYear = null;
    ArrayList classTerm = null;
    ArrayList getScoreOfSchYear1 = null;
    ArrayList getScoreOfTerm1 = null;
    String classId = (String) session.getAttribute("classId");
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
        ArrayList tableName = array.getStuScoreTableName(classId);
        ArrayList tableName1 = (ArrayList) tableName.get(0);
        classSchoolYear = array.getSchYear(tableName1.get(0).toString());
        classTerm = array.getTerm(tableName1.get(0).toString());
        if (schoolYear1 != null) {
            getScoreOfSchYear1 = array.getScoreOfSchYear(schoolYear1, tableName1.get(0).toString());
        }
        if (term1 != null) {
            getScoreOfTerm1 = array.getScoreOfTerm(term1, schoolYear1, tableName1.get(0).toString());
        }
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
        $(window).load(function () {
            $("#londing").css('display', 'none');
            $("#londEnd").css('display', 'block');
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
        })
        function getSchoolYear(schoolYear) {
            var cSchoolYear = schoolYear;
            document.termSelect.action = "<%=basePath%>counsellor/classScore.jsp?schoolYear="
            + cSchoolYear;
            document.termSelect.submit();

        }
        function getTerm(term) {
            var cTerm = term;
            document.termSelect.action = "<%=basePath%>counsellor/classScore.jsp?term="
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
    <div id="londing" style="display: block" align="center">数据加载ing</div>
    <div id="londEnd" style="display: none">
        <table>
            <thead>
            <tr>
                <td><p>上传成绩（excel文件）:</p></td>
                <td>
                    <form action="<%=path%>/Upload" method="post">
                        <input type="file" name="fileUpload2"/> <input type=submit
                                                                       value="上传文件"/>
                    </form>
                </td>
            </tr>

            </thead>
        </table>

        <table>
            <thead>
            <tr>
                <td><p>学年:</p></td>
                <td>
                    <form action="<%=path%>/counsellor/classScore.jsp" method="post" name="termSelect">
                        <select name="schoolYear" class="schoolYear" onchange="getSchoolYear(this.value);">
                            <option>
                                <script language="javascript">
                                    document.termSelect.schoolYear.value = "<%=request.getParameter("schoolYear")%>";
                                </script>
                            </option>
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
                        学期:
                        <select name="term" onchange="getTerm(this.value);">
                            <option>
                                <script language="javascript">
                                    document.termSelect.term.value = "<%=request.getParameter("term")%>";
                                </script>
                            </option>
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
                        <input type="submit" value="查询"/>
                    </form>
                </td>
            </tr>

            </thead>
        </table>
        <form method="post">
            <table width="100%">
                <thead>
                <tr>
                    <td colspan="6" align="center" style="padding:5px;"><h3>班级学生成绩</h3></td>
                </tr>
                <tr class="thead">
                    <td align="center">学号</td>
                    <td align="center" width="100px">姓名</td>
                    <td align="center">学年
                        <%--<select name="schoolYear" onchange="getSchoolYear(this.value);">--%>
                        <%--<option selected="selected" value = null>学年</option>--%>
                        <%--<%--%>
                        <%--for (int j = 0; j < classSchoolYear.size(); j++) {--%>
                        <%--ArrayList getSchoolYear = (ArrayList) classSchoolYear.get(j);--%>
                        <%--%>--%>
                        <%--<option value=<%=getSchoolYear.get(0)%>><%=getSchoolYear.get(0)%></option>--%>
                        <%--<%--%>
                        <%--}--%>
                        <%--%>--%>
                        <%--</select>--%>
                    </td>
                    <td align="center">学期
                        <%--<select name="term" onchange="getTerm(this.value);">--%>
                        <%--<option selected="selected" value=null>学期</option>--%>
                        <%--<%--%>
                        <%--if (schoolYear1 != null) {--%>
                        <%--for (int j = 0; j < classTerm.size(); j++) {--%>
                        <%--ArrayList getTerm = (ArrayList) classTerm.get(j);--%>
                        <%--%>--%>
                        <%--<option value=<%=getTerm.get(0)%>><%=getTerm.get(0)%>--%>
                        <%--</option>--%>
                        <%--<%--%>
                        <%--}--%>
                        <%--}--%>
                        <%--%>--%>
                        <%--</select>--%>
                    </td>
                    <%
                        if (schoolYear1 != null && term1 == null) {
                            ArrayList tableName = array.getStuScoreTableName(classId);
                            ArrayList tableName1 = (ArrayList) tableName.get(0);
                            ArrayList courseID = array.getAllCourse(tableName1.get(0).toString());
                            for (int k = 0; k < courseID.size(); k++) {

                                ArrayList courseName = (ArrayList) courseID.get(k);
                                course = array.getCourseName(courseName.get(0).toString());
                                for (int m = 0; m < course.size(); m++) {
                                    ArrayList courseRealName = (ArrayList) course.get(m);

                    %>
                    <td align="center"><%=courseRealName.get(0)%>
                    </td>
                    <%
                            }
                        }
                    } else if (schoolYear1 != null && term1 != null) {
                        ArrayList tableName = array.getStuScoreTableName(classId);
                        ArrayList tableName1 = (ArrayList) tableName.get(0);
                        ArrayList courseID = array.getAllCourse(tableName1.get(0).toString());
                        for (int k = 0; k < courseID.size(); k++) {
                            ArrayList courseName = (ArrayList) courseID.get(k);
                            course = (ArrayList) courseName.get(0);
                            for (int m = 0; m < course.size(); m++) {
                                ArrayList courseRealName = (ArrayList) course.get(m);

                    %>
                    <td align="center"><%=courseRealName.get(0)%>
                    </td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                </thead>

                <tbody class="tbody">
                <%
                    if (schoolYear1 != null && term1 == null) {
                        for (int i = 0; i < getScoreOfSchYear1.size(); i++) {
                            ArrayList getScoreOfSchYear2 = (ArrayList) getScoreOfSchYear1.get(i);
                %>
                <tr>
                    <td align="center"><%=getScoreOfSchYear2.get(0)%>
                    </td>
                    <td align="center"><%=getScoreOfSchYear2.get(1)%>
                    </td>
                    <td align="center"><%=getScoreOfSchYear2.get(2)%>
                    </td>
                    <td align="center"><%=getScoreOfSchYear2.get(3)%>
                    </td>
                    <%
                        ArrayList tableName = array.getStuScoreTableName(classId);
                        ArrayList tableName1 = (ArrayList) tableName.get(0);
                        ArrayList courseID = array.getAllCourse(tableName1.get(0).toString());
                        for (int k = 0; k < courseID.size(); k++) {
                            ArrayList courseName = (ArrayList) courseID.get(k);
                            if (courseName.get(0).toString().equals(getScoreOfSchYear2.get(4).toString())) {
                                ArrayList courseScore = array.getStuScoreOfcourseId(getScoreOfSchYear2.get(0).toString(), courseName.get(0).toString(), tableName1.get(0).toString());
                                for (int m = 0; m < courseScore.size(); m++) {
                                    ArrayList courseScore1 = (ArrayList) courseScore.get(m);
                    %>
                    <td align="center"><%=courseScore1.get(5)%>
                    </td>
                    <%
                                }
                            }
                        }
                    %>
                </tr>
                <%
                    }
                } else if (schoolYear1 != null && term1 != null) {
                    for (int i = 0; i < getScoreOfTerm1.size(); i++) {
                        ArrayList getScoreOfTerm2 = (ArrayList) getScoreOfTerm1.get(i);
                        if (getScoreOfTerm2.get(3).toString() != term1) {
                            continue;
                        } else {
                %>
                <tr>
                    <td align="center"><%=getScoreOfTerm2.get(0)%>
                    </td>
                    <td align="center"><%=getScoreOfTerm2.get(1)%>
                    </td>
                    <td align="center"><%=getScoreOfTerm2.get(2)%>
                    </td>
                    <td align="center"><%=getScoreOfTerm2.get(3)%>
                    </td>
                    <%
                        ArrayList tableName = array.getStuScoreTableName(classId);
                        ArrayList tableName1 = (ArrayList) tableName.get(0);
                        ArrayList courseID = array.getAllCourse(tableName1.get(0).toString());
                        for (int k = 0; k < courseID.size(); k++) {
                            ArrayList courseName = (ArrayList) courseID.get(k);
                            if (courseName.get(0).toString().equals(getScoreOfTerm2.get(4).toString())) {
                                ArrayList courseScore = array.getStuScoreOfcourseId(getScoreOfTerm2.get(0).toString(), courseName.get(0).toString(), tableName1.get(0).toString());
                                for (int m = 0; m < courseScore.size(); m++) {
                                    ArrayList courseScore1 = (ArrayList) courseScore.get(m);
                    %>
                    <td align="center"><%=courseScore1.get(5)%>
                    </td>
                    <%
                                }
                            }
                        }
                    %>
                    </td>
                </tr>
                <%
                            }
                        }
                    }
                %>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>
