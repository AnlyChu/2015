<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
%>
<title>�ƿ�ϵѧ���ۺϲ���ϵͳ</title>
<style>
.table-padding td {padding:5px;}
</style>
<div class="north-left">�ƿ�ϵѧ���ۺϲ���ϵͳ</div>
<div class="north-right">��ӭ��<%=adminlogin != null && adminlogin.size() != 0?adminlogin.get(1):"" %>&nbsp;--&gt;&nbsp;�û���ɫ��<%=adminlogin != null && adminlogin.size() != 0?adminlogin.get(3):"" %>&nbsp;--&gt;&nbsp;<a href="javascript:void(0)" id="editpass">�޸�����</a>&nbsp;--&gt;&nbsp;<a href="javascript:void(0)" id="click_logout">��ȫ�˳�</a></div>