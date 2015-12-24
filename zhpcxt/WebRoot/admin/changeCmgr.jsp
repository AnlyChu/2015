<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
	boolean closed = false;
	ArrayList counsellor = null;
	ArrayList classInfoCmgr = null;
	String classId = (String) session.getAttribute("classId");
	if (adminlogin != null && adminlogin.size() != 0) {
		closed = true;
		classInfoCmgr = array.getBj(classId);
		counsellor = array.getAllCounsellor();

	}
%>
<style type="text/css">
	.table-padding {text-align: center}
	.table-padding td {padding:5px;margin-top: 5px;}
</style>
<form id="from_change_cmgr" method="post">
	<table class="table-padding">
		<tr align="center">
			<select name="cMgr" style="margin-left: 40%;margin-top: 20%;">
				<%
						for (int i = 0; i < classInfoCmgr.size(); i++) {
							ArrayList classCmgr = (ArrayList) classInfoCmgr.get(i);
				%>
				<option selected="selected"><%=classCmgr.get(5)%></option>
				<%
					}
				%>
				<%
					for (int j = 0; j < counsellor.size(); j++) {
						ArrayList changCmgr = (ArrayList) counsellor.get(j);
				%>
				<option value=<%=changCmgr.get(1)%>><%=changCmgr.get(1)%></option>
				<%
					}
				%>
			</select>
		</tr>
	</table>
</form>
