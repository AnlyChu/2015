<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style type="text/css">
.table-padding td {padding:5px;}
</style>
<form id="form_class_add" method="post">
  <table class="table-padding">
    <tr>
      <td align="right">班级编号：</td>
      <td><input class="easyui-validatebox" type="text" name="id" required="true" validType="pattern" customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">班级系别：</td>
      <td><input class="easyui-validatebox" type="text" name="Dept" required="true"  customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">班级专业：</td>
      <td><input class="easyui-validatebox" type="text" name="Pname" required="true" customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">班级年级：</td>
      <td><input class="easyui-validatebox" type="text" name="Cyear" required="true" validType=""  customize="Customize" /></td>
    </tr>
  </table>
</form>
