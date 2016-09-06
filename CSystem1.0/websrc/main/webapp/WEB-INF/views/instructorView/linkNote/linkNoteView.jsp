<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>		

<!-- 修改联系笔记界面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>

	<table>
	
		<c:if test="${linkNoteDomain.student!=null }">
		<tr>
			<td class="lesta-150">姓名：</td>
			<td class="lestb">
				${linkNoteDomain.student.name }
			</td>
			<td class="lesta-150">学号：</td>
			<td class="lestb">
				${linkNoteDomain.student.stuId }
			</td>
		</tr>
		</c:if>
		<c:if test="${linkNoteDomain.student==null }">
		<tr>
			<td class="lesta-150">班级：</td>
			<td class="lestb">
				${linkNoteDomain.classDomain.name }
			</td>
		</tr>
		</c:if>
		<tr>
			<td class="lesta-150">联系笔记：</td>
			<td class="lestb">
				${linkNoteDomain.linkNoteType.name }
			</td>
		</tr>
		<tr>
			<td class="lesta-150">时间：</td>
			<td class="lestb">
				<fmt:formatDate value="${linkNoteDomain.time }" type="date"/>
			</td>
		</tr>
		<tr>
			<td class="lesta-150">备注：</td>
			<td class="lestb" colspan="3" rowspan="2">
				<textarea rows="5" cols="50" readonly="readonly" style="margin-top: 20px;">${linkNoteDomain.note }</textarea>
			</td>
		</tr>
	</table>
		
	<input id="closeButton" type="button" class="button button-highlight button-rounded button-small" style="margin-top:20px; margin-left: 240px;" value="关闭"/>

<script>
	
	$("#closeButton").click(function(){
		//关闭当前页面
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭     
	});

</script>
