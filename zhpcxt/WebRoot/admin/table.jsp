<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<div region="west" split="false" border="false" title="导航菜单" style="width:180px;" id="west">
  <div id="left-menus" border="false" fit="true">
    <jsp:include page="/admin/left.jsp"></jsp:include>
  </div>
</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;">
  <table width="100%">
    <tr>
      <td align="center" style="padding:10px">智育评测</td>
    </tr>
  </table>
  <form id="article_edit" method="post" action="<%=path %>/IntellectualgradeServlet?term=<%=term %>" onSubmit="return $(this).form('validate');">
    <table border="1" align="center" cellpadding="5">
      <tr>
        <td align="right">学期：</td>
        <td>第<%=term %>学期</td>
      </tr>
      <tr>
        <td align="right">科目：</td>
        <td><%
        if(term != null && term.equals("1")){
        %>
          <table cellpadding="2" id="table1">
            <tr>
              <td align="center">科目</td>
              <td align="center">分数</td>
            </tr>
            <tr>
              <td align="right">思想道德修养与法律基础：</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">大学英语1：</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">国防教育：</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">计算机导论：</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">线性代数：</td>
              <td><input class="easyui-numberbox" type="text" name="input5" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">高等数学上：</td>
              <td><input class="easyui-numberbox" type="text" name="input6" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("2")){
        %>
          <table cellpadding="2" id="table2">
            <tr>
              <td align="center">科目</td>
              <td align="center">分数</td>
            </tr>
            <tr>
              <td align="right">大学语文：</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">马克思主义基本原理：</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">中国近代史纲要：</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">大学英语2：</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">教师口语：</td>
              <td><input class="easyui-numberbox" type="text" name="input5" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">离散数学：</td>
              <td><input class="easyui-numberbox" type="text" name="input6" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">高等数学下：</td>
              <td><input class="easyui-numberbox" type="text" name="input7" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">普通物理：</td>
              <td><input class="easyui-numberbox" type="text" name="input8" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">高级语言程序设计：</td>
              <td><input class="easyui-numberbox" type="text" name="input9" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("3")){
        %>
          <table cellpadding="2" id="table3">
            <tr>
              <td align="center">科目</td>
              <td align="center">分数</td>
            </tr>
            <tr>
              <td align="right">毛泽东思想、邓小平理论和&ldquo;三个代表&rdquo;重要思想概论：</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">大学英语3：</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">电路原理：</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">模拟电子技术：</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">算法与数据结构：</td>
              <td><input class="easyui-numberbox" type="text" name="input5" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">汇编语言：</td>
              <td><input class="easyui-numberbox" type="text" name="input6" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("4")){
        %>
          <table cellpadding="2" id="table4">
            <tr>
              <td align="center">科目</td>
              <td align="center">分数</td>
            </tr>
            <tr>
              <td align="right">毛泽东思想、邓小平理论和&ldquo;三个代表&rdquo;重要思想概论：</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">大学英语4：</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">数字逻辑：</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">计算机组成原理：</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">编译原理：</td>
              <td><input class="easyui-numberbox" type="text" name="input5" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">操作系统：</td>
              <td><input class="easyui-numberbox" type="text" name="input6" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("5")){
        %>
          <table cellpadding="2" id="table5">
            <tr>
              <td align="center">科目</td>
              <td align="center">分数</td>
            </tr>
            <tr>
              <td align="right">心理学：</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">现代教育技术：</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">数据库系统原理：</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">计算机通信与网络：</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("6")){
        %>
          <table cellpadding="2" id="table6">
            <tr>
              <td align="center">科目</td>
              <td align="center">分数</td>
            </tr>
            <tr>
              <td align="right">计算机教学法：</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">教育学：</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">教育见习：</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">网络管理实习：</td>
              <td><input class="easyui-numberbox" type="text" name="input4" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("7")){
        %>
          <table cellpadding="2" id="table7">
            <tr>
              <td align="center">科目</td>
              <td align="center">分数</td>
            </tr>
            <tr>
              <td align="right">形势与政策：</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">教育实习：</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">计算机职业调查：</td>
              <td><input class="easyui-numberbox" type="text" name="input3" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }else if(term != null && term.equals("8")){
        %>
          <table cellpadding="2" id="table8">
            <tr>
              <td align="center">科目</td>
              <td align="center">分数</td>
            </tr>
            <tr>
              <td align="right">软件工程综合实习：</td>
              <td><input class="easyui-numberbox" type="text" name="input1" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
            <tr>
              <td align="right">毕业设计：</td>
              <td><input class="easyui-numberbox" type="text" name="input2" required="true" missingmessage="该输入项只能输入数字" customize="Customize" min="0.1" precision="1" /></td>
            </tr>
          </table>
          <%
        }
        %></td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td><input type="submit" value="提交"></td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
