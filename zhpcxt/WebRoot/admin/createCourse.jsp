<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style type="text/css">
.table-padding td {padding:5px;}
</style>
<form id="from_course_add" method="post">
  <table class="table-padding">
    <tr>
      <td align="right">�γ̺ţ�</td>
      <td><input class="easyui-validatebox" type="text" name="courseId" required="true" validType="pattern" customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">�γ�����</td>
      <td><input class="easyui-validatebox" type="text" name="courseName" required="true"  customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">ѧ�ڣ�</td>
      <td><input class="easyui-validatebox" type="text" name="term" required="true"  customize="Customize" /></td>
    </tr>
  </table>
</form>
