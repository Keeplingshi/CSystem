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
		<span></span>待审核信息
	</div>
    <dl class="leftmenu">
	    <dd>
	    	<ul class="menuson">
		       <li><cite></cite><a href="AdminImgtable.jsp" target="rightFrame">刑事案件登记申请</a></li>
		       <li><cite></cite><a href="AdminLegalImgtable.jsp" target="rightFrame">刑事法律文书呈请</a></li>
		       <li><cite></cite><a href="adminImglist.jsp" target="rightFrame">询问笔录</a></li>
		       <li><cite></cite><a href="adminCheckImglist.jsp" target="rightFrame">搜查笔录</a></li>
		         <li><cite></cite><a href="adminTools.jsp"  target="rightFrame">拘留申请</a></li>
		         <li><cite></cite><a href="adminArrestTools.jsp"  target="rightFrame">逮捕申请</a></li>
	        </ul>    
	    </dd>
    </dl>
</body>
</html>
