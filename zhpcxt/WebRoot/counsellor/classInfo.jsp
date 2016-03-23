<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
	boolean closed = false;
	ArrayList classInfo = null;
	String classId = (String) request.getParameter("classId");
	session.setAttribute("classId",classId);
	if (adminlogin != null && adminlogin.size() != 0) {
		closed = true;
		classInfo = array.getBjInfo(request.getParameter("classId"));
			
	}

	String message = (String) request.getAttribute("message");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<head>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/admin-css.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/themes/icon.css">
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/admin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('tbody tr:even').css({'background':'#ffffff'});
	$('tbody tr:odd').css({'background':'#eeeeff'});
	var message = <%=message%>;
	if(message != null && message != ""){
		alert(message);
	}
	login('<%=path%>',<%=closed%>);
	$("#click_logout").click(function(){
		logout('<%=path%>');
	});
	$("#editpass").click(function(){
		editpass('<%=path%>');
	});
	$("#admin_add").click(function(){
		adminAdd('<%=path%>');
		});
	})
</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no"
	resizable="false">
	<div id="north" region="north" split="false" border="false">
		<jsp:include page="/admin/head.jsp"></jsp:include>
	</div>
	<div region="west" split="false" border="false" title="导航菜单"
		style="width:180px;" id="west">
		<div id="left-menus" border="false" fit="true">
			<jsp:include page="/admin/left.jsp"></jsp:include>
		</div>
	</div>
	<div id="mainPanle" region="center" border="true"
		style="background:#f7f7f7; padding:5px;">
		<table width="100%">
			<thead>
				<tr>
					<td colspan="11" align="center" style="padding:5px;">班级基本信息</td>
				</tr>
				<tr>
					<td colspan="4" style="padding:5px;"><a
						href="<%=basePath%>counsellor/classSelect.jsp">更换班级</a></td>
				</tr>
				<tr class="thead">
					<td align="center">编号</td>
					<td align="center">年级</td>
					<td align="center">系别</td>
					<td align="center">专业</td>
					<td align="center">班级</td>
					<td align="center">辅导员</td>
				</tr>
			</thead>
			<tbody class="tbody">
				<%
					for (int i = 0; i < classInfo.size(); i++) {
						ArrayList classInfo1 = (ArrayList) classInfo.get(i);
				%>
				<tr>
					<td align="center"><%=classInfo1.get(0)%></td>
					<td align="center"><%=classInfo1.get(1)%></td>
					<td align="center"><%=classInfo1.get(2)%></td>
					<td align="center"><%=classInfo1.get(3)%></td>
					<td align="center"><%=classInfo1.get(4)%></td>
					<td align="center"><%=classInfo1.get(5)%></td>
					<%-- 	<td align="center" ><a href="<%=basePath %>cd/add.jsp?method=upcd&id=<%=pagelist2.get(0).toString()%>">修改</a></td>  --%>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
