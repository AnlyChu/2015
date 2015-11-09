<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
}
String message = (String)request.getAttribute("message");
String verifyType = request.getParameter("verifyType");
String str = "";
if(verifyType != null && verifyType.equals("moral")){
	str = "德育";
}else if(verifyType != null && verifyType.equals("sports")){
	str = "体育";
}else if(verifyType != null && verifyType.equals("ability")){
	str = "能力";
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
    <tr>
      <td align="center" style="padding:10px"><%=str %>评测</td>
    </tr>
  </table>
  <form id="article_edit" method="post" action="<%=path %>/VerifyServlet?name=<%=verifyType %>" onSubmit="return $(this).form('validate');">
    <table border="1" align="center" cellpadding="5">
      <tr>
        <td align="right">加分/减分：</td>
        <td><input name="addsubtract" type="radio" value="加分" checked><span>加分</span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="addsubtract" value="减分"><span>减分</span></td>
      </tr>
      <tr>
        <td align="right">分数：</td>
        <td><input class="easyui-numberbox" type="text" name="score" required="true" missingMessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
      </tr>
      <tr>
        <td align="right">原因或理由：</td>
        <td><textarea class="easyui-validatebox" name="reason" required="true" style="width:700px;height:200px;"></textarea></td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td><input type="submit" value="提交"></td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
