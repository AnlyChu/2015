<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList classInfo = null;

if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	classInfo = array.getBj1(adminlogin.get(1).toString()); 
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
<div region="west" split="false" border="false" title="�����˵�" style="width:180px;" id="west">
  <div id="left-menus" border="false" fit="true">
    <jsp:include page="/admin/left.jsp"></jsp:include>
  </div>
</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;">
  <table width="100%">
    <thead>
      <tr>
        <td colspan="11" align="center" style="padding:5px;">�༶������Ϣ</td>
      </tr>
       <tr>
      <td colspan="4" style="padding:5px;"><a href="<%=basePath %>admin/classSelect.jsp">�����༶</a></td>
      </tr>
      <tr class="thead">
        <td align="center">���</td>
        <td align="center">�꼶</td>
        <td align="center">ϵ��</td>
        <td align="center">רҵ</td>
        <td align="center">�༶</td>
        <td align="center">����Ա</td>
      </tr>
    </thead>
    <tbody class="tbody">
 <%
	    for(int i=0;i<classInfo.size();i++){
	    	ArrayList classInfo1 = (ArrayList)classInfo.get(i);	
	 %>
    <tr>
	<td align="center"><%=classInfo1.get(0) %></td>	
	<td align="center"><%=classInfo1.get(1) %></td>
	<td align="center"><%=classInfo1.get(2) %></td>
	<td align="center"><%=classInfo1.get(3) %></td>
	<td align="center"><%=classInfo1.get(4) %></td>
	<td align="center"><%=classInfo1.get(5) %></td>
<%-- 	<td align="center" ><a href="<%=basePath %>cd/add.jsp?method=upcd&id=<%=pagelist2.get(0).toString()%>">�޸�</a></td>  --%>
    </tr>
      <%} %>
    </tbody>
  </table>
</div>
</body>
</html>
