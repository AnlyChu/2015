<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ArrayList adminlogin = (ArrayList) session
			.getAttribute("adminlogin");
	boolean closed = false;
	ArrayList myscore = null;
	ArrayList course = null;
	if (adminlogin != null && adminlogin.size() != 0) {
		closed = true;
		myscore = array.getMyScore();

	}
	String message = (String) request.getAttribute("message");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
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

	/* function display_alert()
	 {
	 var lujing=document.form.fileUpload.value;
	 alert("·��="+lujing)
	 } */
</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no"
	resizable="false">
	<div id="north" region="north" split="false" border="false">
		<jsp:include page="/admin/head.jsp"></jsp:include>
	</div>
	<div region="west" split="false" border="false" title="�����˵�"
		style="width:180px;" id="west">
		<div id="left-menus" border="false" fit="true">
			<jsp:include page="/admin/left.jsp"></jsp:include>
		</div>
	</div>
	<div id="mainPanle" region="center" border="true"
		style="background:#f7f7f7; padding:5px;">
		<table>
			<thead>
				<tr>
					<td><p>�ϴ��ɼ���excel�ļ���:</p></td>
					<td>
						<form action="<%=path%>/Upload" method="post">
							<input type="file" name="fileUpload2" /> <input type=submit
								value="�ϴ��ļ�" />
						</form>
					</td>
				</tr>
				
			</thead>
			<tr>
					<td align="right"><p>ѧ��:</p></td>
					<td >
						<select name=term>
								<%
										ArrayList myscore2 = (ArrayList) myscore.get(0);
								%>
								<option value=<%=myscore2.get(2)%>><%=myscore2.get(2)%>
								</option>
								
						</select>
					</td>
				</tr>
		</table>
		<table width="100%">
			<thead>
			<tr><td colspan="6" align="center" style="padding:5px;"><h3>�༶ѧ���ɼ�</h3></td></tr>
				<tr class="thead">
					<td align="center">ѧ��</td>
					<td align="center" width="100px">����</td>
					<td align="center">ѧ��</td>
					<td align="center">�γ�</td>
					<td align="center">�ɼ�</td>
				</tr>
			</thead>

			<tbody class="tbody">
				<%
					for (int i = 0; i < myscore.size(); i++) {
						ArrayList myscore1 = (ArrayList) myscore.get(i);
						course = array.getCourse(myscore1.get(3).toString());

						ArrayList course1 = (ArrayList) course.get(0);
				%>
				<tr>
					<td align="center"><%=myscore1.get(0)%></td>
					<td align="center"><%=myscore1.get(1)%></td>
					<td align="center"><%=myscore1.get(2)%></td>
					<td align="center"><%=course1.get(1)%></td>
					<td align="center"><%=myscore1.get(4)%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
