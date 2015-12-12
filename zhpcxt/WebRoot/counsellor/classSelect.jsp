<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
	if((String) session.getAttribute("classId") !=null){
		session.removeAttribute("classId");
	}
	
	boolean closed = false;
	ArrayList class1 = null;
	ArrayList admin = null;
	if (adminlogin != null && adminlogin.size() != 0) {
		closed = true;
		admin = array.getAllCounsellor(adminlogin.get(0).toString());
		class1 = array.getMgrClass(adminlogin.get(1).toString());
	}
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
	$(document).ready(function() {

		$('tbody tr:even').css({
			'background' : '#ffffff'
		});
		$('tbody tr:odd').css({
			'background' : '#eeeeff'
		});
	});	

</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no"
	resizable="false">
	<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;">
		<table width="100%" height="100%">
			<tr>
				<td align="center">
				
					<form name="Form1" action="<%=basePath%>counsellor/classInfo.jsp" method="post">
						<table class="table-padding">
							<tr>
								<td align="right">选择班级：</td>
								<td><select name="classId">
										<%
											if (admin != null && admin.size() != 0) {
												for (int j = 0; j < class1.size(); j++) {
													ArrayList classMgr = (ArrayList) class1.get(j);
													String className = classMgr.get(2).toString() + classMgr.get(3).toString() + classMgr.get(4).toString();
													String classID = classMgr.get(0).toString();
												
										%>
										<option value="<%=classID%>"><%=className%></option>
										<%
											}
											}
										%>
								</select></td>
								<td><input type="submit" value="确定"></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

