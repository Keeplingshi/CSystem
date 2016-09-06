<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>		

<!-- 修改家庭成员信息界面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@	taglib uri="/csystem-taglib" prefix="cusfun" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

	<table>
		<tr>
			<td class="lesta-150">学生姓名：</td>
			<td class="lestb">
				${familyDomain.student.name }
			</td>
			<td class="lesta-150">学号：</td>
			<td class="lestb">
				${familyDomain.student.stuId }
			</td>
		</tr>
		<tr>
			<td class="lesta-150">姓名：</td>
			<td class="lestb">
				${familyDomain.name }
			</td>
			<td class="lesta-150">关系：</td>
			<td class="lestb">
				${familyDomain.relation }
			</td>
		</tr>
		<tr>
			<td class="lesta-150">出生日期：</td>
			<td class="lestb">
				<fmt:formatDate value="${familyDomain.birthday }" type="date"/>
			</td>
			<td class="lesta-150">身份证号：</td>
			<td class="lestb">
				${familyDomain.IDnumber }
			</td>
		</tr>
		<tr>
			<td class="lesta-150">职业：</td>
			<td class="lestb">
				${familyDomain.occupation }
			</td>
			<td class="lesta-150">职务：</td>
			<td class="lestb">
				${familyDomain.job }
			</td>
		</tr>
		<tr>
			<td class="lesta-150">联系方式1：</td>
			<td class="lestb">
				${familyDomain.telePhone }
			</td>
			<td class="lesta-150">联系方式2：</td>
			<td class="lestb">
				${familyDomain.cellphone }
			</td>
		</tr>
		<tr>
			<td class="lesta-150">工作地址：</td>
			<td class="lestb" colspan="3">
				${familyDomain.jobAddress }
			</td>
		</tr>
	</table>
	<input id="closeButton" type="button" class="button button-highlight button-rounded button-small" style="margin-top:30px; margin-left: 240px;" value="关闭"/>

<script>
	
	$("#closeButton").click(function(){
		//关闭当前页面
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭     
	});


</script>