<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/common.css"/>
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
<div class="top">
  <div id="top_t">
        <div id="logo" class="fl"></div>
        <ul class="nav">
	  		  <li><a href="index2.jsp"  target="rightFrame"><img src="images/icon03.png" title="逮捕证" /><h2>首页</h2></a></li>
	    <!-- <li><a href="tab.jsp"  target="rightFrame"><img src="images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li> -->
   		 </ul>
        <div id="photo_info" class="fr">
         <div id="photo" class="fl">
            <a href="#"><img src="images/a.png" alt="" width="60" height="60"/></a>
          </div>
        
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
      </div>
   </div>  
   <script type="text/javascript">
   	function help(){
   	   	alert("@admin");
   	   	}
   </script>
</body>
</html>
<%--   <div class="topleft">
    <a target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
	    <li><a href="index2.jsp"  target="rightFrame"><img src="images/icon03.png" title="逮捕证" /><h2>首页</h2></a></li>
	    <li><a href="tab.jsp"  target="rightFrame"><img src="images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
    </ul>
            
    <div class="topright">    
	    <ul>
		    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
		   <li><a href="#">关于</a></li>
		    <li><a href="login.jsp" target="_parent">退出</a></li>
	    </ul>
     
	    <div class="user" >
	   		  <span id="user">${staffDomain}</span> 
	    </div> 
	</div>
	
</div> --%>