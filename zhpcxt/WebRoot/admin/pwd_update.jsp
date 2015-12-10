<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style type="text/css">
.table-padding td {padding:5px;}
</style>
<form id="form_pwd_update" method="post">
  <table class="table-padding">
    <tr>
      <td align="right">新密码：</td>
      <td><input class="easyui-validatebox" type="password" name="newpwd" required="true" validType="pattern" id="admin_new_pwd" customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">重复新密码：</td>
      <td><input class="easyui-validatebox" type="password" name="repeatpwd" required="true" validType="repeat'#admin_new_pwd'" customize="Customize" /></td>
    </tr>
  </table>
</form>
