<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*,java.util.Date"%>
<%@ include file="/base.jsp"%>
<%
	String ${pk["javaName"]} = request.getParameter("${pk["javaName"]}");
	if (${pk["javaName"]} == null) {
		${pk["javaName"]} = "";
	}
	<#list columnList as l>
		<#if "${l.extType}" == "key">
			String ${l.javaName}Url = basePath + "/getOpsBySql.do?sqlKey=${l.javaName}Sql";
		<#elseif "${l.extType}" == "code">
			<#if "${l.javaName}"=="isValid">
		    	String ${l.javaName}Url = basePath + "/getOpsByCode.do?code=isTrue";
		    </#if>
		<#elseif "${l.extType}" == "date"> 
			DateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		</#if>
	</#list>
%>
<script type="text/javascript" src="<%=basePath%>/${middelPath}/js/${ClassName?lower_case}_itf.js"></script>
<#assign idPreName = "${'${middelPath}'?replace('/','_')}">
<div id="${idPreName}_editDiv" class="editBox" style="width:96%">
	<form id="${idPreName}_editForm" method="post">
		<input type="hidden" name="${pk["javaName"]}" value="<%=${pk["javaName"]}%>"></input>
		<table>
		<tr>
			<#list columnList as l>
				<#if "${l.javaName}" != "${pk['javaName']}">
					<td class="text_label">${l.remarks}：</td>
					<#if "${l.extType}" =="remark">
						<td colspan="3"><textarea name="${l.javaName}" style="height: 50px;width: 97%;" class="easyui-validatebox" data-options="validType:'length[0,${l.sqlColumnLength}]'" /></textarea></td>
					<#elseif "${l.extType}" =="cu">
						<td><input name="createName" class="readonly" type="text" readonly /> 
						<input name="${l.javaName}.userId" type="hidden" /></td>
					<#elseif "${l.extType}" =="ct">
						<td><input name="${l.javaName}" type="text" class="readonly" readonly /></td>
					<#elseif "${l.extType}" =="mu">
						<td><input name="modifyName" class="readonly" type="text" readonly /> 
						<input name="${l.javaName}.userId" type="hidden" /></td>
					<#elseif "${l.extType}" =="mt">
						<td><input name="${l.javaName}" type="text" class="readonly" readonly /></td>
					<#elseif "${l.extType}" == "date">
						<td width="10" ><input name="${l.javaName}" type="text"  class="easyui-datetimebox" data-options="required:true" value="<%=date.format(new Date())%>" /></td>	
					<#elseif "${l.extType}" == "key">
						<td><input id="${idPreName}_queryForm_${l.javaName}" size="10" class="easyui-combobox" name="${l.javaName}" data-options="url : '<%=${l.javaName}Url %>',valueField:'${l.name}',
						                textField:'${l.name?replace("CODE","NAME")}', editable:false,value:''"></td>
					<#elseif "${l.extType}" == "code">
						<td><input id="${idPreName}_queryForm_${l.javaName}" class="easyui-combobox" name="${l.javaName}" size="10"  data-options="url : '<%=isValidUrl %>',valueField:'id',
					                    textField:'text', editable:false,value:''"></td>	
					<#elseif "${l.extType}" == "numBox">
						<#if "${l.sqlColumnLength}" == "0">
							 <td><input name="${l.javaName}" type="text" class="easyui-numberbox"
					                 data-options="required:true,validType:'length[0,${l.sqlColumnLength}]',missingMessage:'只能输入数字，最多${l.sqlColumnLength}位 ！',min:0"/></td>
						<#else>
							<td><input name="${l.javaName}" type="text" class="easyui-numberbox"
								data-options="required:true,validType:'length[0,${l.sqlColumnLength}]',missingMessage:'只能输入数字，最多${l.sqlColumnLength}位，可以保留${l.sqlDecimalLength}位小数 ！',min:0,precision:${l.sqlDecimalLength}" /></td>
						</#if>	
					<#else>
						<td><input name="${l.javaName}" type="text" class="easyui-validatebox" data-options="required:true,validType:'length[0,${l.sqlColumnLength}]'" /></td>
					</#if>
					<#if "${(l_index+1)%2}" == "1" &  "${l_index+1}" != "1">
			</tr>
			<tr>
					</#if>
				</#if>
			</#list>
			</tr>
			<tr>
				<td colspan="6" align="center"><dhcc:Button name="保存" cls="easyui-linkbutton" href="save${ClassName?cap_first}()" options="iconCls:'icon-save'" /> <dhcc:Button name="关闭" cls="easyui-linkbutton" href="closeCurrTabPanel()" options="iconCls:'icon-cancel'" /></td>
			</tr>
		</table>
	</form>
</div>
