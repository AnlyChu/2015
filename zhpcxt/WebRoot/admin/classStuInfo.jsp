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
    String class_id = (String) request.getParameter("class_id");
    if (class_id == null) {
        class_id = (String) session.getAttribute("class_id");
    }
    session.setAttribute("class_id", class_id);
    ArrayList course = null;
    ArrayList classSchoolYear = null;
    ArrayList classTerm = null;
    ArrayList getScoreOfSchYear1 = null;
    ArrayList getScoreOfTerm1 = null;
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
        student = array.getClassStudent(class_id);
        classSchoolYear = array.getSchYear(class_id);
        classTerm = array.getTerm(class_id);
        if (schoolYear1 != null) {
            getScoreOfSchYear1 = array.getStudentId(class_id, schoolYear1);
        }
        if (term1 != null) {
            getScoreOfTerm1 = array.getStudentId(class_id, schoolYear1, term1);
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
        $(document).ready(function () {
            $("#londing").css('display', 'none');
            $("#mainPanle").css('display', '');
            <%
            if(schoolYear1 != null){
            %>
            $('#classScore')[0].style.color = 'blue';
            $('#classInfo')[0].style.color = '';
            $('.classInfo')[0].style.display = 'none';
            $('.classScore')[0].style.display = '';
            $('.classInfo1')[0].style.display = 'none';
            $('.classScore1')[0].style.display = '';
            <%
            } else {
            %>
            $('#classInfo')[0].style.color = 'blue';
            $('.classInfo')[0].style.display = '';
            $('.classInfo1')[0].style.display = '';
            <%
            }
            %>
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
            $("#classInfo").click(function () {
                $('#classInfo')[0].style.color = 'blue';
                $('#classScore')[0].style.color = '';
                $('.classScore')[0].style.display = 'none';
                $('.classInfo')[0].style.display = '';
                $('.classScore1')[0].style.display = 'none';
                $('.classInfo1')[0].style.display = '';
            });
            $("#classScore").click(function () {
                $('#classScore')[0].style.color = 'blue';
                $('#classInfo')[0].style.color = '';
                $('.classInfo')[0].style.display = 'none';
                $('.classScore')[0].style.display = '';
                $('.classInfo1')[0].style.display = 'none';
                $('.classScore1')[0].style.display = '';
            });
        });
        function getSchoolYear(schoolYear) {
            var cSchoolYear = schoolYear;
            document.classScore.action = "<%=basePath%>admin/classStuInfo.jsp?schoolYear="
            + cSchoolYear;
            document.classScore.submit();


        }
        function getTerm(term) {
            var cTerm = term;
            document.classScore.action = "<%=basePath%>admin/classStuInfo.jsp?term="
            + cTerm;
            document.classScore.submit();
            $('.classScore')[0].style.display = 'none';
            $('.classInfo')[0].style.display = '';
            $('.classScore1')[0].style.display = 'none';
            $('.classInfo1')[0].style.display = '';
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
<div id="londing" style="display: block;margin-top: 10%" align="center">数据加载ing</div>
<div id="mainPanle" region="center" border="true"
     style="background:#f7f7f7; padding:5px;display: none;">
    <form method="post" name="classScore">
        <table width="100%">
            <thead>
            <tr>
                <td colspan="11" align="center" style="padding:5px;"><h3><a href="javascript:void(0)" id="classInfo" style="color: blue;">班级学生信息</a>
                    | <a href="javascript:void(0)" id="classScore">班级学生成绩</a></h3></td>
            </tr>
            <%--<tr>--%>
                <%--<td colspan="4" style="padding:5px;"><a href="javascript:void(0)" id="course_add">新建课程</a></td>--%>
            <%--</tr>--%>
            <tr>
                <td colspan="4" style="padding:5px;"><a href="javascript:void(0)" id="change_cmgr">更换辅导员</a></td>
            </tr>
            <tr class="thead classInfo" style="display: none">
                <td align="center">学号</td>
                <td align="center">姓名</td>
                <td align="center">性别</td>
                <td align="center">班级</td>
                <td align="center">身份证号</td>
                <td align="center">学院</td>
                <td align="center">专业</td>
                <td align="center">通讯地址</td>
            </tr>
            <tr class="thead classScore" style="display: none">
                <td align="center">学号</td>
                <td align="center" width="100px">姓名</td>
                <td align="center">获得学分</td>
                <td align="center" width="100px">学年
                    <select name="schoolYear" class="schoolYear" onchange="getSchoolYear(this.value);">
                        <option>
                            <script language="javascript">
                                document.classScore.schoolYear.value = "<%=request.getParameter("schoolYear")%>";
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
                </td>
                <td align="center">学期
                    <select name="term" onchange="getTerm(this.value);">
                        <option>
                            <script language="javascript">
                                document.classScore.term.value = "<%=request.getParameter("term")%>";
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
                </td>
                <%
                    if (schoolYear1 != null && term1 == null) {
                        ArrayList courseID = array.getAllCourseForSchoolYear(class_id, schoolYear1);
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
                    ArrayList courseID = array.getAllCourseForTerm(class_id, schoolYear1, term1);
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
                    }
                %>
            </tr>
            </tr>
            </thead>
            <tbody class="tbody classInfo1" style="display: none">
            <%
                if (student != null && student.size() != 0) {
                    for (int i = 0; i < student.size(); i++) {
                        ArrayList alRow = (ArrayList) student.get(i);
            %>
            <tr>

                <td align="center"><%=alRow.get(0)%>
                </td>
                <td align="center"><a
                        href="<%=basePath%>counsellor/stuScore.jsp?studentId=<%=alRow.get(0)%>&class_id=<%=alRow.get(3)%>"><%=alRow.get(1)%>
                </a></td>
                <td align="center"><%=alRow.get(2)%>
                </td>
                <td align="center"><%=alRow.get(3)%>
                </td>
                <td align="center"><%=alRow.get(4)%>
                </td>
                <td align="center"><%=alRow.get(5)%>
                </td>
                <td align="center"><%=alRow.get(6)%>
                </td>
                <td align="center"><%=alRow.get(7)%>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
            <tbody class="tbody classScore1" style="display: none">
            <%
                if (schoolYear1 != null && term1 == null) {
                    for (int i = 0; i < getScoreOfSchYear1.size(); i++) {
                        ArrayList getScoreOfSchYear2 = (ArrayList) getScoreOfSchYear1.get(i);

            %>
            <tr>
                <td align="center"><%=getScoreOfSchYear2.get(0)%>
                </td>
                <%
                    for (int j = 0; j < getScoreOfSchYear2.size(); j++) {
                        ArrayList studentName = array.getStudent(getScoreOfSchYear2.get(0).toString());
                        for (int m = 0; m < studentName.size(); m++) {
                            ArrayList name = (ArrayList) studentName.get(m);
                %>
                <td align="center"><%=name.get(1)%>
                </td>
                <%
                        }
                    }
                    for (int s = 0; s < getScoreOfSchYear2.size(); s++) {
                        ArrayList schoolGrades = array.getScoreOfSchYear(schoolYear1, class_id, getScoreOfSchYear2.get(0).toString());
                        ArrayList grades = (ArrayList) schoolGrades.get(0);
                %>
                <td align="center"><%=grades.get(2)%>
                </td>
                <td align="center"><%=grades.get(3)%>
                </td>
                <td align="center"><%=grades.get(4)%>
                </td>
                <%
                    }
                    ArrayList courseID = array.getAllCourseForSchoolYear(class_id, schoolYear1);
                    for (int k = 0; k < courseID.size(); k++) {
                        ArrayList courseID1 = (ArrayList) courseID.get(k);
                        ArrayList courseScore = array.getStuScoreOfcourseId(getScoreOfSchYear2.get(0).toString(), courseID1.get(0).toString(), class_id);
                        for (int m = 0; m < courseScore.size(); m++) {
                            ArrayList courseScore1 = (ArrayList) courseScore.get(m);
                %>
                <td align="center"><%=courseScore1.get(0)%>
                </td>
                <%
                            }
                        }
                    }
                %>
            </tr>
            <%
                //                    }
            } else if (schoolYear1 != null && term1 != null) {
                for (int i = 0; i < getScoreOfTerm1.size(); i++) {
                    ArrayList getScoreOfTerm2 = (ArrayList) getScoreOfTerm1.get(i);
            %>
            <tr>
                <td align="center"><%=getScoreOfTerm2.get(0)%>
                </td>
                <%
                    for (int j = 0; j < getScoreOfTerm2.size(); j++) {
                        ArrayList studentName = array.getStudent(getScoreOfTerm2.get(0).toString());
                        for (int m = 0; m < studentName.size(); m++) {
                            ArrayList name = (ArrayList) studentName.get(m);
                %>
                <td align="center"><%=name.get(1)%>
                </td>
                <%
                        }
                    }
                    for (int s = 0; s < getScoreOfTerm2.size(); s++) {
                        ArrayList schoolGrades = array.getScoreOfSchYear(schoolYear1, class_id, getScoreOfTerm2.get(0).toString());
                        ArrayList grades = (ArrayList) schoolGrades.get(0);
                %>
                <td align="center"><%=grades.get(2)%>
                </td>
                <td align="center"><%=grades.get(3)%>
                </td>
                <td align="center"><%=grades.get(4)%>
                </td>
                <%
                    }
                    ArrayList courseID = array.getAllCourseForTerm(class_id, schoolYear1, term1);
                    for (int k = 0; k < courseID.size(); k++) {
                        ArrayList courseID1 = (ArrayList) courseID.get(k);
                        ArrayList courseScore = array.getStuScoreOfcourseId(getScoreOfTerm2.get(0).toString(), courseID1.get(0).toString(), class_id);
                        for (int m = 0; m < courseScore.size(); m++) {
                            ArrayList courseScore1 = (ArrayList) courseScore.get(m);
                %>
                <td align="center"><%=courseScore1.get(0)%>
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
            %>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
