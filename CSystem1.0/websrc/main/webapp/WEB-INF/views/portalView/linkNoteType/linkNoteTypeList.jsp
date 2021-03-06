<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!-- 联系笔记类型列表页面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/globle.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />

<form id="formId" action="${pageContext.request.contextPath}/admin/linkNoteType/linkNoteTypeList" method="post">
	<div class="breadcrumbs" id="linkNoteTypeListToolbar">
		<input id="linkNoteTypeAddButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="新增"/>
	</div>
	<div class="table-responsive">
		<table id="sample-table-1" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center">
						<label> <input id="theadCheckbox" type="checkbox" class="ace" /> <span class="lbl"></span></label>
					</th>
					<th>联系笔记类型名称</th>
					<th>操作</th>
				</tr>
			</thead>
	
			<tbody>
				<c:forEach items="${linkNoteTypeList }" var="linkNoteTypeDomain">
					<tr>
						<td class="center">
						<label> <input type="checkbox" class="ace" value="${linkNoteTypeDomain.id }"/> <span class="lbl"></span></label>
						</td>
						<td>${linkNoteTypeDomain.name }</td>
	
						<td style="width: 260px">
							<input type="button" class="btn_list_view" value="查看" onclick="viewlinkNoteType('${linkNoteTypeDomain.id }')"/>
							<c:if test="${linkNoteTypeDomain.id!='1' }">
								<input type="button" class="btn_list_update" value="修改" onclick="updatelinkNoteType('${linkNoteTypeDomain.id }')"/>
								<input type="button" class="btn_list_delete" value="删除" onclick="deletelinkNoteType('${linkNoteTypeDomain.id }')"/>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</form>

<script type="text/javascript">

	//新增联系笔记类型按钮
	$("#linkNoteTypeAddButton").click(function(){
	    parent.layer.open({
	        type: 2,
	        title: '新增联系笔记类型',
	        shadeClose: true, //点击遮罩关闭层
	        area : ['400px' , '240px'],
	        offset: '130px',
	        content: '${pageContext.request.contextPath}/admin/linkNoteType/linkNoteTypeAdd',
	        end: function(){
				//默认加载联系笔记类型列表
	    		$("#formId").ajaxSubmit(function(data){
	        	 	$("#content_page").html(data);
	    		});
	        }
	    });
	});
	
	//list中查看联系笔记类型按钮
	function viewlinkNoteType(linkNoteTypeId)
	{
	    parent.layer.open({
	        type: 2,
	        title: '查看联系笔记类型',
	        shadeClose: true,
	        area : ['340px' , '200px'],
	        offset: ['150px'],
	        content: '${pageContext.request.contextPath}/admin/linkNoteType/linkNoteTypeView/'+linkNoteTypeId
	    });
	}

	//list中修改联系笔记类型按钮
	function updatelinkNoteType(linkNoteTypeId)
	{
	    parent.layer.open({
	        type: 2,
	        title: '修改联系笔记类型',
	        shadeClose: true,
	        area : ['380px' , '300px'],
	        offset: ['150px'],
	        content: '${pageContext.request.contextPath}/admin/linkNoteType/linkNoteTypeEdit/'+linkNoteTypeId,
	        end: function(){
	        	//默认加载用户列表
	        	$("#formId").ajaxSubmit(function(data){
	        	 	$("#content_page").html(data);
	    		});
	        }
	    });
	}
	
	//删除
	function deletelinkNoteType(linkNoteTypeId)
	{
		//询问框
		layer.confirm('是否确定删除？', {
			offset: '200px',
		    btn: ['确定','取消'] //按钮
		}, function(){
	 		//默认加载联系笔记类型列表
			$.post("${pageContext.request.contextPath}/admin/linkNoteType/delete/"+linkNoteTypeId, function(result){
				if(result=='success'){
					//默认加载联系笔记类型列表
		        	$("#formId").ajaxSubmit(function(data){
		        	 	$("#content_page").html(data);
		    		});
					parent.layer.msg('删除成功', {
						offset: '200px',
	     		        time: 1500//1.5s后自动关闭
	     		    });
				}else{
					layer.msg('删除失败', {
						offset: '200px',
	     		        time: 1500//1.5s后自动关闭
	     		    });
				}
			});
		}, function(){
			
		});
		
	}

	//点击表格标题栏，选中所有checkbox框
	$('table th input:checkbox').on('click' , function(){
		
		var that=this;		
 		$(this).closest('table').find('tr > td:first-child input:checkbox').each(function(){
			this.checked = that.checked;
			$(this).closest('tr').toggleClass('selected');
		});
	});

	</script>
