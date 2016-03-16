<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>		

<!-- 修改用户界面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>

<form id="userEditFormId" modelAttribute="domain" action="${pageContext.request.contextPath}/admin/user/editSave" method="post">
	<input type="hidden" id="id" name="id" value="${userDomain.id }"/>
	<input type="hidden" id="username" name="username" value="${userDomain.username }"/>
	<input type="hidden" id="password" name="password" value="${userDomain.password }"/>
	<input type="hidden" id="roleId" name="role.id" value="${userDomain.role.id }" />
	<input type="hidden" id="roleAuthority" value="${userDomain.role.authority }"/>
	<input type="hidden" id="collegeId" name="college.id" value="${userDomain.college.id }"/>
	<input type="hidden" id="gradeId" name="grade.id" value="${userDomain.grade.id }"/>
	<table>
		<tr>
			<td class="lesta-150">账号：</td>
			<td class="lestb">
				${userDomain.username }
			</td>
		</tr>
		<tr>
			<td class="lesta-150">密码：</td>
			<td class="lestb">
				******
			</td>
		</tr>
		<tr>
			<td class="lesta-150">角色：</td>
			<td class="lestb">
				${userDomain.role.name }
<%-- 				<select id="role_select_edit_id" class="select_style">
					<option value="" selected="selected">选择</option>
					<c:forEach items="${roleList }" var="roleDomain">
						<c:if test="${roleDomain.authority!=3 }">
							<option value="${roleDomain.id }_${roleDomain.authority }">${roleDomain.name}</option>
						</c:if>
					</c:forEach>
				</select> --%>
			</td>
<%-- 			<td class="lesta-150">角色：</td>
			<td class="lestb">
				<select id="role_select_edit_id" class="select_style">
					<c:forEach items="${roleList }" var="roleDomain">
						<option value="${roleDomain.id }">${roleDomain.name}</option>
					</c:forEach>
				</select>
			</td> --%>
		</tr>
		
	</table>
	<div id="college_div" style="display: none">
		<table>
			<tr>
				<td class="lesta-150">学院：</td>
				<td class="lestb">
					<select id="college_select_edit_id" class="select_style">
						<option value="" selected="selected">选择</option>
						<c:forEach items="${collegeList }" var="collegeDomain">
							<option value="${collegeDomain.id }">${collegeDomain.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	</div>
	<div id="grade_div" style="display: none">
		<table>
			<tr>
				<td class="lesta-150">年级：</td>
				<td class="lestb">
					<select id="grade_select_edit_id" class="select_style">
						<option value="" selected="selected">选择</option>
						<c:forEach items="${gradeList }" var="gradeDomain">
							<option value="${gradeDomain.id }">${gradeDomain.grade}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	</div>
	<input id="saveButton" type="button" class="button button-highlight button-rounded button-small" style="margin-top:20px; margin-left: 140px;" value="确定"/>
</form>

<script>
	
	//使权限下拉框默认选择
	$(function(){
	
		var authorityOrigin="${userDomain.role.authority }";
		if(authorityOrigin=='1'){
			$("#college_div").show();
			$("#grade_div").show();
		}else if(authorityOrigin=='2'){
			//老师
			$("#college_div").show();
			$("#grade_div").show();
			
		}else if(authorityOrigin=='5'){
			//违纪管理员
			$("#college_div").show();
		}
	
		//$("#role_select_edit_id option[value='${userDomain.role.id}_${userDomain.role.authority }']").attr("selected",true);
		$("#college_select_edit_id option[value='${userDomain.college.id}']").attr("selected",true);
		$("#grade_select_edit_id option[value='${userDomain.grade.id}']").attr("selected",true);
	});
	
/* 	//下拉框选择后给隐藏域赋值
	$("#role_select_edit_id").change(function(){
		var roleselectVal=$(this).children('option:selected').val();
		var role_id=roleselectVal.split('_')[0];
		var role_authorty=roleselectVal.split('_')[1];
		if(role_authorty=='1'){
			//辅导员
			$("#college_div").show();
			$("#grade_div").show();
		}else if(role_authorty=='2'){
			//老师
			$("#college_div").show();
			$("#grade_div").show();
			
		}else if(role_authorty=='5'){
			//违纪管理员
			$("#college_div").show();
		}else{
			//清空学院，年级值
			$("#college_div").hide();
			$("#grade_div").hide();
			$("#college_select_edit_id").val('');
			$("#grade_select_edit_id").val('');
			$("#collegeId").val(null);
			$("#gradeId").val(null);
		}
		
		$("#roleId").val(role_id);
		$("#roleAuthority").val(role_authorty);
	}); */
	
	$("#college_select_edit_id").change(function(){
		var collegeselectVal=$(this).children('option:selected').val();
		$("#collegeId").val(collegeselectVal);
	});
	
	$("#grade_select_edit_id").change(function(){
		var gradeselectVal=$(this).children('option:selected').val();
		$("#gradeId").val(gradeselectVal);
	});
	
	$("#saveButton").click(function(){
	
		var roleIdVal=$("#roleId").val();
		if(roleIdVal==null||roleIdVal==''){
			layer.tips('请选择角色', '#role_select_edit_id');
			return;
		}
		
		var roleAuthorityVal=$("#roleAuthority").val();
		if(roleAuthorityVal=='1'||roleAuthorityVal=='2'){
			//辅导员,老师,判断年级学院是否为空
			var collegeIdVal=$("#collegeId").val();
			var gradeIdVal=$("#gradeId").val();
			if(collegeIdVal==null||collegeIdVal==''){
				layer.tips('请选择学院', '#college_select_edit_id');
				return;
			}
			if(gradeIdVal==null||gradeIdVal==''){
				layer.tips('请选择年级', '#grade_select_edit_id');
				return;
			}
			
		}else if(roleAuthorityVal=='5'){
			var collegeIdVal=$("#collegeId").val();
			if(collegeIdVal==null||collegeIdVal==''){
				layer.tips('请选择学院', '#college_select_edit_id');
				return;
			}
			
		}else{
			
		}
		
		var form = $("#userEditFormId");
		form.ajaxSubmit(function(result){
			if(result=='success'){

				parent.layer.msg('修改成功', {
     		        time: 1500//1.5s后自动关闭
     		    });
				//关闭当前新增页面页
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭     
				
			}else{
				layer.msg('修改失败');
			}
		});
		
	});

</script>