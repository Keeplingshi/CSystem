<#assign obj=ClassName?uncap_first>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	parent.${r"$"}.messager.progress('close');
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
		<input type="hidden" id="id" name="id" value="${r"$"}{${obj}.id}" >
			<table class="table table-hover table-condensed">
				<#list columnList as l>
				<tr>
					<th>${l.remarks}:</th>
					<td>${r"$"}{${obj}.${l.name}}</td>
				</tr>
			</#list>
			</table>
		</form>
	</div>
</div>