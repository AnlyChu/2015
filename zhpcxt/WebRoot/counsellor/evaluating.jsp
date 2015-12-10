<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList evaluating = null;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	evaluating = array.getEvaluating();
}
String message = (String)request.getAttribute("message");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/admin-css.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/admin.js"></script>
<script type="text/javascript">
function evaluatingAdd(path){
	$("body").append("<div id='dlg_evaluating_add' style='padding:20px;'></div>");
	$('#dlg_evaluating_add').dialog({
		href:path+'/admin/evaluating_add.jsp',
		modal:true,
		closed:false,
	    title:'添加系统用户',
	    width:300,
	    height:450,
	    buttons:[{
	        text:'提交',
	        iconCls:'icon-ok',
	        handler:function(){
	            $('#form_evaluating_add').form('submit',{
	            	url:path+'/EvaluatingAddServlet?type=reg',
	                onSubmit:function(){
				        return $(this).form('validate');
				    },
				    success:function(data){
				    	if(data == "-1"){
				    		$.messager.alert('系统消息','用户名已存在','error');
				    	}else{
				    		$.messager.alert('系统消息','添加成功','info',function(){
					    		$('#dlg_login').dialog('refresh');
					    		$('#dlg_login').dialog('close');
					    		location.href = path+'/admin/evaluating.jsp';				    			
				    		},false);
				    	} 
				    }  
	            });
	        }
	    },{
	        text:'重置',
	        iconCls:'icon-reload',
	        handler:function(){
	            $('#dlg_evaluating_add').dialog('refresh');
	        }
	    }]
	});
}
$(document).ready(function(){
	$('tbody tr:even').css({'background':'#ffffff'});
	$('tbody tr:odd').css({'background':'#eeeeff'});
	var message = <%=message %>;
	if(message != null && message != ""){
		alert(message);
	}
	login('<%=path %>',<%=closed %>);
	$("#click_logout").click(function(){
		logout('<%=path %>');
	});
	$("#editpass").click(function(){
		editpass('<%=path %>');
	});
	$("#admin_add").click(function(){
		adminAdd('<%=path %>');
	});
	$("#evaluating_add").click(function(){
		evaluatingAdd('<%=path %>');
	});
})
</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no" resizable="false">
<div id="north" region="north" split="false" border="false">
  <jsp:include page="/admin/head.jsp"></jsp:include>
</div>
<div region="west" split="false" border="false" title="导航菜单" style="width:180px;" id="west">
  <div id="left-menus" border="false" fit="true">
    <jsp:include page="/admin/left.jsp"></jsp:include>
  </div>
</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;">
  <table width="100%">
    <thead>
      <tr>
        <td colspan="11" align="center" style="padding:5px;">评测员管理</td>
      </tr>
      <tr>
        <td colspan="11" style="padding:5px;"><a href="javascript:void(0)" id="evaluating_add">添加评测员</a></td>
      </tr>
      <tr class="thead">
        <td align="center">序号</td>
        <td align="center">用户名</td>
        <td align="center">姓名</td>
        <td align="center">职务</td>
        <td align="center">性别</td>
        <td align="center">出生日期</td>
        <td align="center">联系电话</td>
        <td align="center">家庭地址</td>
        <td align="center">邮编</td>
        <td align="center">电子邮箱</td>
        <td align="center">操作</td>
      </tr>
    </thead>
    <tbody class="tbody">
    <%
    if(evaluating != null && evaluating.size() != 0){
	    for(int i = 0;i < evaluating.size();i++){
	    	ArrayList alRow = (ArrayList)evaluating.get(i);
    %>
      <tr>
        <td align="center"><%=i+1 %></td>
        <td align="center"><%=alRow.get(1) %></td>
        <td align="center"><%=alRow.get(3) %></td>
        <td align="center"><%=alRow.get(4) %></td>
        <td align="center"><%=alRow.get(5) %></td>
        <td align="center"><%=alRow.get(6) %></td>
        <td align="center"><%=alRow.get(7) %></td>
        <td align="center"><%=alRow.get(8) %></td>
        <td align="center"><%=alRow.get(9) %></td>
        <td align="center"><%=alRow.get(10) %></td>
        <td align="center"><a href="<%=path %>/DelServlet?evaluating=<%=alRow.get(0) %>">删除</a></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
</div>
</body>
</html>
