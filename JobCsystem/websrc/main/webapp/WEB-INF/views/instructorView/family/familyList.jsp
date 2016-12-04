<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!-- 家庭成员列表页面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@	taglib uri="/commonutil-taglib" prefix="cusfun" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/globle.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />

<form id="formId" action="${pageContext.request.contextPath}/instructor/family/familySearchList" method="post">
	<input type="hidden" id="majorId" name="majorId" value="${majorId }" />
	<input type="hidden" id="collegeId" name="collegeId" value="${collegeId }" />
	<div class="breadcrumbs" id="familyListToolbar">
	
		<span class="input-icon" style="margin: 5px;">
			<input type="text" id="nav-search-input" name="searchText" placeholder="Search ..." class="nav-search-input" autocomplete="off" value="${searchText }"/> 
			<i class="icon-search nav-search-icon"></i>
		</span>
		
		<input id="familyExcelToDBButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="导入家庭信息"/>
		<input id="familyDeleteButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="删除"/>
		<input id="familyQueryButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="查询"/>
	</div>
	<div class="table-responsive">
		<table id="sample-table-1" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center">
						<label> <input id="theadCheckbox" type="checkbox" class="ace" /> <span class="lbl"></span></label>
					</th>
					<th>学生</th>
					<th>关系</th>
					<th>姓名</th>
					<th>固话</th>
					<th>手机</th>
					<th>操作</th>
				</tr>
			</thead>
	
			<tbody>
				<c:forEach items="${familyList }" var="familyDomain">
					<tr>
						<td class="center">
							<label> <input type="checkbox" class="ace" value="${familyDomain.id }"/> <span class="lbl"></span></label>
						</td>
						<td>${familyDomain.student.name }</td>
						<td>${familyDomain.relation }</td>
						<td>${familyDomain.name }</td>
						<td>${familyDomain.telePhone }</td>
						<td>${familyDomain.cellphone }</td>
						<td style="width: 330px">
 							<input type="button" class="btn_list_view" value="查看" onclick="viewfamily('${familyDomain.id }')"/>
							<input type="button" class="btn_list_update" value="修改" onclick="updatefamily('${familyDomain.id }')"/>  
							<input type="button" class="btn_list_delete" value="删除" onclick="deletefamily('${familyDomain.id }')"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pageId"><tags:paged /></div>
	</div>
</form>

<script type="text/javascript">

	//查询
	$("#familyQueryButton").click(function(){
		$("#formId").ajaxSubmit(function(data){
		 	$("#content_page").html(data);
		});
	});

	//导入信息
	$("#familyExcelToDBButton").click(function(){
		parent.layer.open({
	        type: 2,
	        title: '导入家庭信息',
	        shadeClose: true,
	        area : ['600px' , '500px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/family/familyExcelToDBView',
	        end: function(){
	    		$("#formId").ajaxSubmit(function(data){
	    		 	$("#content_page").html(data);
	    		});
	        }
	    });
		
	});
	
/* 	//新增家庭成员按钮
	$("#familyAddButton").click(function(){
	    parent.layer.open({
	        type: 2,
	        title: '新增家庭成员',
	        shadeClose: true, //点击遮罩关闭层
	        area : ['380px' , '300px'],
	        offset: ['150px'],
	        content: '${pageContext.request.contextPath}/instructor/family/familyAdd',
	        end: function(){
				//默认加载家庭成员列表
	    		$("#formId").ajaxSubmit(function(data){
	        	 	$("#content_page").html(data);
	    		});
	        }
	    });
	}); */
	
	//list中查看家庭成员按钮
	function viewfamily(familyId)
	{
	    parent.layer.open({
	        type: 2,
	        title: '查看家庭成员',
	        shadeClose: true,
	        area : ['640px' , '480px'],
	        offset: ['150px'],
	        content: '${pageContext.request.contextPath}/instructor/family/familyView/'+familyId
	    });
	}

	//list中修改用户按钮
	function updatefamily(familyId)
	{
	    parent.layer.open({
	        type: 2,
	        title: '修改家庭成员',
	        shadeClose: true,
	        area : ['640px' , '480px'],
	        offset: ['150px'],
	        content: '${pageContext.request.contextPath}/instructor/family/familyEdit/'+familyId,
	        end: function(){
	        	//默认加载用户列表
	        	$("#formId").ajaxSubmit(function(data){
	        	 	$("#content_page").html(data);
	    		});
	        }
	    });
	}
	
	//删除
	function deletefamily(familyId)
	{
		//询问框
		layer.confirm('是否确定删除？', {
		    btn: ['确定','取消'] //按钮
		}, function(){
	 		//默认加载家庭成员列表
			$.post("${pageContext.request.contextPath}/instructor/family/delete/"+familyId, function(result){
				if(result=='success'){
					//默认加载家庭成员列表
		        	$("#formId").ajaxSubmit(function(data){
		        	 	$("#content_page").html(data);
		    		});
					parent.layer.msg('删除成功', {
						offset: ['260px'],
	     		        time: 1500//1.5s后自动关闭
	     		    });
				}else{
					layer.msg('删除失败');
				}
			});
		}, function(){
			
		});
		
	}
	
	//多选删除
	$("#familyDeleteButton").click(function(){
		var checkBoxs=$("table tbody input:checkbox");
		var familyIds=new Array();
		for(var i=0;i<checkBoxs.length;i++)
		{
			var checkBox=checkBoxs[i];
			if(checkBox.checked){
				familyIds.push(checkBox.value);
			}
		}
		if(familyIds.length=='0'){
			layer.msg('请至少选择一个');
			return;
		}
		
		//询问框
		layer.confirm('是否确定删除这些家庭成员？', {
		    btn: ['确定','取消'] //按钮
		}, function(){
			console.info("确定");
			$.ajax({
				url : "${pageContext.request.contextPath}/instructor/family/deleteFamilies",
				async: false,
				data : {
					"familyIds" : familyIds
				},
				dataType : "text",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					layer.msg('删除失败');
                },
				success : function(result) {
					if(result=='success'){
						//默认加载用户列表
			        	$("#formId").ajaxSubmit(function(data){
			        	 	$("#content_page").html(data);
			    		});
						parent.layer.msg('删除成功', {
		     		        time: 1500//1.5s后自动关闭
		     		    });
					}else{
						layer.msg('删除失败');
					}
				}
			});
			
		}, function(){
			
		});
	});
	
	//点击表格标题栏，选中所有checkbox框
	$('table th input:checkbox').on('click' , function(){
		
		var that=this;		
 		$(this).closest('table').find('tr > td:first-child input:checkbox').each(function(){
			this.checked = that.checked;
			$(this).closest('tr').toggleClass('selected');
		});
	});

		
</script>
