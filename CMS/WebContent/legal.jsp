<%@page import="com.cumt.criminal.util.QueryDBPages"%>
<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>刑事呈请法律文书界面</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/pagination.css" />
<link rel="stylesheet" href="css/pagination2.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.pagination2.js"></script>
<script type="text/javascript" src="js/legalImgtable.js" charset="utf-8"></script>
<!-- <script type="text/javascript">
$(document).ready(function() {
	 $("#Pagination2").pagination2("15"); 
});
</script> -->
<script language="javascript">
	$(function(){	
		//导航切换
		$(".imglist li").click(function(){
			$(".imglist li.selected").removeClass("selected");
			$(this).addClass("selected");
		});
	});
</script>

<!-- <style>
.imgtable  tr:hover{background:#e5ebee;}
.imgtable  tr{background:#f5f8fa;height:20px;}
</style> -->

</head>
<body>
    <div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="legal.jsp">刑事法律呈请文书记录</a></li>
	    </ul>
    </div>
    <div class="rightinfo">
 
		<div class="tools">
	    	<ul class="toolbar">
		        <li class="clickaddLD" ><span><img id="add" src="images/t01.png" /></span>添加</li>
	        </ul>
	        <div class="search-box" style="padding-top:20px;position: relative; z-index: 5;float:right;">
                 <div class="input-box"> 
                  	<select id="querySelect1">
                      	    	<option value="1">根据法律文书表id查找</option>
                      	    	<option value="2">根据处理人查找</option>
                      	    	<option value="3">根据处理状态 查找</option>
                      	    </select>
                     <input name="queryLDid" type="text" class="inp-metro" id="queryLDid" placeholder="查找内容" maxlength="26" autocomplete="off" style="color: rgb(51, 51, 51);"/>
                     <input type="button" id="queryLD" onclick="queryL()"value="搜索"/>
                 </div>
            </div>
	   </div>
    <div class="formtitle"><span>呈请法律文书登记</span></div>
    <div class="toolsli">
       <table class="imgtable" id="table_2">
		    <thead>
			    <tr>
				    <th>法律文书表id</th>
				    <th>对应刑事案件登记表id</th>
				     <th>处理人姓名</th>
				    <th>内容</th>
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
	<div class="pages2">
	        <div id="Pagination2"></div>
 	</div>
    
     <div class="tip1">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否要添加刑事法律呈请？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="suretip1" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    </div>
   
    
</body>

</html>
    
 