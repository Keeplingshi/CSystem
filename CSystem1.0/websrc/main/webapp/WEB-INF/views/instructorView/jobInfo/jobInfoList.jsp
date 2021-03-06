<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!-- 就业列表页面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@	taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@	taglib uri="/csystem-taglib" prefix="cusfun" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/globle.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<div>
<form id="formId" action="${pageContext.request.contextPath}/instructor/jobInfo/jobInfoSearchList" method="post">
	<input type="hidden" id="majorId" name="majorId" value="${majorId }" />
	<input type="hidden" id="classId" name="classId" value="${classId }" />
	<input type="hidden" id="contractStatusId" name="contractStatusId" value="${contractStatusId }" />
	<input type="hidden" id="protocalStateId" name="protocalStateId" value="${protocalStateId }" />
	<input type="hidden" id="isPositive" name="isPositive" value="${isPositive }" />
	<input type="hidden" id="sortMode" name="sortMode" value="${sortMode }" />
	<input type="hidden" id="sortValue" name="sortValue" value="${sortValue }" />
	<div class="breadcrumbs" id="jobInfoListToolbar">
	
		<span class="input-icon" style="margin: 5px;">
			<input type="text" id="nav-search-input" name="searchText" placeholder="Search ..." class="nav-search-input" autocomplete="off" value="${searchText }"/> 
			<i class="icon-search nav-search-icon"></i>
		</span>
		
		<label style="margin-left: 20px;">专业：</label>
		<select id="major_select_id" style="width: 100px;" onchange="getClass(this.value)">
			<option value="" selected="selected">全部</option>
			<c:forEach items="${majorList }" var="majorItem">
				<option value="${majorItem.selectText }">${majorItem.selectValue}</option>
			</c:forEach>
		</select>
	
		<label style="margin-left: 20px;">班级：</label>
		<select id="class_select_id" style="width: 100px;">
			<option value="" selected="selected">全部</option>
			<c:forEach items="${classList }" var="classItem">
				<option value="${classItem.selectText }">${classItem.selectValue}</option>
			</c:forEach>
		</select>
	
		<input id="jobInfoQueryButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="查询"/>
	</div>
	<div class="breadcrumbs">
	
		<label style="margin-left: 20px;">签约状态：</label>
		<select id="contractStatus_select_id" class="select_style" onchange="getProtocalState(this.value)">
			<option value="" selected="selected">选择</option>
			<c:forEach items="${contractStatusList }" var="contractStatusDomain">
				<option value="${contractStatusDomain.value }">${contractStatusDomain.name}</option>
			</c:forEach>
		</select>
	
		<label style="margin-left: 20px;">协议书：</label>
		<select id="protocalState_select_id" class="select_style">
			<option value="" selected="selected">选择</option>
			<c:forEach items="${protocalStateList }" var="protocalStateDomain">
				<option value="${protocalStateDomain.value }">${protocalStateDomain.name}</option>
			</c:forEach>
		</select>
	
		<label style="margin-left: 20px;">标记：</label>
		<select id="isPositive_select_id" class="select_style" style="width: 100px;">
			<option value="" selected="selected">选择</option>
			<option value="2">标记</option>
		</select>
	
		<input id="jobInfoCountButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="统计信息"/>
		<input id="jobInfoDBToExcelButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="导出数据"/>
	</div>
	<div class="table-responsive">
		<table id="sample-table-2" class="table table-striped table-bordered table-hover" style="table-layout:fixed;">
			<thead>
				<tr>
					<th class="center" style="width: 60px;">
						<label> <input id="theadCheckbox" type="checkbox" class="ace" /> <span class="lbl"></span></label>
					</th>
					<th style="width: 100px;">学号
						<span>
							<c:choose>
								<c:when test="${sortMode=='asc'&&sortValue=='qstu.stuId' }">
									<img id="img_qstu.stuId_asc" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_up_24.png">
								</c:when>
								<c:when test="${sortMode=='desc'&&sortValue=='qstu.stuId' }">
									<img id="img_qstu.stuId_desc" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_down_24.png">
								</c:when>
								<c:otherwise>
									<img id="img_qstu.stuId" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_24.png">
								</c:otherwise>
							</c:choose>
						</span>
					</th>
					<th style="width: 80px;">姓名</th>
					<th style="width: 60px;">性别</th>
					<th>班级</th>
					<th>签约状态</th>
					<th>签约单位</th>
					<th>协议书</th>
					<th>当前状态</th>
					<th>薪水
						<span>
							<c:choose>
								<c:when test="${sortMode=='asc'&&sortValue=='salary' }">
									<img id="img_salary_asc" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_up_24.png">
								</c:when>
								<c:when test="${sortMode=='desc'&&sortValue=='salary' }">
									<img id="img_salary_desc" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_down_24.png">
								</c:when>
								<c:otherwise>
									<img id="img_salary" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_24.png">
								</c:otherwise>
							</c:choose>
						</span>
					</th>
					<!-- <th>备注</th> -->
					<th>最后修改时间
						<span>
							<c:choose>
								<c:when test="${sortMode=='asc'&&sortValue=='modifyTime' }">
									<img id="img_modifyTime_asc" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_up_24.png">
								</c:when>
								<c:when test="${sortMode=='desc'&&sortValue=='modifyTime' }">
									<img id="img_modifyTime_desc" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_down_24.png">
								</c:when>
								<c:otherwise>
									<img id="img_modifyTime" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_24.png">
								</c:otherwise>
							</c:choose>
						</span>
					</th>
					<th>操作</th>
				</tr>
			</thead>
	
			<tbody>
				<c:forEach items="${jobInfoList }" var="jobInfoDomain">
					<c:if test="${jobInfoDomain.isPositive!=2 }">
					<tr>
						<td class="center">
							<label> <input type="checkbox" class="ace" value="${jobInfoDomain.id }"/> <span class="lbl"></span></label>
						</td>
						<td><a href="${pageContext.request.contextPath}/studentinfo/studentIndex/${jobInfoDomain.student.id }" style="color: #000000;" target="_blank">${jobInfoDomain.student.stuId }</a></td>
						<td><a href="${pageContext.request.contextPath}/studentinfo/studentIndex/${jobInfoDomain.student.id }" style="color: #000000;" target="_blank">${jobInfoDomain.student.name }</a></td>
						<td>${cusfun:getNameByValueAndType(jobInfoDomain.student.sex,"8002")}</td>
						<td>${jobInfoDomain.student.classDomain.name }</td>
						<td>${cusfun:getNameByValueAndType(jobInfoDomain.contractStatus,"8003")}</td>
						<td>${jobInfoDomain.company }</td>
						<td>${cusfun:getNameByValueAndType(jobInfoDomain.protocalState,"8004")}</td>
						<td>${cusfun:getNameByValueAndType(jobInfoDomain.nowState,"8005")}</td>
						<td>${jobInfoDomain.salary }</td>
						<%-- <td>${jobInfoDomain.note }</td> --%>
						<td>${jobInfoDomain.modifyTime }</td>
						<td>
							<input type="button" class="btn_list_lock" value="标记" onclick="tagjobInfo('${jobInfoDomain.id }')"/>
							<input type="button" class="btn_list_view" value="查看" onclick="viewjobInfo('${jobInfoDomain.id }')"/>
							<input type="button" class="btn_list_update" value="修改" onclick="updatejobInfo('${jobInfoDomain.id }')"/>
						</td>
					</tr>
					</c:if>
					<c:if test="${jobInfoDomain.isPositive==2 }">
					<tr style="color: #FF0000;">
						<td class="center">
							<label> <input type="checkbox" class="ace" value="${jobInfoDomain.id }"/> <span class="lbl"></span></label>
						</td>
						<td><a href="${pageContext.request.contextPath}/studentinfo/studentIndex/${jobInfoDomain.student.id }" style="color: #FF0000;" target="_blank">${jobInfoDomain.student.stuId }</a></td>
						<td><a href="${pageContext.request.contextPath}/studentinfo/studentIndex/${jobInfoDomain.student.id }" style="color: #FF0000;" target="_blank">${jobInfoDomain.student.name }</a></td>
						<td>${cusfun:getNameByValueAndType(jobInfoDomain.student.sex,"8002")}</td>
						<td>${jobInfoDomain.student.classDomain.name }</td>
						<td>${cusfun:getNameByValueAndType(jobInfoDomain.contractStatus,"8003")}</td>
						<td>${jobInfoDomain.company }</td>
						<td>${cusfun:getNameByValueAndType(jobInfoDomain.protocalState,"8004")}</td>
						<td>${cusfun:getNameByValueAndType(jobInfoDomain.nowState,"8005")}</td>
						<td>${jobInfoDomain.salary }</td>
						<%-- <td>${jobInfoDomain.note }</td> --%>
						<td>${jobInfoDomain.modifyTime }</td>
						<td>
							<input type="button" class="btn_list_unlock" value="取消标记" onclick="tagjobInfo('${jobInfoDomain.id }')"/>
							<input type="button" class="btn_list_view" value="查看" onclick="viewjobInfo('${jobInfoDomain.id }')"/>
							<input type="button" class="btn_list_update" value="修改" onclick="updatejobInfo('${jobInfoDomain.id }')"/>
						</td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div id="pageId"><tags:paged /></div>
	</div>
</form>
</div>

<script type="text/javascript">
	
	//排序
	$("#sample-table-2 thead tr th img").click(function(){
		
		var sortValueVal=$(this)[0].id.split("_")[1];
		var sortModeVal=$(this)[0].id.split("_")[2];
		$("#sortValue").val(sortValueVal);
		if(sortModeVal=='asc'){
			$("#sortMode").val('desc');
		}else{
			$("#sortMode").val('asc');
		}
		
		//默认加载学生列表
		$("#formId").ajaxSubmit(function(data){
		 	$("#content_page").html(data);
		});
	});
	
	//使下拉框默认选择
	$(function(){
		$("#major_select_id option[value='${majorId}']").attr("selected",true);
		$("#class_select_id option[value='${classId}']").attr("selected",true);
		$("#isPositive_select_id option[value='${isPositive}']").attr("selected",true);
		$("#contractStatus_select_id option[value='${contractStatusId}']").attr("selected",true);
		$("#protocalState_select_id option[value='${protocalStateId}']").attr("selected",true);
	});
	
		//下拉框选择后给隐藏域赋值
	$("#class_select_id").change(function(){
		var classIdVal=$(this).children('option:selected').val();
		$("#classId").val(classIdVal);
	});
	$("#major_select_id").change(function(){
		var majorIdVal=$(this).children('option:selected').val();
		$("#majorId").val(majorIdVal);
	});
	//下拉框选择后给隐藏域赋值
	$("#contractStatus_select_id").change(function(){
		var contractStatus_value=$(this).children('option:selected').val();
		$("#contractStatusId").val(contractStatus_value);
	});
	
	//下拉框选择后给隐藏域赋值
	$("#protocalState_select_id").change(function(){
		var protocalState_value=$(this).children('option:selected').val();
		$("#protocalStateId").val(protocalState_value);
	});
	
	$("#isPositive_select_id").change(function(){
		var isPositive_value=$(this).children('option:selected').val();
		$("#isPositive").val(isPositive_value);
	});
	
	//查询
	$("#jobInfoQueryButton").click(function(){
		$("#formId").ajaxSubmit(function(data){
		 	$("#content_page").html(data);
		});
	});
	
	//就业信息导出数据
	$("#jobInfoDBToExcelButton").click(function(){
	    parent.layer.open({
	        type: 2,
	        title: '导出就业信息',
	        shadeClose: true,
	        area : ['700px' , '500px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/jobInfo/jobInfoDBToExcelView'
	    });
	});
	
	//就业信息统计
	$("#jobInfoCountButton").click(function(){
	    parent.layer.open({
	        type: 2,
	        title: '就业信息统计',
	        shadeClose: true,
	        area : ['860px' , '500px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/jobInfo/jobInfoCountView'
	    });
	});
	
	//list中修改就业信息按钮
	function updatejobInfo(jobInfoId)
	{
	    parent.layer.open({
	        type: 2,
	        title: '修改就业信息',
	        shadeClose: true,
	        area : ['700px' , '700px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/jobInfo/jobInfoEdit/'+jobInfoId,
	        end: function(){
	        	//默认加载用户列表
	        	$("#formId").ajaxSubmit(function(data){
	        	 	$("#content_page").html(data);
	    		});
	        }
	    });
	}
	
	//list中查看就业信息按钮
	function viewjobInfo(jobInfoId)
	{
	    parent.layer.open({
	        type: 2,
	        title: '查看就业信息',
	        shadeClose: true,
	        area : ['700px' , '700px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/jobInfo/jobInfoView/'+jobInfoId
	    });
	}
	
	//标记
	function tagjobInfo(jobInfoId)
	{
    	$.ajax({
			url:'${pageContext.request.contextPath}/instructor/jobInfo/markIsPositive/'+jobInfoId,
			type:"post",
			error:function(e){
			},
			success:function(data){
				if(data=='success'){
		        	//默认加载用户列表
		        	$("#formId").ajaxSubmit(function(data){
		        	 	$("#content_page").html(data);
		    		});
				}
			}
		});
	}

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
 				var class_select=$("#class_select_id");
				class_select.empty();
				class_select.append('<option value="">'+"全部"+'</option>');
				for(var i=0;i<json.length;i++){
					class_select.append('<option value="'+json[i].selectText+'">'+json[i].selectValue+'</option>');
				} 
			}
		});
	}
	
	//选择签约状态，得到签约书
	function getProtocalState(contractStatus_value)
	{
    	$.ajax({
			url:'${pageContext.request.contextPath}/common/getProtocalState?contractStatusValue='+contractStatus_value,
			type:"post",
			error:function(e){
			},
			success:function(data){
				var json = new Function("return" + data)();
 				var major_select=$("#protocalState_select_id");
				major_select.empty();
				major_select.append('<option value="">'+"选择"+'</option>');
				for(var i=0;i<json.length;i++){
					major_select.append('<option value="'+json[i].selectText+'">'+json[i].selectValue+'</option>');
				}
				$("#protocalState").val('');
			}
		});
	}
</script>
