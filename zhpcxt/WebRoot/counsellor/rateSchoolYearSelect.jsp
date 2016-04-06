<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    String class_id = (String)session.getAttribute("class_id");
    boolean closed = false;
    ArrayList school_year = null;
    if( session.getAttribute("school_year") !=null){
        session.removeAttribute("school_year");
    }
    ArrayList admin = null;
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        admin = array.getAllCounsellor(adminlogin.get(0).toString());
        school_year = array.getAllCourseSchoolYear(class_id);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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

            $('tbody tr:even').css({
                'background': '#ffffff'
            });
            $('tbody tr:odd').css({
                'background': '#eeeeff'
            });
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

    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no"
      resizable="false">
<div id="north" region="north" split="false" border="false">
    <jsp:include page="/admin/head.jsp"></jsp:include>
</div>
<div region="west" split="false" border="false" title="导航菜单" style="width:180px;" id="west">
    <div id="left-menus" border="false" fit="true">
        <jsp:include page="/admin/left.jsp"></jsp:include>
    </div>
</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;">
    <table width="100%" height="100%">
        <tr>
            <td align="center">

                <form name="Form1" action="<%=basePath%>counsellor/studentInfoForRate.jsp" method="post">
                    <table class="table-padding">
                        <tr>
                            <td align="right">选择学年：</td>
                            <td><select name="school_year">
                                <%
                                    if (admin != null && admin.size() != 0) {
                                        for (int j = 0; j < school_year.size(); j++) {
                                            ArrayList classSchoolYear = (ArrayList) school_year.get(j);
                                %>
                                <option value="<%=classSchoolYear.get(0)%>"><%=classSchoolYear.get(0)%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select></td>
                            <td><input type="submit" value="确定"></td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>
</body>
</html>

