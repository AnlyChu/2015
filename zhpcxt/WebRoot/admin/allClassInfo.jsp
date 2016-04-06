<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList allClass = null;
    ArrayList getBjofPro = null;
    ArrayList getBjofPro1 = null;
    ArrayList getBjofGrade = null;
    ArrayList getBjofGrade1 = null;
    String classMgr = null;
    String classPro = (String) request.getParameter("pro");
    String classGrade = (String) request.getParameter("garde");
    if (classPro == null) {
        classPro = null;
    } else {
        try {
            classPro = (new String(classPro.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (classGrade == null) {
        classGrade = null;
    } else {
        try {
            classGrade = (new String(classGrade.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }

    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        allClass = array.getAllBj();
        getBjofPro1 = array.getBjofPro();
        getBjofGrade1 = array.getBjofGrade();
        if (classPro != null) {
            getBjofPro = array.getBjofPro(classPro);
        }
        if (classGrade != null) {
            getBjofGrade = array.getBjofGrade(classGrade);
        }
    }

    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/admin-css.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/admin.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('tbody tr:even').css({'background': '#ffffff'});
            $('tbody tr:odd').css({'background': '#eeeeff'});
            var message = <%=message %>;
            if (message != null && message != "") {

                alert(message);
            }
            login('<%=path %>', <%=closed %>);
            $("#click_logout").click(function () {
                logout('<%=path %>');
            });
            $("#editpass").click(function () {
                editpass('<%=path %>');
            });
            $("#admin_add").click(function () {
                adminAdd('<%=path %>');
            });
            $("#class_add").click(function () {
                classAdd('<%=path %>');
            });
            $("#course_add").click(function () {
                courseAdd('<%=path %>');
            });
        })

        function getPro(pro) {
            document.classSelect.action = "<%=basePath%>admin/allClassInfo.jsp?pro="
            + pro;
            document.classSelect.submit();

        }
        function getGrade(grade) {
            document.classSelect.action = "<%=basePath%>admin/allClassInfo.jsp?grade="
            + grade;
            document.classSelect.submit();

        }
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no"
      resizable="false">
<div id="north" region="north" split="false" border="false">
    <jsp:include page="/admin/head.jsp"></jsp:include>
</div>
<div region="west" split="false" border="false" title="导航菜单"
     style="width:180px;" id="west">
    <div id="left-menus" border="false" fit="true">
        <jsp:include page="/admin/left.jsp"></jsp:include>
    </div>
</div>
<div id="mainPanle" region="center" border="true"
     style="background:#f7f7f7; padding:5px;">
    <form method="post" name="classSelect">
        <table width="100%">
            <thead>
            <tr>
                <td colspan="11" align="center" style="padding:5px;"><h3>计算机学院班级</h3></td>
            </tr>
            <tr>
                <td colspan="4" style="padding:5px;"><a href="javascript:void(0)" id="class_add">新建班级</a></td>
            </tr>
            <%--<tr>--%>
            <%--<td colspan="4" style="padding:5px;"><a href="javascript:void(0)" id="course_add">新建课程</a></td>--%>
            <%--</tr>--%>
            <tr class="thead">
                <td align="center">编号</td>
                <td align="center">
                    <select name="classGrade" onchange="getGrade(this.value);">
                        <option selected="selected">年级</option>
                        <%
                            for (int j = 0; j < getBjofGrade1.size(); j++) {
                                ArrayList getClassGrade = (ArrayList) getBjofGrade1.get(j);
                        %>
                        <option value=<%=getClassGrade.get(0)%>><%=getClassGrade.get(0)%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </td>
                <td align="center">院系</td>
                <td align="center">
                    <select name="classPro" onchange="getPro(this.value);">
                        <option selected="selected" style="text-align:center">专业</option>
                        <%
                            for (int j = 0; j < getBjofPro1.size(); j++) {
                                ArrayList getClassPro = (ArrayList) getBjofPro1.get(j);
                        %>
                        <option value=<%=getClassPro.get(0)%>><%=getClassPro.get(0)%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </td>
                <td align="center">班级</td>
                <td align="center">辅导员</td>
                <td align="center">操作</td>
            </tr>
            </thead>

            <tbody class="tbody">
            <%
                if (classPro == null && classGrade == null) {
                    for (int i = 0; i < allClass.size(); i++) {
                        ArrayList allClass1 = (ArrayList) allClass.get(i);
            %>
            <tr>
                <td align="center"><%=allClass1.get(0)%>
                </td>
                <td align="center"><%=allClass1.get(1)%>
                </td>
                <td align="center"><%=allClass1.get(2)%>
                </td>
                <td align="center"><%=allClass1.get(3)%>
                </td>
                <td align="center"><%=allClass1.get(4)%>
                </td>
                <%
                    if (allClass1.get(5).toString().equals("null") || allClass1.get(5).toString().equals("")) {
                        classMgr = "无";
                    } else {
                        classMgr = allClass1.get(5).toString();
                    }
                %>
                <td align="center"><%=classMgr%>
                </td>
                <td align="center"><a href="<%=basePath%>admin/classStuInfo.jsp?class_id=<%=allClass1.get(0)%>">查看</a>
                </td>
            </tr>
            <%
                }
            } else if (classPro != null && classGrade == null) {
                for (int i = 0; i < getBjofPro.size(); i++) {
                    ArrayList getClassofPro = (ArrayList) getBjofPro.get(i);
            %>
            <tr>
                <td align="center"><%=getClassofPro.get(0)%>
                </td>
                <td align="center"><%=getClassofPro.get(1)%>
                </td>
                <td align="center"><%=getClassofPro.get(2)%>
                </td>
                <td align="center"><%=getClassofPro.get(3)%>
                </td>
                <td align="center"><%=getClassofPro.get(4)%>
                </td>
                <%
                    if (getClassofPro.get(5).toString().equals("null") || getClassofPro.get(5).toString().equals("")) {
                        classMgr = "无";
                    } else {
                        classMgr = getClassofPro.get(5).toString();
                    }
                %>
                <td align="center"><%=classMgr%>
                </td>
                <td align="center"><a
                        href="<%=basePath%>admin/classStuInfo.jsp?class_id=<%=getClassofPro.get(0)%>">查看</a></td>
            </tr>
            <%
                }
            } else if (classPro == null && classGrade != null) {
                for (int i = 0; i < getBjofGrade.size(); i++) {
                    ArrayList getClassGrade = (ArrayList) getBjofGrade.get(i);
            %>
            <tr>
                <td align="center"><%=getClassGrade.get(0)%>
                </td>
                <td align="center"><%=getClassGrade.get(1)%>
                </td>
                <td align="center"><%=getClassGrade.get(2)%>
                </td>
                <td align="center"><%=getClassGrade.get(3)%>
                </td>
                <td align="center"><%=getClassGrade.get(4)%>
                </td>
                <%
                    if (getClassGrade.get(5).toString().equals("null") || getClassGrade.get(5).toString().equals("")) {
                        classMgr = "无";
                    } else {
                        classMgr = getClassGrade.get(5).toString();
                    }
                %>
                <td align="center"><%=classMgr%>
                </td>
                <td align="center">
                    <a href="<%=basePath%>admin/classStuInfo.jsp?class_id=<%=getClassGrade.get(1)%>">查看</a></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>

        </table>
    </form>
</div>
</body>
</html>
