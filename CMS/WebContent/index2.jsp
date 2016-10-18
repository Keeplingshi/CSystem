<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">  
	    var timerID = null;  
	    var timerRunning = false;  
	    function stopclock() {  
	        if (timerRunning)  
	            clearTimeout(timerID);  
	        timerRunning = false;  
	    }  
	    function startclock() {  
	        stopclock();  
	        showtime();  
	    }  
	    function showtime() {  
	        var now = new Date();  
	        document.clock.thetime.value = now.toString();  
	        timerID = setTimeout("showtime()", 1000);  
	        timerRunning = true;  
	    }  
	</script>  
	</head>
	<body onload="startclock()">
		<div class="place">
		    <span>位置：</span>
		    <ul class="placeul">
		    	<li><a href="index2.jsp">首页</a></li>
		    </ul>
	    </div>
	    <div class="mainindex">
	   		 <div class="welinfo">
			    <span><img src="images/sun.png" alt="天气" /></span>
			    <b>你好，欢迎使用刑事案件管理系统</b>
			   <form name="clock" class="time">  
					当前时间:<input name="thetime" style="font-size: 12pt;color:#000000;border:0" size="100"/>  
				</form> 
	   		 </div>
		    <ul class="iconlist">
			    <li><a href="imgtable.jsp"><img src="images/ico01.png" /><p>刑事案件登记档案</p></a></li>
			    <li><a href="imglist.jsp"><img src="images/ico03.png" /><p>询问笔录档案</p></a></li>
			     <li><a href="checkImglist.jsp"><img src="images/ico04.png" /><p>搜查笔录档案</p></a></li>
		    </ul>
		    <ul class="iconlist1">
			    <li><a href="tools.jsp"><img src="images/ico05.png" /><p>拘留申请档案</p></a></li>
			    <li><a href="arresttools.jsp"><img src="images/ico06.png" /><p>逮捕申请档案</p></a></li> 
			    <li><a href="legal.jsp"><img src="images/ico02.png" /><p>移送起诉申请</p></a></li>
		    </ul>
	    </div>
	    
	   <div class="leftinfos">
	    <div class="mainright">
		    <div class="dflist">
			    <div class="listtitle">法律文库查询</div>    
				    <ul class="newlist">
					    <li><a href="http://www.chinacourt.org/law/detail/2012/12/id/146068.shtml" target="_blank">中国法院网 </a></li>
					    <li><a href="http://code.fabao365.com/level_4.html" target="_blank">中央法规库</a></li>
					    <li><a href="http://www.nciic.com.cn/framework/gongzuo/index.jsp" target="_blank">全国公民身份证号码查询服务中心</a></li>
					    <li><a href="http://www.pkulaw.cn/" target="_blank">北大法宝</a></li>
				    </ul>        
	   		 </div>
	    </div>
    </div>
	</body>

</html>
<!-- <script type="text/javascript">
		 	window.onload = check;
			function check(){
				function GetQueryString(name)
				   {
				        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				        var r = window.location.search.substr(1).match(reg);
				        if(r!=null)return  decodeURI(r[2]); return null;
				   }
				  staffDomain = GetQueryString("staffDomain");
				 alert(staffDomain);
				  ip = GetQueryString("ip");
				  localIP = GetQueryString("localIP");
				 alert(ip+"====="+localIP);
				$.ajax({
			        url:"queryOneStaff.do",
			        // 数据发送方式
			        type:"post",
			        data:{"loginName":staffDomain},
			        // 接受数据格式
			        dataType:"json",
			        // 要传递的数据
			        beforeSend: LoadFunction, //加载执行方法
			        error: erryFunction,  //错误执行方法  
			        success: succFunction //成功执行方法 
				}); 
				}
			function LoadFunction() {  
				alert("LoadFunction");
			} 
		 
		function erryFunction(XMLHttpRequest, result, errorThrown,res) {  
		  alert(XMLHttpRequest.status);   // 200    
		  alert(res);
		  alert(errorThrown);  
		}  
			function succFunction(result){
				var result_list = eval(result);
			     $.each(result_list, function (index, item) {
			    	 var ipFDB = result_list[index].ip; 
			    	 alert(ipFDB+"=="+localIP);
			    	 if(localIP != ipFDB) {
				    	 window.location="login.jsp";
				    }
			     });
				} 
		</script> -->