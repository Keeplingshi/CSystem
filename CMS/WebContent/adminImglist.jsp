<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/pagination.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.adminpaginationQR.js"></script>
<script type="text/javascript" src="js/adminImglist.js"></script>
<!-- <script type="text/javascript">
$(document).ready(function() {
	$("#Pagination").paginationadmin3("15");  
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
		    <li><a href="adminImglist.jsp">调查证书管理记录</a></li>
	    </ul>
    </div>
    <div class="rightinfo">
   		
   		<div class="tools">
	     <div class="search-box" style=" padding-top:20px;position: relative; z-index: 5;float:right;">
                        <div class="input-box"> 
                        	<select id="querySelectCheck">
                        		<option value="1">根据登记表编号</option>
                      	    	<option value="2">根据处理结果查找</option>
                      	    	<option value="3">根据处理状态 查找</option>
                      	    	<option value="4">根据询问时间 查找(形式1999-10-10)</option>
                      	    	<option value="5">根据询问人 查找</option>
                      	    </select>
                        	<input name="postid" type="text" class="inp-metro" id="postid" placeholder="请输入查找id" maxlength="26" autocomplete="off" style="color: rgb(51, 51, 51);"/>
                        	<input type="button" id="queryQRe" onclick="queryQRecord()"value="搜索"/>
                        </div>
             </div>
	    </div>
    
   	 	<div class="formtitle"><span>询问笔录记录</span></div>
    	<div class="toolsli">
   			<table class="imgtable" id="table_3">
	   			 <thead>
	   			  <tr>
					    <th>登记表编号</th>
					    <th>询问人姓名</th>
					    <th>询问时间</th>
					    <th>被询问人姓名</th>
					    <th>询问内容</th>
					    <th>审核状态</th>
					    <th>审核结果</th>
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
		  <div class="pages">
	        <div id="Pagination"></div>
	        <div class="searchPage">
	        <!--   <span class="page-go">跳转<input type="text"/>页 <a href="javascript:;" class="page-btn">GO</a></span> -->
	         
	        </div>
	    </div>
  
    </div>
</body>

</html>
