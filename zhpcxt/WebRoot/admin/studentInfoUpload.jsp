<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
ArrayList student = null;
int m = 1;
String sql0 = "select  * from student1";
String sql = (String)request.getAttribute( "sql") != null ? (String)request.getAttribute( "sql") : sql0;
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
	student = array.getStudent(sql);

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
})

/* function display_alert()
  {
  var lujing=document.form.fileUpload.value;
  alert("·��="+lujing)
  } */
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
  <table width="100%" >
    <thead>
     <tr>
       
      </tr>
      <tr>
        <td><p>�ϴ��༶ѧ����Ϣ:</p></td>
        <td>
       <form action="<%=path%>/Upload" method="post"  >       <!--  enctype="multipart/form-data" -->
        <input type="file" name="fileUpload1" />  
    	<input type=submit value="�ϴ��ļ�"  />
    	</form>


    	</td>
<td colspan="6" align="center" style="padding:5px;">�ɼ��ϴ�</td>
      </tr>
  <tr class="thead">
        <td align="center">ѧ��</td>
        <td align="center">����</td>
        <td align="center">�Ա�</td>
        <td align="center">�༶</td>
        <td align="center">���֤��</td>
        <td align="center">ѧԺ</td>
        <td align="center">רҵ</td>
        <td align="center">ͨѶ��ַ</td>
    
      </tr>
    </thead>
    <tbody class="tbody">
    <%
    if(student != null && student.size() != 0){
	    for(int i = 0;i < student.size();i++){
	    	ArrayList alRow = (ArrayList)student.get(i);
    %>
      <tr>
       
        <td align="center"><%=alRow.get(0) %></td>
        <td align="center"><%=alRow.get(1) %></td>
        <td align="center"><%=alRow.get(2) %></td>
        <td align="center"><%=alRow.get(3) %></td>
        <td align="center"><%=alRow.get(4) %></td>
        <td align="center"><%=alRow.get(5) %></td>
        <td align="center"><%=alRow.get(6) %></td>
        <td align="center"><%=alRow.get(7) %></td>
        </tr>
          <%}} %>
    </tbody>
  </table>
   <div>
       	<a href="<%=path %>/studentInfoServlet?sql=<%=0 %>">��ҳ</a>
   		<span >
			<a href="<%=path %>/studentInfoServlet?sql=<%=m-- %>">��һҳ</a>
		</span>
			<a href="<%=path %>/studentInfoServlet?sql=<%=m++ %>">��һҳ</a>
	</div>
</div>
</body>
</html>
