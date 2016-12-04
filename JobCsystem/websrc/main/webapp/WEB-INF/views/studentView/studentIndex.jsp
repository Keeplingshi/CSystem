<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.cb.csystem.util.*" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@	taglib uri="/csystem-taglib" prefix="cusfun" %>

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		
		<title>学生个人信息</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ui/hui/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ui/hui/lib/Hui-iconfont/1.0.7/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ui/hui/lib/icheck/icheck.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ui/hui/static/h-ui/css/style.css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/lib/layer/2.1/layer.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/lib/laypage/1.2/laypage.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/lib/My97DatePicker/WdatePicker.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/lib/icheck/jquery.icheck.min.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/lib/bootstrap-Switch/bootstrapSwitch.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/lib/Validform/5.3.2/Validform.min.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/lib/Validform/5.3.2/passwordStrength-min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ui/hui/static/h-ui/js/H-ui.js"></script>

		<style>
			.table-font th{font-size:16px;}
			.table-font td{font-size:16px;}
		</style>
	</head>
	<body>
	<header class="navbar-wrapper">
		<div class="navbar navbar-black navbar-fixed-top">
			<div class="container cl">
				<a class="logo navbar-logo hidden-xs" href="${pageContext.request.contextPath}/login">CSystem学生系统</a>
				<span class="logo navbar-slogan hidden-xs"> &middot;  学生详细信息</span>
			</div>
		</div>
	</header>
	<div style="width: 70%;margin: 0 auto;" >
		<div class="codeView docs-example">
			<span style="margin-bottom: 20px;font-size: 26px;">学生基本信息</span>
			<table id="studentinfoId" class="table table-border table-bordered radius table-font">
				<thead>
 					<tr>
						<th style="width: 15%;"></th>
						<th style="border-left:0px;"></th>
						<th style="border-left:0px;width: 15%;"></th>
						<th style="border-left:0px;"></th>
					</tr> 
				</thead>
				<tbody>
					<tr>
						<th>学号：</th><td>${studentDomain.stuId }</td>
						<th>年级：</th><td>${studentDomain.classDomain.grade.grade }</td>
					</tr>
					<tr>
						<th>姓名：</th><td>${studentDomain.name }</td>
						<th>学院：</th><td>${studentDomain.classDomain.major.college.name }</td>
					</tr>
					<tr>
						<th>性别：</th><td>${cusfun:getNameByValueAndType(studentDomain.sex,"8002")}</td>
						<th>专业：</th><td>${studentDomain.classDomain.major.name }</td>
					</tr>
					<tr>
						<th>出生日期：</th><td><fmt:formatDate value="${studentDomain.birthday }" type="date"/></td>
						<th>班级：</th><td>${studentDomain.classDomain.name }</td>
					</tr>
					<tr>
						<th>政治面貌：</th><td>${cusfun:getNameByValueAndType(studentDomain.politicalStatus,"8001")}</td>
						<th>教学班级：</th><td>${studentDomain.teachClass }</td>
					</tr>
					<tr>
						<th>身份证号：</th><td>${studentDomain.IDnumber }</td>
						<th>QQ：</th><td>${studentDomain.email }</td>
					</tr>
					<tr>
						<th>籍贯：</th><td>${studentDomain.nativePlace }</td>
						<th>手机号码：</th><td>${studentDomain.cellphone }</td>
					</tr>
					<tr>
						<th>宿舍号：</th><td>${studentDomain.dormitory }</td>
						<th>民族：</th><td>${studentDomain.nationality }</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="codeView docs-example">
			<span style="margin-bottom: 20px;font-size: 26px;">家庭信息</span>
			<c:forEach items="${studentDomain.families }" var="familyDomain" varStatus="status">
			<table id="familyinfoId" class="table table-border table-bordered radius table-font" style="margin-top: 10px;">
				<thead>
					<tr>
						<th style="width: 15%;font-size:18px;">家庭成员${status.index + 1}</th>
						<th style="width: 35%;border-left:0px;"></th>
						<th style="border-left:0px;width: 15%;"></th>
						<th style="width: 35%;border-left:0px;"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>姓名：</th><td>${familyDomain.name }</td>
						<th>关系：</th><td>${familyDomain.relation }</td>
					</tr>
					<tr>
						<th>出生日期：</th><td><fmt:formatDate value="${familyDomain.birthday }" type="date"/></td>
						<th>身份证号：</th><td>${familyDomain.IDnumber }</td>
					</tr>
					<tr>
						<th>职业：</th><td>${familyDomain.occupation }</td>
						<th>职务：</th><td>${familyDomain.job }</td>
					</tr>
					<tr>
						<th>联系方式1：</th><td>${familyDomain.telePhone }</td>
						<th>联系方式2：</th><td>${familyDomain.cellphone }</td>
					</tr>
					<tr>
						<th>工作地址：</th><td colspan="3">${familyDomain.jobAddress }</td>
					</tr>
				</tbody>
			</table>
			</c:forEach>

		</div>
		
		
		<div class="codeView docs-example">
			<span style="margin-bottom: 20px;font-size: 26px;">学生就业信息</span>
			<table id="studentinfoId" class="table table-border table-bordered radius table-font">
				<thead>
					<tr>
						<th style="width: 15%;"></th>
						<th style="border-left:0px;"></th>
						<th style="border-left:0px;width: 15%;"></th>
						<th style="border-left:0px;"></th>
					</tr> 
				</thead>
				<tbody>
					<tr>
						<th>姓名：</th><td>${studentDomain.name }</td>
						<th>学号：</th><td>${studentDomain.stuId }</td>
					</tr>
					<tr>
						<th>班级：</th><td>${studentDomain.classDomain.name }</td>
						<th>当前状态：</th><td>${cusfun:getNameByValueAndType(studentDomain.jobInfo.nowState,"8005")}</td>
					</tr>
					<tr>
						<th>签约状态：</th><td>${cusfun:getNameByValueAndType(studentDomain.jobInfo.contractStatus,"8003")}</td>
						<th>协议书状态：</th><td>${cusfun:getNameByValueAndType(studentDomain.jobInfo.protocalState,"8004")}</td>
					</tr>
					<tr>
						<th>签约单位：</th>
						<td colspan="3">${studentDomain.jobInfo.company }</td>
					</tr>
					<tr>
						<th>薪水：</th>
						<td colspan="3">${studentDomain.jobInfo.salary }</td>
					</tr>
					<tr>
						<th>派遣地址：</th>
						<td colspan="3">${studentDomain.jobInfo.city }</td>
					</tr>
					<tr>
						<th rowspan="2">备注：</th>
						<td rowspan="2" colspan="3">${studentDomain.jobInfo.note }</td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="codeView docs-example">
			<span style="margin-bottom: 20px;font-size: 26px;">党建信息</span>
			<table id="studentinfoId" class="table table-border table-bordered radius table-font">
				<thead>
					<tr>
						<th style="width: 15%;"></th>
						<th style="border-left:0px;"></th>
						<th style="border-left:0px;width: 15%;"></th>
						<th style="border-left:0px;"></th>
					</tr> 
				</thead>
				<tbody>
					<tr>
						<th>姓名：</th><td>${studentDomain.name }</td>
						<th>学号：</th><td>${studentDomain.stuId }</td>
					</tr>
					<tr>
						<th>班级：</th><td>${studentDomain.classDomain.name }</td>
						<th>性别：</th><td>${cusfun:getNameByValueAndType(studentDomain.sex,"8002")}</td>
					</tr>
					<tr>
						<th>提交入党申请书日期：</th>
						<td colspan="3"><fmt:formatDate value="${studentDomain.paty.applicationDate }" type="date"/></td>
					</tr>
					<tr>
						<th>确定积极份子日期：</th>
						<td colspan="3"><fmt:formatDate value="${studentDomain.paty.activeDate }" type="date"/></td>
					</tr>
					<tr>
						<th>中党是否通过：</th>
						<td colspan="3">${cusfun:getNameByValueAndType(studentDomain.paty.isPassActive,"8007")} </td>
					</tr>
					<tr>
						<th>确定发展对象日期：</th>
						<td colspan="3"><fmt:formatDate value="${studentDomain.paty.developDate }" type="date"/></td>
					</tr>
					<tr>
						<th>入党日期：</th>
						<td colspan="3"><fmt:formatDate value="${studentDomain.paty.joinpatyDate }" type="date"/></td>
					</tr>
					<tr>
						<th>转正日期：</th>
						<td colspan="3"><fmt:formatDate value="${studentDomain.paty.confirmDate }" type="date"/></td>
					</tr>
					<tr>
						<th rowspan="2">备注：</th>
						<td rowspan="2" colspan="3">${studentDomain.paty.note }</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>



	<footer class="footer mt-20">
		<div class="container">
			<nav class="footer-nav">
				<a href="#">关于CSystem</a>
				<span class="pipe">|</span>
				<a href="#">软件著作权</a>
				<span class="pipe">|</span>
				<a href="#">联系我</a>
			</nav>
			<p>Copyright &copy;2016 cb All Rights Reserved. <br>
			未经允许，禁止转载、抄袭、镜像<br>
		</div>
	</footer>
	
	<script>
	
	</script>
	</body>
</html>
