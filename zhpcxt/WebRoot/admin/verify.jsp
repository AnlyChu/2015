<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
String verifyType = request.getParameter("verifyType");
String str = "";
ArrayList verify = null;
int sum=0;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	verify = array.getVerify(verifyType,adminlogin.get(0).toString());
	if(verifyType != null && verifyType.equals("moral")){
		str = "����";
	}else if(verifyType != null && verifyType.equals("sports")){
		str = "����";
	}else if(verifyType != null && verifyType.equals("ability")){
		str = "����";
	}
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
        <td colspan="7" align="center" style="padding:5px;"><%=str %>�������</td>
      </tr>
      <tr>
        <td colspan="7" style="padding:5px;"><span style="color:#F00">ע�����������δͨ������ɾ���������ύ</span></td>
      </tr>
      <tr>
        <td colspan="7" style="padding:5px;"><a href="<%=path %>/admin/verify_edit.jsp?verifyType=<%=verifyType %>">���Ӽӷ���<%-- <%=str %> --%></a></td>
      </tr>
      <tr class="thead">
        <td align="center">���</td>
        <td align="center">��/����</td>
        <td align="center">����</td>
        <td align="center">ԭ�������</td>
        <td align="center">����</td>
        <td align="center">���</td>
        <td align="center"></td>
      </tr>
    </thead>
    <tbody class="tbody">
    <%
    if(verify != null && verify.size() != 0){
	    for(int i = 0;i < verify.size();i++){
	    	ArrayList alRow = (ArrayList)verify.get(i);
	    	String state = "";
	    	if(alRow.get(8).equals("0")){
	    		state = "�����";
	    	}else if(alRow.get(8).equals("1")){
	    		state = "�����ͨ��";
	    		/* if(alRow.get(3).equals("�ӷ�")){	    		
	    		sum=sum+(int)(alRow.get(4));
	    		}
	    		else{
	    		sum=sum-(int)(alRow.get(4));
	    		} */
	    	}else if(alRow.get(8).equals("2")){
	    		state = "���δͨ��";
	    	}
    %>
      <tr>
        <td align="center"><%=i+1 %></td>
        <td align="center"><%=alRow.get(3) %></td>
        <td align="center"><%=alRow.get(4) %></td>
        <td align="center"><%=alRow.get(5) %></td>
        <td align="center"><%=alRow.get(6) %></td>
        <td align="center"><%=state %></td>
        <td align="center"><%=alRow.get(8).equals("2")?"<a href="+path+"/DelServlet?verify="+alRow.get(0)+"&verifyType="+verifyType+">ɾ��</a>":"" %></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
  <p>�������ʲ����ܷ�Ϊ��</p><%=sum%>
</div>
</body>
</html>
