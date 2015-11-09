<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList student = null;
ArrayList admin = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	admin = array.getAllAdmin(adminlogin.get(0).toString());
}

if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	student = array.getBj(request.getParameter("bjh")); 
}
String message = (String)request.getAttribute("message");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/admin-css.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/admin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('tbody tr:even').css({'background':'#ffffff'});
	$('tbody tr:odd').css({'background':'#eeeeff'});
	var message = <%=message %>;
	if(message != null && message != ""){
		alert(message);
	}
	login('<%=path %>',<%=closed %>);
	$("#click_logout").click(function(){
		logout('<%=path %>');
	});
	$("#editpass").click(function(){
		editpass('<%=path %>');
	});
	$("#admin_add").click(function(){
		adminAdd('<%=path %>');
	});
})
</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no" resizable="false">
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
        <td colspan="11" align="center" style="padding:5px;">班级管理</td>
      </tr>
      <tr class="thead">
        <td align="center">班级</td>
        <td align="center">班级人数</td>
        <td align="center">辅导员</td>
        <td align="center">不及格人数</td>
        <td align="center">变更辅导员</td>
<!--          <td align="center">变更辅导员</td> -->
      </tr>
    </thead>
    
    <tbody class="tbody">
 <%
	    for(int i=0;i<student.size();i++){
	    	ArrayList student1 = (ArrayList)student.get(i);	
	 %>
	<form action="<%=path %>/DelServlet?" method="post" name=nihao<%=student1.get(0)%>>
    <tr>
	<td align="center"><input name=bj value=<%=student1.get(1) %> readOnly="true" ></input></td>
	<td align="center"><%=student1.get(2) %></td>
	<td align="center">
	<select name=fdy>
	<option><%=student1.get(3) %></option>
	<%
    if(admin != null && admin.size() != 0){
	    for(int j = 0;j < admin.size();j++){
	    	ArrayList alRow = (ArrayList)admin.get(j);
    %>
		<option><%=alRow.get(4) %></option>
      <%}} %>
	</select>
	</td>
	<td align="center"><%=student1.get(4) %></td>
	<td align="center"><input type="submit" value="确定"> </td>
<%-- 	<td align="center"><a href="<%=path %>/DelServlet?admin=<%=alRow.get(0) %>">删除</a></td> --%>
    </tr>
    </form>
      <%} %>
    </tbody>
    
  </table>
</div>
</body>
</html>
