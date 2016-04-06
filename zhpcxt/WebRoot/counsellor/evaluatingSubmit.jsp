<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String daodesuyangPlus = request.getParameter("daodesuyangPlus");
    String daodesuyangSub = request.getParameter("daodesuyangSub");
    String studyingPlus = request.getParameter("studyingPlus");
    String studyingSub = request.getParameter("studyingSub");
    String suzhituozhanPlus = request.getParameter("suzhituozhanPlus");
    String suzhituozhanSub = request.getParameter("suzhituozhanSub");
    String doPlusOrSub = request.getParameter("doPlusOrSub");
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css"/>
<link rel="stylesheet" type="text/css"
      href="<%=path%>/css/admin-css.css"/>
<link rel="stylesheet" type="text/css"
      href="<%=path%>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
      href="<%=path%>/css/themes/icon.css">
<table width="100%">
    <tr class="thead">
        <td align="right">道德素养评分加分</td>
        <td align="center" colspan="4"><%=daodesuyangPlus%>分</td>
    </tr>
    <tr class="thead">
        <td align="right">道德素养评分减分</td>
        <td align="center" colspan="4"><%=daodesuyangSub%>分</td>
    </tr>
    <tr class="thead">
        <td align="right">学习能力加分</td>
        <td align="center" colspan="4"><%=studyingPlus%>分</td>
    </tr>
    <tr class="thead">
        <td align="right">学习能力减分</td>
        <td align="center" colspan="4"><%=studyingSub%>分</td>
    </tr>
    <tr class="thead">
        <td align="right">素质拓展加分</td>
        <td align="center" colspan="4"><%=suzhituozhanPlus%>分</td>
    </tr>
    <tr class="thead">
        <td align="right">素质拓展减分</td>
        <td align="center" colspan="4"><%=suzhituozhanSub%>分</td>
    </tr>
    <tr class="thead">
        <td align="right">直接加减分</td>
        <td align="center" colspan="4"><%=doPlusOrSub%>分</td>
    </tr>
</table>
