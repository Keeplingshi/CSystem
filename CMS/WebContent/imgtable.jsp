<%@page import="com.cumt.criminal.util.QueryDBPages"%>
<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/pagination.css" />
<link rel="stylesheet" href="css/pagination2.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/imgtable.js" charset="utf-8"></script>
<script language="javascript">
	$(function(){	
		//导航切换
		$(".imglist li").click(function(){
			$(".imglist li.selected").removeClass("selected");
			$(this).addClass("selected");
		});
	});
</script>

</head>
<body>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="imgtable.jsp">刑事案件记录</a></li>
	    </ul>
    </div>
    
    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar" style="float:left;">
		        <li class="clickadd" ><span><img id="add" src="images/t01.png" /></span>添加</li>
	        </ul>
	         <div class="search-box" style=" padding-top:20px;position: relative; z-index: 5;float:right;">
                        <div class="input-box"> 
                      	    <select id="querySelect">
                      	    	<option value="1">根据登记编号查找</option>
                      	    	<option value="2">根据犯案时间查找</option>
                      	    	<option value="3">根据报案人查找</option>
                      	    	<option value="4">根据处理状态 查找</option>
                      	    </select>
                        	<input name="postid" type="text" class="inp-metro" id="postid" placeholder="请输入" maxlength="26" autocomplete="off" style="color: rgb(51, 51, 51);" />
                        	<input type="button" id="query" onclick="query()"value="搜索" />
                        </div>
             </div>
	    </div>
   	  	<div class="formtitle"><span>刑事案件登记记录</span></div>
    	<div class="toolsli" style="overflow: auto; width: 100%;">
	   		<table class="imgtable" id="table_1">
	   			 <thead>
	   				 <tr>
					    <th>登记表编号</th>
					    <th>身份证号</th>
					    <th>报案人</th>
					    <th>出生日期</th>
					    <th>犯案时间</th>
					    <th>出生地</th>
					     <th>工作地址</th>
					    <th>学历</th>
					    <th>状态</th>
					    <th>操作</th>
	    			</tr>
	   			 </thead>
	   			 <!-- <tbody>
	   			 </tbody>-->
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
	    </div>
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否要添加刑事案件登记表 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="suretip" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    </div>
   
 <script type="text/javascript">
 function check(){
	
		
	}
 </script>
    
</body>

</html>
    
 