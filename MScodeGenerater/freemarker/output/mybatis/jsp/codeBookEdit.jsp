<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var editor;
	$(function() {
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/codeBook/update',
			onSubmit : function() {
				//editor.sync();
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.messager.show({
								title : '提示',
								msg : result.msg
							});
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});

	function fileManage() {
		editor.loadPlugin('filemanager', function() {
			editor.plugin.filemanagerDialog({
				viewType : 'VIEW',
				dirName : 'image',
				clickFn : function(url, title) {
					//KindEditor('#url').val(url);
					editor.insertHtml($.formatString('<img src="{0}" alt="" />', url));
					editor.hideDialog();
				}
			});
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
		<input type="hidden" id="id" name="id" value="${codeBook.id}" >
			<table class="table table-hover table-condensed">
				<tr>
					<th>主键:</th>
					<td><input name="id" type="text" placeholder="请输入" class="easyui-validatebox span2" data-options="required:true" value="${codeBook.id}"></td>
				</tr>
				<tr>
					<th>名称:</th>
					<td><input name="name" type="text" placeholder="请输入" class="easyui-validatebox span2" data-options="required:true" value="${codeBook.name}"></td>
				</tr>
				<tr>
					<th>值:</th>
					<td><input name="value" type="text" placeholder="请输入" class="easyui-validatebox span2" data-options="required:true" value="${codeBook.value}"></td>
				</tr>
				<tr>
					<th>类型:</th>
					<td><input name="type" type="text" placeholder="请输入" class="easyui-validatebox span2" data-options="required:true" value="${codeBook.type}"></td>
				</tr>
				<tr>
					<th>描述:</th>
					<td><input name="marke" type="text" placeholder="请输入" class="easyui-validatebox span2" data-options="required:true" value="${codeBook.marke}"></td>
				</tr>
			</table>
		</form>
	</div>
</div>