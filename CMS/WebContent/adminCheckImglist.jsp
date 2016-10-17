<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/pagination2.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.adminpaginationCQ2.js"></script>
<script type="text/javascript" src="js/adminCheckImglist.js"></script>
<!-- <script type="text/javascript">
$(document).ready(function() {
	$("#Pagination2").paginationadmin4("15");  
});
</script> -->
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	});	
})	
</script>
</head>

<body>

	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="adminCheckImglist.jsp">调查证书管理记录</a></li>
	    </ul>
    </div>
    <div class="rightinfo">
   		
   		<div class="tools">
	    	<!-- <ul class="toolbar" style="float:left;">
		        <li class="clickaddC" ><span><img id="add" src="images/t01.png" /></span>添加</li>
	        </ul> -->
	           	<div class="search-box" style=" padding-top:20px;position: relative; z-index: 5;float:right;">
                        <div class="input-box"> 
                        <select id="querySelectQ">
                     		   <option value="1">根据登记表编号</option>
                      	    	<option value="2">根据处理结果查找(形式：已通过/未通过)</option>
                      	    	<option value="3">根据处理状态 查找(形式：已审核/未审核过)</option>
                      	    </select>
                        	<input name="postid" type="text" class="inp-metro" id="queryCRid" placeholder="请输入查找id" maxlength="26" autocomplete="off" style="color: rgb(51, 51, 51);"/>
                        	<input type="button" id="queryCRid" onclick="queryCheckRecord()"value="搜索"/>
                        </div>
             </div>
	    </div>
	    
   	 	<div class="formtitle"><span>询问笔录记录</span></div>  
   		<div class="toolsli">
   			<table class="imgtable" id="table_4">
	   			 <thead>
	   				 <tr>
					    <th>登记表编号</th>
					    <th>内容</th>
					    <th>结果</th>
					    <th>状态</th>
					    <th>操作</th>
	    			</tr>
	   			 </thead>
	   			 <tbody>
			    </tbody>
		  </table>
   		</div>
	      <div class="pagin">
	    	<div class="message">全部数据共
	    		<i id="allRecord" class="blue"></i>条记录，当前显示第&nbsp;&nbsp;
		        <i id="nowPage" class="blue">1&nbsp;&nbsp;</i>页
		    </div>
		 </div>
		<div class="pages2">
	        <div id="Pagination2"></div>
	    </div>
   
    </div>
</body>

</html>
