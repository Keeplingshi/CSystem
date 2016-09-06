<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	parent.$.messager.progress('close');
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
		<input type="hidden" id="id" name="id" value="${codeBook.id}" >
			<table class="table table-hover table-condensed">
				<tr>
					<th>主键:</th>
					<td>${codeBook.id}</td>
				</tr>
				<tr>
					<th>名称:</th>
					<td>${codeBook.name}</td>
				</tr>
				<tr>
					<th>值:</th>
					<td>${codeBook.value}</td>
				</tr>
				<tr>
					<th>类型:</th>
					<td>${codeBook.type}</td>
				</tr>
				<tr>
					<th>描述:</th>
					<td>${codeBook.marke}</td>
				</tr>
			</table>
		</form>
	</div>
</div>