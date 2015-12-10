<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList myTest = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	myTest = array.getMyTest(adminlogin.get(1).toString());

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
        <td colspan="5" align="center" style="padding:5px;">愿景计划</td>
      </tr>
      <tr class="thead">
      	<td align="center">学期</td>
        <td align="center">内容</td>
      </tr>
    </thead>
    <tbody class="tbody">
     <%
	    for(int i=0;i<myTest.size();i++){
	    	ArrayList myTest1 = (ArrayList)myTest.get(i);	
	 %>
      <tr>
      	<td align="center"><%=myTest1.get(1) %></td>
        <td align="center"><%=myTest1.get(2) %></td>
<%-- <td align="center"><%=Float.parseFloat(myscore.get(2).toString())*0.35+Float.parseFloat(myscore.get(3).toString())*0.5+Float.parseFloat(myscore.get(4).toString())*0.05+Float.parseFloat(myscore.get(5).toString())*0.1 %></td> --%> 
      </tr>
          <%} %>          
    </tbody>
   
  </table>
   <a href="yuanjingjihua2.jsp">添加愿景计划</a>
</div>
</body>
</html>
