<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList student = null;
    String school_year = null;
    String class_id = (String) session.getAttribute("class_id");
    if (session.getAttribute("school_year") != null) {
        school_year = (String) session.getAttribute("school_year");
    } else {
        school_year = request.getParameter("school_year");
    }
    ArrayList checkRating = null;
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        student = array.getClassStudent(class_id);
    }
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/admin-css.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/admin.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#londing").css('display', 'none');
            $("#mainPanle").css('display', '');
            $('tbody tr:even').css({'background': '#ffffff'});
            $('tbody tr:odd').css({'background': '#eeeeff'});
            var message = <%=message %>;
            if (message != null && message != "") {
                alert(message);
            }
            login('<%=path %>', <%=closed %>);
            $("#click_logout").click(function () {
                logout('<%=path %>');
            });
            $("#editpass").click(function () {
                editpass('<%=path %>');
            });
            $("#admin_add").click(function () {
                adminAdd('<%=path %>');
            });
        })

        /* function display_alert()
         {
         var lujing=document.form.fileUpload.value;
         alert("路径="+lujing)
         } */
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no" resizable="false">
<div id="north" region="north" split="false" border="false">
    <jsp:include page="/admin/head.jsp"></jsp:include>
</div>
<div region="west" split="false" border="false" title="导航菜单" style="width:180px;" id="west">
    <div id="left-menus" border="false" fit="true">
        <jsp:include page="/admin/left.jsp"></jsp:include>
    </div>
</div>
<div id="londing" style="display: '';margin-top: 10%" align="center">数据加载ing</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;display: none;">
    <table width="100%">
        <thead>
        <tr>
            <td colspan="11" align="center" style="padding:5px;"><h3>班级学生信息</h3></td>
        </tr>
        <tr class="thead">
            <td align="center">学号</td>
            <td align="center">姓名</td>
            <td align="center">性别</td>
            <td align="center">班级</td>
            <td align="center">学院</td>
            <td align="center">专业</td>
            <td align="center">学年</td>
            <td align="center">操作</td>

        </tr>
        </thead>
        <tbody class="tbody">
        <%
            if (student != null && student.size() != 0) {
                for (int i = 0; i < student.size(); i++) {
                    ArrayList alRow = (ArrayList) student.get(i);
        %>
        <tr>

            <td align="center"><%=alRow.get(0) %>
            </td>
            <td align="center"><%=alRow.get(1) %>
            </td>
            <td align="center"><%=alRow.get(2) %>
            </td>
            <td align="center"><%=alRow.get(3) %>
            </td>
            <td align="center"><%=alRow.get(5) %>
            </td>
            <td align="center"><%=alRow.get(6) %>
            </td>
            <td align="center"><%=school_year %>
            </td>
            <%
                checkRating = array.getEvaluating(alRow.get(0).toString(), school_year, class_id);
                if (checkRating != null && checkRating.size() != 0) {
            %>
            <td align="center">已评分</td>
            <%
            } else {
            %>
            <td align="center">
                <a href="<%=basePath%>counsellor/stuQualityEvaluation.jsp?student_id=<%=alRow.get(0)%>&school_year=<%=school_year%>">评分</a>
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
    </table>

</div>
</body>
</html>
