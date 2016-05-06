<#assign obj=ClassName?uncap_first>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var editor;
	${r"$"}(function() {
		parent.${r"$"}.messager.progress('close');
		${r"$"}('#form').form({
			url : '${r"$"}{pageContext.request.contextPath}/${obj}/save',
			onSubmit : function() {
				//editor.sync();
				parent.${r"$"}.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = ${r"$"}(this).form('validate');
				if (!isValid) {
					parent.${r"$"}.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				parent.${r"$"}.messager.progress('close');
				result = ${r"$"}.parseJSON(result);
				if (result.success) {
					parent.${r"$"}.messager.show({
								title : '提示',
								msg : result.msg
							});
					parent.${r"$"}.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.${r"$"}.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.${r"$"}.modalDialog.handler.dialog('close');
				} else {
					parent.${r"$"}.messager.alert('错误', result.msg, 'error');
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
					editor.insertHtml(${r"$"}.formatString('<img src="{0}" alt="" />', url));
					editor.hideDialog();
				}
			});
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
			<table class="table table-hover table-condensed">
			<#list columnList as l>
				<tr>
					<th>${l.remarks}:</th>
					<td><input name="${l.name}" type="text" placeholder="请输入" class="easyui-validatebox span2" data-options="required:true" value=""></td>
				</tr>
			</#list>
			</table>
		</form>
	</div>
</div>