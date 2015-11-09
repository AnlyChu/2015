<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
boolean closed = false;
String term = request.getParameter("term");
if(adminlogin != null && adminlogin.size() != 0){
	closed = true;
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
    <tr>
      <td align="center" style="padding:10px">��������</td>
    </tr>
  </table>
  <form id="article_edit" method="post" action="<%=path %>/IntellectualgradeServlet?term=<%=term %>" onSubmit="return $(this).form('validate');">
    <table border="1" align="center" cellpadding="5">
      <tr>
        <td align="right">ѧ�ڣ�</td>
        <td>��<%=term %>ѧ��</td>
      </tr>
      <tr>
        <td align="right">��Ŀ��</td>
        <td><%
        if(term != null && term.equals("1")){
        %>
          <table cellpadding="2" id="table1">
            <tr>
              <td align="center">��Ŀ</td>
              <td align="center">����</td>
            </tr>
            <tr>
              <td align="right">˼����������뷨�ɻ�����</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��ѧӢ��1��</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">����������</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��������ۣ�</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">���Դ�����</td>
              <td><input class="easyui-numberbox" type="text" name="input5" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�ߵ���ѧ�ϣ�</td>
              <td><input class="easyui-numberbox" type="text" name="input6" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("2")){
        %>
          <table cellpadding="2" id="table2">
            <tr>
              <td align="center">��Ŀ</td>
              <td align="center">����</td>
            </tr>
            <tr>
              <td align="right">��ѧ���ģ�</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">���˼�������ԭ��</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�й�����ʷ��Ҫ��</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��ѧӢ��2��</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��ʦ���</td>
              <td><input class="easyui-numberbox" type="text" name="input5" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��ɢ��ѧ��</td>
              <td><input class="easyui-numberbox" type="text" name="input6" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�ߵ���ѧ�£�</td>
              <td><input class="easyui-numberbox" type="text" name="input7" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��ͨ����</td>
              <td><input class="easyui-numberbox" type="text" name="input8" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�߼����Գ�����ƣ�</td>
              <td><input class="easyui-numberbox" type="text" name="input9" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("3")){
        %>
          <table cellpadding="2" id="table3">
            <tr>
              <td align="center">��Ŀ</td>
              <td align="center">����</td>
            </tr>
            <tr>
              <td align="right">ë��˼�롢��Сƽ���ۺ�&ldquo;��������&rdquo;��Ҫ˼����ۣ�</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��ѧӢ��3��</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��·ԭ��</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">ģ����Ӽ�����</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�㷨�����ݽṹ��</td>
              <td><input class="easyui-numberbox" type="text" name="input5" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">������ԣ�</td>
              <td><input class="easyui-numberbox" type="text" name="input6" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("4")){
        %>
          <table cellpadding="2" id="table4">
            <tr>
              <td align="center">��Ŀ</td>
              <td align="center">����</td>
            </tr>
            <tr>
              <td align="right">ë��˼�롢��Сƽ���ۺ�&ldquo;��������&rdquo;��Ҫ˼����ۣ�</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��ѧӢ��4��</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�����߼���</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��������ԭ��</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">����ԭ��</td>
              <td><input class="easyui-numberbox" type="text" name="input5" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">����ϵͳ��</td>
              <td><input class="easyui-numberbox" type="text" name="input6" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("5")){
        %>
          <table cellpadding="2" id="table5">
            <tr>
              <td align="center">��Ŀ</td>
              <td align="center">����</td>
            </tr>
            <tr>
              <td align="right">����ѧ��</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�ִ�����������</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">���ݿ�ϵͳԭ��</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�����ͨ�������磺</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("6")){
        %>
          <table cellpadding="2" id="table6">
            <tr>
              <td align="center">��Ŀ</td>
              <td align="center">����</td>
            </tr>
            <tr>
              <td align="right">�������ѧ����</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">����ѧ��</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">������ϰ��</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�������ʵϰ��</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("7")){
        %>
          <table cellpadding="2" id="table7">
            <tr>
              <td align="center">��Ŀ</td>
              <td align="center">����</td>
            </tr>
            <tr>
              <td align="right">���������ߣ�</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">����ʵϰ��</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">�����ְҵ���飺</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("8")){
        %>
          <table cellpadding="2" id="table8">
            <tr>
              <td align="center">��Ŀ</td>
              <td align="center">����</td>
            </tr>
            <tr>
              <td align="right">��������ۺ�ʵϰ��</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">��ҵ��ƣ�</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="��������ֻ����������" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }
        %></td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td><input type="submit" value="�ύ"></td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
