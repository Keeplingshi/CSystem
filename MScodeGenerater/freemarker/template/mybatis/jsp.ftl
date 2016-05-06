﻿<#assign modelPath=middelPath+"/"+ClassName?uncap_first>
<#assign jspPath=middelPath+"/"+ClassName?lower_case>
<#assign obj=ClassName?uncap_first>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<script language="JavaScript" type="text/javascript">
	var nodeName = "<%= URLDecoder.decode(request.getParameter("nodeName"),"UTF-8")%>";
	Ext.onReady(function(){
	    Ext.QuickTips.init();
		Ext.ux.ScriptLoader("<c:url value='${jspPath}/scripts/${ClassName}GridPanel.js'/>",false);
		var ${obj}ManagementSuperTabPanel = new Ext.TabPanel({
			el : '_${obj}Management_SuperTabPanel_${r"${uuid}"}',//此处el指向div id 必须唯一
	        id : '_${obj}Management_SuperTabPanel_Id',
	        border : true,
	        height : tabHeight,
		    activeTab : 0,
		    frame : false,
		    enableTabScroll : true,
			plugins : new Ext.ux.TabCloseMenu()
		});
		var ${obj}GridPanel = new ${ClassName}GridPanel({
			superTabPanel : ${obj}ManagementSuperTabPanel
		});
		${obj}ManagementSuperTabPanel.add(${obj}GridPanel);
		${obj}ManagementSuperTabPanel.render();
		${obj}GridPanel.doLayout();
	});
</script>

<div id='_${obj}Management_SuperTabPanel_${r"${uuid}"}'></div>
