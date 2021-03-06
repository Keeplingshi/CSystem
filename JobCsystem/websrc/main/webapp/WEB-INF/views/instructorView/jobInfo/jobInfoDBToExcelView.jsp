<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>

<form id="jobInfoDBtoExcelFormId" modelAttribute="domain" action="${pageContext.request.contextPath}/instructor/jobInfo/jobInfoDBToExcel" method="post">
	<input type="hidden" id="classId" name="classId" value="" />
	<input type="hidden" id="majorId" name="majorId" value="" />
	<input type="hidden" id="contractStatusId" name="contractStatusId" value="" />
	<input type="hidden" id="protocalStateId" name="protocalStateId" value="" />
	<input type="hidden" id="isPositive" name="isPositive" value="" />
	<table>
		<tr style="height: 60px;">
			<td>
				<label style="margin-left: 15px;">专业：</label>
				<select id="major_DBtoExcel_select_id" class="select_style" onchange="getClass(this.value)">
					<option value="" selected="selected">全部</option>
					<c:forEach items="${majorList }" var="majorItem">
						<option value="${majorItem.selectText }">${majorItem.selectValue}</option>
					</c:forEach>
				</select>	
				
				<label style="margin-left: 15px;">班级：</label>
				<select id="class_DBtoExcel_select_id" class="select_style">
					<option value="" selected="selected">全部</option>
					<c:forEach items="${classList }" var="classItem">
						<option value="${classItem.selectText }">${classItem.selectValue}</option>
					</c:forEach>
				</select>	
			</td>
		</tr>
		<tr style="height: 60px;">
			<td>
				<label style="margin-left: 15px;">签约状态：</label>
				<select id="contractStatus_DBtoExcel_select_id" class="select_style" onchange="getProtocalState(this.value)">
					<option value="" selected="selected">选择</option>
					<c:forEach items="${contractStatusList }" var="contractStatusDomain">
						<option value="${contractStatusDomain.value }">${contractStatusDomain.name}</option>
					</c:forEach>
				</select>
			
				<label style="margin-left: 15px;">协议书：</label>
				<select id="protocalState_DBtoExcel_select_id" class="select_style">
					<option value="" selected="selected">选择</option>
					<c:forEach items="${protocalStateList }" var="protocalStateDomain">
						<option value="${protocalStateDomain.value }">${protocalStateDomain.name}</option>
					</c:forEach>
				</select>
			
				<label style="margin-left: 15px;">标记：</label>
				<select id="isPositive_DBtoExcel_select_id" class="select_style" style="width: 100px;">
					<option value="" selected="selected">选择</option>
					<option value="2">标记</option>
				</select>
			</td>
		</tr>
		<tr style="height: 60px;">
			<td>
				<input type="button" id="DBtoExcelButton" class="button button-primary button-rounded button-small" value="导出数据"/>
			</td>
		</tr> 
	</table>
</form>

<script>

	$("#DBtoExcelButton").click(function(){
		var form = $("#jobInfoDBtoExcelFormId");
		form.ajaxSubmit(function(result){
			
			if(result=='error'){
				layer.msg("遇到未知错误，请重新查询！", {
					offset: ['260px'],
					time: 1500//1.5s后自动关闭
				});
			}else{
				parent.layer.msg('导出成功', {
					offset: ['260px'],
     		        time: 1500//1.5s后自动关闭
     		    });
				window.location="${pageContext.request.contextPath}/instructor/jobInfo/"+result+"/downloadJobInfo";
			};
		});
	});

	//下拉框选择后给隐藏域赋值
	$("#grade_DBtoExcel_select_id").change(function(){
		var gradeIdVal=$(this).children('option:selected').val();
		$("#gradeId").val(gradeIdVal);
	});
	
	//下拉框选择后给隐藏域赋值
	$("#class_DBtoExcel_select_id").change(function(){
		var classIdVal=$(this).children('option:selected').val();
		$("#classId").val(classIdVal);
	});
	
	//下拉框选择后给隐藏域赋值
	$("#major_DBtoExcel_select_id").change(function(){
		var majorIdVal=$(this).children('option:selected').val();
		$("#majorId").val(majorIdVal);
	});
	
	//下拉框选择后给隐藏域赋值
	$("#contractStatus_DBtoExcel_select_id").change(function(){
		var contractStatus_value=$(this).children('option:selected').val();
		$("#contractStatusId").val(contractStatus_value);
	});
	
	//下拉框选择后给隐藏域赋值
	$("#protocalState_DBtoExcel_select_id").change(function(){
		var protocalState_value=$(this).children('option:selected').val();
		$("#protocalStateId").val(protocalState_value);
	});

	$("#isPositive_DBtoExcel_select_id").change(function(){
		var isPositive_value=$(this).children('option:selected').val();
		$("#isPositive").val(isPositive_value);
	});
	
	//选择专业，得到班级
	function getClass(major_id)
	{
		$.ajax({
			url:'${pageContext.request.contextPath}/instructor/class/getClassByMajor?major_id='+major_id,
			type:"post",
			error:function(e){
			},
			success:function(data){
				var json = new Function("return" + data)();
				var class_select=$("#class_DBtoExcel_select_id");
				class_select.empty();
				class_select.append('<option value="">'+"全部"+'</option>');
				for(var i=0;i<json.length;i++){
					class_select.append('<option value="'+json[i].selectText+'">'+json[i].selectValue+'</option>');
				} 
			}
		});
	}
</script>