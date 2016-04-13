<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
.table-padding td {padding:5px;}
</style>
<form id="form_login" method="post">
  <table class="table-padding">
    <tr>
      <td align="right">用户名：</td>
      <td><input class="easyui-validatebox" type="text" name="user_id" required="true" validType="pattern" customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">密码：</td>
      <td><input class="easyui-validatebox" type="password" name="pwd" required="true" validType="pattern" customize="Customize" /></td>
    </tr>
    <tr>
      <td align="right">身份：</td>
      <td>
      	<input type=radio name="status" value="辅导员" checked>辅导员
      	<input type=radio name="status" value="书记">书记
      	<%--<input type=radio name="status" value="学生">学生--%>
      </td>
    </tr>
  </table>
</form>
