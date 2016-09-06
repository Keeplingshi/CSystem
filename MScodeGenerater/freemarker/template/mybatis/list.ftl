<#assign obj=ClassName?uncap_first>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include  file="/inc.jsp" %>
<html>
<head>
<title>数据字典管理</title>
<script type="text/javascript">
	var dataGrid;
	${"$"}(function() {
		dataGrid = ${"$"}('#dataGrid').datagrid({
			url : '${"$"}{pageContext.request.contextPath}/${obj}/dataGrid',
			fit : true,
			fitColumns : true,
			border : false,
			pagination : true,
			idField : 'id',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			sortName : 'id',
			sortOrder : 'desc',
			checkOnSelect : false,
			selectOnCheck : false,
			nowrap : false,
			striped : true,
			rownumbers : true,
			singleSelect : true,
			frozenColumns : [ [ {
				field : 'id',
				title : '编号',
				width : 150,
				checkbox : true
			}, {
				field : 'name',
				title : '名称',
				width : 80,
				sortable : true
			} ] ],
			columns : [ [
			 {
				field : 'value',
				title : '值',
				width : 150,
				sortable : true
			},
			 {
				field : 'type',
				title : '类型',
				width : 150,
				sortable : true
			},
			 {
				field : 'marke',
				title : '描述',
				width : 150,
				sortable : true
			},
			 {
				field : 'action',
				title : '操作',
				width : 100,
				formatter : function(value, row, index) {
					var str = '';
					str += ${"$"}.formatString('<img onclick="editFun(\'{0}\',\'修改\');" src="{1}" title="编辑"/>','${"$"}{pageContext.request.contextPath}/${obj}/get?id='+row.id,  '${"$"}{pageContext.request.contextPath}/style/images/extjs_icons/bug/bug_edit.png');
					str += '&nbsp;';
					str += ${"$"}.formatString('<img onclick="deleteFun(\'{0}\');" src="{1}" title="删除"/>','${"$"}{pageContext.request.contextPath}/${obj}/delete?id='+row.id, '${"$"}{pageContext.request.contextPath}/style/images/extjs_icons/bug/bug_delete.png');
					str += '&nbsp;';
					str += ${"$"}.formatString('<img onclick="viewFun(\'{0}\',\'查看\');" src="{1}" title="查看"/>', '${"$"}{pageContext.request.contextPath}/${obj}/view?id=' + row.id, '${"$"}{pageContext.request.contextPath}/style/images/extjs_icons/bug/bug_link.png');
					return str;
				}
			} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function() {
				${"$"}('#searchForm table').show();
				parent.$.messager.progress('close');
				${"$"}(this).datagrid('tooltip');
			}
		});
	});
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div data-options="region:'north',title:'查询条件',border:false" style="height: 160px; overflow: hidden;">
			<form id="searchForm">
				<table   class="table table-hover table-condensed"   style="display: none;width: 99%">
					<tr>
						<th>名称:</th>
						<td>
						<input type="text" name="name" id="name" placeholder="可以模糊查询" class="span2" >
						</td>
						<th>值:</th>
						<td>
							<input type="text" name="value" id="value" placeholder="可以模糊查询" class="span2" >
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="dataGrid"></table>
		</div>
	</div>
	<div id="toolbar" style="display: none;">
		<a onclick="addFun('${"$"}{pageContext.request.contextPath}/${obj}/add','添加');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'bug_add'">添加</a>
			<a onclick="batchDeleteFun('${"$"}{pageContext.request.contextPath}/${obj}/delete');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'delete'">批量删除</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_add',plain:true" onclick="searchFun();">过滤条件</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="cleanFun();">清空条件</a>
	</div>
</body>
</html>