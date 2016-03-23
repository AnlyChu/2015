<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    String class_id = (String) session.getAttribute("class_id");
    ArrayList classInfo = null;
    if (adminlogin != null && adminlogin.size() != 0) {
        classInfo = array.getBjInfo(class_id);
    }
%>
<title>计算机学院学生信息档案管理</title>
<style>
    .table-padding td {
        padding: 5px;
    }
</style>
<div class="north-left" style="width:50%">计算机学院学生信息档案管理
    <span style="font-size: 10px;margin-left: 8%">
      <%
          if (adminlogin != null && adminlogin.size() != 0 && adminlogin.get(1).toString().equals("辅导员")) {
      %>
         当前班级：
    <%
        for (int i = 0; i < classInfo.size(); i++) {
            ArrayList classInfo1 = (ArrayList) classInfo.get(i);
            String className = classInfo1.get(2).toString() + classInfo1.get(3).toString() + classInfo1.get(4).toString();
    %>
    <%=className%>
    <%
            }
        }
    %>
    </span>
</div>
<div class="north-right">欢迎：<%=adminlogin != null && adminlogin.size() != 0 ? adminlogin.get(1) : "" %>&nbsp;|&nbsp;用户角色：<%=adminlogin != null && adminlogin.size() != 0 ? adminlogin.get(3) : "" %>
    &nbsp;|&nbsp;<a href="javascript:void(0)" id="editpass">修改密码</a>&nbsp;|&nbsp;<a href="javascript:void(0)"
                                                                                    id="click_logout">安全退出</a></div>