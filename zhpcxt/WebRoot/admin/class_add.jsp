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
      <td align="right">��ţ�</td>
      <td><input class="easyui-validatebox" type="text" name="classId" required="true" validType="pattern" customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">ϵ��</td>
      <td><input class="easyui-validatebox" type="text" name="dept" required="true"  customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">�꼶��</td>
      <td><input class="easyui-validatebox" type="text" name="grade" required="true"  customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">רҵ��</td>
      <td><input class="easyui-validatebox" type="text" name="pro" required="true" customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">�༶��</td>
      <td><input class="easyui-validatebox" type="text" name="class" required="true" customize="Customize" /></td>
    </tr>
    
  </table>
</form>
