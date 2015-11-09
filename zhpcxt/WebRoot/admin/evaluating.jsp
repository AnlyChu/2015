<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
	    title:'���ϵͳ�û�',
	    width:300,
	    height:450,
	    buttons:[{
	        text:'�ύ',
	        iconCls:'icon-ok',
	        handler:function(){
	            $('#form_evaluating_add').form('submit',{
	            	url:path+'/EvaluatingAddServlet?type=reg',
	                onSubmit:function(){
				        return $(this).form('validate');
				    },
				    success:function(data){
				    	if(data == "-1"){
				    		$.messager.alert('ϵͳ��Ϣ','�û����Ѵ���','error');
				    	}else{
				    		$.messager.alert('ϵͳ��Ϣ','��ӳɹ�','info',function(){
					    		$('#dlg_login').dialog('refresh');
					    		$('#dlg_login').dialog('close');
					    		location.href = path+'/admin/evaluating.jsp';				    			
				    		},false);
				    	} 
				    }  
	            });
	        }
	    },{
	        text:'����',
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
<div region="west" split="false" border="false" title="�����˵�" style="width:180px;" id="west">
  <div id="left-menus" border="false" fit="true">
    <jsp:include page="/admin/left.jsp"></jsp:include>
  </div>
</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;">
  <table width="100%">
    <thead>
      <tr>
        <td colspan="11" align="center" style="padding:5px;">����Ա����</td>
      </tr>
      <tr>
        <td colspan="11" style="padding:5px;"><a href="javascript:void(0)" id="evaluating_add">�������Ա</a></td>
      </tr>
      <tr class="thead">
        <td align="center">���</td>
        <td align="center">�û���</td>
        <td align="center">����</td>
        <td align="center">ְ��</td>
        <td align="center">�Ա�</td>
        <td align="center">��������</td>
        <td align="center">��ϵ�绰</td>
        <td align="center">��ͥ��ַ</td>
        <td align="center">�ʱ�</td>
        <td align="center">��������</td>
        <td align="center">����</td>
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
        <td align="center"><a href="<%=path %>/DelServlet?evaluating=<%=alRow.get(0) %>">ɾ��</a></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
</div>
</body>
</html>
