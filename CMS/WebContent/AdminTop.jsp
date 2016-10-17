﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
 <link rel="stylesheet" href="css/common.css"></link>
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
	});
	function GetQueryString(name)
	   {
	        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	        var r = window.location.search.substr(1).match(reg);
	        if(r!=null)return  decodeURI(r[2]); return null;
	   }
	window.onload=function(){
		  staffDomain = GetQueryString("staffDomain");
		  document.getElementById("user").innerText = staffDomain;
		  document.getElementById("edit").href = "editIP.do?staffDomain="+staffDomain;
		};
});	
</script>


</head>
<body style="background:url(images/topbg.jpg) repeat-x;">

    <div class="topleft">
    <a target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    </ul>
            
    <div class="topright">    
	    <ul>
		    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="javascript:help();">帮助</a></li>
		    <li><a href="" id="edit" target="_parent">退出</a></li>
	    </ul>
     
	    <div class="user" >
	   		  <span id="user"></span> 
	    </div> 
	</div>
	
</div>   
  <script type="text/javascript">
   	function help(){
   	   	alert("@admin");
   	   	}
   </script>
</body>

</body>
</html>
