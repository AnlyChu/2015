<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList sportsgrade = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	sportsgrade = array.getIntellectualgrade();
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
        <td colspan="7" align="center" style="padding:5px;"><a href="<%=path %>/admin/sportsgradeexamine.jsp">体育成绩审核</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/admin/intellectualgradeexamine.jsp">智育成绩审核</a></td>
      </tr>
      <tr>
        <td colspan="7" align="center" style="padding:5px;">智育成绩审核</td>
      </tr>
      <tr class="thead">
        <td align="center">序号</td>
        <td align="center">学生姓名</td>
        <td align="center">班级</td>
        <td align="center">学期</td>
        <td align="center">科目/分数</td>
        <td align="center">日期</td>
        <td align="center">审核</td>
      </tr>
    </thead>
    <tbody class="tbody">
    <%
    if(sportsgrade != null && sportsgrade.size() != 0){
	    for(int i = 0;i < sportsgrade.size();i++){
	    	ArrayList alRow = (ArrayList)sportsgrade.get(i);
	    	ArrayList student = array.getStudent(alRow.get(1).toString());
	    	String state = "";
	    	if(alRow.get(7).equals("1")){
	    		state = "已通过";
	    	}else if(alRow.get(7).equals("2")){
	    		state = "未通过";
	    	}
    %>
      <tr>
        <td align="center"><%=i+1 %></td>
        <td align="center"><%=student.get(3) %></td>
        <td align="center"><%=student.get(4) %></td>
        <td align="center">第<%=alRow.get(2) %>学期</td>
        <td align="center"><table>
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
        <td align="center"><%=alRow.get(7).equals("0")?"<a href=\""+path+"/ExamineServlet?type=intellectual&state=1&id="+alRow.get(0)+"\">已通过</a>&nbsp;&nbsp;<a href=\""+path+"/ExamineServlet?type=intellectual&state=2&id="+alRow.get(0)+"\">未通过</a>":state %></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
</div>
</body>
</html>
