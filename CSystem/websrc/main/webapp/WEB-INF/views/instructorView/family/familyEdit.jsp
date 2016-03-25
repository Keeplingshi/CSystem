<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>		

<!-- 修改家庭成员信息界面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@	taglib uri="/csystem-taglib" prefix="cusfun" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/validform.js"></script>

<form id="familyEditFormId" modelAttribute="domain" action="${pageContext.request.contextPath}/instructor/family/save" method="post">
	<input type="hidden" id="id" name="id" value="${familyDomain.id }"/>
	<input type="hidden" name="student.id" value="${familyDomain.student.id }"/>
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
				<input type="text" id="familyname" name="name" class="input_text_a" placeholder="请输入姓名" value="${familyDomain.name }">
			</td>
			<td class="lesta-150">关系：</td>
			<td class="lestb">
				<input type="text" id="relation" name="relation" class="input_text_a" placeholder="请输入关系" value="${familyDomain.relation }">
			</td>
		</tr>
		<tr>
			<td class="lesta-150">出生日期：</td>
			<td class="lestb">
				<input type="text" name="birthday" class="Wdate" readonly="readonly"  value="<fmt:formatDate value="${familyDomain.birthday }" type="date"/>" onfocus="WdatePicker({maxDate:'%y-%M-%d'})" style="width: 150px;height: 30px;cursor: pointer;"/>
			</td>
			<td class="lesta-150">身份证号：</td>
			<td class="lestb">
				<input type="text" id="IDnumber" name="IDnumber" class="input_text_a" placeholder="请输入身份证号" value="${familyDomain.IDnumber }">
			</td>
		</tr>
		<tr>
			<td class="lesta-150">职业：</td>
			<td class="lestb">
				<input type="text" id="occupation" name="occupation" class="input_text_a" placeholder="请输入职业" value="${familyDomain.occupation }">
			</td>
			<td class="lesta-150">职务：</td>
			<td class="lestb">
				<input type="text" id="job" name="job" class="input_text_a" placeholder="请输入职务" value="${familyDomain.job }">
			</td>
		</tr>
		<tr>
			<td class="lesta-150">联系方式1：</td>
			<td class="lestb">
				<input type="text" id="telePhone" name="telePhone" class="input_text_a" placeholder="请输入电话" value="${familyDomain.telePhone }">
			</td>
			<td class="lesta-150">联系方式2：</td>
			<td class="lestb">
				<input type="text" id="cellphone" name="cellphone" class="input_text_a" placeholder="请输入手机号" value="${familyDomain.cellphone }">
			</td>
		</tr>
		<tr>
			<td class="lesta-150">工作地址：</td>
			<td class="lestb" colspan="3">
				<input type="text" id="jobAddress" name="jobAddress" class="input_text_a" style="width: 320px;" placeholder="请输入工作地址" value="${familyDomain.jobAddress }">
			</td>
		</tr>
	</table>
	<input id="saveButton" type="button" class="button button-highlight button-rounded button-small" style="margin-top:30px; margin-left: 240px;" value="确定"/>
</form>
<script>
	
	$("#saveButton").click(function(){
	
		var familynameVal=$("#familyname").val();	//姓名
		var relationVal=$("#relation").val();	//班级
		
		if(familynameVal==null||familynameVal==''){
			layer.tips('姓名不能为空', '#familyname');
			return;
		}
		if(relationVal==null||relationVal==''){
			layer.tips('关系不能为空', '#relation');
			return;
		}
		
		var form = $("#familyEditFormId");
		form.ajaxSubmit(function(result){
			if(result=='success'){

				parent.layer.msg('修改成功', {
					offset: ['260px'],
     		        time: 1500//1.5s后自动关闭
     		    });
				//关闭当前新增页面页
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭    
			}else{
				layer.msg('修改失败',{
					offset: ['260px'],
	     		    time: 1500
	     		});
			}
		});
	});


</script>