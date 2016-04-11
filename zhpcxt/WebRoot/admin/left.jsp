<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
String class_id = (String)session.getAttribute("class_id");
%>
<ul>
<%
if(adminlogin != null && adminlogin.size() != 0){ 
if(adminlogin.get(3).equals("书记")){ %>
	<li><a href="<%=path %>/admin/allClassInfo.jsp">班级信息查询</a></li>
	<li><a href="<%=path %>/admin/systemuser.jsp">辅导员管理</a></li>
	<li><a href="<%=path %>/admin/stuInfoSelect.jsp">学生信息查询</a></li>
	<li><a href="<%=path %>/admin/classQualified.jsp">班级及格率查询</a></li>
	<li><a href="<%=path %>/admin/classRating.jsp">班级测评查询</a></li>
	<li><a href="<%=path %>/admin/stuWarning.jsp">学业预警查询</a></li>
<%}
if(adminlogin.get(3).equals("辅导员")){ %>
	<li><a href="<%=path %>/counsellor/classScore.jsp">班级学生成绩</a></li>
  <%--<li><a href="<%=path %>/counsellor/verifyexamine.jsp">评测审核</a></li>--%>
  <%--<li><a href="<%=path %>/counsellor/classSelect.jsp">查询</a></li>--%>
  <li><a href="<%=path %>/counsellor/classInfo.jsp?class_id=<%=class_id%>">班级基本信息</a></li>
  <%--<li><a href="<%=path %>/counsellor/evaluating.jsp">班长管理</a></li>--%>
  <li><a href="<%=path %>/counsellor/studentInfoUpload.jsp">班级学生信息</a></li>
  <li><a href="<%=path %>/counsellor/rateSchoolYearSelect.jsp">学生素质综合测评</a></li>
  <li><a href="<%=path %>/counsellor/ratingScore.jsp">学生素质测评排名</a></li>
<%}
if(adminlogin.get(3).equals("学生")){
%>
  <li><a href="<%=path %>/admin/gerenxinxi.jsp">我的信息</a></li>
  <li><a href="<%=path %>/admin/szcp.jsp?verifyType=moral">素质评测</a></li>
  <li><a href="<%=path %>/admin/myscore.jsp">我的成绩</a></li>
  <li><a href="<%=path %>/admin/yuanjingjihua.jsp">愿景计划</a></li>

  
<%}}%>
</ul>

