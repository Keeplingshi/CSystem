<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>		

<!-- 增加联系笔记类型界面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/datePicker/WdatePicker.js"></script>

<form id="linkNoteAddFormId" modelAttribute="domain" action="${pageContext.request.contextPath}/admin/linkNote/save" method="post">
	<input type="hidden" id="stuId" name="student.id" value=""/>
	<input type="hidden" id="linkNoteTypeId" name="linkNoteType.id" value=""/>
	<table>
		<tr>
			<td class="lesta-150">学生：</td>
			<td class="lestb">
				<input type="text" id="stuname" class="input_text_a" placeholder="请选择学生" readonly="readonly"/>
				<input type="button" id="chooseStudentButton" class="button button-primary button-rounded button-small" value="选择">
			</td>
		</tr>
		<tr>
			<td class="lesta-150">联系笔记类型：</td>
			<td class="lestb">
				<select id="linkNoteType_select_choose_id" class="select_style">
					<option value="" selected="selected">选择</option>
					<c:forEach items="${linkNoteTypeList }" var="linkNoteTypeDomain">
						<option value="${linkNoteTypeDomain.id }">${linkNoteTypeDomain.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td class="lesta-150">时间：</td>
			<td class="lestb">
				<input type="text" name="time" class="Wdate" readonly="readonly" placeholder="日期" onfocus="WdatePicker()" 
					 style="width: 150px;height: 30px;cursor: pointer;"/> 
			</td>
		</tr>
		<tr>
			<td class="lesta-150">备注：</td>
			<td class="lestb" colspan="3" rowspan="2">
				<textarea rows="5" cols="50" id="note" name="note" style="margin-top: 20px;" maxlength="200"></textarea>
			</td>
		</tr>
	</table>
	
	<input id="saveButton" type="button" class="button button-highlight button-rounded button-small" style="margin-top:20px; margin-left: 140px;" value="确定"/>
</form>

<script>
	
	//选择学生
	$("#chooseStudentButton").click(function(){
 	    layer.open({
	        type: 2,
	        title: '选择学生',
	        shadeClose: true, //点击遮罩关闭层
	        area : ['800px' , '650px'],
	        offset: '-40px',
	        moveOut: true,
	        scrollbar: false,
	        content: '${pageContext.request.contextPath}/admin/student/studentChooseView',
	        end: function(){
				
	        }
	    }); 
	});
	
	//联系笔记类型选择
	$("#linkNoteType_select_choose_id").click(function(){
		var linkNoteType_id=$(this).children('option:selected').val();
		$("#linkNoteTypeId").val(linkNoteType_id);
	});
	
	$("#saveButton").click(function(){
		
/* 		var stuIdVal=$("#stuId").val();
		if(stuIdVal==null||stuIdVal==''){
			layer.tips('请选择学生', '#stuname');
			return;
		}  */
		
 		var linkNoteTypeVal=$("#linkNoteTypeId").val();
		if(linkNoteTypeVal==null||linkNoteTypeVal==''){
			layer.tips('联系笔记类型不能为空', '#linkNoteType_select_choose_id');
			return;
		}
		
		var form = $("#linkNoteAddFormId");
		form.ajaxSubmit(function(result){
			if(result=='success'){

				parent.layer.msg("新增成功！", {
					offset: ['260px'],
					time: 1500//1.5s后自动关闭
				});
				//关闭当前新增页面页
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭    
			}else{
				layer.msg("新增失败！", {
					offset: ['260px'],
					time: 1500//1.5s后自动关闭
				});
			}
		});
		
	});

</script>
