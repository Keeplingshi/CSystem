<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
});	
</script>


</head>

<body style="background:#afdd22;">
	<div class="lefttop">
		<span></span>信息提交目录
	</div>
    <dl class="leftmenu">
	    <dd>
	    	<ul class="menuson">
		         <li><cite></cite><a href="xingshi.jsp" target="rightFrame">案件登记表录入</a><i></i></li>
		        <li><cite></cite><a href="LawDocument.jsp" target="rightFrame">法律文书录入</a><i></i></li>
		        <li><cite></cite><a href="qrecord.jsp" target="rightFrame">询问笔录录入</a><i></i></li>
		        <li><cite></cite><a href="checkRecord.jsp" target="rightFrame">检查笔录录入</a><i></i></li>
		        <li><cite></cite><a href="detention.jsp" target="rightFrame">拘留证管理录入</a><i></i></li>
		        <li><cite></cite><a href="arrest.jsp" target="rightFrame">逮捕证管理录入</a><i></i></li>
	        </ul>    
	    </dd>
    </dl>
</body>
</html>
