<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList admin = null;
    String mgr = null;
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        admin = array.getAllCounsellor();
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
<div id="londing" style="display: block;margin-top: 10%" align="center">数据加载ing</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;display: none;">
    <table width="100%">
        <thead>
        <tr>
            <td colspan="4" align="center" style="padding:5px;"><h3>辅导员管理</h3></td>
        </tr>
        <tr>
            <td colspan="4" style="padding:5px;"><a href="javascript:void(0)" id="admin_add">添加辅导员</a></td>
        </tr>
        <tr class="thead">
            <td align="center">职工号</td>
            <td align="center">用户名</td>
            <td align="center">身份</td>
            <td align="center">操作</td>
        </tr>
        </thead>
        <tbody class="tbody">
        <%
            if (admin != null && admin.size() != 0) {
                for (int i = 0; i < admin.size(); i++) {
                    ArrayList alRow = (ArrayList) admin.get(i);
                    mgr = alRow.get(1).toString();
        %>
        <tr>
            <td align="center"><%=alRow.get(0) %>
            </td>
            <td align="center"><%=alRow.get(1) %>
            </td>
            <td align="center"><%=alRow.get(3) %>
            </td>
            <td align="center">
                <a href="<%=path %>/DelServlet?admin=<%=alRow.get(0) %>">删除</a>
                |
                <a href="javascript:void(0)" onclick="giveClassToMgr('<%=path %>', '<%=mgr %>')">分配班级</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
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

    });
    <%--function giveClassToMgr(){--%>
        <%--giveClassToMgr('<%=path %>', '<%=mgr %>');--%>
    <%--}--%>
</script>
</body>
</html>
