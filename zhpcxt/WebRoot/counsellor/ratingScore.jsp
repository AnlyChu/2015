<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList rating = null;
    String class_id = (String) session.getAttribute("class_id");
    if (class_id == null){
        class_id = request.getParameter("class_id");
    }
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        rating = array.getEvaluating(class_id);
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
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;">
    <table width="100%">
        <thead>
        <tr>
            <td colspan="11" align="center" style="padding:5px;"><h3>班级学生素质测评排名</h3></td>
        </tr>
        <tr class="thead">
            <td align="center">序号</td>
            <td align="center">学号</td>
            <td align="center">姓名</td>
            <td align="center">学年</td>
            <td align="center">道德素养</td>
            <td align="center">学习能力</td>
            <td align="center">素质拓展</td>
            <td align="center">直接加减分</td>
            <td align="center">测评总分</td>
        </tr>
        </thead>
        <tbody class="tbody">
        <%
            if (rating != null && rating.size() != 0) {
                for (int i = 0; i < rating.size(); i++) {
                    ArrayList alRow = (ArrayList) rating.get(i);
                    ArrayList name = array.getStudent(alRow.get(0).toString());
                    for (int j = 0; j < name.size(); j++) {
                        ArrayList studentName = (ArrayList) name.get(j);
        %>
        <tr>
            <td align="center"><%=i+1 %>
            </td>
            <td align="center"><%=alRow.get(0) %>
            </td>
            <td align="center"><%=studentName.get(1) %>
            </td>
            <td align="center"><%=alRow.get(1) %>
            </td>
            <td align="center"><%=alRow.get(2) %>
            </td>
            <td align="center"><%=alRow.get(3) %>
            </td>
            <td align="center"><%=alRow.get(4) %>
            </td>
            <td align="center"><%=alRow.get(5) %>
            </td>
            <td align="center"><%=alRow.get(6) %>
            </td>

        </tr>
        <%
                    }
                }
            }
        %>
        </tbody>
    </table>

</div>
</body>
</html>
