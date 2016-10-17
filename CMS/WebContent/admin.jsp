 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/common.css">
  <link rel="stylesheet" href="css/style1.css">
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
  <script type="text/javascript">
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
</script>
  <title>后台首页</title>
</head>
<body>
    <div class="top">
      <div id="top_t">
        <div id="logo" class="fl"></div>
        <div id="photo_info" class="fr">
         <div id="photo" class="fl">
            <a href="#"><img src="images/a.png" alt="" width="60" height="60"></a>
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
      <div id="side_here">
        <!-- <div id="side_here_l" class="fl"></div> -->
        <div id="here_area" class="fl">系统数据：</div>
      </div>
    </div>
    <div class="side">
 
    </div>
    <div class="main">
       <iframe name="right" id="rightMain" src="main.jsp" frameborder="no" scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
    </div>
  <script type="text/javascript">
   	function help(){
   	   	alert("@admin");
   	   	}
   </script>
</body>

</html>
 