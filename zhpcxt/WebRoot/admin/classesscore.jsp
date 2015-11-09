<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList student = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	student = array.getStudent(adminlogin.get(0).toString());
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
        <td colspan="5" align="center" style="padding:5px;">班级测评成绩</td>
      </tr>
      <tr class="thead">
        <td align="center">德育成绩</td>
        <td align="center">智育成绩</td>
        <td align="center">体育成绩</td>
        <td align="center">能力成绩</td>
        <td align="center">综合成绩</td>
      </tr>
    </thead>
    <tbody class="tbody">
    <%
    if(adminlogin != null && adminlogin.size() != 0){
    %>
      <tr>
        <td align="center"><table>
            <tr>
              <td>名次</td>
              <td>姓名</td>
              <td>成绩</td>
            </tr>
            <%
            ArrayList moral = array.getClassesScore(student.get(4).toString(),"moral");
            float moralF = 0;
            for(int i = 0;i < moral.size();i++){
            	ArrayList alRow = (ArrayList)moral.get(i);
            	moralF = moralF+(float)Float.parseFloat(alRow.get(2).toString());
            %>
            <tr>
              <td><%=i+1 %></td>
              <td><%=alRow.get(7) %></td>
              <td><%=alRow.get(2) %></td>
            </tr>
            <%} %>
            <tr>
              <td colspan="3">总成绩：<%=moralF %></td>
            </tr>
        </table></td>
        <td align="center"><table>
            <tr>
              <td>名次</td>
              <td>姓名</td>
              <td>成绩</td>
            </tr>
            <%
            ArrayList intellectual = array.getClassesScore(student.get(4).toString(),"intellectual");
            float intellectualF = 0;
            for(int i = 0;i < intellectual.size();i++){
            	ArrayList alRow = (ArrayList)intellectual.get(i);
            	intellectualF = intellectualF+(float)Float.parseFloat(alRow.get(3).toString());
            %>
            <tr>
              <td><%=i+1 %></td>
              <td><%=alRow.get(7) %></td>
              <td><%=alRow.get(3) %></td>
            </tr>
            <%} %>
            <tr>
              <td colspan="3">总成绩：<%=intellectualF %></td>
            </tr>
        </table></td>
        <td align="center"><table>
            <tr>
              <td>名次</td>
              <td>姓名</td>
              <td>成绩</td>
            </tr>
            <%
            ArrayList sports = array.getClassesScore(student.get(4).toString(),"sports");
            float sportsF = 0;
            for(int i = 0;i < sports.size();i++){
            	ArrayList alRow = (ArrayList)sports.get(i);
            	sportsF = sportsF+(float)Float.parseFloat(alRow.get(4).toString());
            %>
            <tr>
              <td><%=i+1 %></td>
              <td><%=alRow.get(7) %></td>
              <td><%=alRow.get(4) %></td>
            </tr>
            <%} %>
            <tr>
              <td colspan="3">总成绩：<%=sportsF %></td>
            </tr>
        </table></td>
        <td align="center"><table>
            <tr>
              <td>名次</td>
              <td>姓名</td>
              <td>成绩</td>
            </tr>
            <%
            ArrayList ability = array.getClassesScore(student.get(4).toString(),"ability");
            float abilityF = 0;
            for(int i = 0;i < ability.size();i++){
            	ArrayList alRow = (ArrayList)ability.get(i);
            	abilityF = abilityF+(float)Float.parseFloat(alRow.get(5).toString());
            %>
            <tr>
              <td><%=i+1 %></td>
              <td><%=alRow.get(7) %></td>
              <td><%=alRow.get(5) %></td>
            </tr>
            <%} %>
            <tr>
              <td colspan="3">总成绩：<%=abilityF %></td>
            </tr>
        </table></td>
        <td align="center"><table>
            <tr>
              <td>名次</td>
              <td>姓名</td>
              <td>成绩</td>
            </tr>
            <%
            ArrayList zhonghe = array.getClassesScore(student.get(4).toString(),"zhonghe");
            float zhongheF = 0;
            for(int i = 0;i < zhonghe.size();i++){
            	ArrayList alRow = (ArrayList)zhonghe.get(i);
            	zhongheF = zhongheF+(float)Float.parseFloat(alRow.get(6).toString());
            %>
            <tr>
              <td><%=i+1 %></td>
              <td><%=alRow.get(7) %></td>
              <td><%=alRow.get(6) %></td>
            </tr>
            <%} %>
            <tr>
              <td colspan="3">总成绩：<%=zhongheF %></td>
            </tr>
        </table></td>
      </tr>
      <%} %>
    </tbody>
  </table>
</div>
</body>
</html>
