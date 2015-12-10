<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList intellectualgrade = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	intellectualgrade = array.getIntellectualgrade(adminlogin.get(0).toString());
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
        <td colspan="6" align="center" style="padding:5px;">智育评测管理</td>
      </tr>
      <tr>
        <td colspan="6" style="padding:5px;"><span style="color:#F00">注：如评测审核未通过，请删除后重新提交</span></td>
      </tr>
      <tr>
        <td colspan="6" style="padding:5px;"><a href="<%=path %>/admin/intellectualgrade_edit.jsp">智育评测</a></td>
      </tr>
      <tr class="thead">
        <td align="center">序号</td>
        <td align="center">学期</td>
        <td align="center">分数</td>
        <td align="center">日期</td>
        <td align="center">审核</td>
        <td align="center"></td>
      </tr>
    </thead>
    <tbody class="tbody">
    <%
    if(intellectualgrade != null && intellectualgrade.size() != 0){
	    for(int i = 0;i < intellectualgrade.size();i++){
	    	ArrayList alRow = (ArrayList)intellectualgrade.get(i);
	    	String state = "";
	    	if(alRow.get(7).equals("0")){
	    		state = "审核中";
	    	}else if(alRow.get(7).equals("1")){
	    		state = "审核已通过";
	    	}else if(alRow.get(7).equals("2")){
	    		state = "审核未通过";
	    	}
    %>
      <tr>
        <td align="center"><%=i+1 %></td>
        <td align="center">第<%=alRow.get(2) %>学期</td>
        <td align="center">
          <table>
            <tr>
            <%
            String name[] = alRow.get(3).toString().split(",");
            for(int n = 0;n < name.length;n++){
            %>
              <td><%=name[n] %></td>
            <%} %>
            </tr>
            <tr>
            <%
            String grade[] = alRow.get(4).toString().split(",");
            for(int n = 0;n < grade.length;n++){
            %>
              <td><%=grade[n] %></td>
            <%} %>
            </tr>
        </table></td>
        <td align="center"><%=alRow.get(5) %></td>
        <td align="center"><%=state %></td>
        <td align="center"><%=alRow.get(7).equals("2")?"<a href="+path+"/DelServlet?sportsgrade="+alRow.get(0)+">删除</a>":"" %></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
</div>
</body>
</html>
