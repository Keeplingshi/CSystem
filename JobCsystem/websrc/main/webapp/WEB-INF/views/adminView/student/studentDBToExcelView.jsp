<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>

<form id="studentDBtoExcelFormId" modelAttribute="domain" action="${pageContext.request.contextPath}/admin/student/studentDBToExcel" method="post">
	<input type="hidden" id="gradeId" name="gradeId" value="" />
	<input type="hidden" id="classId" name="classId" value="" />
	<input type="hidden" id="majorId" name="majorId" value="" />
	<input type="hidden" id="collegeId" name="collegeId" value="" />
	<table>
		<tr style="height: 60px;">
			<td>
				<label style="margin-left: 15px;">年级：</label>
				<select id="grade_DBtoExcel_select_id" class="select_style">
					<option value="" selected="selected">全部</option>
					<c:forEach items="${gradeList }" var="gradeDomain">
						<option value="${gradeDomain.id }">${gradeDomain.grade}</option>
					</c:forEach>
				</select>
				
				<label style="margin-left: 15px;">学院：</label>
				<select id="college_DBtoExcel_select_id" class="select_style" onchange="getMajor(this.value)">
					<option value="" selected="selected">全部</option>
					<c:forEach items="${collegeList }" var="collegeDomain">
						<option value="${collegeDomain.id }">${collegeDomain.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
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
				<input type="button" id="DBtoExcelButton" class="button button-primary button-rounded button-small" value="导出数据"/>
			</td>
		</tr> 
	</table>
</form>

<script>

	$("#DBtoExcelButton").click(function(){
		var form = $("#studentDBtoExcelFormId");
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
				window.location="${pageContext.request.contextPath}/admin/student/"+result+"/downloadStudentInfo";
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
	$("#college_DBtoExcel_select_id").change(function(){
		var collegeIdVal=$(this).children('option:selected').val();
		$("#collegeId").val(collegeIdVal);
	});

	//选择学院，得到专业
	function getMajor(college_id)
	{
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/major/getMajorByCollege?college_id='+college_id,
			type:"post",
			error:function(e){
			},
			success:function(data){
				var json = new Function("return" + data)();
				var major_select=$("#major_DBtoExcel_select_id");
				major_select.empty();
				major_select.append('<option value="">'+"全部"+'</option>');
				for(var i=0;i<json.length;i++){
					major_select.append('<option value="'+json[i].selectText+'">'+json[i].selectValue+'</option>');
				} 
			}
		});
	}
	
	//选择专业，得到班级
	function getClass(major_id)
	{
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/class/getClassByMajor?major_id='+major_id,
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