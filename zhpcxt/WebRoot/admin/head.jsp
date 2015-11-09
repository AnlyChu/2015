<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
%>
<title>计科系学生综合测评系统</title>
<style>
.table-padding td {padding:5px;}
</style>
<div class="north-left">计科系学生综合测评系统</div>
<div class="north-right">欢迎：<%=adminlogin != null && adminlogin.size() != 0?adminlogin.get(1):"" %>&nbsp;--&gt;&nbsp;用户角色：<%=adminlogin != null && adminlogin.size() != 0?adminlogin.get(3):"" %>&nbsp;--&gt;&nbsp;<a href="javascript:void(0)" id="editpass">修改密码</a>&nbsp;--&gt;&nbsp;<a href="javascript:void(0)" id="click_logout">安全退出</a></div>