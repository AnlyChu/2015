<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList student = null;
    int quality = 0;
    ArrayList classSchoolYear = null;
    ArrayList getAllclassId = null;
    String schoolYear1 = (String) request.getParameter("schoolYear");
    String term1 = (String) request.getParameter("term");
    String noQuality = (String) request.getParameter("noQuality");
    String classno = (String) request.getParameter("classno");
    if (term1 == null || term1 == "") {
        term1 = null;
    } else {
        try {
            term1 = (new String(term1.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (noQuality == null || noQuality == "") {
        noQuality = null;
    } else {
        try {
            noQuality = (new String(noQuality.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (classno == null || classno == "") {
        classno = null;
    } else {
        try {
            classno = (new String(classno.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (schoolYear1 == null || schoolYear1 == "") {
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
        student = array.getStudent();
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
            $("#londing").css('display', 'none');
            $("#mainPanle").css('display', '');
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
        });
        function getSchoolYear(schoolYear) {
            var cSchoolYear = schoolYear;
            document.termSelect.action = "<%=basePath%>admin/stuWarning.jsp?schoolYear="
            + cSchoolYear;
            document.termSelect.submit();

        }
        function getTerm(term) {
            var cTerm = term;
            document.termSelect.action = "<%=basePath%>admin/stuWarning.jsp?term="
            + cTerm;
            document.termSelect.submit();

        }
        function getClass(classno) {
            var cClass = classno;
            document.termSelect.action = "<%=basePath%>admin/stuWarning.jsp?class_id="
            + cClass;
            document.termSelect.submit();

        }
        function getQuality(noQuality) {
            var cNoQuality = noQuality;
            document.termSelect.action = "<%=basePath%>admin/stuWarning.jsp?noQuality="
            + cNoQuality;
            document.termSelect.submit();
        }
        <%--function showTheCourse (student_id,class_id){--%>
        <%--showTheCourseJS('<%=path%>',student_id,class_id);--%>
        <%--}--%>
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

<div id="londing" style="display: block;margin-top: 10%" align="center">数据加载ing</div>

<div id="mainPanle" region="center" border="true"
     style="background:#f7f7f7; padding:5px;display: none">
    <table width="100%">
        <thead>
        <tr>
            <td colspan="11" align="center" style="padding:5px;"><h3>学业预警</h3></td>
        </tr>
        <tr>
            <td>
                <form method="post" name="termSelect">
                    学年:
                    <select name="schoolYear" class="schoolYear" onchange="getSchoolYear(this.value);">
                        <option>
                            <script language="javascript">
                                document.termSelect.schoolYear.value = "<%=request.getParameter("schoolYear")%>";
                            </script>
                        </option>
                        <%
                            if (student != null && student.size() != 0) {
                                getAllclassId = array.getAllclassId();
                                for (int i = 0; i < getAllclassId.size(); i++) {
                                    ArrayList allClassId = (ArrayList) getAllclassId.get(i);
                                    for (int j = 0; j < allClassId.size(); j++) {
                                        classSchoolYear = array.getAllSchoolYear(allClassId.get(j).toString());
                                        for (int m = 0; m < classSchoolYear.size(); m++) {
                                            ArrayList schoolYear = (ArrayList) classSchoolYear.get(m);
                        %>
                        <option><%=schoolYear.get(0)%>
                        </option>
                        <%
                                        }
                                    }
                                }
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
                                for (int j = 0; j < 2; j++) {
                        %>
                        <option value=<%=j + 1%>><%=j + 1%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                    班级:
                    <select name="classno" onchange="getClass(this.value);">
                        <option>
                            <script language="javascript">
                                document.termSelect.classno.value = "<%=request.getParameter("classno")%>";
                            </script>
                        </option>
                        <%
                            if (student != null && student.size() != 0) {
                                getAllclassId = array.getAllclassId();
                                for (int i = 0; i < getAllclassId.size(); i++) {
                                    ArrayList classNo = (ArrayList) getAllclassId.get(i);
                                    ArrayList class1 = array.getBjInfo(classNo.get(0).toString());
                                    for (int j = 0; j < class1.size(); j++) {
                                        ArrayList classMgr = (ArrayList) class1.get(j);
                                        String className = classMgr.get(2).toString() + classMgr.get(3).toString() + classMgr.get(4).toString() + "班";
                                        String classID = classMgr.get(0).toString();
                        %>
                        <option value=<%=classID%>><%=className%>
                        </option>
                        <%
                                    }
                                }
                            }
                        %>
                    </select>
                    不及格门数:
                    <select name="noQuality" onchange="getQuality(this.value);">
                        <option>
                            <script language="javascript">
                                document.termSelect.noQuality.value = "<%=request.getParameter("noQuality")%>";
                            </script>
                        </option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </form>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr class="thead">
            <td align="center">学号</td>
            <td align="center">姓名</td>
            <td align="center">性别</td>
            <td align="center">班级</td>
            <td align="center">学院</td>
            <td align="center">专业</td>
            <td align="center">未通过课程数</td>
        </tr>
        </thead>
        <tbody class="tbody classInfo">
        <%
            if (schoolYear1 == null && term1 == null && classno == null) {
                if (student != null && student.size() != 0) {
                    int[] sum = new int[student.size()];
                    for (int i = 0; i < student.size(); i++) {
                        ArrayList alRow = (ArrayList) student.get(i);
                        ArrayList stuScore = array.getStuScore(alRow.get(0).toString(), alRow.get(3).toString());
                        for (int j = 0; j < stuScore.size(); j++) {
                            ArrayList stuScore1 = (ArrayList) stuScore.get(j);
                            if (Float.parseFloat(stuScore1.get(4).toString()) > 60.0) {
                                sum[i]++;
                            }
                        }
                        if (noQuality != null) {
                            quality = Integer.parseInt(noQuality);
                        } else {
                            quality = 4;
                        }

                        if (sum[i] >= quality) {
        %>

        <tr>

            <td align="center"><%=alRow.get(0)%>
            </td>
            <td align="center"><%=alRow.get(1)%>
                </a></td>
            <td align="center"><%=alRow.get(2)%>
            </td>
            <td align="center"><%=alRow.get(3)%>
            </td>
            <td align="center"><%=alRow.get(5)%>
            </td>
            <td align="center"><%=alRow.get(6)%>
            </td>
            <td align="center" onclick="showTheCourseJS('<%=path%>',<%=alRow.get(0)%>,<%=alRow.get(3)%>);"
                style="cursor:pointer"><%=sum[i]%>
            </td>
        </tr>

        <%
                    }
                }
            }
        } else if (schoolYear1 != null && term1 == null && classno == null) {
            if (student != null && student.size() != 0) {
                int[] sum = new int[student.size()];
                for (int i = 0; i < student.size(); i++) {
                    ArrayList alRow = (ArrayList) student.get(i);
                    ArrayList stuScore = array.getStuScoreOfSchoolYear(alRow.get(0).toString(), alRow.get(3).toString(), schoolYear1);
                    for (int j = 0; j < stuScore.size(); j++) {
                        ArrayList stuScore1 = (ArrayList) stuScore.get(j);
                        if (Float.parseFloat(stuScore1.get(4).toString()) > 60.0) {
                            sum[i]++;
                        }
                    }
                    if (noQuality != null) {
                        quality = Integer.parseInt(noQuality);
                    } else {
                        quality = 4;
                    }

                    if (sum[i] >= quality) {
        %>

        <tr>

            <td align="center"><%=alRow.get(0)%>
            </td>
            <td align="center"><%=alRow.get(1)%>
                </a></td>
            <td align="center"><%=alRow.get(2)%>
            </td>
            <td align="center"><%=alRow.get(3)%>
            </td>
            <td align="center"><%=alRow.get(5)%>
            </td>
            <td align="center"><%=alRow.get(6)%>
            </td>
            <td align="center" onclick="showTheCourseJS('<%=path%>',<%=alRow.get(0)%>,<%=alRow.get(3)%>);"
                style="cursor:pointer"><%=sum[i]%>
            </td>
        </tr>

        <%
                    }
                }
            }
        } else if (schoolYear1 != null && term1 != null && classno == null) {
            if (student != null && student.size() != 0) {
                int[] sum = new int[student.size()];
                for (int i = 0; i < student.size(); i++) {
                    ArrayList alRow = (ArrayList) student.get(i);
                    ArrayList stuScore = array.getStuScoreOfTerm(alRow.get(0).toString(), alRow.get(3).toString(), schoolYear1, term1);
                    for (int j = 0; j < stuScore.size(); j++) {
                        ArrayList stuScore1 = (ArrayList) stuScore.get(j);
                        if (Float.parseFloat(stuScore1.get(4).toString()) > 60.0) {
                            sum[i]++;
                        }
                    }
                    if (noQuality != null) {
                        quality = Integer.parseInt(noQuality);
                    } else {
                        quality = 4;
                    }

                    if (sum[i] >= quality) {
        %>

        <tr>

            <td align="center"><%=alRow.get(0)%>
            </td>
            <td align="center"><%=alRow.get(1)%>
                </a></td>
            <td align="center"><%=alRow.get(2)%>
            </td>
            <td align="center"><%=alRow.get(3)%>
            </td>
            <td align="center"><%=alRow.get(5)%>
            </td>
            <td align="center"><%=alRow.get(6)%>
            </td>
            <td align="center" onclick="showTheCourseJS('<%=path%>',<%=alRow.get(0)%>,<%=alRow.get(3)%>);"
                style="cursor:pointer"><%=sum[i]%>
            </td>
        </tr>

        <%
                    }
                }
            }
        } else if (schoolYear1 != null && term1 != null && classno != null) {
            if (student != null && student.size() != 0) {
                int[] sum = new int[student.size()];
                for (int i = 0; i < student.size(); i++) {
                    ArrayList alRow = (ArrayList) student.get(i);
                    if (!alRow.get(3).toString().equals(classno)) {
                        continue;
                    }
                    ArrayList stuScore = array.getStuScoreOfTerm(alRow.get(0).toString(), alRow.get(3).toString(), schoolYear1, term1);
                    for (int j = 0; j < stuScore.size(); j++) {
                        ArrayList stuScore1 = (ArrayList) stuScore.get(j);
                        if (Float.parseFloat(stuScore1.get(4).toString()) > 60.0) {
                            sum[i]++;
                        }
                    }
                    if (noQuality != null) {
                        quality = Integer.parseInt(noQuality);
                    } else {
                        quality = 4;
                    }

                    if (sum[i] >= quality) {
        %>

        <tr>

            <td align="center"><%=alRow.get(0)%>
            </td>
            <td align="center"><%=alRow.get(1)%>
                </a></td>
            <td align="center"><%=alRow.get(2)%>
            </td>
            <td align="center"><%=alRow.get(3)%>
            </td>
            <td align="center"><%=alRow.get(5)%>
            </td>
            <td align="center"><%=alRow.get(6)%>
            </td>
            <td align="center" onclick="showTheCourseJS('<%=path%>',<%=alRow.get(0)%>,<%=alRow.get(3)%>);"
                style="cursor:pointer"><%=sum[i]%>
            </td>
        </tr>

        <%
                    }
                }
            }
        } else if (schoolYear1 == null && term1 == null && classno != null) {
            if (student != null && student.size() != 0) {
                int[] sum = new int[student.size()];
                for (int i = 0; i < student.size(); i++) {
                    ArrayList alRow = (ArrayList) student.get(i);
                    if (!alRow.get(3).toString().equals(classno)) {
                        continue;
                    }
                    ArrayList stuScore = array.getStuScore(alRow.get(0).toString(), alRow.get(3).toString());
                    for (int j = 0; j < stuScore.size(); j++) {
                        ArrayList stuScore1 = (ArrayList) stuScore.get(j);
                        if (Float.parseFloat(stuScore1.get(4).toString()) > 60.0) {
                            sum[i]++;
                        }
                    }
                    if (noQuality != null) {
                        quality = Integer.parseInt(noQuality);
                    } else {
                        quality = 4;
                    }

                    if (sum[i] >= quality) {
        %>

        <tr>

            <td align="center"><%=alRow.get(0)%>
            </td>
            <td align="center"><%=alRow.get(1)%>
                </a></td>
            <td align="center"><%=alRow.get(2)%>
            </td>
            <td align="center"><%=alRow.get(3)%>
            </td>
            <td align="center"><%=alRow.get(5)%>
            </td>
            <td align="center"><%=alRow.get(6)%>
            </td>
            <td align="center" onclick="showTheCourseJS('<%=path%>',<%=alRow.get(0)%>,<%=alRow.get(3)%>);"
                style="cursor:pointer"><%=sum[i]%>
            </td>
        </tr>

        <%
                    }
                }
            }
        } else if (schoolYear1 != null && term1 == null && classno != null) {
            if (student != null && student.size() != 0) {
                int[] sum = new int[student.size()];
                for (int i = 0; i < student.size(); i++) {
                    ArrayList alRow = (ArrayList) student.get(i);
                    if (!alRow.get(3).toString().equals(classno)) {
                        continue;
                    }
                    ArrayList stuScore = array.getStuScoreOfSchoolYear(alRow.get(0).toString(), alRow.get(3).toString(), schoolYear1);
                    for (int j = 0; j < stuScore.size(); j++) {
                        ArrayList stuScore1 = (ArrayList) stuScore.get(j);
                        if (Float.parseFloat(stuScore1.get(4).toString()) > 60.0) {
                            sum[i]++;
                        }
                    }
                    if (noQuality != null) {
                        quality = Integer.parseInt(noQuality);
                    } else {
                        quality = 4;
                    }

                    if (sum[i] >= quality) {
        %>

        <tr>

            <td align="center"><%=alRow.get(0)%>
            </td>
            <td align="center"><%=alRow.get(1)%>
                </a></td>
            <td align="center"><%=alRow.get(2)%>
            </td>
            <td align="center"><%=alRow.get(3)%>
            </td>
            <td align="center"><%=alRow.get(5)%>
            </td>
            <td align="center"><%=alRow.get(6)%>
            </td>
            <td align="center" onclick="showTheCourseJS('<%=path%>',<%=alRow.get(0)%>,<%=alRow.get(3)%>);"
                style="cursor:pointer"><%=sum[i]%>
            </td>
        </tr>

        <%
                        }
                    }
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
