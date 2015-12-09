<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
//String adminName = (String)request.getAttribute("adminName");
boolean closed = false;
ArrayList class1 = null;
ArrayList admin = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	admin = array.getAllAdmin(adminlogin.get(0).toString());
	class1 = array.getMgrClass(adminlogin.get(1).toString()); 
}

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
	
})
</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no" resizable="false"  onload="myFunc()">
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;">
 <table width="100%" height="100%">
    <tr>
      <td align="center">
      <form id="form_login" action="<%=basePath %>admin/classInfo.jsp" method="post">
  		<table class="table-padding">
    		<tr>
     			<td align="right">选择班级：</td>
      			<td><select name=classMgr>
				<%
    				if(admin != null && admin.size() != 0){
	    				for(int j = 0;j < class1.size();j++){
	    					ArrayList classMgr = (ArrayList)class1.get(j);
    			%>
					<option><%=classMgr.get(2)%></option>
      			<%}} %>
				</select></td>
				<td><input type="submit" value="确定"> </td>
    		</tr>
  		</table>
	</form>
	</td>
   </tr>
</table>
</div>
</body>
</html>

