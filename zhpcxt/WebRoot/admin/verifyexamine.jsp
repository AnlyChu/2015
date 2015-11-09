<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList verify = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	verify = array.getVerify();
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
        <td colspan="9" align="center" style="padding:5px;">�������</td>
      </tr>
      <tr class="thead">
        <td align="center">���</td>
        <td align="center">ѧ������</td>
        <td align="center">�༶</td>
        <td align="center">�����Ŀ</td>
        <td align="center">��/����</td>
        <td align="center">����</td>
        <td align="center">ԭ�������</td>
        <td align="center">����</td>
        <td align="center">���</td>
      </tr>
    </thead>
    <tbody class="tbody">
    <%
    if(verify != null && verify.size() != 0){
	    for(int i = 0;i < verify.size();i++){
	    	ArrayList alRow = (ArrayList)verify.get(i);
	    	ArrayList student = array.getStudent(alRow.get(1).toString());
	    	String state = "";
	    	String str = "";
	    	if(alRow.get(2) != null && alRow.get(2).equals("moral")){
	    		str = "����";
	    	}else if(alRow.get(2) != null && alRow.get(2).equals("sports")){
	    		str = "����";
	    	}else if(alRow.get(2) != null && alRow.get(2).equals("ability")){
	    		str = "����";
	    	}
	    	if(alRow.get(8).equals("1")){
	    		state = "��ͨ��";
	    	}else if(alRow.get(8).equals("2")){
	    		state = "δͨ��";
	    	}
    %>
      <tr>
        <td align="center"><%=i+1 %></td>
        <td align="center"><%=student.get(3) %></td>
        <td align="center"><%=student.get(4) %></td>
        <td align="center"><%=str %></td>
        <td align="center"><%=alRow.get(3) %></td>
        <td align="center"><%=alRow.get(4) %></td>
        <td align="center"><%=alRow.get(5) %></td>
        <td align="center"><%=alRow.get(6) %></td>
        <td align="center"><%=alRow.get(8).equals("0")?"<a href=\""+path+"/ExamineServlet?type=item&state=1&id="+alRow.get(0)+"\">��ͨ��</a>&nbsp;&nbsp;<a href=\""+path+"/ExamineServlet?type=item&state=2&id="+alRow.get(0)+"\">δͨ��</a>":state %></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
</div>
</body>
</html>
