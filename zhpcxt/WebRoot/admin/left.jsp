<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");

%>
<ul>
<%
if(adminlogin != null && adminlogin.size() != 0){ 
if(adminlogin.get(3).equals("���")){ %>
	<li><a href="<%=path %>/admin/bj.jsp">�༶��Ϣ��ѯ</a></li>
	<li><a href="<%=path %>/admin/systemuser.jsp">����Ա����</a></li>
	<li><a href="<%=path %>/admin/student.jsp">ѧ����Ϣ��ѯ</a></li>
<%}
if(adminlogin.get(3).equals("����Ա")){ %>
	<li><a href="<%=path %>/admin/classScore.jsp">�ɼ��ϴ�</a></li>
  <li><a href="<%=path %>/admin/verifyexamine.jsp">�������</a></li>
  <li><a href="<%=path %>/admin/classInfo.jsp">�༶������Ϣ</a></li>
  <li><a href="<%=path %>/admin/evaluating.jsp">�೤����</a></li>
  <li><a href="<%=path %>/admin/studentInfoUpload.jsp">�༶ѧ����Ϣ</a></li>
<%}
if(adminlogin.get(3).equals("ѧ��")){
%>
  <li><a href="<%=path %>/admin/gerenxinxi.jsp">�ҵ���Ϣ</a></li>
  <li><a href="<%=path %>/admin/szcp.jsp?verifyType=moral">��������</a></li>
  <li><a href="<%=path %>/admin/myscore.jsp">�ҵĳɼ�</a></li>
  <li><a href="<%=path %>/admin/yuanjingjihua.jsp">Ը���ƻ�</a></li>

  
<%}}%>
</ul>

