<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.cb.system.util.DateUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<link href="${pageContext.request.contextPath}/resources/ace/assets/css/bootstrap.min.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/datePicker/WdatePicker.js"></script>

<div id="pop_content_page">
	<form id="linkNoteCountFormId" action="${pageContext.request.contextPath}/admin/linkNote/linkNoteExcel" method="post">
		<input type="hidden" id="linkNoteTypeId" name="linkNoteTypeId" value="${linkNoteTypeId }" />
		<table>
			<tr style="height: 60px;">
				<td>
					<label style="margin-left: 15px;">联系笔记类型：</label>
					<select id="type_linkNote_select_id" class="select_style">
						<option value="" selected="selected">全部</option>
						<c:forEach items="${linkNoteTypeList }" var="linkNoteTypeItem">
							<option value="${linkNoteTypeItem.id }">${linkNoteTypeItem.name}</option>
						</c:forEach>
					</select>	
					
				</td>
			</tr>
			<tr style="height: 60px;">
				<td>
				<label style="margin-left: 20px;">起始时间：</label>
				
	            <input type="text" id="beginTime" name="beginTime" placeholder="起始时间" class="Wdate" 
	            	style="width: 150px;height: 30px;cursor: pointer;" onfocus="WdatePicker()">
	            <label style="margin-left: 20px;">结束时间：</label>
	            <input type="text" id="endTime" name="endTime" placeholder="结束时间" class="Wdate" 
	            	style="width: 150px;height: 30px;cursor: pointer;" onfocus="WdatePicker()">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="linkNoteCountButton" class="button button-primary button-rounded button-small" style="margin-top: 30px;margin-left: 140px;" value="导出联系笔记报表"/>
				</td>
			</tr>
		</table>
		
	</form>

<script>

	//查询按钮
	$("#linkNoteCountButton").click(function() {
		var form = $("#linkNoteCountFormId");
		form.ajaxSubmit(function(data) {
			if(data=='error'){
				layer.msg("遇到未知错误，请重新查询！", {
					offset: ['260px'],
					time: 1500//1.5s后自动关闭
				});
			}else{
				parent.layer.msg('导出成功', {
					offset: ['260px'],
     		        time: 1500//1.5s后自动关闭
     		    });
				window.location="${pageContext.request.contextPath}/admin/linkNote/"+data+"/downloadlinkNote";
			};
		});
	});
	
	$("#type_linkNote_select_id").change(function() {
		var linkNoteTypeIdVal = $(this).children('option:selected').val();
		$("#linkNoteTypeId").val(linkNoteTypeIdVal);
	});

</script>

</div>
