<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList class1 = null;
ArrayList admin = null;
ArrayList class2 = null;
ArrayList class3 = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	admin = array.getAllAdmin(adminlogin.get(0).toString());
	class2 = array.getBj(request.getParameter("bjh")); 
	class1 = array.getBjs(); 
	class3 = array.getAllBj(); 
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
	$("#class_add").click(function(){
		classAdd('<%=path %>');
	});
	$("#course_add").click(function(){
		courseAdd('<%=path %>');
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
      <tr>
      <td colspan="4" style="padding:5px;"><a href="javascript:void(0)" id="class_add">新建班级</a></td>
      </tr>
      <tr>
      <td colspan="4" style="padding:5px;"><a href="javascript:void(0)" id="course_add">新建课程</a></td>
      </tr>
      <form action="<%=basePath %>admin/bj.jsp" method="post" name="form1">
      <tr class="thead">
        <td colspan="4"  align="center"></td>
        <td>
    <select name=bjh>
	 <% for(int i=0;i<class1.size();i++){
	    	ArrayList class1bj = (ArrayList)class1.get(i);	
	 %>
    <option value=<%=class1bj.get(0) %>><%=class1bj.get(0) %>年级</option>
    <%} %>
    </select>
    </td>
    <td><input type="submit" value="提交查询"> </td>
      </tr>
      </form>
    </thead>
    <tbody class="tbody">
    
    </tbody>
  </table>

  <table width="100%">
    <thead>
      
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
 	if(class2 != null && class2.size() != 0){
	    for(int i=0;i<class2.size();i++){
	    	ArrayList student2 = (ArrayList)class2.get(i);	
	 %>
	<form action="<%=path %>/DelServlet?" method="post" name=nihao<%=student2.get(0)%>>
    <tr>
<td align="center"><input name=bj value=<%=student2.get(1) %> readOnly="true" ></td>
	<td align="center"><%=student2.get(2) %></td>
	<td align="center">
	<select name=fdy>
	<option><%=student2.get(3) %></option>
	<%
    if(admin != null && admin.size() != 0){
	    for(int j = 0;j < admin.size();j++){
	    	ArrayList alRow = (ArrayList)admin.get(j);
    %>
		<option><%=alRow.get(2) %></option>
      <%}} %>
	</select>
	</td>
	<td align="center"><%=student2.get(4) %></td>
	<td align="center"><input type="submit" value="确定"> </td>
<%-- 	<td align="center"><a href="<%=path %>/DelServlet?admin=<%=alRow.get(0) %>">删除</a></td> --%>
    </tr>
    </form>
      <%}}else { %>
    <%
	    for(int i=0;i<class3.size();i++){
	    	ArrayList student2 = (ArrayList)class3.get(i);	
	 %>
	<form action="<%=path %>/DelServlet?" method="post" name=nihao<%=student2.get(0)%>>
    <tr>
	<td align="center"><input name=bj value=<%=student2.get(1) %> readOnly="true" ></td>
	<td align="center"><%=student2.get(2) %></td>
	<td align="center">
	<select name=fdy>
	<option><%=student2.get(3) %></option>
	<%
    if(admin != null && admin.size() != 0){
	    for(int j = 0;j < admin.size();j++){
	    	ArrayList alRow = (ArrayList)admin.get(j);
    %>
		<option><%=alRow.get(2) %></option>
      <%}} %>
	</select>
	</td>
	<td align="center"><%=student2.get(4) %></td>
	<td align="center"><input type="submit" value="确定"> </td>
<%-- 	<td align="center"><a href="<%=path %>/DelServlet?admin=<%=alRow.get(0) %>">删除</a></td> --%>
    </tr>
    </form>
      <%}}%>
    </tbody>
    
  </table>
</div>
</body>
</html>
