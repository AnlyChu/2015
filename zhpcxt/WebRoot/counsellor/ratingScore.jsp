<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList rating = null;
    ArrayList getScoreOfSchYear1 = null;
    ArrayList classSchoolYear = null;
    String schoolYear1 = request.getParameter("schoolYear");
    String class_id = (String) session.getAttribute("class_id");
    if (class_id == null) {
        class_id = request.getParameter("class_id");
    }
    if (schoolYear1 == null) {
        schoolYear1 = null;
    } else {
        try {
            schoolYear1 = (new String(schoolYear1.getBytes("iso-8859-1"), "UTF-8")).trim();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
//        rating = array.getEvaluating(class_id);
        classSchoolYear = array.getRatingSchYear(class_id);
        if (schoolYear1 != null) {
            rating = array.getEvaluatingOfSchoolYear(class_id, schoolYear1);
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
            $("#londing").css('display', 'none');
            $("#mainPanle").css('display', '');
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
        })

        function getSchoolYear(schoolYear) {
            var cSchoolYear = schoolYear;
            document.schoolYearSelect.action = "<%=basePath%>counsellor/ratingScore.jsp?schoolYear="
            + cSchoolYear;
            document.schoolYearSelect.submit();

        }
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no" resizable="false">
<div id="north" region="north" split="false" border="false">
    <jsp:include page="/admin/head.jsp"></jsp:include>
</div>
<div region="west" split="false" border="false" title="导航菜单" style="width:180px;" id="west">
    <div id="left-menus" border="false" fit="true">
        <jsp:include page="/admin/left.jsp"></jsp:include>
    </div>
</div>
<div id="londing" style="display: block;margin-top: 10%" align="center">数据加载ing</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;display: none;">
    <table width="100%">
        <thead>
        <tr>
            <td>上传班级学生综合测评信息:</td>
            <td>
                <form action="<%=path%>/Upload" method="post">
                    <select name="schoolYear">
                        <option>-请选择学年-</option>
                        <option value="2012-2013">2012-2013</option>
                        <option value="2013-2014">2013-2014</option>
                        <option value="2014-2015">2014-2015</option>
                        <option value="2015-2016">2015-2016</option>
                        <option value="2016-2017">2016-2017</option>
                        <option value="2017-2018">2017-2018</option>
                        <option value="2018-2019">2018-2019</option>
                        <option value="2019-2020">2019-2020</option>
                    </select>
                    <input type="file" name="rating"/>
                    <input type=submit value="上传文件"/>
                </form>
            </td>
            <td>
                <button onclick="window.open('<%=path%>/demo-xls/class-student-demo.xls')">下载素质测评成绩模板</button>
            </td>
        </tr>
        <tr>
            <td colspan="19" align="center" style="padding:5px;"><h3>班级学生素质测评排名</h3></td>
        </tr>
    </table>
    <table>
        <thead>
        <tr>
            <td><p>学年:</p></td>
            <td>
                <form action="<%=path%>/counsellor/ratingScore.jsp" method="post" name="schoolYearSelect">
                    <select name="schoolYear" class="schoolYear" onchange="getSchoolYear(this.value);">
                        <option>
                            <script language="javascript">
                                document.schoolYearSelect.schoolYear.value = "<%=request.getParameter("schoolYear")%>";
                            </script>
                        </option>
                        <%
                            for (int j = 0; j < classSchoolYear.size(); j++) {
                                ArrayList getSchoolYear = (ArrayList) classSchoolYear.get(j);
                        %>
                        <option><%=getSchoolYear.get(0)%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </form>
            </td>
        </tr>

        </thead>
    </table>
    <table width="100%">
        <tr class="thead">
            <td align="center">序号</td>
            <td align="center">姓名</td>
            <td align="center">学年</td>
            <td align="center" colspan="4">道德素养</td>
            <td align="center" colspan="4">学习能力</td>
            <td align="center" colspan="4">素质拓展</td>
            <td align="center" colspan="3">直接加减分</td>
            <td align="center">测评总分</td>
        </tr>
        <tr class="thead">
            <td align="center"></td>
            <td align="center"></td>
            <td align="center"></td>
            <td align="center">基本分</td>
            <td align="center">加分</td>
            <td align="center">减分</td>
            <td align="center">积分</td>
            <td align="center">基本分</td>
            <td align="center">加分</td>
            <td align="center">减分</td>
            <td align="center">积分</td>
            <td align="center">基本分</td>
            <td align="center">加分</td>
            <td align="center">减分</td>
            <td align="center">积分</td>
            <td align="center">加分</td>
            <td align="center">减分</td>
            <td align="center">积分</td>
            <td align="center">基本分</td>
        </tr>
        </thead>
        <tbody class="tbody">
        <%
            if (rating != null && rating.size() != 0) {
                for (int i = 0; i < rating.size(); i++) {
                    ArrayList alRow = (ArrayList) rating.get(i);
        %>
        <tr>
            <td align="center"><%=i + 1 %>
            </td>
            <td align="center"><%=alRow.get(1) %>
            </td>
            <td align="center"><%=alRow.get(2) %>
            </td>
            <td align="center"><%=alRow.get(3) %>
            </td>
            <td align="center"><%=alRow.get(4) %>
            </td>
            <td align="center"><%=alRow.get(5) %>
            </td>
            <td align="center"><%=alRow.get(6) %>
            </td>
            <td align="center"><%=alRow.get(7) %>
            </td>
            <td align="center"><%=alRow.get(8) %>
            </td>
            <td align="center"><%=alRow.get(9) %>
            </td>
            <td align="center"><%=alRow.get(10) %>
            </td>
            <td align="center"><%=alRow.get(11) %>
            </td>
            <td align="center"><%=alRow.get(12) %>
            </td>
            <td align="center"><%=alRow.get(13) %>
            </td>
            <td align="center"><%=alRow.get(14) %>
            </td>
            <td align="center"><%=alRow.get(15) %>
            </td>
            <td align="center"><%=alRow.get(16) %>
            </td>
            <td align="center"><%=alRow.get(17) %>
            </td>
            <td align="center"><%=alRow.get(18) %>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

</div>
</body>
</html>
