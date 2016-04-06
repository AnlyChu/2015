<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ArrayList adminlogin = (ArrayList) session.getAttribute("adminlogin");
    boolean closed = false;
    ArrayList verify = null;
    String student_id = request.getParameter("student_id");
    String school_year = request.getParameter("school_year");
    session.setAttribute("school_year",school_year);
    String class_id = (String) session.getAttribute("class_id");
    if (adminlogin != null && adminlogin.size() != 0) {
        closed = true;
        verify = array.getVerify();
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
    </script>
    <style type="text/css">
        .table-padding td, tr {
            border: 1px solid #000;
        }

        .level {
            text-align: center;
            vertical-align: middle;
            width: 5%;
        }

        .btn {
            text-align: center;
            padding-top: 5%;
            padding-bottom: 5%;
        }
        .btn a{
            width: 100px;
            height: 50px;
            background: white;
            border-radius: 5px;
            border: 1px solid #000;
            line-height: 50px;
            display: inline-block;
            font-size: 16px;
        }
        .btn a:hover{
            text-decoration: none;
            border: 1px solid red;
        }
    </style>
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
<div id="londing" style="display: '';margin-top: 10%" align="center">数据加载ing</div>
<div id="mainPanle" region="center" border="true" style="background:#f7f7f7; padding:5px;display: none;">
    <h3 style="text-align:center">学生素质综合测评</h3>

    <form id="suzhizeping" method="post">
        <table width="100%" class="table-padding">
            <thead>
            <%--<tr class="title">--%>
            <%--<td colspan="9" align="center" style="padding:5px;"></td>--%>
            <%--</tr>--%>
            </thead>
            <tr class="thead">
                <td align="center" colspan="4" class="level">项目</td>
                <td align="center" colspan="9">标准及分值</td>
                <td align="center" colspan="4">评分</td>
            </tr>
            <tbody>
            <td align="center" colspan="4" rowspan="4" class="level">
                道<br>
                德<br>
                素<br>
                养
            </td>
            <tr>
                <td align="left" colspan="9">基本分：75分</td>
                <td align="center" colspan="4" class="level">

                </td>
            </tr>
            <tr>
                <td align="left" colspan="9">
                    加分：<br>
                    1、服从院、系管理者5分。<br>
                    2、积极要求进步，参加党校、团校学习并取得结业证书者2分。<br>
                    3、个人事迹等方面获院系级正式文件通报表彰者5分/次，校级10分/次，省级15分/次；国家级20分/次。<br>
                    4、在校文明卫生检查评比活动中，或“文明寝室标兵”的室员3分/人；获“文明寝室”的室员2分/人；获“卫生寝室”的室员1分/人。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 获校级“优良学风班级”班级每人加10分，“优良学风寝室”每位室员加10分，“优良学风先进个人”个人加10分。<br>
                    5、行为举止文明，遵守校规校纪者加5分。<br>
                    6、学陶师陶或读书月活动中表现优秀者加10分。<br>
                </td>
                <td align="center" colspan="4" class="level">
                    <input class="easyui-numberbox" id="daodesuyangPlus" type="text" name="daodesuyangPlus" placeholder="评分只能为数字"/>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="9">
                    减分：<br>
                    1、无故不参加校、院系、班组织的集体活动者5分/次。<br>
                    2、不讲究文明卫生，在校、院系组织的检查中月平均成绩低于65分的寝室，其成员每人3分/次。<br>
                    3、未经审批私自校外住宿者10分/次。<br>
                    4、公共场所行为不文明，不服从管理者10分/次。<br>
                    5、在测评工作中，态度不认真，不实事求是，有阻挠或无理取闹行为者10分/次。<br>
                    6、受院系内通报批评者5分/次，受学校通报批评、警告、严重警告、记过和留校察看处分者分别为10分、15分、20分、30分、50分。<br>
                </td>
                <td align="center" colspan="4" class="level">
                    <input class="easyui-numberbox" id="daodesuyangSub" type="text" name="daodesuyangSub" placeholder="评分只能为数字"/>
                </td>
            </tr>

            <td align="center" rowspan="4" colspan="4" class="level">
                学<br>
                习<br>
                能<br>
                力
            </td>
            <tr>

                <td align="left" colspan="9">
                    基本分=【{[必修课成绩 * 学时（或学分）/ 总学时（或总学分）} * 70% + {[选修课成绩 * 学时（或学分）] / 总学时（或总学分）} * 30% ]】* 80%。
                </td>
                <td align="center" colspan="4" class="level">

                </td>
            </tr>
            <tr>
                <td align="left" colspan="9">
                    加分：<br>
                    1、非英语专业：英语四级达425分者3分，580分以上者6分；六级达425分者8分，580分以上者10分。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 英语专业：六级达425分者2分，580分以上者4分；英语专业四级6分，八级10分。（只在所在学年度加一次，采取就高原则）<br>
                    2、非计算机专业：计算机水平等级考试一级通过者2分，二级通过者4分，三级通过者6分。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 计算机中专业：计算机水平等级考试二级通过者2分，三级通过者6分，四级通过者10分。（只在所在学年度加一次，采取就高原则）<br>
                    3、获得专业技能资格证者5分/项（师范生教师资格证除外）。<br>
                    4、一学期无事假者2分，一学年无事假者5分。<br>
                    5、在师范基本功比赛中获校前三名者分别为5、3、2分/次；获院系级前三名的分别为3、2、1分/次。<br>
                </td>
                <td align="center" colspan="4" class="level">
                    <input class="easyui-numberbox" id="studyingPlus" type="text" name="studyingPlus" placeholder="评分只能为数字"/>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="9">
                    减分：<br>
                    1、考试不及格者2分/门；补考不及格者4分/门。<br>
                    2、有考试作弊行为者10分/次，旷课者5分/次。<br>
                    3、违反实验操作规程，造成不良后果者5分/次。<br>
                </td>
                <td align="center" colspan="4" class="level">
                    <input class="easyui-numberbox" id="studyingSub" type="text" name="studyingSub" placeholder="评分只能为数字"/>
                </td>
            </tr>

            <td align="center" rowspan="4" colspan="4" class="level">
                素<br>
                质<br>
                拓<br>
                展
            </td>
            <tr>
                <td align="left" colspan="9">
                    基本分= 70分
                </td>
                <td align="center" colspan="4" class="level">

                </td>
            </tr>
            <tr>
                <td align="left" colspan="9">
                    加分：<br>
                    一、社会实践<br>
                    1、校学生会正副主席、大学生自律委员会正副主席、社团联合会正副主席、《合师青年》主编副主编4分，各部门负责人3分；<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 各学生社团负责人3分；院系学生党支部书记4分，院系学生会正副主席3分。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 支委和班长、团支书书记3分，其余学生干部（含学生助理、学生社团干部）2分，此项积分满分为8分。<br>
                    2、积极参加校内勤工俭学本学年度连续4个月以上者5分。<br>
                    3、积极参加素质拓展活动，哥院系根据表现状况酌情1~3分/次（已获得表彰加分者除外）。<br>
                    4、获得除专业资格证书以外的职业资格证书者10分/项。<br>
                    二、学术创作<br>
                    1、在全国公开刊物上发表署名学校的文章者20分/篇。<br>
                    2、在校报（或地级市）内部刊物发表文章者5分/篇，校内广播站发稿者1分/篇（满分10分），院系级或部门主办的内部刊物发表文章1分/篇<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （满分10分，作者本人是编辑、记者、通讯员等减半）。<br>
                    以上均为第一作者，第二作者减半，第三作者不加分。<br>
                    三、文体、科技竞赛<br>
                    1、个人获国家级文体、科技竞赛1、2、3、4、5——7等奖和优秀奖分别加25、20、15、12、10。<br>
                    2、个人获省级文体、科技竞赛1、2、3、4、5——7等奖和优秀者分别加20、15、13、10、8.<br>
                    3、个人获校级文体、科技竞赛1、2、3、4、5——7等奖和优秀奖分别加15、12、10、8、6.<br>
                    4、个人获院系级文体、科技竞赛1、2、3、4、5——7等奖和优秀奖分别加110、8、6、4、2.<br>
                    5、学术科技成果获得专利或被采用加30分/项。<br>
                    6、在实习期间被评为优秀实习生者加5分。<br>
                    7、积极参加校、院系组织的文体、科技活动者根据表现状况酌情1~3分。<br>
                    集体获以上奖项，在相应级别和等次分值 * 2 基础上均分加分，人均不足2分的按2分加分。<br>
                </td>
                <td align="center" colspan="4" class="level">
                    <input class="easyui-numberbox" id="suzhituozhanPlus" type="text" name="suzhituozhanPlus" placeholder="评分只能为数字"/>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="9">
                    减分：<br>
                    1、在体育比赛中违背体育道德，不服从裁判，扰乱赛场秩序者，视情节3~5分/人。<br>
                    2、学生干部工作不积极、不能按时完成校、院系交给的任务者3~5分。<br>
                    3、应参加院系组织的社会实践、文体活动、科技活动，而无故不参加者5分/次。<br>
                </td>
                <td align="center" colspan="4" class="level">
                    <input class="easyui-numberbox" id="suzhituozhanSub" type="text" name="suzhituozhanSub" placeholder="评分只能为数字"/>
                </td>
            </tr>

            <td align="center" rowspan="2" colspan="4" class="level">
                直<br>
                接<br>
                加<br>
                减<br>
                分
            </td>
            <tr>
                <td align="left" colspan="9">
                    1、学生愿景计划的制定、实施情况在总分基础上直加0~2分。<br>
                    2、经常上网吧，不思悔改者（每学年5次以上及其以上，或连续二天及其以上者）减10分。<br>
                    3、经常夜不归宿者（每学年累计5次及其以上者）减10分。<br>
                    4、在学校和院系的学风建设中发挥积极模范作用的在总分基础上直加0~2分；受学校通报批评的减2分/次（二次及以上的取消评奖评优资格）。<br>
                    （以上各院系制定加减分详细细则）<br>
                </td>
                <td align="center" colspan="4" class="level">
                    <input class="easyui-numberbox" id="doPlusOrSub" type="text" name="doPlusOrSub" placeholder="评分只能为数字"/>
                </td>
            </tr>

            <td align="center" rowspan="4" colspan="4" class="level">
                备<br>
                注
            </td>
            <tr>
                <td align="left" colspan="9">
                    各院系可在素质综合测评标准及加减分要素基础上，可作微调，制定实施细则；实施细则需报学生工作处审查和备案。<br>
                </td>
                <td align="center" colspan="4" class="level">

                </td>
            </tr>
            </tbody>
        </table>
        <input type="hidden" name="student_id" value="<%=student_id%>"/>
        <input type="hidden" name="school_year" value="<%=school_year%>"/>
        <input type="hidden" name="class_id" value="<%=class_id%>"/>
        <div class="btn">
            <a href="javascript:void(0);" onclick="submit('<%=path %>');">提交</a>
        </div>
    </form>
</div>
</body>
</html>
